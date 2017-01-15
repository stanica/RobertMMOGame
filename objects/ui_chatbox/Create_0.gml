width = 16*4;
height = 16*3;
padding = 4;
max_word_length = floor((width - (padding * 2))  / string_width(string_hash_to_newline("z")));
max_displayed_lines = ceil(height / string_height(string_hash_to_newline("z")));
//List of line ends
start = ds_list_create();
ds_list_add(start, 0);
        
count = 0;
last_space = 0;
line = 0;
max_lines = 0;
current_line = 100;
displayed = false;
up = "";
down = "";
message = "";
str = "";
word_length = 0;
created = false;

with (instance_create(x+width-8, y, obj_chat_up)){
  message_id = other.id;
  other.up = id;
  chatID = other.id;
}

with (instance_create(x+width-8, y+height-8, obj_chat_down)){
  message_id = other.id;
  other.down = id;
  chatID = other.id;
}
alarm[0] = 30*5

playerID = -1;

