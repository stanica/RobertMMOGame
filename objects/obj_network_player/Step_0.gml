if(target_x > x) { 
  x += 4; 
  facing = "right"; 
  sprite_index = spr_hero_right;
}
if(target_x < x) { 
  x -= 4; 
  facing = "left"; 
  sprite_index = spr_hero_left;
}
if(target_y > y) { 
  y += 4; 
  facing = "down"; 
  sprite_index = spr_hero_down;
}
if(target_y < y) { 
  y -= 4; 
  facing = "up"; 
  sprite_index = spr_hero_up;
}

