extends Node

var inDialogue = false
# Called when the node enters the scene tree for the first time.
func _ready():
	DialogueManager.show_dialogue_balloon(load("res://Dialog/StartDialog.dialogue"), "Start")
	



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
