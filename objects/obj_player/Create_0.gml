/// @description Insert description here
// You can write your code in this editor

velocidade = 5;

hvel = 0;
vvel = 0;
vel_tiro = 10;

espera_tiro = 0;
demora_tiro = room_speed * 0.2; //0.2 segundos

image_xscale = 1;
image_yscale = 1;


//Função para o movimento do player
movendo_player = function()
{
	var right,left,down,up;
	
	//Pegando o input do personagem
	right = keyboard_check(ord("D"));
	left = keyboard_check(ord("A"));
	down = keyboard_check(ord("S"));
	up = keyboard_check(ord("W"));
	
	//Escolhendo para onde ele se move e multiplicando com a velocidade
	hvel = (right - left)*velocidade;
	vvel = (down - up)*velocidade;
	
	//Alterando o eixo X (Movimentando na horizontal)
	x += hvel;
	//Alterando o eixo Y (Movimentando na vertical)
	y += vvel;
	
	if(hvel != 0 || vvel != 0)
	{
		image_speed = 1;
	}
	else
	{
		image_speed = 0;	
	}
}


atirando = function()
{
	var _mira = point_direction(x, y, mouse_x, mouse_y);

	image_angle = _mira;
	
	//Criando o tiro
	//Checando se o player está apertando o botão esquerdo do Mouse
	var _fire = mouse_check_button(mb_left);
	
	
	//Só posso atirar se a minha espera do tiro for 0
	if (espera_tiro <= 0)
	{
		if(_fire)
		{
			//Criando o tiro
			var _tiro = instance_create_layer(x, y, "tiros", obj_tiro);
		
			_tiro.speed = vel_tiro;
			_tiro.direction = _mira;
			
			//Se eu atirei então reseto o valor da espera tiro
			espera_tiro = demora_tiro;
			
			//Usando a sprite do tiro
			sprite_index = spr_player_tiro;
		}
		else
		{
			//Voltando para a sprite original
			sprite_index = spr_player;
		}
	}
	else //Espera tiro é maior do que 0, então eu diminuo ela
	{
		espera_tiro--;
	}
}
