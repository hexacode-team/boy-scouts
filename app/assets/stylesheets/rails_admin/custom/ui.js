/**
 * Created by thomas on 3/28/16.
 */
window.onload = function(e) {

    //Button for side navbar
    var sidebar_button = document.createElement("button");
    sidebar_button.setAttribute("id", "sidebar-button");
    sidebar_button.setAttribute("type", "button");
    sidebar_button.setAttribute("onclick", "javascript: slideNav();");
    document.body.appendChild(sidebar_button);

    //Creating top navigation
    var meta = document.createElement("meta");
    meta.setAttribute("name", "viewport");
    meta.setAttribute("content", "width=device-width, initial-scale=1, maximum-scale=1");
    document.head.appendChild(meta);

    var navbar = document.getElementsByClassName("navbar-collapse").item(0);
    var att = document.createAttribute("id");
    att.value = "main-nav";
    navbar.setAttributeNode(att);

    //Button for top navbar
    var navbar_button = document.createElement("button");
    navbar_button.setAttribute("type", "button");
    navbar_button.setAttribute("class", "navbar-toggle collapsed");
    navbar_button.setAttribute("data-toggle", "collapse");
    navbar_button.setAttribute("data-target", "#main-nav");
    navbar_button.setAttribute("onclick", "javascript: showNav();");
    navbar_button.innerHTML = "<span class='icon-bar'></span><span class='icon-bar'></span><span class='icon-bar'></span>";

    var navbar_header = document.getElementsByClassName("navbar-header").item(0);
    navbar_header.appendChild(navbar_button);

    //Changes navbar title to "Boy Scout Flags"
    document.getElementsByClassName("navbar-brand")[0].textContent = "Boy Scouts Flags: Admin";

    //Removes G image from navbar
    var navbar_nav = document.getElementsByClassName("navbar-nav").item(0);
    navbar_nav.removeChild(navbar_nav.children[3]); 

    //Add class admin-header to navbar-header for css purposes
    var header = document.getElementsByClassName("navbar-header").item(0);
    header.className += " admin-header";

}

//Side sliding navbar
function slideNav() {
    var sidebar_nav = document.getElementsByClassName("sidebar-nav").item(0);
    var top_nav = document.getElementsByClassName("navbar-collapse").item(0);

    if (top_nav.classList.contains("in"))
        top_nav.classList.remove("in");

    if (sidebar_nav.classList.contains("toggle-nav"))
        sidebar_nav.classList.remove("toggle-nav");
    else
        sidebar_nav.classList.add("toggle-nav");
}

//Top sliding navbar
function showNav() {
    var sidebar_nav = document.getElementsByClassName("sidebar-nav").item(0);

    if (sidebar_nav.classList.contains("toggle-nav"))
        sidebar_nav.classList.remove("toggle-nav");
}
