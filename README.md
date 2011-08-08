# ggcluster

This is a set of tools for creating cluster plots, tree plots and dendrograms in [R]

It supports functions to plot the results of:

* `kmeans()`
* 'Mclust()`

## Important functions

ggcluster offers a generic function to extract data and text from the various clustering models:

* `cluster_data()` extracts cluster information from the model object, e.g. cluster allocation, line segment data or label data.

The results of these functions can then be passed to `ggplot()` for plotting.



