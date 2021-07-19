# ReducingDimensions-FaceData-

#The data set consists of 50 photos (faces of 5 men and 5 women, each photographed 5 times)
#Each photo is 200 by 180 in size. So each photo may be considered as a point in 36000 dimensional space.

#we will visualize the points in this high dimensional space by plotting them as images with the help of the user function "drawPic"

#We will perform PCA (calculate the eigen vectors and values) and visualize the eigenvectors(eigenfaces) as images with the user function "showEigenFace"

#Since we have only 50 observations in respond to 36000 dimensions the sample dispersion matrix is singular and immediately we can reduce the dimensions 50 having variance explained as 100% . We further try and reduce the dimensions 

#We will store all the pictures in a matrix form
#We will look at the cummulative variances explained by the components and try to find out the smallest dimension at which most of the variablity can be explained , that is the smallest dimension at which the face is recognizable without having the minute detailing.

#We found out that 90% of the variability gets explained in 7th dimesional space itself.
