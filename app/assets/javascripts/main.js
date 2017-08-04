$(document).ready(function(){
  $('.datepicker').datepicker({
    format: 'dd-mm-yyyy'
  });

  $('#addrow').click(function(){
    $('.item-row:last').after('<tr class="item-row"><td><input class="form-control item_name" placeholder="Item name" /></td><td><input class="form-control item_desc" placeholder="Item Description" /></td><td><input class="form-control cost" value="0.00" /></td>  <td><input class="form-control qty" value="0" /></td><td class="price_td"><span class="price"></span><span class="subtotal_currency"></span></td><td class="delete_td"><a class="delete" href="javascript:;" title="Remove row"><span class="ti-close"></span></a></td></tr>');
    if ($('.delete').lenght > 0) $('.delete').show();
  });

  $('body').on('click', '.delete', function(){
    $(this).parents('.item-row').remove();
    if ($('.delete').lenght < 2) $('.delete').hide();
  })

});
