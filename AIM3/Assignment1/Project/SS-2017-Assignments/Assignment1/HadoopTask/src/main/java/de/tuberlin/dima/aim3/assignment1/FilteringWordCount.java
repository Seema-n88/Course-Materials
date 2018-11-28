package de.tuberlin.dima.aim3.assignment1;

import com.google.common.collect.Iterators;
import de.tuberlin.dima.aim3.HadoopJob;
import org.apache.hadoop.fs.Path;
import org.apache.hadoop.io.IntWritable;
import org.apache.hadoop.io.Text;
import org.apache.hadoop.mapreduce.Job;
import org.apache.hadoop.mapreduce.Mapper;
import org.apache.hadoop.mapreduce.Reducer;
import org.apache.hadoop.mapreduce.lib.input.TextInputFormat;
import org.apache.hadoop.mapreduce.lib.output.TextOutputFormat;
import java.util.StringTokenizer;
import java.io.IOException;
import java.util.HashSet;
import java.util.Map;
import java.util.Set;

public class FilteringWordCount extends HadoopJob {

  @Override
  public int run(String[] args) throws Exception {
    Map<String,String> parsedArgs = parseArgs(args);

    Path inputPath = new Path(parsedArgs.get("--input"));
    Path outputPath = new Path(parsedArgs.get("--output"));

    Job wordCount = prepareJob(inputPath, outputPath, TextInputFormat.class, FilteringWordCountMapper.class,
            Text.class, IntWritable.class, FilteringWordCountReducer.class, Text.class, IntWritable.class, TextOutputFormat.class);
    wordCount.waitForCompletion(true);

    return 0;
  }

  static class FilteringWordCountMapper extends Mapper<Object,Text,Text,IntWritable> {
    private Set<String> stopWordList = new HashSet<String>();

    public FilteringWordCountMapper() {
      String[] stopWords = "to and in the".split(" ");
      for (int i = 0; i < stopWords.length; i++) {
        stopWordList.add(stopWords[i]);
      }
    }

    @Override
    protected void map(Object key, Text line, Context ctx) throws IOException, InterruptedException {
      // IMPLEMENT ME
      String keyName = line.toString().toLowerCase();
      StringTokenizer tokenizer = new StringTokenizer(keyName, "' '|,");
      while (tokenizer.hasMoreTokens()) {
        String word = tokenizer.nextToken();
        if (!stopWordList.contains(word)) {
          Text newWord = new Text(word);
          ctx.write(newWord, new IntWritable(1));
        }
      }
    }
  }

  static class FilteringWordCountReducer extends Reducer<Text, IntWritable, Text, IntWritable> {
    @Override
    protected void reduce(Text key, Iterable<IntWritable> values, Context ctx)
            throws IOException, InterruptedException {
      // IMPLEMENT ME
      ctx.write(key, new IntWritable(Iterators.size(values.iterator())));
    }
  }
}

