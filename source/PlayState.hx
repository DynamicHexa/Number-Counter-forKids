package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.util.FlxColor;

class PlayState extends FlxState
{
	override public function create()
	{
		var bg = new FlxSprite();
		bg.makeGraphic(FlxG.width, FlxG.height, FlxColor.WHITE);
		add(bg);
		super.create();
	}
}
