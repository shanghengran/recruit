/**
 * Created by Administrator on 2018/8/28.
 */

function blockDiv_update_photo(){
    var div_update_photo = document.getElementById("update_photo").style.display;
    var div_update_password = document.getElementById("update_password").style.display;
    if(!div_update_photo || div_update_photo == 'none'){
        document.getElementById("update_photo").style.display = 'block';
        document.getElementById("update_password").style.display = 'none';
    }else{
        document.getElementById("update_photo").style.display = 'none';
    }
}
function blockDiv_update_password(){
    var div_update_password = document.getElementById("update_password").style.display;
    var div_update_photo = document.getElementById("update_photo").style.display;
    if(!div_update_password || div_update_password == 'none'){
        document.getElementById("update_password").style.display = 'block';
        document.getElementById("update_photo").style.display = 'none';
    }else{
        document.getElementById("update_password").style.display = 'none';
    }
}