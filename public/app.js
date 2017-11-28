function something()
{

	var x = window.localStorage.getItem('bbb'); // x = hh['bbb'] так в ruby 
	
	x = x  1 + 1;	// x = x + 1 так в ruby								

	window.localStorage.setItem('bbb', x); // hh['bbb'] = x   так в ruby		

	alert(x);
}

function add_to_cart(id)
{
	var key = 'product_' + id;
	
	var x = window.localStorage.getItem(key);
	x = x * 1 + 1;
	window.localStorage.setItem(key, x);

	alert('Items in your cart: ' + cart_get_number_of_items());
}

function cart_get_number_of_items()
{
	var cnt = 0;

	for(var i = 0; i < window.localStorage.length; i++)
	{
		var key = window.localStorage.key(i); // получаем ключ
		   var value = window.localStorage.getitem(key); // получаем значение, в ruby: hh[key] = x
			
			if(key.indexOf('product_') == 0)
			
			{
				cnt = cnt + value * 1;
			}
		}
		return cnt;
	}