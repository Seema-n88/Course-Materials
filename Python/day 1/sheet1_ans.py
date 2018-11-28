
# coding: utf-8

# # Exercise Sheet 1: Python Basics
# 
# This first  exercise sheet tests the basic functionalities of the Python programming language in the context of a simple prediction task. We consider the problem of predicting health risk of subjects from personal data and habits. We first use for this task a decision tree
# 
# ![](tree.png)
# 
# adapted from the webpage http://www.refactorthis.net/post/2013/04/10/Machine-Learning-tutorial-How-to-create-a-decision-tree-in-RapidMiner-using-the-Titanic-passenger-data-set.aspx. For this exercise sheet, you are required to use only pure Python, and to not import any module, including numpy. In exercise sheet 2, the nearest neighbor part of this exercise sheet will be revisited with numpy.

# ## Classifying a single instance (15 P)
# 
# * Create a function that takes as input a tuple containing values for attributes (smoker,age,diet), and computes the output of the decision tree.
# * Test your function on the tuple `('yes',31,'good')`,

# In[14]:

def classifier(x):
   if x[0]=='yes':
       if x[1]>=29.5:
           return (x,'more')
       else: return (x,'less')
   elif x[0]=='no':
       if x[2]=='good':
           return (x,'less')
       else:
           return (x,'more')
   else:
       return 'unknown'

tup = ('yes',31,'good')
classifier(tup)


# ## Reading a dataset from a text file (10 P)
# 
# The file `health-test.txt` contains several fictious records of personal data and habits.
# 
# * Read the file automatically using the methods introduced during the lecture.
# * Represent the dataset as a list of tuples.

# In[16]:

def readDataFromText(filename):
    f = open(filename, 'rU')
    lines = f.read().splitlines()
    data = []
    for line in lines:
        elements = line.split(',')
        #elements[1]= int(elements[1])
        #data.append(elements[0:3])
        data.append((elements[0],int(elements[1]), elements[2]))
    f.close()
    return data
readDataFromText('health-test.txt')


# ## Applying the decision tree to the dataset (15 P)
# 
# * Apply the decision tree to all points in the dataset, and compute the percentage of them that are classified as "more risk".

# In[18]:

### Replace by your own code
def applyDecisionTree(data):
    return len(filter(lambda x: classifier(x) == (x,'more'), data))/float(len(data))
applyDecisionTree(data)


# ## Learning from examples (10 P)
# 
# Suppose that instead of relying on a fixed decision tree, we would like to use a data-driven approach where data points are classified based on a set of training observations manually labeled by experts. Such labeled dataset is available in the file `health-train.txt`. The first three columns have the same meaning than for `health-test.txt`, and the last column corresponds to the labels.
# 
# * Write a procedure that reads this file and converts it into a list of pairs. The first element of each pair is a triplet of attributes, and the second element is the label.

# In[23]:

### Replace by your own code
def learnFromExamples():
    result = []
    with open("health-train.txt", "r+") as f:
        for line in f:
            l = line.strip()
            data = l.split(",")
            #data[1] = int(data[1])
            #result.append(tuple([tuple(data[0:3]), data[3]]))
            result.append(((data[0], int(data[1]),data[2]), data[3]))
    return result
print learnFromExamples()


# ## Nearest neighbor classifier (25 P)
# 
# We consider the nearest neighbor algorithm that classifies test points following the label of the nearest neighbor in the training data. For this, we need to define a distance function between data points. We define it to be
# 
# `d(a,b) = (a[0]!=b[0])+((a[1]-b[1])/50.0)**2+(a[2]!=b[2])`
# 
# where `a` and `b` are two tuples corrsponding to the attributes of two data points.
# 
# * Write a function that retrieves for a test point the nearest neighbor in the training set, and classifies the test point accordingly.
# * Test your function on the tuple `('yes',31,'good')`

# In[21]:

### Replace by your own code
def nearestNeighborClassifier(inputtuple):
    nearestNeighborValue = 999;
    nearestNeighbor = []
    with open("health-train.txt", "r+") as f:
        for line in f:
            l = line.strip().split(",")
            l[1] = int(l[1])
            i = tuple(l[0:3])
            distance = (inputtuple[0] != i[0]) + ((inputtuple[1] - i[1]) / 50.0) ** 2 + (inputtuple[2] != i[2])
            if (distance < nearestNeighborValue):
                nearestNeighborValue = distance
                nearestNeighbor = tuple([inputtuple, l[3]])

    return nearestNeighbor
nearestNeighborClassifier(('yes',31,'good'))


# * Apply both the decision tree and nearest neighbor classifiers on the test set, and find the data point(s) for which the two classifiers disagree, and the fraction of the time it happens.

# In[22]:

### Replace by your own code
def nearestNeighborClassifierVerify():
    data = readDataFromText('health-test.txt')
    disagreeList = []
    for x in data:
        decisionTreeResult = classifier(x)
        nearestNeighborClassifierResult = nearestNeighborClassifier(x)
        if decisionTreeResult[1] != nearestNeighborClassifierResult[1]:
            disagreeList.append(x)
    return tuple([disagreeList, len(disagreeList)/float(len(data))])
nearestNeighborClassifierVerify()


# One problem of simple nearest neighbors is that one needs to compare the point to predict to all data points in the training set. This can be slow for datasets of thousands of points or more. Alternatively, some classifiers train a model first, and then use it to classify the data.
# 
# ## Nearest mean classifier (25 P)
# 
# We consider one such trainable model, which operates in two steps:
# 
# (1) Compute the average point for each class, (2) classify new points to be of the class whose average point is nearest to the point to predict.
# 
# For this classifier, we convert the attributes smoker and diet to real values (for smoker: yes=1.0 and no=0.0, and for diet: good=0.0 and poor=1.0), and use the modified distance function:
# 
# `d(a,b) = (a[0]-b[0])**2+((a[1]-b[1])/50.0)**2+(a[2]-b[2])**2`
# 
# We adopt an object-oriented approach for building this classifier.
# 
# * Implement the methods `train` and `predict` of the class `NearestMeanClassifier`.

# In[27]:

class NearestMeanClassifier:
    
    # Training method that takes as input a dataset
    # and produces two internal vectors corresponding
    # to the mean of each class.
    def train(dataset):
        classifierless = []
        classifiermore = []
        meanvalues = []
        with open("health-train.txt", "r+") as f:
            for line in f:
                l = line.strip().split(",")
                l[1] = int(l[1])
                if l[3] == "more":
                    classifiermore.append(tuple(l[0:3]))
                else:
                    classifierless.append(tuple(l[0:3]))
            meanvalues.append([calculateMean(classifiermore), calculateMean(classifierless)])
    predict(dataset,meanvalues)
    
    # Prediction method that takes as input a new data
    # point and predicts it to belong to the class with
    # nearest mean.
def predict(self,x):
    nearestNeighborValue = 999
    nearestNeighbor = []
    for data in meanvalues:
        l = data.strip().split(",")
        l[1] = float(l[1])
        i = tuple(l[0:3])
        distance = (sampledata[0] - i[0]) ** 2 + ((sampledata[1] - i[1]) / 50.0) ** 2 + (sampledata[2] - i[2]) ** 2
        if (distance < nearestNeighborValue):
            nearestNeighborValue = distance
            nearestNeighbor = tuple([sampledata, l[3]])
    return nearestNeighbor;


# * Build an object of class `NearestMeanClassifier`, train it on the training data, and print the mean vector for each class.

# In[ ]:

### Replace by your own code
import solutions
solutions.exercise6a()
###


# * Predict the test data using the nearest mean classifier and print all test examples for which all three classifiers (decision tree, nearest neighbor and nearest mean) agree.

# In[ ]:

### Replace by your own code
import solutions
solutions.exercise6b()
###

