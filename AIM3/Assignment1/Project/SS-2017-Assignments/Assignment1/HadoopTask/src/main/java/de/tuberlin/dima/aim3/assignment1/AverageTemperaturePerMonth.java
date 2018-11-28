package de.tuberlin.dima.aim3.assignment1;


import com.google.common.base.Strings;
import de.tuberlin.dima.aim3.HadoopJob;
import org.apache.hadoop.fs.Path;
import org.apache.hadoop.io.DoubleWritable;
import org.apache.hadoop.mapreduce.Job;
import org.apache.hadoop.mapreduce.Mapper;
import org.apache.hadoop.mapreduce.Reducer;
import org.apache.hadoop.mapreduce.lib.input.TextInputFormat;
import org.apache.hadoop.mapreduce.lib.output.TextOutputFormat;
import org.apache.hadoop.io.Text;
import javax.naming.Context;
import org.apache.hadoop.conf.Configuration;
import java.util.HashSet;
import java.io.IOException;
import java.util.Map;
import java.util.Set;

public class AverageTemperaturePerMonth extends HadoopJob {
    private static final String minThreshold = "minimumQuality";
    @Override
    public int run(String[] args) throws Exception {
        Map<String, String> parsedArgs = parseArgs(args);

        Path inputPath = new Path(parsedArgs.get("--input"));
        Path outputPath = new Path(parsedArgs.get("--output"));

        double minimumQuality = Double.parseDouble(parsedArgs.get("--minimumQuality"));

        //IMPLEMENT ME
        Job tempJob = prepareJob(inputPath, outputPath, TextInputFormat.class, AvgTempMapper.class,
                Text.class, DoubleWritable.class, AvgTempReducer.class, Text.class, DoubleWritable.class,
                TextOutputFormat.class);

        tempJob.getConfiguration().set(minThreshold, Double.toString(minimumQuality));
        //tempJob.getConfiguration().set(minimumQuality, Double.toString(minimumQuality));

        tempJob.waitForCompletion(true);
        return 0;
    }
    static class AvgTempMapper extends Mapper<Object, Text, Text, DoubleWritable> {
        private double minQuality;
        @Override
        protected void map(Object key, Text line, Context ctx) throws IOException, InterruptedException {
            if (!Strings.isNullOrEmpty(line.toString())) {
                minQuality = Double.parseDouble(ctx.getConfiguration().get(minThreshold));
                String[] keyField = line.toString().split("\t");
                if (keyField.length > 2 && !Strings.isNullOrEmpty(keyField[3])) {
                    try {
                        double quality = Double.parseDouble(keyField[3]);
                        if (quality >= minQuality) {
                            Text YearMonthKey = new Text(keyField[0] + "\t" + keyField[1]);
                            Long tempreature = Long.parseLong(keyField[2]);
                            ctx.write(YearMonthKey, new DoubleWritable(tempreature));
                        }
                    } catch (Exception ex) {
                    }
                }
            }
        }

    }
    static class AvgTempReducer extends Reducer<Text, DoubleWritable, Text, DoubleWritable> {
        @Override
        protected void reduce(Text key, Iterable<DoubleWritable> values, Context ctx) throws IOException, InterruptedException {
            int countRecords = 0;
            double sumRecords = 0;
            for (DoubleWritable i : values) {
                countRecords++;
                sumRecords += i.get();
            }
            double average = sumRecords / countRecords;

            ctx.write(new Text(key.toString().replace("_", "\t")), new DoubleWritable(average));
        }
    }
}

