extends Control


@onready var MAIN = preload("res://scenes/main.tscn")
@onready var CREDITS = preload("res://scenes/credits.tscn")

func _on_start_pressed() -> void:
	get_tree().change_scene_to_packed(MAIN)

func _on_credits_pressed() -> void:
	get_tree().change_scene_to_packed(CREDITS)

func _on_exit_pressed() -> void:
	get_tree().quit()
