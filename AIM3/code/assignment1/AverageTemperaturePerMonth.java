package de.tuberlin.dima.aim3.assignment1;


import com.google.common.io.Closeables;
import de.tuberlin.dima.aim3.HadoopJob;
import org.apache.hadoop.fs.Path;
import org.apache.hadoop.io.DoubleWritable;
import org.apache.hadoop.io.IntWritable;
import org.apache.hadoop.io.Text;
import org.apache.hadoop.mapreduce.Job;
import org.apache.hadoop.mapreduce.Mapper;
import org.apache.hadoop.mapreduce.Reducer;
import org.apache.hadoop.mapreduce.lib.input.TextInputFormat;
import org.apache.hadoop.mapreduce.lib.output.TextOutputFormat;

import java.io.*;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

public class AverageTemperaturePerMonth extends HadoopJob {

  private static double minimumQuality;
    private File averageTemperatureOutput;
    private PrintWriter pw;
  @Override
  public int run(String[] args) throws Exception {
    Map<String,String> parsedArgs = parseArgs(args);

    Path inputPath = new Path(parsedArgs.get("--input"));
    Path outputPath = new Path(parsedArgs.get("--output"));

      if (averageTemperatureOutput == null) {
          averageTemperatureOutput = new File("/Users/seema/Documents/Semester2/AIM3/Assignment1/output/averageTemperatureOutput.csv");
          if(averageTemperatureOutput.exists()) averageTemperatureOutput.delete();
          if (!averageTemperatureOutput.getParentFile().exists()) {
              if(!averageTemperatureOutput.getParentFile().mkdir()) {
                  throw new IOException("Could not create " + averageTemperatureOutput);
              }
          }
          averageTemperatureOutput.createNewFile();
          pw = new PrintWriter(averageTemperatureOutput);
      }

    double minimumQuality = Double.parseDouble(parsedArgs.get("--minimumQuality"));
    this.minimumQuality = minimumQuality;
    Job avgTempPerMonth = prepareJob(inputPath, outputPath, TextInputFormat.class, AverageTemperaturePerMonth.AverageTemperaturePerMonthMapper.class,
            Text.class, IntWritable.class, AverageTemperaturePerMonth.AverageTemperaturePerMonthReducer.class, Text.class, DoubleWritable.class, TextOutputFormat.class);
    avgTempPerMonth.waitForCompletion(true);

      //write the output to csv file to plot the graph
      StringBuilder sb = new StringBuilder();
      sb.append("Year and Month" + "\t" + "Avg.Temperature");
      pw.println(sb);
      List<String> records = readLines(outputPath.toString()+ "/" + "part-r-00000");
      for(String record:records){
          String[] tokens = record.split("\t");
          String YearAndMonth = tokens[0] + "/" + tokens[1];
          pw.println(YearAndMonth + "\t" + tokens[2]);
      }

      pw.close();
    return 0;
  }

  static class AverageTemperaturePerMonthMapper extends Mapper<Object,Text,Text,IntWritable> {
    @Override
    protected void map(Object key, Text line, Context ctx) throws IOException, InterruptedException {
        String record = line.toString();
        String[] fields = record.split("\\s+|,");
        if(Double.parseDouble(fields[3]) >= minimumQuality) {
            String strKey = String.valueOf(fields[0]) + "\t" + String.valueOf(fields[1]);
            Text outputKey = new Text(strKey);
            IntWritable outputValue = new IntWritable(Integer.parseInt(fields[2]));
            ctx.write(outputKey, outputValue);
        }
    }
  }

  static class AverageTemperaturePerMonthReducer extends Reducer<Text,IntWritable,Text,DoubleWritable> {
    @Override
    protected void reduce(Text key, Iterable<IntWritable> values, Context ctx)
            throws IOException, InterruptedException {
      int sum = 0;
      int size = 0;
      for(IntWritable value : values)
      {
        sum += value.get();
        size++;
      }
      DoubleWritable value = new DoubleWritable((double) sum / size);
      ctx.write(key, value);
    }
  }

    public List<String> readLines(String path) throws IOException {
        List<String> lines = new ArrayList<String>();
        BufferedReader reader = null;
        try {
            reader = new BufferedReader(new FileReader(path));
            String line;
            while ((line = reader.readLine()) != null) {
                lines.add(line);
            }
        } finally {
            Closeables.closeQuietly(reader);
        }
        return lines;
    }
}