// colisão com a parede
repeat(abs(horizontalspd)){
	if place_meeting(x+sign(horizontalspd),y,obj_block){
		if !place_meeting(x+sign(horizontalspd),y-1,obj_block)
		y--
	}
	else{
		if !place_meeting(x+sign(horizontalspd),y+1,obj_block){
			if place_meeting(x+sign(horizontalspd),y+2,obj_block){
				y++
			}	
		}
	}
	
	if place_meeting(x+sign(horizontalspd),y,obj_block){
		horizontalspd=0
		break
	}
	else{
		x+=sign(horizontalspd)
	}
}
//colisão com o chão
repeat(abs(verticalspd)){
	if place_meeting(x,y+sign(verticalspd),obj_block){
		verticalspd=0
		break
	}
	else{
		y+=sign(verticalspd)
	}
}




