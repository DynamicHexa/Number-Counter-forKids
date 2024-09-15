package;

import engine.DeveloperStuff;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.text.FlxText;
import flixel.util.FlxColor;
import sprites.Number;

class PlayState extends FlxState
{
	var number = 0;

	var devText:FlxText;

	override public function create()
	{
		FlxG.mouse.visible = false;

		var bg = new FlxSprite();
		bg.makeGraphic(FlxG.width, FlxG.height, FlxColor.WHITE);
		add(bg);

		if (DeveloperStuff.enabled)
		{
			devText = new FlxText(10, 10, "Loading...", 18);
			devText.color = FlxColor.BLACK;
			add(devText);
		}

		super.create();
	}
	override public function update(elapsed:Float)
	{
		super.update(elapsed);

		if (DeveloperStuff.enabled)
		{
			devText.text = "CurNum: " + number;
		}

		if (FlxG.mouse.justPressed)
		{
			createNumber();
		}
		for (touch in FlxG.touches.list)
		{
			if (touch.justPressed)
			{
				createNumber();
			}
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
