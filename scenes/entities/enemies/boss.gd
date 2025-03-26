extends Enemy

const simple_attacks = {
	'slice': "2H_Melee_Attack_Slice",
	'spin': "2H_Melee_Attack_Spin",
	'range': "1H_Melee_Attack_Stab"
}

func _physics_process(delta: float) -> void:
	move_to_player(delta)


func _on_attack_timer_timeout() -> void:
	if position.distance_to(player.position) < 5.0:
		melee_attack_animation()
	else:
		range_attack_animation()
		

func range_attack_animation() -> void:
	stop_movement(1.5,1.5)
	attack_animations.animation = simple_attacks['range']
	$AnimationTree.set("parameters/AttackOneShot/request", AnimationNodeOneShot.ONE_SHOT_REQUEST_FIRE)
		

func melee_attack_animation() -> void:
	attack_animations.animation = simple_attacks['slice' if rng.randi() % 2 else 'spin']
	$AnimationTree.set("parameters/AttackOneShot/request", AnimationNodeOneShot.ONE_SHOT_REQUEST_FIRE)
