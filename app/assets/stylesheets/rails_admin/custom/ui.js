/**
 * Created by thomas on 3/28/16.
 */
window.onload = function(e) {

    //Button for side navbar
    var sidebar_button = document.createElement("button");
    sidebar_button.setAttribute("id", "sidebar-button");
    sidebar_button.setAttribute("type", "button");
    sidebar_button.setAttribute("onclick", "javascript: slideNav();");
    var icon = document.createElement("i");
    icon.setAttribute("class", "icon-chevron-right");
    icon.setAttribute("id", "navbar-icon")
    sidebar_button.appendChild(icon);
    
    
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
    page_check(sidebar_button, navbar_header, navbar_button)
    propogateHeaders();
    

    //Removes G image from navbar
    var navbar_nav = document.getElementsByClassName("navbar-nav").item(0);
    navbar_nav.removeChild(navbar_nav.children[3]); 

    //Add class admin-header to navbar-header for css purposes
    var header = document.getElementsByClassName("navbar-header").item(0);
    header.className += " admin-header";

    removePjax();
};

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

    changeIcon();
}

function propogateHeaders() {
    var headers = document.getElementsByTagName("th");
    var header_names = [];
    header_names.push("Select");
    for (var i = 1; i < headers.length; i++) {
        //if (i < headers.length - 2)
        if (headers.item(i).innerText == "...")
            header_names.push("Expand");
        else if (headers.item(i).innerText != "")
            header_names.push(headers.item(i).innerText);
        //else if (i == headers.length - 2) {
        //    if (headers.item(i).innerText != null)
        //        header_names.push(headers.item(i).innerText);
        //    else
        //        header_names.push("Expand");
        //}
        //else if (i == headers.length - 1) {
        //    header_names.push("Options");
        //}
    }
    if (header_names.indexOf("Expand") == -1)
        header_names.push("Expand");
    header_names.push("Options");

    var rows = document.getElementsByTagName("tr");
    for (var i = 0; i < rows.length; i++) {
        var tds = rows.item(i).getElementsByTagName("td");
        for (var j = 0; j < tds.length; j++) {
            var att = document.createAttribute("data-header");
            att.value = header_names[j];
            tds.item(j).setAttributeNode(att);
            var children = tds.item(j).getElementsByTagName("a");

            //for (var k = 0; k < children.length; k++) {
            //    children.item(k).classList.remove("pjax");
            //}
            if (tds.item(j).innerHTML == "" || (children.length != 0 && children.item(0).innerText == ""))
                tds.item(j).innerHTML = "&nbsp";
        }
    }
}
//Top sliding navbar
function showNav() {
    var sidebar_nav = document.getElementsByClassName("sidebar-nav").item(0);

    if (sidebar_nav.classList.contains("toggle-nav"))
        sidebar_nav.classList.remove("toggle-nav");
}

function changeIcon() {
    var icon = document.getElementById("navbar-icon");

    if(icon.className == "icon-chevron-right") {
        icon.setAttribute("class", "icon-chevron-left");
    }
    else {
        icon.setAttribute("class", "icon-chevron-right");
    }

}
function removePjax() {
    var pjax = document.getElementsByTagName("a");
    for (var i = 0; i < pjax.length; i++) {
        pjax.item(i).classList.remove("pjax");
    }
}

//Check for different pages and populate nav depending on page
function page_check(sidebar_button, navbar_header, navbar_button) {
    var page = document.getElementById("page");
    if (page != null) {
        page = page.innerHTML;
    }
    else {
        page = "adminpage";
    }
    if (page == "homepage") {
        document.getElementsByClassName("navbar-brand")[0].textContent = "Boy Scouts Flags";
    }
    else if (page == "grouppage") {
        document.getElementsByClassName("navbar-brand")[0].textContent = "Boy Scouts Flags: My Troops";
    }
    else if (page == "routepage") {
        document.getElementsByClassName("navbar-brand")[0].textContent = "Boy Scouts Flags: My Routes";
    }
    else if (page == "signinpage") {
        document.getElementsByClassName("navbar-brand")[0].textContent = "Boy Scouts Flags: Sign In";
    }
    else {
        document.body.appendChild(sidebar_button);
        navbar_header.appendChild(navbar_button);
        document.getElementsByClassName("navbar-brand")[0].textContent = "Boy Scouts Flags: Admin";
    }
}