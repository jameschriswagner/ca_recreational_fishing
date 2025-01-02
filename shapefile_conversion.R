library(sf)
library(ggplot2)


# Specify the path to the geodatabase
gdb_path <- "/Users/jameswagner/Dropbox/Mac/Documents/recreational_fishing_pressure/raw_datasets/benthic/ds3091/ds3091_vector.gdb"

# List the available layers in the geodatabase
layer_names <- st_layers(gdb_path)
print(layer_names)

# close in for the kill
layer_data <- st_read(gdb_path, layer = "ds3091")
head(layer_data)

st_crs(layer_data)

# EPSG:4326 (WGS 84)
lat_lon_crs <- 4326

# Transform the CRS of layer_data
layer_data <- st_transform(layer_data, crs = lat_lon_crs)

# Check the CRS after transformation
st_crs(layer_data)

st_write(layer_data, "/Users/jameswagner/Dropbox/Mac/Documents/recreational_fishing_pressure/clean_data/benthic/benthic_substrates.shp")
