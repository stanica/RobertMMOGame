if(hover){
  draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, image_angle, c_gray, 1.0);
}
else {
  draw_self();
}

draw_text(x + 3, y + 8, string_hash_to_newline(string(text)));

