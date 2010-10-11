# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#   
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Major.create(:name => 'Daley', :city => cities.first)

Api.create([{:controller => 'products', :method => 'index', :url => 'http://codex.yodel.co.uk/products?format=[xml,html]', :description => 'The product API provides a list of all the YODEL products (i.e. different parcel delivery services) accross all of the postcodes that YODEL services.',:response => '<products>
   <product></product>
   <product></product>
</products>', :jquery => '$("#try_me").click(function() {
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
});'}])
