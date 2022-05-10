/// @description Insert description here
// You can write your code in this editor

image_xscale = 2;
image_yscale = image_xscale;

tempo_tiro = room_speed * 6;

dano = 1;


//Voltando o tiro ao tamanho original 
efeito_tamanho = function()
{
	image_xscale = lerp(image_xscale, 1, 0.2)
	image_yscale = image_xscale;
}

//Metodo de efeito e desenho
efeito_tiro = function()
{
	draw_self();

	//Mudando o blendmode
	gpu_set_blendmode(bm_add);
	
	//Desenhando a sprite do efeito
	draw_sprite_ext(spr_tiro_efeito, 0, x, y, image_yscale * 1.1, image_xscale * 1.1, image_angle, c_red, 0.7);
	
	//Resetando o blendmode
	gpu_set_blendmode(bm_normal);
}

//Criando um metodo para me destruir
me_destruindo = function()
{
	tempo_tiro--;
	if (tempo_tiro <= 0)
	{
		instance_destroy();
	}
}

//Colidindo com o inimigo
colide_inimigo = function()
{
	var _inimigo = instance_place(x, y, obj_inimigo1);
	
	//Se eu colidi com algum inimigo, eu tiro vida dele e me mato
	if (_inimigo)
	{
		_inimigo.levar_dano(dano);
		
		//Me destruindo
		instance_destroy();
		
		//Criando o impacto
		instance_create_layer(x, y, layer, obj_impacto_tiro);
	}
}
