// Color palette //
@water: #a0c8f0;
@river: #6ca4df;
@drain:  mix(@river,red,50);


// Water Features (including riverbanks) //
#water {
  polygon-fill: @water - #111;
  // Map tiles are 256 pixels by 256 pixels wide, so the height 
  // and width of tiling pattern images must be factors of 256. 

  [zoom<=5] {
    // Below zoom level 5 we use Natural Earth data for water,
    // which has more obvious seams that need to be hidden.
    polygon-gamma: 0.4;
  }
  ::blur {
    // This attachment creates a shadow effect by creating a
    // light overlay that is offset slightly south. It also
    // create a slight highlight of the land along the
    // southern edge of any water body.
    polygon-fill: #f0f0ff;
    comp-op: soft-light;
    image-filters: agg-stack-blur(1,1);
    polygon-geometry-transform: translate(0,1);
    polygon-clip: false;
  }
}

// Wetland / Floodprone Areas //
#landuse_overlay[class='wetland'] {
  polygon-pattern-file: url(pattern/wave.png);
  
  ::shadow {
    polygon-fill: mix(@water,@fill4,60);
    polygon-opacity: 0.1;
  }
  ::fill {
    polygon-fill: @water;
    polygon-opacity: 0.1;
    // blurring reveals the polygon fill from ::shadow around
    // the edges of the water
    image-filters: agg-stack-blur(5,5);
  }
}



// Rivers, Streams, Canals //
#waterway {
  [type='river'],
  [type='canal'] {
    line-color: @river;
    line-width: 0.5;
    [zoom>=12] { line-width: 1.0; }
    [zoom>=13] { line-width: 1.3; }
    [zoom>=14] { line-width: 2.6; }
    [zoom>=15] { line-width: 3.4; }
    [zoom>=16] { line-width: 3.8; }
    [zoom>=17] { line-width: 4.4; }
    [zoom>=18] { line-width: 5.0; }
    [zoom>=19] { line-width: 6.0; }
  }
  [type='stream'] {
    line-color: @river;
    line-width: 0.5;
    [zoom>=13] { line-width: 0.7; }
    [zoom>=14] { line-width: 1.3; }
    [zoom>=15] { line-width: 1.7; }
    [zoom>=16] { line-width: 1.9; }
    [zoom>=17] { line-width: 2.2; }
    [zoom>=18] { line-width: 2.5; }
    [zoom>=19] { line-width: 3.0; }
  }
  [type='stream_intermittent'] {
    line-dasharray: 4,2;
  }
}

// Drains //
// **** add width and depth to label, maybe type?
// (would do dashes for covered features if it came with MapBox streets)
#waterway {
  [type='drain'],
  [type='ditch'] {
    line-join: round;
    line-color: @drain;
    line-width: 0.2;
    [zoom>=14] { line-width: 0.5; }
    [zoom>=15] { line-width: 1.0; }
    [zoom>=16] { line-width: 1.5; }
    [zoom>=17] { line-width: 1.8; }
    [zoom>=18] { line-width: 2.1; }
    [zoom>=19] { line-width: 2.5; }
  }
  [class='ditch'] {
    line-dasharray: 4,2;
  }
}
