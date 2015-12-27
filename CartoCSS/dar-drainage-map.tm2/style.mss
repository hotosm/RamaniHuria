// Languages: name (local), name_en, name_fr, name_es, name_de
@name: '[name_en]';

// Text for drains and ditches (could be used for width/depth,
//   but that doesn't come with Mapbox vector tiles
@drain_name: '[type]';

// Fonts //
@sans: 'Arial Unicode MS Regular';
@sans_bold: 'Arial Unicode MS Bold';

/*
This style is designed to be easily recolored by adjusting the color
variables below. For predicatable feature relationships,
maintain or invert existing value (light to dark) scale.
*/

// Color palette //
@road:  #fff;
@land:  #eee;

@fill1: #fff;
@fill2: #bbb;
@fill3: #777;
@fill4: #000;

@text: #777;

Map { background-color: @land; }

// Political boundaries //
#admin[admin_level=2][maritime=0] {
  line-join: round;
  line-color: mix(@fill3,@fill2,50);
  line-width: 1;
  [zoom>=5] { line-width: 1.4; }
  [zoom>=6] { line-width: 1.8; }
  [zoom>=8] { line-width: 2; }
  [zoom>=10] { line-width: 3; }
  [disputed=1] { line-dasharray: 4,4; }
}

#admin[admin_level>2][maritime=0] {
  line-join: round;
  line-color: @fill2;
  line-width: 1;
  line-dasharray: 3,2;
  [zoom>=6] { line-width: 1.5; }
  [zoom>=8] { line-width: 1.8; }
}

// Land Features //
#landuse[class='cemetery'],
#landuse[class='park'],
#landuse[class='wood'],
#landuse_overlay[class!='wetland'] {
  polygon-fill: darken(@land,3);
  [zoom>=15] { polygon-fill:mix(@land,@fill4,95); }
}

#landuse[class='pitch'],
#landuse[class='sand'] { 
  polygon-fill: mix(@land,@fill4,90);
}

#landuse[class='hospital'],
#landuse[class='industrial'],
#landuse[class='school'] { 
  polygon-fill: mix(@land,@fill1,95);
}

#building { 
  polygon-fill: mix(@fill2,@land,25);
  [zoom>=16]{ polygon-fill: mix(@fill2,@land,50);}
  polygon-opacity: 0.7;
}

#aeroway {
  ['mapnik::geometry_type'=3][type!='apron'] { 
    polygon-fill: mix(@fill2,@land,25);
    [zoom>=16]{ polygon-fill: mix(@fill2,@land,50);}
  }
  ['mapnik::geometry_type'=2] { 
    line-color: mix(@fill2,@land,25);
    line-width: 1;
    [zoom>=13][type='runway'] { line-width: 4; }
    [zoom>=16] {
      [type='runway'] { line-width: 6; }
      line-width: 3;
      line-color: mix(@fill2,@land,50);
    }
  }
}