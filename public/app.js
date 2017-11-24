function something()
{
	var x = window.localStorage.getItem('aaa'); // x = hh['bbb'] так в ruby 
	
	x = x*1 + 1;	// x = x + 1 так в ruby								

	window.localStorage.setItem('aaa', x); // hh['bbb'] = x   так в ruby		

	alert(x);
}

function add_to_cart()
{
	alert('hello from cart');
}