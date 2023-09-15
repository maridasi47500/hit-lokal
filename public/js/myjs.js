window.onload=function(){
    $(".dropdown-toggle").click(function(){
  $($(this)[0].parentElement).children('ul').toggle()
})
}
