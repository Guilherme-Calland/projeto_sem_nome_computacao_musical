extends "res://scripts/estagios/RodarEstagio.gd"

var xilofoneNotas = ['C6','A5','F5','G5','E6','C6','F6', 'B5', 'G6', 'E6','F6', 'B5','C6','A5','F5','G5','C6']
var xilofonePosicoes = [
	Vector2(160, 96), # C6
	Vector2(289, 31), # A5
	Vector2(353, 63), # F5
	Vector2(417, 95), # G5
	Vector2(480, 126), # E6
	Vector2(415, 160), # C6
	Vector2(321,142), # F6
	Vector2(286, 96), # B5
	Vector2(351,128), # G6
	Vector2(289, 94), # E6
	Vector2(353,63), # F6
	Vector2(450,80), # B5
	Vector2(350,60), # C6
	Vector2(480,90), # A5
	Vector2(418,127), # F5
	Vector2(450,140), # G5
	Vector2(510,175), # C6
]
var xilofoneIndex = 0

func _ready():
	$Gatilhos/Xilofone.global_position = xilofonePosicoes[xilofoneIndex]
	
func _process(_delta):
	if Input.is_action_pressed('start'):
		if not $Musica/Faixa1.playing:
			$Musica/Faixa1.play()

func tocarAudioEEngatilharProximo(body):
	body.tocarAudio('xilofone',xilofoneNotas[xilofoneIndex])
	xilofoneIndex += 1
	if xilofoneIndex >= xilofoneNotas.size():
		xilofoneIndex = 0
	$Gatilhos/Xilofone.global_position = xilofonePosicoes[xilofoneIndex]
