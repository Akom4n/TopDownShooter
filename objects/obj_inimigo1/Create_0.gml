/// @description Insert description here
// You can write your code in this editor

diminui_tempo = room_speed * 6;
resetar_tempo = diminui_tempo;

//Variável de vida
vida_inimigo = 1;

//Distância para ele seguir o player
distancia = 200;

movendo_inimigo = function()
{
	//Direção aleatória
	direction = irandom(359);
	
	//Velocidade aleatória entre 1 e 4
	speed = random_range(1, 4);
	
	//Fazendo ele olhar para onde ele vai
	image_angle = direction;
}

fica_room = function()
{
	//Olhando para onde está indo depois de quicar na room
	image_angle = direction;
	
	//Impedindo que o inimigo saia da room
	if (bbox_right >= room_width || bbox_left <= 0)
	{
		hspeed *= -1;
	}
	else if(bbox_bottom >= room_height || bbox_top <= 0)
	{
		vspeed *= -1;
	}
}

muda_dir = function()
{
	
	diminui_tempo--;
	if (diminui_tempo = 0)
	{
		direction = random(359);
		speed = random_range(1, 4);
		diminui_tempo = resetar_tempo;
	}
}

seguir_player = function()
{
	//Checando a minha distância para o player
	//Checando se o player existe
	if (instance_exists(obj_player))
	{
		//Pegando distancia
		var _dist_player = point_distance(x, y, obj_player.x, obj_player.y);
		
		//Seguindo o plpayer SE ele estiver muito próximo
		if(_dist_player < distancia)
		{
			//Pegando a direção do player
			var _dir = point_direction(x, y, obj_player.x, obj_player.y)
			direction = _dir;
			//Usando uma velocidade padrão
			speed = 2;
		}
	}
}

//Levando dano
///@method levar_dano(valor_dano);
levar_dano = function(_dano)
{
	//Garantindo que se a pessoa não passar valor para o _dano, ele vai valer 1
	if (_dano == undefined)
	{
		_dano = 1;
	}
	
	//Perdendo vida
	vida_inimigo -= _dano;
	
	//Se estou sem vida eu morro
	if (vida_inimigo <= 0)
	{
		instance_destroy();
		
		//Me explodindo 
		explodir();
		
		//Criando um rastro
		instance_create_layer(x, y, layer, obj_rastro);
	}
}

explodir = function()
{
	//Criando um número aleatório de pedaços
	var _qtd = irandom_range(10,20);
	
	//Criando os pedaços
	repeat(_qtd)
	{
		//instancindo o pedaço
		var _pedaco = instance_create_layer(x, y, layer, obj_pedaco);
		//Dando velocidade ao pedaço
		_pedaco.speed = random_range(8, 16);
		//Dando uma direção alatória ao pedaço
		_pedaco.direction = irandom(359);
		//Fazendo ele olhar para onde vai
		_pedaco.image_angle = _pedaco.direction;
	}
}

movendo_inimigo();





