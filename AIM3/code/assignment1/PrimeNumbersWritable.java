package de.tuberlin.dima.aim3.assignment1;

import org.apache.hadoop.io.Writable;

import java.io.DataInput;
import java.io.DataOutput;
import java.io.IOException;
import java.util.Arrays;

public class PrimeNumbersWritable implements Writable {

  private int[] numbers;

  public PrimeNumbersWritable() {
    numbers = new int[0];
  }

  public PrimeNumbersWritable(int... numbers) {
    this.numbers = numbers;
  }

  @Override
  public void write(DataOutput out) throws IOException {
    int len = numbers.length;
    out.writeInt(len);
    for (int primeNumber:numbers) {
      out.writeInt(primeNumber);
    }
  }

  @Override
  public void readFields(DataInput in) throws IOException {
    int len = in.readInt();
    numbers = new int[25];
    for(int i = 0; i < len; i++)
    {
      numbers[i] = in.readInt();
    }
  }

  @Override
  public boolean equals(Object obj) {
    if (obj instanceof PrimeNumbersWritable) {
      PrimeNumbersWritable other = (PrimeNumbersWritable) obj;
      return Arrays.equals(numbers, other.numbers);
    }
    return false;
  }

  @Override
  public int hashCode() {
    return Arrays.hashCode(numbers);
  }
}