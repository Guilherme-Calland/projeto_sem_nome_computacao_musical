extends Node2D

export var posicaoInicial = Vector2(0,0)
export var velocidadePadrao = 75
export var forcaPulo = 375
export var gatilhoAudio = false

func _ready():
	connectSignals()
	$Jogador.respawnar(posicaoInicial, Vector2(0, -200))

func rodar(gravidade):
	$Jogador.rodar(gravidade)
	$Jogador/Movimento/Fisica.velocidadePadrao = velocidadePadrao
	$Jogador/Movimento/Fisica.forcaPulo = forcaPulo
	$Sombra.rodar($Jogador/Movimento/Fisica.posicaoChao)
	$PosicaoXY.rodar($Jogador/Movimento/Fisica.posicaoXY)
	escutarGatilhoAudio()
#
func mudarZIndex(index):
	z_index = index

func connectSignals():
	$Jogador.connect('mudarZIndex', self, 'mudarZIndex')
	$PosicaoXY.connect('mudarPosicaoChao', self, 'mudarPosicaoChao')
	$PosicaoXY.connect('mudarCoeficienteZ', self, 'mudarCoeficienteZ')
	$PosicaoXY.connect('tocarAudio', self, 'tocarAudio')

func mudarPosicaoChao(posicao):
	$Jogador.mudarPosicaoChao(posicao)

func mudarCoeficienteZ(inCoeficiente):
	$Jogador.mudarCoeficienteZ(inCoeficiente)

func mudarAtrito(inAtrito):
	$Jogador.mudarAtrito(inAtrito)

func tocarAudio(intrumento, nota):
	if $Jogador/Movimento/Fisica.noChao():
		$Audio.tocarAudio(intrumento, nota)

func escutarGatilhoAudio():
	if not gatilhoAudio: 
		if not $Jogador/Movimento/Fisica.noChao():
			gatilhoAudio = true
	elif gatilhoAudio:
		if $Jogador/Movimento/Fisica.noChao():
			gatilhoAudio = false
			$PosicaoXY.global_position = Vector2(0, -5000)
