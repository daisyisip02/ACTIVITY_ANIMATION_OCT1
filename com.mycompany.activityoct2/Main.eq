

/*
 * Main.eq
 * Generated by Eqela Studio 2.0b7.4
 */

public class Main : SEScene   
{
    SESprite bg;
    SESprite fg;
	SESprite text;
   
    bool move_right=true;
     bool move_left=false;
    int speed=50;
    bool move_down=true;
    bool move_up=false;
	String display;
    double rotation;
	int bounce=0;

    public void initialize(SEResourceCache rsc)
    {
        base.initialize(rsc);
        bg=add_sprite_for_color(Color.instance("#0AB3F0"),get_scene_width(),get_scene_height());
        bg.move(0,0);
       // fg = add_sprite_for_color(Color.instance("green"),get_scene_width()*0.1,get_scene_height()*0.1);
       // fg.move(100,00);
		rsc.prepare_font("myfont","arial bold color=white",40);
		display="BOUNCES = %d".printf().add(Primitive.for_integer(bounce)).to_string();
		text=add_sprite_for_text("BOUNCING RECTANGLE","myfont");
		text.move(0, get_scene_height()-text.get_height());
			rsc.prepare_image("myimage","yep", get_scene_width()*0.1, get_scene_height()*0.1);
				fg=add_sprite_for_image(SEImage.for_resource("myimage"));
			
		 fg.move(100,100);
		
    }
    public void update(TimeVal now, double delta)
        {
        base.update(now,delta);
        speed+=100;
        rotation+=MathConstant.M_PI_4/30;
        fg.set_rotation(rotation);
        if(move_right)
        {
            fg.move(fg.get_x()+delta*500,fg.get_y());
            if(fg.get_x()+fg.get_width()>get_scene_width())
            {
                move_right=false;
                move_left=true;
                speed=50;
				bounce++;
				display="BOUNCES = %d".printf().add(Primitive.for_integer(bounce)).to_string();
				text.set_text(display);
            }
        }
       
        if(move_left)
        {
            fg.move(fg.get_x()-delta*500,fg.get_y());
            if(fg.get_x() < 0)
            {
                move_right=true;
                move_left=false;
                speed=50;
				bounce++;
				display="BOUNCES = %d".printf().add(Primitive.for_integer(bounce)).to_string();
				text.set_text(display);
            }
        }
   

   
        if(move_down)
        {
            fg.move(fg.get_x(),fg.get_y()+delta*500);
            if(fg.get_y()+fg.get_height()>get_scene_height())
            {
                move_down=false;
                move_up=true;
                speed=50;
				bounce++;
				display="BOUNCES = %d".printf().add(Primitive.for_integer(bounce)).to_string();
				text.set_text(display);
            }
        }
       
        if(move_up)
        {
            fg.move(fg.get_x(),fg.get_y()-delta*500);
            if(fg.get_y() < 0)
            {
                move_down=true;
                move_up=false;
                speed=50;
				bounce++;
				display="BOUNCES = %d".printf().add(Primitive.for_integer(bounce)).to_string();
				text.set_text(display);
            }
        }
   
    }
    public void set_rotation(double angle)
    {
        rotation=angle;
    }
    public double get_rotation()
     {
        return(rotation);
    }

	public void cleanup()
	{
		base.cleanup();
		SESprite.remove(fg);
		SESprite.remove(bg);
		SESprite.remove(text);
	}
   
   
}
