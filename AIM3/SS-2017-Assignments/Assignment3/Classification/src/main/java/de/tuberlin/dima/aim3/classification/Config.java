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

public class Config {

  private static final String INPUT_PATH = "/Users/seema/Documents/Semester2/AIM3/Assignment3/SS-2017-Assignments-master-23f94c277d2734d55a59d536744c0a7f5e649ef9/Assignment3/Classification/src/test/resources/classification/";
  private static final String OUTPUT_PATH = "/Users/seema/Documents/Semester2/AIM3/Assignment3/";
  private static final double SMOOTHING_PARAM = 1.0;

  private Config() {}

  public static String pathToTrainingSet() {
    return INPUT_PATH + "train.tab";
  }

  public static String pathToTestSet() {
    return INPUT_PATH + "test.tab";
  }

  public static String pathToOutput() {
    return OUTPUT_PATH + "result";
  }

  public static String pathToSums() {
    return OUTPUT_PATH + "sums";
  }

  public static String pathToConditionals() {
    return OUTPUT_PATH + "conditionals";
  }

  public static double getSmoothingParameter() {
    return SMOOTHING_PARAM;
  }

  public static String pathToSecretTestSet() {
    return INPUT_PATH + "secrettest.dat";
  }

  public static String pathToSecretOutput() {
    return OUTPUT_PATH + "secretresult";
  }

}
