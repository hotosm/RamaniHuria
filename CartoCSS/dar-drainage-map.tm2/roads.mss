// dummy styles to set ordering (case below fill)
#tunnel, #bridge, #road {
  ::case { opacity: 0.5; }
  ::fill { opacity: 0.5; }
} 

// consistent case size
@case: 2;

// Road & Railway Fills //
#tunnel { opacity: 0.5; }

#road[zoom<11],
#tunnel[zoom<11],
#bridge[zoom<11] {
    line-color: @road;
    line-width: 0.5;
  [class='motorway'] { line-width: 1;}
}

#road::fill[zoom>=11],
#tunnel::fill[zoom>=11],
#bridge::fill[zoom>=11] {
  ['mapnik::geometry_type'=2] {
    line-color: @road;
    line-width: 0.5;
    [zoom>=15] { line-width: 1; } 
    [class='path'] { line-dasharray: 2,2;}
    [class='major_rail'],
    [class='minor_rail'] { line-dasharray: 3,3; }
    [class='motorway'] { 
      [zoom>=11] { line-width: 2; }
      [zoom>=12] { line-width: 2; }
      [zoom>=14] { line-width: 3; }
      [zoom>=16] { line-width: 4; }
      [zoom>=17] { line-width: 5; }
      [zoom>=18] { line-width: 7.5; }
//      [zoom>=15] { line-width: 0; }
    }
    [class='motorway_link'],
    [class='main'] {
      [zoom>=11] { line-width: 1; }
      [zoom>=12] { line-width: 1; }
      [zoom>=14] { line-width: 2; }
      [zoom>=16] { line-width: 3; }
      [zoom>=17] { line-width: 4; }
      [zoom>=18] { line-width: 5.5; }
//      [zoom>=15] { line-width: 0; }
    }
    [class='street'],
    [class='street_limited'] {
      [zoom>=14] { line-width: 1; }
      [zoom>=16] { line-width: 2; }
      [zoom>=18] { line-width: 3.2; }
//      [zoom>=15] { line-width: 0; }
    }
    [class='street_limited'] { line-dasharray: 4,2;}
    [class='path'] {
      line-color: mix(@road,black,70);
      [zoom>=18] { line-width: 1.2; }
      [zoom>=19] { line-width: 2; }
    }
  }
}

// Casing for high-zoom roads //
#road::case[zoom>=11],
#tunnel::case[zoom>=11],
#bridge::case[zoom>=11] {
  ['mapnik::geometry_type'=2] {
    line-color: @land;
    line-width: 1;
    [class='motorway_link'] {
      [zoom>=11] { line-width: 2 + @case; }
      [zoom>=12] { line-width: 2 + @case; }
      [zoom>=14] { line-width: 3 + @case; }
      [zoom>=16] { line-width: 4 + @case; }
      [zoom>=17] { line-width: 5 + @case; }
      [zoom>=18] { line-width: 7.5 + @case; }
    }
    [class='motorway_link'],
    [class='main'] {
      [zoom>=11] { line-width: 1 + @case; }
      [zoom>=12] { line-width: 1 + @case; }
      [zoom>=14] { line-width: 2 + @case; }
      [zoom>=16] { line-width: 3 + @case; }
      [zoom>=17] { line-width: 4 + @case; }
      [zoom>=18] { line-width: 5.5 + @case; }
    }
    [class='street'],
    [class='street_limited'] {
      [zoom>=14] { line-width: 1 + @case; }
      [zoom>=16] { line-width: 2 + @case; }
      [zoom>=18] { line-width: 3.2 + @case; }
    }
    [class='street_limited'] { line-dasharray: 4,2; }
  }
}