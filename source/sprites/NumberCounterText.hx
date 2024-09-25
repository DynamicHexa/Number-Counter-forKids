package sprites;

import flixel.text.FlxText;
import flixel.tweens.FlxEase;
import flixel.tweens.FlxTween;
import flixel.util.FlxColor;
import flixel.util.FlxTimer;

class NumberCounterText extends FlxText
{
	var curDirection = 0;

	public function new()
	{
		super();
		text = "Number Counter";
		screenCenter();
		size = 50;
		color = FlxColor.BLACK;
		alpha = 0.4;

		tween();
	}

	public function tween()
	{
		// switch (curDirection)
		// {
		// 	case 0:
		// 		FlxTween.tween(this, {y: y + 80}, 1.5, {
		// 			ease: FlxEase.linear,
		// 			type: ONESHOT,
		// 			onComplete: function(tw)
		// 			{
		// 				curDirection = 1;
		// 				tween();
		// 			}
		// 		});
		// 	case 1:
		// 		FlxTween.tween(this, {y: y - 160}, 1.5, {
		// 			ease: FlxEase.linear,
		// 			type: ONESHOT,
		// 			onComplete: function(tw)
		// 			{
		// 				curDirection = 0;
		// 				tween();
		// 			}
		// 		});
		// }

		if (curDirection == 1)
		{
			alpha += 0.1;
			if (alpha >= 1)
			{
				curDirection = 0;
			}
		}
		else if (curDirection == 0)
		{
			alpha -= 0.1;
			if (alpha <= 0)
			{
				curDirection = 1;
			}
		}

		new FlxTimer().start(0.25, function(timer)
		{
			tween();
		});
	}

	override public function update(elapsed:Float)
	{
		super.update(elapsed);
	}
}