# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#   
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Major.create(:name => 'Daley', :city => cities.first)

Api.create([{
      :controller => 'products',
      :method => 'index',
      :url => 'GET http://codex.yodel.co.uk/products?format=[xml,html]',
      :group => 'Products and services',
      :description =>
        'The product API provides a list of all the YODEL products (i.e.
        different parcel delivery services) accross all of the postcodes that
        YODEL services.',
      :response =>
        '<products>
           <product></product>
           <product></product>
        </products>',
      :jquery =>
        '$("#try_me").click(function() {
          $.ajax({
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
         });
      });'
    }])

Api.create([{
      :controller => 'users',
      :method => 'destroy',
      :url => 'DELETE http://codex.yodel.co.uk/accounts/[account name]/users/[username]',
      :group => 'Account, Users and Locations',
      :description =>
        'Deletes a user from an account, note that any changes that may have
        been made by the user will still exist within the data.',
      :response =>
        '<users>
          <account>acme</account>
          <user>admin</user>
          <user>geoff</user>
          <user>katie</user>
         </users>',
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
    });"
    }])
