if(target_x > x) { x += 4; }
if(target_x < x) { x -= 4; }
if(target_y > y) { y += 4; }
if(target_y < y) { y -= 4; }

if(target_x == x && target_y == y) { moving = false; image_speed=0;}

if(canMove){
    if(keyboard_check(vk_left) && !moving && place_free(x - 8, y)){
      input = instance_create(0,0,obj_movement);
      with(input){
        x = other.x - other.stepSpeed;
        y = other.y;
        inputID = ++other.inputID;
      }
      ds_list_add(inputs, input);
      moving = true;
      facing = "left";
      sprite_index = spr_hero_left;
      var movePacket = buffer_create(1, buffer_grow, 1);
      buffer_write(movePacket, buffer_string, "move");
      buffer_write(movePacket, buffer_string, "left");
      buffer_write(movePacket, buffer_string, string(inputID));
      network_write(Network.socket, movePacket);
      target_x = x - stepSpeed;
    }
    else if(keyboard_check(vk_right) && !moving && place_free(x + 8, y)){
      input = instance_create(0,0,obj_movement);
      with(input){
        x = other.x + other.stepSpeed;
        y = other.y;
        inputID = ++other.inputID;
      }
      ds_list_add(inputs, input);
      moving = true;
      facing = "right";
      sprite_index = spr_hero_right;
      var movePacket = buffer_create(1, buffer_grow, 1);
      buffer_write(movePacket, buffer_string, "move");
      buffer_write(movePacket, buffer_string, "right");
      buffer_write(movePacket, buffer_string, string(inputID));
      network_write(Network.socket, movePacket);
      target_x = x + stepSpeed;
    }
    else if(keyboard_check(vk_up) && !moving && place_free(x, y - 8)){
      input = instance_create(0,0,obj_movement);
      with(input){
        x = other.x;
        y = other.y - other.stepSpeed;
        inputID = ++other.inputID;
      }
      ds_list_add(inputs, input);
      moving = true;
      facing = "up";
      sprite_index = spr_hero_up;
      var movePacket = buffer_create(1, buffer_grow, 1);
      buffer_write(movePacket, buffer_string, "move");
      buffer_write(movePacket, buffer_string, "up");
      buffer_write(movePacket, buffer_string, string(inputID));
      network_write(Network.socket, movePacket);
      target_y = y - stepSpeed;
    }
    else if(keyboard_check(vk_down) && !moving && !moving && place_free(x, y + 8)){
      input = instance_create(0,0,obj_movement);
      with(input){
        x = other.x;
        y = other.y + other.stepSpeed;
        inputID = ++other.inputID;
      }
      ds_list_add(inputs, input);
      moving = true;
      facing = "down";
      sprite_index = spr_hero_down;
      var movePacket = buffer_create(1, buffer_grow, 1);
      buffer_write(movePacket, buffer_string, "move");
      buffer_write(movePacket, buffer_string, "down");
      buffer_write(movePacket, buffer_string, string(inputID));
      network_write(Network.socket, movePacket);
      target_y = y + stepSpeed;
    }
    else if(keyboard_check(vk_left)){
      facing = "left";
       sprite_index = spr_hero_left;
    }
    else if(keyboard_check(vk_right)){
      facing = "right";
       sprite_index = spr_hero_right;
    }
    else if(keyboard_check(vk_up)){
      facing = "up";
       sprite_index = spr_hero_up;
    }
    else if(keyboard_check(vk_down)){
      facing = "down";
      sprite_index = spr_hero_down;
    }
    image_speed=0.2;
}

if(keyboard_check_released(vk_enter)){
  if(instance_exists(obj_chat_background) && instance_exists(obj_chat_text)){
    canMove = true;
    text = obj_chat_text.text;
    text = string_copy(text, 3, string_length(text));
    if(string_length(text) > 0){
      var chatPacket = buffer_create(1, buffer_grow, 1);
      buffer_write(chatPacket, buffer_string, "chatmsg");
      buffer_write(chatPacket, buffer_string, "all");
      buffer_write(chatPacket, buffer_string, text);
      buffer_write(chatPacket, buffer_string, name);
      network_write(Network.socket, chatPacket);
    }
    with(obj_chat_background){
      instance_destroy();
    }
    with(obj_chat_text){
      instance_destroy();
    }
  }
  else {
    canMove = false;
    instance_create(__view_get( e__VW.XView, 0 ), __view_get( e__VW.YView, 0 ) + __view_get( e__VW.HView, 0 )-16, obj_chat_background)
    instance_create(__view_get( e__VW.XView, 0 ), __view_get( e__VW.YView, 0 ) + __view_get( e__VW.HView, 0 )-16, obj_chat_text)
  }
}

