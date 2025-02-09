//console.log("discord.gg/debux | Tebex : debux.shop")
//<center><div class="box-s-text-2">Adet Fiyatı: <b class="" style="color:green;">`+event.data.price+`$</b> / Toplam: </div></center>
$(document).ready(function () {
  window.addEventListener("message", function (event) {
    //console.log(event.data.action)
  if (event.data.action == "openmenu") {
      $.post('http://bb-drugsale/box-menu', JSON.stringify({}));
      $('#box').empty();
      $(".bg").css("display", "block");
  } 
  if (event.data.action == "update") {
    $(".shopname").html(event.data.shopname );
    $(".wallet-money").html(event.data.have_money );
  } 
  if (event.data.action == "add-drugs-box") {
    html = `
    <div class="item">
    <div class="item-text">`+event.data.label+`</div>
    <center><div class="box-s-text-2">Piece Price: <b style="color:green;">`+event.data.price+`$</b> X <b>`+event.data.owned_count+`</b> = <b style="color:green;">`+event.data.price * event.data.owned_count +`$</b> Total</div></center>
    <div class="item-img" style="background-image: url(./img/`+event.data.img+`);"></div>
    <div class="prew-but" onclick="Sale('`+event.data.name+`','`+event.data.price+`','`+event.data.label+`','`+event.data.owned_count+`')" id="`+event.data.id+`"><t>All Sell</t></div>
  </div>
  `
  $('#box').prepend(html);
  } 
  if (event.data.action == "open-menu-d") {
    $(".bg-4").css("display", "block");
  } 
});
});

$(".close-button").click(function () {
  $(".bg").css("display", "none");
  $('#box').empty();
	$.post('http://bb-drugsale/closenui', JSON.stringify({}));
});

function Sale(data,data2,data3,data4) { 
  $(".bg").css("display", "none");
  $('#box').empty();
  
  $.post('http://bb-drugsale/allsell', JSON.stringify({itemname:data, countprice:data2, itemlabel:data3}));

  if (data4 > 0){
    $.post('http://bb-drugsale/success_closenui', JSON.stringify({}));
  }
  else{
    $.post('http://bb-drugsale/closenui', JSON.stringify({}));
  }
}
