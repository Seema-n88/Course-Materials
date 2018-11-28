package de.tuberlin.dima.aim3.assignment1;

import de.tuberlin.dima.aim3.HadoopJob;
import org.apache.hadoop.fs.Path;
import org.apache.hadoop.io.IntWritable;
import org.apache.hadoop.io.Text;
import org.apache.hadoop.mapreduce.Job;
import org.apache.hadoop.mapreduce.Mapper;
import org.apache.hadoop.mapreduce.Reducer;
import org.apache.hadoop.mapreduce.lib.input.TextInputFormat;
import org.apache.hadoop.mapreduce.lib.output.TextOutputFormat;

import java.io.IOException;
import java.util.Map;

public class FilteringWordCount extends HadoopJob {

  @Override
  public int run(String[] args) throws Exception {
    Map<String,String> parsedArgs = parseArgs(args);

    Path inputPath = new Path(parsedArgs.get("--input"));
    Path outputPath = new Path(parsedArgs.get("--output"));

    Job wordCount = prepareJob(inputPath, outputPath, TextInputFormat.class, FilteringWordCountMapper.class,
        Text.class, IntWritable.class, WordCountReducer.class, Text.class, IntWritable.class, TextOutputFormat.class);
    wordCount.waitForCompletion(true);

    return 0;
  }

  static class FilteringWordCountMapper extends Mapper<Object,Text,Text,IntWritable> {
    @Override
    protected void map(Object key, Text line, Context ctx) throws IOException, InterruptedException {
      String linie = line.toString();
      linie = linie.replaceAll("\\bto\\b", "");
      linie = linie.replaceAll("\\band\\b", "");
      linie = linie.replaceAll("\\bin\\b", "");
      linie = linie.replaceAll("\\bthe\\b", "");
      String[] words = linie.split("\\s+|,");
      for (String word : words) {
        Text outputKey = new Text(word.toLowerCase().trim());
        IntWritable outputValue = new IntWritable(1);
        ctx.write(outputKey, outputValue);
      }
    }
  }

  static class WordCountReducer extends Reducer<Text,IntWritable,Text,IntWritable> {
    @Override
    protected void reduce(Text key, Iterable<IntWritable> values, Context ctx)
        throws IOException, InterruptedException {
      int sum = 0;
      for(IntWritable value : values)
      {
        sum += value.get();
      }
      ctx.write(key, new IntWritable(sum));
    }
  }

}