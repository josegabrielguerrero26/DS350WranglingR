---
title: "W09 Case Study: Interactive Maps, leaflet"
author: "Gabriel Guerrero"
date: "November 08, 2023"
execute:
  keep-md: true
  warning: false
format:
  html:
    code-fold: true
    code-tools: true
---



## Resources

### Readings

In Leaflet for R read the following sections:

-   Introduction
-   The Map Widget
-   Basemaps
-   Markers
-   Popups and Labels
-   Lines and Shapes
-   Colors
-   Layers

A gallery of tiles to consider is the Leaflet Providers Preview

*http://leaflet-extras.github.io/leaflet-providers/preview/*

### Guided Instruction

-   Publishing to a Posit Server for Interactive Files: https://byuistats.github.io/M335/online_class/week10-shiny.Rmd

-   Leaflet Basic.Rmd : https://byuistats.github.io/M335/online_class/week13-leaflet_basic.Rmd

-   Leaflet Layers.Rmd : https://byuistats.github.io/M335/online_class/week13-leaflet_layers.Rmd (optional)

-   Answer Key to Above Guided Instructions : https://byuistats.github.io/M335/online_class/week13-leaflet_activity_keys.html

## Background

You can recreate the previous map task, or find your own spatial data to display using leaflet. Consider using layers and control boxes to show time or other aspects of the data.

## Recreate a Graph

-  Recreate a previous task visualization using a simple leaflet plot using R OR

-  Find your own spatial data that interests you and build a simple interactive map using leaflet You could experiment with using one (or both) of the two different kinds of layers.


::: {.cell}
::: {.cell-output-display}

```{=html}
<div class="datatables html-widget html-fill-item-overflow-hidden html-fill-item" id="htmlwidget-573957740c8770227e86" style="width:100%;height:auto;"></div>
<script type="application/json" data-for="htmlwidget-573957740c8770227e86">{"x":{"filter":"none","vertical":false,"data":[["1","2","3","4","5","6","7","8","9","10","11","12","13","14","15","16"],["Alberta","British Columbia","Diamond Princess","Grand Princess","Manitoba","New Brunswick","Newfoundland and Labrador","Northwest Territories","Nova Scotia","Nunavut","Ontario","Prince Edward Island","Quebec","Repatriated Travellers","Saskatchewan","Yukon"],[53.9333,53.7267,0,0,53.7609,46.5653,53.1355,64.82550000000001,44.682,70.2998,51.2538,46.5107,52.9399,null,52.9399,64.28230000000001],[-116.5765,-127.6476,0,0,-98.8139,-66.4619,-57.6604,-124.8457,-63.7443,-83.10760000000001,-85.3232,-63.4168,-73.5491,null,-106.4509,-135],[629269,396817,0,13,154712,88866,54757,11511,140793,3531,1601325,56523,1320325,13,153651,4989],[5622,5249,1,0,2464,834,318,22,794,7,16234,93,18160,0,1890,32],[0.893417600422077,1.322775989939947,null,0,1.592636640984539,0.9384916616028628,0.5807476669649542,0.1911215359221614,0.5639484917574027,0.1982441234777683,1.013785458916834,0.1645347911469667,1.375418930945032,0,1.230060331530547,0.6414111044297455]],"container":"<table class=\"display\">\n  <thead>\n    <tr>\n      <th> <\/th>\n      <th>province<\/th>\n      <th>lat<\/th>\n      <th>long<\/th>\n      <th>confirmed<\/th>\n      <th>death<\/th>\n      <th>death_rate<\/th>\n    <\/tr>\n  <\/thead>\n<\/table>","options":{"columnDefs":[{"className":"dt-right","targets":[2,3,4,5,6]},{"orderable":false,"targets":0}],"order":[],"autoWidth":false,"orderClasses":false}},"evals":[],"jsHooks":[]}</script>
```

:::
:::



#### Covid Cases in Canada Graph 1


::: {.cell}
::: {.cell-output-display}

```{=html}
<div class="leaflet html-widget html-fill-item-overflow-hidden html-fill-item" id="htmlwidget-9aa6b722dafaa1c62dd4" style="width:100%;height:464px;"></div>
<script type="application/json" data-for="htmlwidget-9aa6b722dafaa1c62dd4">{"x":{"options":{"crs":{"crsClass":"L.CRS.EPSG3857","code":null,"proj4def":null,"projectedBounds":null,"options":{}}},"setView":[[60,-100],3.45,[]],"calls":[{"method":"addTiles","args":["https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",null,null,{"minZoom":0,"maxZoom":18,"tileSize":256,"subdomains":"abc","errorTileUrl":"","tms":false,"noWrap":false,"zoomOffset":0,"zoomReverse":false,"opacity":1,"zIndex":1,"detectRetina":false,"attribution":"&copy; <a href=\"https://openstreetmap.org/copyright/\">OpenStreetMap<\/a>,  <a href=\"https://opendatacommons.org/licenses/odbl/\">ODbL<\/a>"}]},{"method":"addMarkers","args":[[53.9333,53.7267,0,0,53.7609,46.5653,53.1355,64.82550000000001,44.682,70.2998,51.2538,46.5107,52.9399,null,52.9399,64.28230000000001],[-116.5765,-127.6476,0,0,-98.8139,-66.4619,-57.6604,-124.8457,-63.7443,-83.10760000000001,-85.3232,-63.4168,-73.5491,null,-106.4509,-135],null,null,null,{"interactive":true,"draggable":false,"keyboard":true,"title":"","alt":"","zIndexOffset":0,"opacity":1,"riseOnHover":false,"riseOffset":250},["89.34%","132.28%","Inf","0.00%","159.26%","93.85%","58.07%","19.11%","56.39%","19.82%","101.38%","16.45%","137.54%","0.00%","123.01%","64.14%"],null,null,null,["Alberta","British Columbia","Diamond Princess","Grand Princess","Manitoba","New Brunswick","Newfoundland and Labrador","Northwest Territories","Nova Scotia","Nunavut","Ontario","Prince Edward Island","Quebec","Repatriated Travellers","Saskatchewan","Yukon"],{"interactive":false,"permanent":false,"direction":"auto","opacity":1,"offset":[0,0],"textsize":"10px","textOnly":false,"className":"","sticky":true},null]}],"limits":{"lat":[0,70.2998],"lng":[-135,0]}},"evals":[],"jsHooks":[]}</script>
```

:::
:::

#### Covid Cases in Canada Graph 2


::: {.cell}
::: {.cell-output-display}

```{=html}
<div class="leaflet html-widget html-fill-item-overflow-hidden html-fill-item" id="htmlwidget-f973acf243d5173376e7" style="width:100%;height:464px;"></div>
<script type="application/json" data-for="htmlwidget-f973acf243d5173376e7">{"x":{"options":{"crs":{"crsClass":"L.CRS.EPSG3857","code":null,"proj4def":null,"projectedBounds":null,"options":{}}},"setView":[[60,-100],3.45,[]],"calls":[{"method":"addTiles","args":["https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",null,null,{"minZoom":0,"maxZoom":18,"tileSize":256,"subdomains":"abc","errorTileUrl":"","tms":false,"noWrap":false,"zoomOffset":0,"zoomReverse":false,"opacity":1,"zIndex":1,"detectRetina":false,"attribution":"&copy; <a href=\"https://openstreetmap.org/copyright/\">OpenStreetMap<\/a>,  <a href=\"https://opendatacommons.org/licenses/odbl/\">ODbL<\/a>"}]},{"method":"addCircles","args":[[53.9333,53.7267,0,0,53.7609,46.5653,53.1355,64.82550000000001,44.682,70.2998,51.2538,46.5107,52.9399,null,52.9399,64.28230000000001],[-116.5765,-127.6476,0,0,-98.8139,-66.4619,-57.6604,-124.8457,-63.7443,-83.10760000000001,-85.3232,-63.4168,-73.5491,null,-106.4509,-135],[79326.47729478475,62993.41235399143,0,360.5551275463989,39333.44632752131,29810.4008694952,23400.2136742381,10728.9328453486,37522.39331385992,5942.221806698231,126543.4707916612,23774.56624209998,114905.3958698198,360.5551275463989,39198.34180166299,7063.285354564121],null,null,{"interactive":true,"className":"","stroke":true,"color":["#2A768E","#3B518B","#440154","#440154","#482475","#481668","#470E61","#450457","#482072","#440255","#FDE725","#470E61","#8AD547","#440154","#482374","#440256"],"weight":5,"opacity":0.5,"fill":true,"fillColor":["#2A768E","#3B518B","#440154","#440154","#482475","#481668","#470E61","#450457","#482072","#440255","#FDE725","#470E61","#8AD547","#440154","#482374","#440256"],"fillOpacity":1},null,null,["Alberta 89.34%","British Columbia 132.28%","Diamond Princess Inf","Grand Princess 0.00%","Manitoba 159.26%","New Brunswick 93.85%","Newfoundland and Labrador 58.07%","Northwest Territories 19.11%","Nova Scotia 56.39%","Nunavut 19.82%","Ontario 101.38%","Prince Edward Island 16.45%","Quebec 137.54%","Repatriated Travellers 0.00%","Saskatchewan 123.01%","Yukon 64.14%"],{"interactive":false,"permanent":false,"direction":"auto","opacity":1,"offset":[0,0],"textsize":"10px","textOnly":false,"className":"","sticky":true},null,null]}],"limits":{"lat":[0,70.2998],"lng":[-135,0]}},"evals":[],"jsHooks":[]}</script>
```

:::
:::



## Conclusions

N/A