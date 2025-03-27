extends Node2D

@onready var interactable_component: InteractableConponent = $InteractableComponent
@onready var interactable_label_component: Control = $InteractableLabelComponent
var in_range: bool

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	interactable_component.interactable_activated.connect(on_interactable_activated)
	interactable_component.interactable_deactivated.connect(on_interactable_deactivated)
	interactable_label_component.hide()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func on_interactable_activated()-> void:
	in_range=true
	interactable_label_component.show()

func on_interactable_deactivated()->void:
	in_range=false
	interactable_label_component.hide()

func _unhandled_input(event: InputEvent) -> void:
	if in_range:	
		if event.is_action_pressed("show_dialogue"):
			get_tree().paused=true
			get_node('AnimatedSprite2D').play('idle')
			get_node('Shop/Panel/Anim').play('TransIn')
