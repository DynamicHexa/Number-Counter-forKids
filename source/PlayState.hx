package;

import engine.DeveloperStuff;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.text.FlxText;
import flixel.util.FlxColor;
import sprites.Number;
import sprites.NumberCounterText;

class PlayState extends FlxState
{
	var number = 0;

	var devText:FlxText;
	var title:FlxText;

	override public function create()
	{
		FlxG.mouse.visible = false;

		var bg = new FlxSprite();
		bg.makeGraphic(FlxG.width, FlxG.height, FlxColor.WHITE);
		add(bg);

		title = new NumberCounterText();
		title.screenCenter();
		add(title);

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

		// if (number > 9) // Just limit the number limit
		// {
		// 	number = 0;
		// }

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
		if (DeveloperStuff.enabled)
		{
			if (FlxG.keys.justPressed.R)
			{
				trace("[Numbers] Resetting");
				number = 0;
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
