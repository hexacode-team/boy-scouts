/**
 * Created by thomas on 3/28/16.
 */
window.onload = function(e) {
    var sidebar_button = document.createElement("button");
    sidebar_button.setAttribute("id", "sidebar-button");
    sidebar_button.setAttribute("type", "button");
    sidebar_button.setAttribute("onclick", "javascript: slideNav();");
    document.body.appendChild(sidebar_button);

    var meta = document.createElement("meta");
    meta.setAttribute("name", "viewport");
    meta.setAttribute("content", "width=device-width, initial-scale=1, maximum-scale=1");
    document.head.appendChild(meta);

    var navbar = document.getElementsByClassName("navbar-collapse").item(0);
    var att = document.createAttribute("id");
    att.value = "main-nav";
    navbar.setAttributeNode(att);

    var navbar_button = document.createElement("button");
    navbar_button.setAttribute("type", "button");
    navbar_button.setAttribute("class", "navbar-toggle collapsed");
    navbar_button.setAttribute("data-toggle", "collapse");
    navbar_button.setAttribute("data-target", "#main-nav");
    navbar_button.innerHTML = "<span class='icon-bar'></span><span class='icon-bar'></span><span class='icon-bar'></span>";

    var navbar_header = document.getElementsByClassName("navbar-header").item(0);
    navbar_header.appendChild(navbar_button);

    propogateHeaders();
}
function slideNav() {
    var sidebar_nav = document.getElementsByClassName("sidebar-nav").item(0);
    if (sidebar_nav.classList.contains("toggle-nav"))
        sidebar_nav.classList.remove("toggle-nav");
    else
        sidebar_nav.classList.add("toggle-nav");

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

    var rows = document.getElementsByClassName("group_row");
    for (var i = 0; i < rows.length; i++) {
        var tds = rows.item(i).getElementsByTagName("td");
        for (var j = 0; j < tds.length; j++) {
            var att = document.createAttribute("data-header");
            att.value = header_names[j];
            tds.item(j).setAttributeNode(att);
            var children = tds.item(j).getElementsByTagName("a");

            for (var k = 0; k < children.length; k++) {
                children.item(k).classList.remove("pjax");
            }
            if (tds.item(j).innerHTML == "" || (children.length != 0 && children.item(0).innerText == ""))
                tds.item(j).innerHTML = "&nbsp";
        }
    }
}
