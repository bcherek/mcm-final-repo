extends Node

#Variable represents the TENTATIVE amount to transport.
var curr_cargo: Array

func _ready() -> void:
	curr_cargo.resize(26)
	curr_cargo.fill(0)
	
