function mobile_menu(){
  console.log('mobile_menu作動');

  const moBtn = document.getElementById("mo_menu_btn")
  const moMenu = document.getElementById("mo_menu")

  moBtn.addEventListener('click',function(){
    
    if (moMenu.getAttribute("style") == "display:grid;"){
      moMenu.removeAttribute("style", "display:grid;");
      console.log("menuが閉じた");

    } else {
      moMenu.setAttribute("style", "display:grid;");
      console.log("menuが開いた");
      
    }
  })
}

window.addEventListener("turbolinks:load",mobile_menu);