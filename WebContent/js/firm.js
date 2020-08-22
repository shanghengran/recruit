/**
 * Created by Administrator on 2018/8/29.
 */

window.onload=function(){
    var change = document.getElementById("change");
    change.onclick= function(){
        var logo = document.getElementById("logo");
        var firmName = document.getElementById("firmName");
        var place = document.getElementById("place");
        var tel = document.getElementById("tel");
        var manager = document.getElementById("manager");
        var profile = document.getElementById("profile");
        var fFile = document.getElementById("fFile");
        var update = document.getElementById("update");
        logo.setAttribute("type","file");
        firmName.removeAttribute("readonly");
        place.removeAttribute("readonly");
        tel.removeAttribute("readonly");
        manager.removeAttribute("readonly");
        profile.removeAttribute("readonly");
        fFile.setAttribute("type","file");
        change.setAttribute("type","hidden");
        update.setAttribute("type","submit");
    }
}