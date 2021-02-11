##-----------------------------------------------##
##    Author: Adela Sobotkova                    ##
##    Institute of Culture and Society           ##
##    Aarhus University, Aarhus, Denmark         ##
##    adela@cas.au.dk                             ##
##-----------------------------------------------##

#### Goals ####

# - Understand the provided datasets
# - Learn how to reproject spatial data
# - Limit your data into an area of interest
# - Create a new map

# We highlighted all parts of the R script in which you are supposed to add your
# own code with: 

# /Start Code/ #

print("Hello World") # This would be your code contribution

# /End Code/ #

#### Required R libraries ####

# We will use the sf, raster, and tmap packages.
# Additionally, we will use the spData and spDataLarge packages that provide new datasets. 
# These packages have been preloaded to the worker2 workspace.

library(sf)
library(raster)
library(tmap)
library(spData)
library(spDataLarge)

#### Data sets #### 

# We will use two data sets: `srtm` and `zion`.
# The first one is an elevation raster object for the Zion National Park area, and the second one is an sf object with polygons representing borders of the Zion National Park.

srtm <- raster(system.file("raster/srtm.tif", package = "spDataLarge"))
zion <- read_sf(system.file("vector/zion.gpkg", package = "spDataLarge"))

# Additionally, the last exercise (IV) will used the masked version of the `lc_data` dataset.

study_area <- read_sf("HW/data/study_area.gpkg")
lc_data <- raster("HW/data/example_landscape.tif")
lc_data_masked <- mask(crop(lc_data, study_area), study_area)

#### Exercise I ####

# 1. Display the `zion` object and view its structure.
# What can you say about the content of this file?

# What type of data does it store? 

# What is the coordinate system used?

# How many attributes does it contain?

# What is its geometry?


# 2. Display the `srtm` object and view its structure.

# What can you say about the content of this file? 

# What type of data does it store?

# What is the coordinate system used? 

# How many attributes does it contain?

# How many dimensions does it have?

# What is the data resolution?



# Your solution (type answer to the questions as code comments and the code used)

# /Start Code/ #

## 1.

# the file contains polygons of the Zion national park. It contains spatial 
# location as well as non-spatial information (The park is placed in Utah); 
# it contains date, link to additional metadata, park name and more.

head(zion) #Polygon

st_crs(zion)
crs(zion)
# the coordinate system = GRS80

ncol(zion)
# it contains 12 columns = 12 attributes (different information)

st_geometry(zion)
# Its geometry is polygon

## 2.

head(srtm)
# Its a raster. It contains a matrix of different numbers probably representing different colours.

# It stores raster data, matrices of cells organized in rows and columns as a grid; 
# it looks like it contains raster legends;
# and it contains the crs

crs(srtm) # the coordinate system
# WGS84

# We are in doubt as to what constitutes attributes in raster data because ncol() must just be the width of the matrix. 
# However, it seems like there are 6 different kinds of information stored in the object.

# dimensions
dim(srtm)
# There seems to be only one raster layer. Thus, there are two dimensions; height and width.

res(srtm) # resolution
# 0.0008333333 0.0008333333


# /End Code/ #

#### Exercise II ####

# 1. Reproject the `srtm` dataset into the coordinate reference system used in the `zion` object. 
# Create a new object `srtm2`
# Vizualize the results using the `plot()` function.
# 2. Reproject the `zion` dataset into the coordinate reference system used in the `srtm` object.
# Create a new object `zion2`
# Vizualize the results using the `plot()` function.


# Your solution

# /Start Code/ #

# 1.
# Determine the CRS
crs(zion)
crs(srtm)

# Assign the zion CRS to srtm
crs_zion <- "+proj=utm +zone=12 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs"
srtm2 <- srtm
crs(srtm2) <- crs_zion 

# check out the change
crs(zion)
crs(srtm)
crs(srtm2)

# plot it
plot(srtm)
plot(zion)
plot(srtm2)

# 2.
# Assign the srtm CRS to zion with the function st_transform
crs_srtm <- "+proj=longlat +datum=WGS84 +no_defs +ellps=WGS84 +towgs84=0,0,0"
zion2 <- st_transform(zion, crs = crs_srtm)

# check out the change
crs(srtm)
crs(zion)
crs(zion2)

# plot it
plot(zion)
plot(zion2)



# /End Code/ #
