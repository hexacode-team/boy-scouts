/**
 * Created by thomas on 3/28/16.
 */
window.onload = function(e) {
    var sidebar_button = document.createElement("button");
    sidebar_button.setAttribute("id", "sidebar-button");
    sidebar_button.setAttribute("type", "button");
    sidebar_button.setAttribute("onclick", "javascript: slideNav();");
    document.body.appendChild(sidebar_button);

}
function slideNav() {
    var sidebar_nav = document.getElementsByClassName("sidebar-nav").item(0);
    if (sidebar_nav.classList.contains("toggle-nav"))
        sidebar_nav.classList.remove("toggle-nav");
    else
        sidebar_nav.classList.add("toggle-nav");

}


