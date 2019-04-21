switch(mpos)
{
	case 0:
	{
		room_goto(level1);
		break;
	}
	case 1:
	{
		room_goto(settings);
		break;
	}
	case 2:
	{
		room_goto(Controls);
		break;
	}
	case 3: game_end(); break;
	default: break;
	
}