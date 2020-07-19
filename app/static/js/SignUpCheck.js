var user = 0;
var pd = 0;
var em = 0;
function ChangeSubmit(){
  if (user && pd && em){
    $('#sign_up').removeAttr("disabled");
  }
  else{
    $('#sign_up').attr("disabled",true);
  }
}
function undisplay(obj){
  obj.placeholder = "";
}
function display(object,str){
    object.placeholder = str;
}
function AutoCheck(object){
  var name = object.name;
  var value = object.value;
  if (name == "username"){
      // console.log(value);
      $('#username_id').removeAttr("hidden");
      if (value.length > 2){
          var first_reg = /^\d/g;
          if(!first_reg.test(value)){
              $.post("../verify/" , {"username":value} , function(data){
                  if (data == 1){
                      $("#username_id").html("<font color='red'>用户名已被注册</font>");
                      user = 0;
                  }else{
                      $("#username_id").html("<font color='green'>用户名可以使用</font>");
                      user = 1;
                  }
              });
          }
          else {
              $("#username_id").html("<font color='red'>用户名首位不能为数字</font>");
              user = 0;
          }
      }
      else{
          $("#username_id").html("<font color='red'>用户名长度必须大于 2 位</font>");
          user = 0;
      }
  }
  else if(name == "password"){
    $('#password_id').removeAttr("hidden");
    if (value.length <= 8){
      $("#password_id").html("<font color='red'>密码长度必须大于 8 位</font>");
      pd = 0;
    }
    else{
      $("#password_id").html("<font color='green'>密码可以使用</font>");
      pd = 1;
    }
  }
  else if(name == "email"){
    $('#email_id').removeAttr("hidden");
    var reg = /^([a-zA-Z\d])(\w|\-)+@[a-zA-Z\d]+\.[a-zA-Z]{3}$/;
    if (!reg.test(value)){
      $("#email_id").html("<font color='red'>邮箱地址格式不对</font>");
      em = 0;
    }
    else{
      $("#email_id").html("<font color='green'>格式正确</font>");
      em = 1;
    }
  }
  ChangeSubmit();
}
