draw_set_alpha(0.5);
draw_roundrect_colour(x, y, x+width, y+height, c_black, c_black, false);
draw_set_alpha(1);
draw_set_color(c_white);
draw_set_font(chatBox);
draw_text(x+padding, y+padding, string_hash_to_newline(str));
draw_set_font(font0);

