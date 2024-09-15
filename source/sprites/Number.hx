package sprites;

import flixel.FlxG;
import flixel.text.FlxText;
import flixel.util.FlxColor;
import flixel.util.FlxTimer;

class Number extends FlxText
{
	public var beginWreckSequence = 0;

	public function new(curNumber:Int)
	{
		super();
		trace("Creating number instance with num: " + curNumber);
		font = "assets/fonts/bubble.ttf";
		// color = FlxColor.BLACK; (Was just testing placing sys)
		color = FlxColor.fromRGB(FlxG.random.int(10, 240), FlxG.random.int(10, 240), FlxG.random.int(10, 240)); // Prevent full white and prevent full black.
		text = Std.string(curNumber);
		size = 80;

		x = FlxG.mouse.x;
		y = FlxG.mouse.y;

		new FlxTimer().start(3, function(timer:FlxTimer)
		{
			beginWreckSequence = 1;
		});
	}

	override public function update(elapsed)
	{
		if (beginWreckSequence == 1)
		{
			if (alpha > 0)
			{
				alpha -= 0.005;
			}
			else
			{
				destroy();
				return;
			}
		}

		super.update(elapsed);
	}

	override public function destroy()
	{
		trace("[Number Instance] I'm finished! Bye bye!");
		super.destroy();
	}
}