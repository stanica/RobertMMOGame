///Initiate the connection

//ivars
savedBuffer = buffer_create(1, buffer_grow, 1);
reading = 0;
cutBuffer = buffer_create(1, buffer_grow, 1);
curTime = 0;
timeOffset = 0;

//initiate the socket
socket = network_create_socket(network_socket_tcp);
//network_connect_raw(socket, "168.235.144.28", 8082);
network_connect_raw(socket, "127.0.0.1", 8082);

