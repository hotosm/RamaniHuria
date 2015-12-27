// Basic color palette, from which variations will be derived.
@primary: #f89d9d;
@secondary: #face94;
@tertiary: #fea;
@street: #fff;
@street_limited: #f3f3f3;

// ---------------------------------------------------------------------

// Roads are split across 3 layers: #road, #bridge, and #tunnel. Each
// road segment will only exist in one of the three layers. The
// #bridge layer makes use of Mapnik's group-by rendering mode;
// attachments in this layer will be grouped by layer for appropriate
// rendering of multi-level overpasses.

// The main road style is for all 3 road layers and divided into 2 main
// attachments. The 'case' attachment is 

#road, #bridge, #tunnel {
  // casing/outlines & single lines
  ::case[zoom>=6]['mapnik::geometry_type'=2] {
    [type='primary'], [type='secondary'], [class='motorway'], [class='main'] {
      line-join:round;
      line-color: mix(@primary, #800, 75);
      #road { line-cap: round; }
      #tunnel { line-dasharray:3,2; }
      [zoom>=6]  { line-width:0.4; }
      [zoom>=7]  { line-width:0.6; }
      [zoom>=8] { line-width:1.5; }
      [zoom>=10]  { line-width:3; }
      [zoom>=13] { line-width:3.5;  }
      [zoom>=14] { line-width:5; }
      [zoom>=15] { line-width:7; }
      [zoom>=16] { line-width:9; }
    }
    [type='primary_link'][zoom>=13], [type='secondary_link'][zoom>=13] {
      line-join:round;
      line-color: mix(@primary, #800, 75);
      #road { line-cap: round; }
      #tunnel { line-dasharray:3,2; }
      [zoom>=13] { line-width:1; }
      [zoom>=14] { line-width:3; }
      [zoom>=15] { line-width:5; }
      [zoom>=16] { line-width:6.5; }
    }
    [type='secondary'], [type='secondary_link'][zoom>=13] {
      line-color: mix(@secondary, #800, 75);
    }
    
    [type='tertiary'] {
      line-join:round;
      line-color: mix(@tertiary, #800, 75);
      #road { line-cap: round; }
      #tunnel { line-dasharray:3,2; }
      [zoom>=6] { line-width:0.2; }
      [zoom>=7] { line-width:0.4; }
      [zoom>=8] { line-width:1.5; }
      [zoom>=10] { line-width:2.4; }
      [zoom>=13] { line-width:2.5; }
      [zoom>=14] { line-width:4; }
      [zoom>=15] { line-width:5; }
      [zoom>=16] { line-width:8; }
    }
    [class='street'][zoom>=12],[class='street_limited'][zoom>=12] {
      line-join:round;
      #road { line-cap: round; }
      #tunnel { line-dasharray:3,2; }
      line-color: @land * 0.8;
      [zoom>=12] { line-width:0.5; }
      [zoom>=14] { line-width:1; }
      [zoom>=15] { line-width:4; }
      [zoom>=16] { line-width:6.5; }
    }
    [class='service'][zoom>=15] {
      line-join:round;
      #road { line-cap: round; }
      #tunnel { line-dasharray:3,2; }
      line-color: @land * 0.9;
      [zoom>=15] { line-width:1; }
      [zoom>=16] { line-width:4; }
    }
    [class='path'][zoom>=15] {
      line-color: #7d9e5a;
      line-dasharray: 2,1;
      [zoom>=16] { line-width: 1.2; }
      [zoom>=17] { line-width: 1.5; }
    }
  }
  
  // fill/inlines
  ::fill[zoom>=6]['mapnik::geometry_type'=2] {
    [type='primary'][zoom>=8], [type='secondary'][zoom>=8], [class='motorway'][zoom>=8], [class='main'][zoom>=8] {
      line-join:round;
      #road, #bridge { line-cap:round; }
      line-color:@primary;
      #tunnel { line-color:lighten(@primary,4); }
      [zoom>=8] { line-width:0.5; }
      [zoom>=10] { line-width:1; }
      [zoom>=13] { line-width:2; }
      [zoom>=14] { line-width:3.5; }
      [zoom>=15] { line-width:5; }
      [zoom>=16] { line-width:7; }
    }
    [type='primary_link'][zoom>=14], [type='secondary_link'][zoom>=14] {
      line-join:round;
      #road, #bridge { line-cap: round; }
      line-color:@primary;
      #tunnel {  line-color:lighten(@primary,4); }
      [zoom>=14] { line-width:1.5; }
      [zoom>=15] { line-width:3; }
      [zoom>=16] { line-width:4.5; }
    }
    
    [type='secondary'][zoom>=8], [type='secondary_link'][zoom>=14] {
      line-color: @secondary;
      #tunnel { line-color:lighten(@secondary,4); }
    }
    
    [type='tertiary'][zoom>=8] {
      line-join:round;
      #road, #bridge { line-cap: round; }
      line-color:@tertiary;
      #tunnel { line-color:lighten(@tertiary,4); }
      [zoom>=8] { line-width:0.5; }
      [zoom>=10] { line-width:1; }
      [zoom>=13] { line-width:1.5; }
      [zoom>=14] { line-width:2.5; }
      [zoom>=15] { line-width:3.5; }
      [zoom>=16] { line-width:6; }
    }
    [class='street'][zoom>=15], {
      line-join:round;
      #road, #bridge { line-cap: round; }
      [zoom>=15] { line-width:2.5; line-color:#fff; }
      [zoom>=16] { line-width:4; }
    }
    [class='street_limited'][zoom>=15], {
      line-join:round;
      #road, #bridge { line-cap: round; }
      [zoom>=15] { line-width:2.5; line-color:#eee; }
      [zoom>=16] { line-width:4; }
    }
    [class='service'][zoom>=16], {
      line-join:round;
      #road, #bridge { line-cap: round; }
      [zoom>=16] { line-width:2; line-color:#fff; }
    }
    [class='major_rail'] {
      line-width: 0.4;
      line-color: #bbb;
      [zoom>=16] {
        line-width: 0.75;
      	// Hatching
      	h/line-width: 3;
      	h/line-color: #bbb;
      	h/line-dasharray: 1,31;
      }
    }
  }
}
