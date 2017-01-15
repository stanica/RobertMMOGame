if(keyboard_key == vk_backspace && string_length(text) > 2){
  text = string_copy(text, 0, string_length(text)-1);
}
else {
  if(ord(keyboard_lastchar) != vk_enter)
    text += keyboard_lastchar;
}

