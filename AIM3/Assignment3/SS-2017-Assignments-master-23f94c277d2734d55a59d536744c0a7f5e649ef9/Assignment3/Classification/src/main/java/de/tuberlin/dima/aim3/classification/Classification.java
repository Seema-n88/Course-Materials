/**
 * AIM3 - Scalable Data Mining -  course work
 * Copyright (C) 2014  Sebastian Schelter, Christoph Boden
 *
 * This program is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program.  If not, see <http://www.gnu.org/licenses/>.
 */

package de.tuberlin.dima.aim3.classification;

import com.google.common.collect.Maps;
import org.apache.flink.api.common.functions.MapFunction;
import org.apache.flink.api.common.functions.RichMapFunction;
import org.apache.flink.api.java.DataSet;
import org.apache.flink.api.java.ExecutionEnvironment;
import org.apache.flink.api.java.operators.DataSource;
import org.apache.flink.api.java.tuple.Tuple2;
import org.apache.flink.api.java.tuple.Tuple3;
import org.apache.flink.configuration.Configuration;
import org.apache.flink.core.fs.FileSystem;

import java.util.*;

public class Classification {
    public static void main(String[] args) throws Exception {

        ExecutionEnvironment env = ExecutionEnvironment.getExecutionEnvironment();

        DataSource<String> conditionalInput = env.readTextFile(Config.pathToConditionals());
        DataSource<String> sumInput = env.readTextFile(Config.pathToSums());

        DataSet<Tuple3<String, String, Long>> conditionals = conditionalInput.map(new ConditionalReader());
        DataSet<Tuple2<String, Long>> sums = sumInput.map(new SumReader());

        double smoothingParameter = Config.getSmoothingParameter();

        DataSource<String> testData = env.readTextFile(Config.pathToTestSet());

        DataSet<Tuple3<String, String, Double>> classifiedDataPoints = testData.map(new Classifier(smoothingParameter))
                .withBroadcastSet(conditionals, "conditionals")
                .withBroadcastSet(sums, "sums");

        classifiedDataPoints.writeAsCsv(Config.pathToOutput(), "\n", "\t", FileSystem.WriteMode.OVERWRITE);

        // Secret
        DataSource<String> secretTestData = env.readTextFile(Config.pathToSecretTestSet());

        DataSet<Tuple3<String, String, Double>> secretDataPoints = secretTestData.map(new Classifier(smoothingParameter ))
                .withBroadcastSet(conditionals, "conditionals")
                .withBroadcastSet(sums, "sums");

        secretDataPoints.writeAsCsv(Config.pathToSecretOutput(), "\n", "\t", FileSystem.WriteMode.OVERWRITE);

        env.execute();
    }

    public static class ConditionalReader implements MapFunction<String, Tuple3<String, String, Long>> {

        @Override
        public Tuple3<String, String, Long> map(String s) throws Exception {
            String[] elements = s.split("\t");
            return new Tuple3<String, String, Long>(elements[0], elements[1], Long.parseLong(elements[2]));
        }
    }

    public static class SumReader implements MapFunction<String, Tuple2<String, Long>> {

        @Override
        public Tuple2<String, Long> map(String s) throws Exception {
            String[] elements = s.split("\t");
            return new Tuple2<String, Long>(elements[0], Long.parseLong(elements[1]));
        }
    }


    public static class Classifier extends RichMapFunction<String, Tuple3<String, String, Double>>  {

        private final Map<String, Map<String, Long>> wordCounts = Maps.newHashMap();
        private final Map<String, Long> wordSums = Maps.newHashMap();
        private double smoothing;

        public Classifier(double smootingParameter) {
            this.smoothing = smootingParameter;
        }
        @Override
        public void open(Configuration parameters) throws Exception {
            super.open(parameters);

            final List<Tuple3<String, String, Long>> conditionals = getRuntimeContext().getBroadcastVariable("conditionals");
            final List<Tuple2<String, Long>> sums = getRuntimeContext().getBroadcastVariable("sums");
            initCountPerCategory(sums);
            initConditionalWordCounts(conditionals);

        }

        @Override
        public Tuple3<String, String, Double> map(String line) throws Exception {

            String[] tokens = line.split("\t");
            String label = tokens[0];
            String[] terms = tokens[1].split(",");

            double maxProbability = Double.NEGATIVE_INFINITY;
            String predictionLabel = "";

            for (String labelVal : wordCounts.keySet()) {
                double logProb = calculateLogProbability(labelVal, terms);
                if (logProb > maxProbability) {
                    maxProbability = logProb;
                    predictionLabel = labelVal;
                }
            }


             return new Tuple3<String, String, Double>(label, predictionLabel, maxProbability);
        }

        private double calculateLogProbability(String label, String[] words) {
            double logProb = 0.0;//= priors.get(label);
            Map<String, Long> countsPerLabel = wordCounts.get(label);

            Double num;
            for (String word : words) {
                Long count_word = countsPerLabel.get(word);
                if (count_word != null) {
                     num = count_word + this.smoothing;
                } else {
                     num = this.smoothing;
                }
                Long den = wordSums.get(label);
                if (den == null)
                    den = 0L;
                double count_wihout_word =  den - num + ((wordSums.size()-1)*this.smoothing);

                logProb += Math.log(num/count_wihout_word);
            }

            return logProb;
        }

        private void initCountPerCategory(List<Tuple2<String, Long>> input) {
            for (Tuple2<String, Long> tuple : input) {
                wordSums.put(tuple.f0, tuple.f1);
            }
        }

        private void initConditionalWordCounts(List<Tuple3<String, String, Long>> input) {

            Set<String> distinctWords = new HashSet<String>();

            for (Tuple3<String, String, Long> tuple : input) {
                distinctWords.add(tuple.f1);
                if(wordCounts.containsKey(tuple.f0))
                {
                    Map<String, Long> valMap = wordCounts.get(tuple.f0);
                    valMap.put(tuple.f1,tuple.f2);
                    wordCounts.put(tuple.f0,valMap);
                }
                else
                {
                    Map<String, Long> valMap = new HashMap<String, Long>();
                    valMap.put(tuple.f1,tuple.f2);
                    wordCounts.put(tuple.f0,valMap);
                }

            }

        }

    }

}
