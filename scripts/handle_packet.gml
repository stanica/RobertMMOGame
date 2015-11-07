///argument0: data buffer
var command = buffer_read(argument0, buffer_string);
show_debug_message("Networking event: " + string(command));

switch(command){
  case "HELLO":
    server_time = buffer_read(argument0, buffer_string);
    room_goto_next();
    show_debug_message("Server welcomes you @ " + server_time);
    break;
  
  case "TIME":
    server_time = buffer_read(argument0, buffer_u32);
    Network.timeOffset = server_time - Network.curTime;  
    break;
    
  case "LOGIN":
    status = buffer_read(argument0, buffer_string);
    if(status == "TRUE"){
      target_room = buffer_read(argument0, buffer_string);
      target_x = buffer_read(argument0, buffer_u16);
      target_y = buffer_read(argument0, buffer_u16);
      name = buffer_read(argument0, buffer_string);
      goto_room = asset_get_index(target_room);
      room_goto(goto_room);
      with(instance_create(target_x, target_y, obj_player)){
        name = other.name;
      }
      //Login has taken place, load other players
      var loadPlayers = buffer_create(1, buffer_grow, 1);
      buffer_write(loadPlayers, buffer_string, "loadplayers");
      network_write(Network.socket, loadPlayers);
    }
    else {
      show_message("Login failed: Invalid username or password.");
    }
    break;
  
  case "REGISTER":
    status = buffer_read(argument0, buffer_string);
    if(status == "TRUE"){
      show_message("Register success. Please login.");
    }
    else {
      show_message("Register failed: Username taken.");
    }
    break;
    
  case "POS":
    username = buffer_read(argument0, buffer_string);
    target_x = buffer_read(argument0, buffer_u16);
    target_y = buffer_read(argument0, buffer_u16);
    foundPlayer = -1;
    with(obj_network_player){
      if(name == other.username){
        other.foundPlayer = id;
        break;
      }
    }
    if(foundPlayer != -1){
      with(foundPlayer){
        target_x = other.target_x;
        target_y = other.target_y;
      }
    }
    else {
      with(instance_create(target_x, target_y, obj_network_player)){
        name = other.username;
      }
    }
    break;
    
  case "USER_POS":
    dir = buffer_read(argument0, buffer_string);
    value = buffer_read(argument0, buffer_u16);
    //Stores the last confirmed input message number by the server
    var networkInput = buffer_read(argument0, buffer_string);
    var updatedX = 0;
    var updatedY = 0;
    switch(dir){
      case "HORIZ":
        updatedX = value;
        break;
          
      case "VERT":
        updatedY = value;
        break;
      }
    //Extract last confirmed coordinates from last confirmed input using last confirmed message number
    for(var i=0; i<ds_list_size(obj_player.inputs); i++){
      if(obj_player.inputs[| i].inputID == real(networkInput)){
        with(obj_player.inputs[| i]){
        show_debug_message("other x is:" + string(updatedX));
          if(updatedX == 0){
            updatedX = x;
          }
          else if(updatedY == 0)
            updatedY = y;
        }
      }
    }
    with(obj_player){
      //If the last confirmed coordinate doesn't match current player's coordinate, update player
      target_x = updatedX;
      target_y = updatedY;
      
      //Destroy input object matching confirmed message number and delete item from inputs array
      for (var i=0; i<ds_list_size(inputs); i++){
        if (inputs[| i].inputID == real(networkInput)){
          with(inputs[| i]){
            instance_destroy();
          }
          ds_list_delete(inputs, i);
        }
      }
      
      //Loop through inputs array and apply local coordinates to player
      with(obj_player){
      show_debug_message("inputs size is: " + string(ds_list_size(inputs)) + " x is: " + string(x) + " y is: " + string(y));
        for(i = 0; i < ds_list_size(inputs); i++){
          target_x = inputs[| i].x;
          target_y = inputs[| i].y;
        }
      }
    }
    break;
  
  case "PONG":
    old_time = buffer_read(argument0, buffer_u32);
    //server_time = buffer_read(argument0, buffer_u32);
    obj_player.ping = floor(current_time - old_time);
    break;
  
  case "LOGOUT":
    user = buffer_read(argument0, buffer_string);
    with(obj_network_player){
        if(name == other.user){
            instance_destroy();
        }
    }
    break
    
  case "CHAT":
    type = buffer_read(argument0, buffer_string);
    message = buffer_read(argument0, buffer_string);
    user = buffer_read(argument0, buffer_string);
    show_debug_message(message);
    with(obj_network_player){
      if(name == other.user){
        text = other.message;
        if(chatID > 0) {
          with(chatID){
            instance_destroy();
          }
        }
        with(instance_create(other.x - 24, other.y - 44, ui_chatbox)){
          message = other.text;
          playerID = other.id;
          other.chatID = id;
          line = 0;
        }
      }
    }
    if(user == obj_player.name) {
      if(obj_player.chatID > 0){
        with(obj_player.chatID){
          instance_destroy();
        }
      }
      with(instance_create(obj_player.x - 24, obj_player.y - 44, ui_chatbox)){
          message = other.message;
          playerID = obj_player.id;
          obj_player.chatID = id;
          count = 0;
          line = 0;
          displayed = false;
        }
    }
    break
}
