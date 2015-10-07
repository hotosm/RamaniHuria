## Ramani Huria QGIS project

This directory contains the QGIS project as used by Ramani Huria to produce maps for both general use and specific drainage maps. The map styles are based on the default OpenStreetMap look, but adapted to show more details on drainage, water network, building type, and landuse, amongst others.

Two files are provided: the full QGIS project in `Dar es Salaam.zip` and an example set of shapefiles is provided in `dar_es_salaam.shp_2015-10-07.zip`.

### Prerequisites

- Have QGIS (http://www.qgis.org/) installed

### Usage

- Unzip `Dar es Salaam.zip` into a new folder .
- Unzip `dar_es_salaam.shp_2015-10-07.zip` (or a fresh set of shapefiles; recommended, see below) into the `/shapefiles` directory.
- Run the QGIS project file, `DarEsSalaam.qgs`.

It is recommended to download a fresh set of shapefiles for the area of your interest from the HOT export tool at http://export.hotosm.org/en/, then set the CRS to the desired one for your area (the project is set to Arc1960 for Tanzania/Dar es Salaam).

### Contents

The QGIS project contains the following folders and directories:

```
|  DarEsSalaam.qgs: The QGIS project file
|  export.txt: Additional export instruction for use with the HOT export tool
|  RamaniHuria.xml: The JOSM preset file for Ramani Huria, to be used when exporting through the HOT export tool
|- logos: Different logos in use for the map templates; covers license, sponsor logos and other map elements
|- shapefiles: Unzip your shapefiles into this folder!
|- shapefiles_sea: Standard polygon for the Indian Ocean around Dar es Salaam, based on the coastline polylines.
|- templates: Map templates various map types: A5 handout map, A1 drainage maps, A1 general maps.
```

