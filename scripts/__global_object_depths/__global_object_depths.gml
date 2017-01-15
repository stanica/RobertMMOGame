// Initialise the global array that allows the lookup of the depth of a given object
// GM2.0 does not have a depth on objects so on import from 1.x a global array is created
// NOTE: MacroExpansion is used to insert the array initialisation at import time
gml_pragma( "global", "__global_object_depths()");

// insert the generated arrays here
global.__objectDepths[0] = 0; // Network
global.__objectDepths[1] = 0; // ui_base
global.__objectDepths[2] = 0; // ui_focus_base
global.__objectDepths[3] = 0; // txt_username
global.__objectDepths[4] = 0; // ui_button_base
global.__objectDepths[5] = 0; // ui_chatbox
global.__objectDepths[6] = -1; // obj_chat_down
global.__objectDepths[7] = -100; // obj_chat_text
global.__objectDepths[8] = -1; // obj_chat_up
global.__objectDepths[9] = 0; // ui_textbox_base
global.__objectDepths[10] = 0; // obj_chat_background
global.__objectDepths[11] = 0; // obj_movement
global.__objectDepths[12] = 0; // obj_player
global.__objectDepths[13] = 0; // btn_register
global.__objectDepths[14] = 0; // obj_blocked
global.__objectDepths[15] = 0; // obj_network_player
global.__objectDepths[16] = 0; // btn_login
global.__objectDepths[17] = 0; // txt_password


global.__objectNames[0] = "Network";
global.__objectNames[1] = "ui_base";
global.__objectNames[2] = "ui_focus_base";
global.__objectNames[3] = "txt_username";
global.__objectNames[4] = "ui_button_base";
global.__objectNames[5] = "ui_chatbox";
global.__objectNames[6] = "obj_chat_down";
global.__objectNames[7] = "obj_chat_text";
global.__objectNames[8] = "obj_chat_up";
global.__objectNames[9] = "ui_textbox_base";
global.__objectNames[10] = "obj_chat_background";
global.__objectNames[11] = "obj_movement";
global.__objectNames[12] = "obj_player";
global.__objectNames[13] = "btn_register";
global.__objectNames[14] = "obj_blocked";
global.__objectNames[15] = "obj_network_player";
global.__objectNames[16] = "btn_login";
global.__objectNames[17] = "txt_password";


// create another array that has the correct entries
var len = array_length_1d(global.__objectDepths);
global.__objectID2Depth = [];
for( var i=0; i<len; ++i ) {
	var objID = asset_get_index( global.__objectNames[i] );
	global.__objectID2Depth[ objID ] = global.__objectDepths[i];
} // end for