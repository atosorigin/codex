# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#   
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Major.create(:name => 'Daley', :city => cities.first)

Api.create(
      :apiname => 'Get Products',
      :controller => 'products',
      :method => 'index',
      :url => 'GET http://codex.yodel.co.uk/products?format=[xml,html]',
      :businessgroup => 'Products and services',
      :description =>
        'The product API provides a list of all the YODEL products (i.e.
        different parcel delivery services) accross all of the postcodes that
        YODEL services.',
      :exampleresponse =>
      '<products> 
            <product>EXPRESS-PRIORITY 12:00</product> 
            <product>EXPRESS-EXPRESS 24</product> 
      </products>',
      :response =>
        '<products>
           <product></product>
           <product></product>
        </products>',
      :jquery =>
        '$.ajax({
            type: "GET",
            url: \'/products?format=xml\',
            dataType: "xml",
            success: function(data) {

               $(\'#result\').empty();
               $(\'#result\').append("<ul id=\'product_list\' ></ul>");

               $(data).find(\'product\').each(function(){
                  $(\'#product_list\').append("<li>" + $(this).text() + "</li>");
               })
            }
         });'
).parameters.create(:name => 'optional format', :description => 'added as a query string can specify html or xml as the desired response format')


Api.create(
    :apiname => 'Delete Account User',
		:controller => 'users',
		:method => 'destroy',
		:url => 'DELETE http://codex.yodel.co.uk/accounts/[account name]/users/[username]',
		:businessgroup => 'Account, Users and Locations',
		:description =>
		'Deletes a user from an account, note that any changes that may have
		been made by the user will still exist within the data.',
		:response =>
		'HTTP 200 - OK',
		:exampleresponse =>
		'HTTP 200 - OK',
		:jquery =>
		"    $.ajax({
type: 'DELETE',
	url: '/accounts/acme/users/billy',
	dataType: 'xml',
	success: function(data) {
		$('#result').empty();
		$('#result').append('<ul id='user' ></ul>');
		//$('#user').append('<li>username=' + $(data).find('username').text() + '</li>');
		//$('#user').append('<li>email=' + $(data).find('email').text() + '</li>');
		//$('#user').append('<li>role=' + $(data).find('role').text() + '</li>');
	}
});").parameters.create(:name => 'none')

Api.create(
    :apiname => 'Delete Account Location',
		:controller => 'locations',
		:method => 'destroy',
		:url => 'DELETE codex.yodel.co.uk/accounts/[account name]/locations/[location name]',
		:businessgroup => 'Account, Users and Locations',
		:description =>
	        'Deletes a location for an account'	,
		:response =>
		'HTTP 200 - OK',
		:exampleresponse =>
		'HTTP 200 - OK',
		:jquery =>
                '$("#try_me").click(function() {
    		     $.ajax({
                           type: "DELETE",
                           url: "/accounts/acme/locations/South West wharehouse",
                           data: {},
                           success: function(data){
                                $(\'#result\').empty();
         		        $(\'#result\').append("<h2>success</h2>");
                           }
                      });
                 });'
            ).parameters.create(:name => 'none')

Api.create(
    :apiname => 'Get Account Details',
    :controller => 'users',
		:method => 'show',
		:url => 'GET http://codex.yodel.co.uk/accounts/[account name]',
		:businessgroup => 'Account, Users and Locations',
		:description =>
		'Retrieves account information for a given account name',
		:response =>
		'account
		    -id - numeric account id
		    -account_name - e.g. acme
		    -address - the main address for billing
                    -postcode - billing postcode',
		:exampleresponse =>
		'<account>
			<id>12345</id>
			<account_name>ACME</account_name>
			<address>123 The Street, The Town</address>
			<postcode>BD11 1TR</postcode>
		</account>',
		:jquery =>
		"    $.ajax({
          type: 'DELETE',
          url: '/accounts/acme/users/billy',
          dataType: 'xml',
          success: function(data) {
            $('#result').empty();
            $('#result').append('<ul id='user' ></ul>');
            //$('#user').append('<li>username=' + $(data).find('username').text() + '</li>');
            //$('#user').append('<li>email=' + $(data).find('email').text() + '</li>');
            //$('#user').append('<li>role=' + $(data).find('role').text() + '</li>');
          }
});").parameters.create(:name => 'none')



