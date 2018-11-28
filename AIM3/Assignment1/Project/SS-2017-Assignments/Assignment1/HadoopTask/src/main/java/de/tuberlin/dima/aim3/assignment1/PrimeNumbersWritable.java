package de.tuberlin.dima.aim3.assignment1;

import org.apache.hadoop.io.Writable;

import java.io.*;
import java.nio.ByteBuffer;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

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
    //IMPLEMENT ME

    out.writeInt(numbers.length);
    for (int i : numbers) {
      out.writeInt(i);
    }

  }

  @Override
  public void readFields(DataInput in) throws IOException {
    //IMPLEMENT ME

    int len = in.readInt();
    numbers = new int[len];
    for (int i = 0; i < len; ++i) {
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

