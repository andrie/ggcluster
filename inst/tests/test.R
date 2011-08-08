# Test functionality using testthat library
# 
# Author: Andrie
###############################################################################






### kmeans
data(iris)
iris <- iris[, -5]
#model <- kmeans(d, 3)
#cdata <- cluster_data(model)
#pc <- princomp(d)
#pcdata <- cluster_data(pc)
#eedata <- cbind(cdata, pcdata)
#eldata <- ellipsoid_data(eedata)
#
#ggplot() + 
#		geom_point(data=cbind(cdata, pcdata), aes(x=x, y=y, colour=factor(cluster))) +
#		geom_polygon(data=eldata, aes(x=x, y=y, colour=factor(cluster), group=cluster), alpha=0.1)



###############################################################################

context("kmeans")

test_that("kmeans data is extracted correctly", {
	data(iris)
	iris <- iris[, -5]
	model <- kmeans(iris, 3)
	pc <- princomp(iris)
	
	expect_that(cluster_data(model), is_a("data.frame"))
	expect_that(cluster_data(pc), is_a("data.frame"))
	
	
	cdata <- cluster_data(model)
	pcdata <- cluster_data(pc)
	eedata <- cbind(cdata, pcdata)

	expect_that(.ellipsoid_data(eedata), is_a("data.frame"))
	
	eldata <- .ellipsoid_data(eedata)

	p <- ggplot() + 
			geom_point(data=cbind(cdata, pcdata), aes(x=x, y=y, colour=factor(cluster))) +
			geom_polygon(data=eldata, aes(x=x, y=y, colour=factor(cluster), group=cluster), alpha=0.1)
	expect_that(p, is_a("ggplot"))
	
})



context("clusterplot")

test_that("plot_cluster works", {
      require(mclust)
			data(iris)
			iris <- iris[, -5]
			expect_that(plot_cluster(iris, kmeans(iris, 3)), is_a("ggplot"))
			expect_that(plot_cluster(iris, Mclust(iris, 3)), is_a("ggplot"))
			
		})

context("cluster_data default")

test_that("undefined model type throws error", {
      expect_that(cluster_data(USArrests), throws_error())
    })
