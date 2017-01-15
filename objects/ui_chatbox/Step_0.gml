if (!displayed){
  for (i=0; i<= string_length(message); i++){
    //If past width of chat box, insert line break.
    if(string_width(string_hash_to_newline(str)) > width - (padding*2)){
      //Remove space and replace with line break
      message = string_delete(message, last_space, 1);
      message = string_insert("#", message, last_space);
      ds_list_add(start, last_space+1);
    }
    
    //Make sure we have not reached end of message
    if (count <= string_length(message)){
      //If space, set last_space variable
      if (string_char_at(message, count) == " "){
        last_space = count;
        word_length = 0;
      }
      //Increment count
      count+=1;
      
      if (string_char_at(message, count) != "-" && string_char_at(message, count) != "#"){
        word_length++;
      }
      else {
            word_length = 0;
      }
      show_debug_message(word_length);
      if (word_length > max_word_length && string_char_at(message, count-1) != "-"){
        message = string_insert("-", message, count-1);
        message = string_insert("#", message, count);
        ds_list_add(start, count+1);
        word_length = 0;
      }
    }
    
    //If past bottom of chat box, move up a line
    if (string_height(string_hash_to_newline(str)) > height && line<current_line) {
      line++;
    }
    
    //Grab string 
    str = string_copy(message, ds_list_find_value(start, line), count-ds_list_find_value(start, line));
  }
  //Add newline character at the end of the string for computing max displayed lines
  message = string_insert("#", message, count);
  if(max_lines == 0){
    max_lines = line;
    current_line = line;
  }
  displayed = true;
  word_length = 0;
  var line_length = 0;
  var displayed_lines = 0;
  if (line < max_lines){
    while(displayed_lines < max_displayed_lines){
        line_length++;
        if(string_char_at(message, ds_list_find_value(start,line) + line_length) == "#" || string_char_at(message, ds_list_find_value(start,line) + line_length) == undefined){
            displayed_lines++;
        }
    }
    str = string_copy(message, ds_list_find_value(start, line), line_length);
  }
}

