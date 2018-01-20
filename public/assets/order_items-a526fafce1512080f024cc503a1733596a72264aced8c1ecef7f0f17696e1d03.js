$(document).ready(function() {
  $("#order_item_product_id").on("change", function() {
    $.get({
      url: '/orders/order_items/unit_price/' + $(this).val(),
     });
  });

// Máscara dos preços
    function reformatPrice() {
    $('.money').priceFormat({
      prefix: 'R$ ',
      centsSeparator: ',',
      thousandsSeparator: '.'
    });
  };
  
  reformatPrice();

// Calculo dos produtos
  $(function() {
    $("#order_item_unit_price, #order_item_quantity").keyup(function() {
        var unit_price = $("#order_item_unit_price").val().replace(/[R.$\s]/g, '').replace(',', '.');
        var quantity = $("#order_item_quantity").val();
        $("#order_item_total_price").val((quantity * unit_price).toFixed(2));

        reformatPrice();
    });
  });
});
