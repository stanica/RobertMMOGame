name = "";
moving = false;
target_x = x;
target_y = y;
facing = "down";
sprite_index = spr_hero_down;
image_speed = 0.1;
draw_set_font(font0);
date_set_timezone(timezone_utc);
alarm[0] = 1;
timeOffset = 0;
ping = 0;
visible_chat = false;
canMove = true;
chatID = -1;
stepSpeed = 8;

inputs = ds_list_create();
inputID = -1;

//var file;
//file = file_text_open_append("map.txt");
//file_text_write_string(file, "vals[" + string(y/8) + "][" + string(x/8)+"]=1;");
//file_text_close(file);

