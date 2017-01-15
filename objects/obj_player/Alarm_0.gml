var ping_packet = buffer_create(1, buffer_grow, 1);
buffer_write(ping_packet, buffer_string, "ping");
buffer_write(ping_packet, buffer_u32, current_time);
//network_write(Network.socket, ping_packet);
alarm[0] = room_speed * 5;

