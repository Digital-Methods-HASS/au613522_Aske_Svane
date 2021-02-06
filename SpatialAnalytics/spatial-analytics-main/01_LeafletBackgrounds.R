###   GETTING STARTED WITH LEAFLET


## Choose favorite backgrounds in:
# https://leaflet-extras.github.io/leaflet-providers/preview/
## beware that some need extra options specified

# Packages
install.packages("leaflet")
install.packages("htmltools")

# Example with Markers
library(leaflet)
library(htmltools)
library(htmlwidgets)

popup = c("Robin", "Jakub", "Jannes")

leaflet() %>%
  addProviderTiles("Esri.WorldPhysical") %>% 
  addProviderTiles("Esri.WorldImagery") %>% 
  addAwesomeMarkers(lng = c(-3, 23, 11), # the coordinates for three points 
                    lat = c(52, 53, 49), # the map is interactive - click on the points on the map
                    popup = popup) # map zoom automatically chosen because of the points


## Sydney with setView
leaflet() %>%
  addTiles() %>%
  addProviderTiles("Esri.WorldImagery", 
                   options = providerTileOptions(opacity=0.5)) %>% 
  setView(lng = 151.005006, lat = -33.9767231, zoom = 10) # not plotting any points (map zoom manually chosen)


# Europe with Layers
leaflet() %>% 
  addTiles() %>% 
  setView( lng = 2.34, lat = 48.85, zoom = 5 ) %>% 
  addProviderTiles("Esri.WorldPhysical", group = "Physical") %>% 
  addProviderTiles("Esri.WorldImagery", group = "Aerial") %>% 
  addProviderTiles("MtbMap", group = "Geo") %>% 

addLayersControl(
  baseGroups = c("Geo","Aerial", "Physical"),
  options = layersControlOptions(collapsed = T))

# note that you can feed plain Lat Long columns into Leaflet
# without having to convert into spatial objects (sf), or projecting


########################## SYDNEY HARBOUR DISPLAY WITH LAYERS

# Set the location and zoom level
leaflet() %>% 
  setView(151.2339084, -33.85089, zoom = 13) %>%
  addTiles()  # checking I am in the right area


# Bring in a choice of esri background layers  

l_aus <- leaflet() %>%   # assign the base location to an object
  setView(151.2339084, -33.85089, zoom = 13)


esri <- grep("^Esri", providers, value = TRUE)

for (provider in esri) {
  l_aus <- l_aus %>% addProviderTiles(provider, group = provider)
}

AUSmap <- l_aus %>%
  addLayersControl(baseGroups = names(esri),
                   options = layersControlOptions(collapsed = FALSE)) %>%
  addMiniMap(tiles = esri[[1]], toggleDisplay = TRUE,
             position = "bottomright") %>%
  addMeasure(
    position = "bottomleft",
    primaryLengthUnit = "meters",
    primaryAreaUnit = "sqmeters",
    activeColor = "#3D535D",
    completedColor = "#7D4479") %>% 
    htmlwidgets::onRender("
                          function(el, x) {
                          var myMap = this;
                          myMap.on('baselayerchange',
                          function (e) {
                          myMap.minimap.changeLayer(L.tileLayer.provider(e.name));
                          })
                          }") %>% 
addControl("", position = "topright")

AUSmap # run the plot

################################## SAVE FINAL PRODUCT

# Save map as a html document (optional, replacement of pushing the export button)
# only works in root
library(htmlwidgets)
saveWidget(AUSmap, "AUSmap.html", selfcontained = TRUE)


################################## ADD DATA TO LEAFLET

# Libraries
library(tidyverse)
remove.packages("googlesheets4")
install.packages("googlesheets4")

library(googlesheets4)
library(leaflet)


gs4_deauth()

places <- read_sheet("https://docs.google.com/spreadsheets/d/1PlxsPElZML8LZKyXbqdAYeQCDIvDps2McZx1cTVWSzI/edit#gid=0",col_types = "cccnncn")
glimpse(places)
rlang::last_error()

leaflet() %>% 
  addTiles() %>% 
  addCircleMarkers(lng = places$Longitude, 
             lat = places$Latitude,
             popup = places$Description),
             clusterOptions = 


#########################################################
#
# Task 1: Create a Danish equivalent with esri layers

# Set the location and zoom level
leaflet() %>% 
  setView(11, 56, zoom = 7) %>%
  addTiles()  # checking I am in the right area


# Bring in a choice of esri background layers  

l_dk <- leaflet() %>%   # assign the base location to an object
  setView(11, 56, zoom = 7)


esri <- grep("^Esri", providers, value = TRUE)

for (provider in esri) {
  l_dk <- l_dk %>% addProviderTiles(provider, group = provider)
}

DKmap <- l_dk %>%
  addLayersControl(baseGroups = names(esri),
                   options = layersControlOptions(collapsed = FALSE)) %>%
  addMiniMap(tiles = esri[[1]], toggleDisplay = TRUE,
             position = "bottomright") %>%
  addMeasure(
    position = "bottomleft",
    primaryLengthUnit = "meters",
    primaryAreaUnit = "sqmeters",
    activeColor = "#3D535D",
    completedColor = "#7D4479") %>% 
  htmlwidgets::onRender("
                        function(el, x) {
                        var myMap = this;
                        myMap.on('baselayerchange',
                        function (e) {
                        myMap.minimap.changeLayer(L.tileLayer.provider(e.name));
                        })
                        }") %>% 
addControl("", position = "topright")

DKmap # runa the plot


# Task 2: Read in the googlesheet data you and your colleagues populated with data. 
# The googlesheet is at https://docs.google.com/spreadsheets/d/1PlxsPElZML8LZKyXbqdAYeQCDIvDps2McZx1cTVWSzI/edit#gid=0






#########################################################









