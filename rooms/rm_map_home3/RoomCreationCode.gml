/*
var file;
file = file_text_open_append("map.txt");

for (var r=0; r<768; r+=8){
    for (var s=0; s<1024; s+=8){
    if(tile_layer_find(1000000,s,r) >= 0){
      var pos = string(tile_get_top(tile_layer_find(1000000,s,r))) + " " + string(tile_get_left(tile_layer_find(1000000,s,r)));
        if (pos == "16 80"){
          show_debug_message(string(s/8) + " " + string(r/8));
          file_text_write_string(file, "vals[" + string(r/8) + "][" + string(s/8)+"]=1;");
        }
    }
  }
}
file_text_close(file);
*/