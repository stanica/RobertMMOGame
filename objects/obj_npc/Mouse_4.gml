if(messageId == -1){
	with(instance_create(x - 24, y - 44, ui_chatbox)){
	  message = other.text;
	  playerID = other.id;
	  line = 0;
		other.messageId = id;
		speaking = true;
	}
}
else {
	with(messageId){
		instance_destroy();
	}
	messageId = -1;
}