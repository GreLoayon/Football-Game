extends Area2D

var score = 0
func _on_body_entered(body):
	score += 1
	print("Goal! You scored some points. Score: " , score)
