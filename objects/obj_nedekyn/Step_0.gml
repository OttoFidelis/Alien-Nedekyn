script_execute(estado)
if place_meeting(x+horizontalspd,y,obj_gun){
	alarm[4]=300
	instance_destroy(obj_gun)
}
if alarm[4]>0{
	tiros++
}

