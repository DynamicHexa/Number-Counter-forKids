package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.util.FlxColor;
import sprites.Number;

class PlayState extends FlxState
{
	var number = 0;

	override public function create()
	{
		FlxG.mouse.visible = false;

		var bg = new FlxSprite();
		bg.makeGraphic(FlxG.width, FlxG.height, FlxColor.WHITE);
		add(bg);

		super.create();
	}
	override public function update(elapsed:Float)
	{
		super.update(elapsed);

		if (FlxG.mouse.justPressed)
		{
			createNumber();
		}
	}

	public function createNumber()
	{
		number += 1;
		var num:Number = new Number(number);
		// num.x = FlxG.mouse.x;
		// num.y = FlxG.mouse.y;
		add(num);
	}
}
