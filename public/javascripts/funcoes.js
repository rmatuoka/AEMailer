function mostraCase(x, y)
{
	for(var i = 0; i < y; i++)
	{
		document.getElementById(i).style.display = 'none';		
	}
	
	document.getElementById(x).style.display = 'inline';

}