event_inherited();

if(string_length(txt_username.text) > 0 && string_length(txt_password.text) > 0){
  var loginPacket = buffer_create(1, buffer_grow, 1);
  buffer_write(loginPacket, buffer_string, "login");
  buffer_write(loginPacket, buffer_string, txt_username.text);
  buffer_write(loginPacket, buffer_string, txt_password.text);
  
  network_write(Network.socket, loginPacket);
}
else {
  show_message("Error: Username or password cannot be blank");
}

