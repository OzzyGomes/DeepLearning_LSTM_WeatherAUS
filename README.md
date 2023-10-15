<h1>Predicting Humidity using Recurrent Neural Networks (RNN) - GitHub README </h1>
<p>This repository contains code that demonstrates the use of Recurrent Neural Networks (RNN) for predicting humidity levels in Albury, Australia. The code utilizes the R package 'rnn' and the 'ggplot2' library for data visualization.</p>
<h2>Table of Contents</h2>
<ul>
  <li><a href="#introduction">Introduction</a></li>
  <li><a href="#getting-started">Getting Started</a></li>
  <li><a href="#data">Data</a></li>
  <li><a href="#preprocessing">Preprocessing</a></li>
  <li><a href="#model-training">Model Training</a></li>
  <li><a href="#model-evaluation">Model Evaluation</a></li>
  <li><a href="#results">Results</a></li>
  <li><a href="#visualization">Visualization</a></li>
</ul>

<h2>Introduction</h2>
<p>This code aims to predict humidity levels in Albury, Australia, using a Recurrent Neural Network (RNN). RNNs are a type of neural network well-suited for sequential data, making them suitable for time-series prediction tasks.</p>

<h2>Getting Started</h2>
<p>To get started with this code, you need to install the 'rnn' and 'ggplot2' libraries in your R environment. You can install them with the following commands:</p>
<pre>
<code>library("rnn")
library("ggplot2")</code>
</pre>

<h2>Data</h2>
<p>The dataset 'weatherAUS.csv' is used in this project. It contains various weather-related attributes. The code extracts data related to humidity at 3 pm and 9 am for the Albury location, considering the first 3040 rows.</p>

<h2>Preprocessing</h2>
<p>Data preprocessing is essential to ensure the data is in a suitable format for the RNN. Missing values are removed from the dataset using <code>na.omit</code>. The data is scaled using Min-Max scaling to ensure all values fall between 0 and 1.</p>

<h2>Model Training</h2>
<p>The RNN is trained with the following parameters:</p>
<ul>
  <li>Learning rate: 0.01</li>
  <li>Hidden dimensions: 15</li>
  <li>Network type: RNN (other options include LSTM and GRU)</li>
  <li>Number of epochs: 100</li>
</ul>

<h2>Model Evaluation</h2>
<p>The model's training progress is visualized by plotting the errors over each epoch. This allows you to assess how well the model is learning.</p>

<h2>Results</h2>
<p>The model's performance is evaluated using the coefficient of determination (R-squared). In this code, the R-squared value indicates how well the predicted humidity explains the variance in the test data.</p>

<h2>Visualization</h2>
<p>To visualize the model's predictions, a plot is created to compare the actual humidity values (in red) with the predicted values (in black). The legend shows the labels for each line.</p>

<p>Please note that the provided code is a basic example of using RNN for humidity prediction and is designed for educational purposes. For practical applications, additional data and fine-tuning of the model may be required.</p>
