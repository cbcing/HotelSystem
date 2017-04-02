<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <script type="text/javascript" src="js/jquery-3.1.1.min.js"></script>
    <script src="js/jquery-latest.js"></script>

    <title></title>
</head>
<body>
<div class="bookNum">
    <a id="sub" href="javascript:void(0);">-</a>
    <input type="text" value="1" id="bookNum">
    <a id="add" href="javascript:void(0);">+</a>
    <a href="javascript:void(0);" id="addCart">加入借阅台</a>
    <div class="clear"></div>
</div>

<script>
    $("#bookNum").keypress(function(b) {
        var keyCode = b.keyCode ? b.keyCode : b.charCode;
        if (keyCode != 0 && (keyCode < 48 || keyCode > 57) && keyCode != 8 && keyCode != 37 && keyCode != 39) {
            return false;
        } else {
            return true;
        }
    }).keyup(function(e) {
        var keyCode = e.keyCode ? e.keyCode : e.charCode;
        console.log(keyCode);
        if (keyCode != 8) {
            var numVal = parseInt($("#bookNum").val()) || 0;
            numVal = numVal < 1 ? 1 : numVal;
            $("#bookNum").val(numVal);
        }
    }).blur(function() {
        var numVal = parseInt($("#bookNum").val()) || 0;
        numVal = numVal < 1 ? 1 : numVal;
        $("#bookNum").val(numVal);
    });
    //增加
    $("#add").click(function() {
        var num = parseInt($("#bookNum").val()) || 0;
        $("#bookNum").val(num + 1);
    });
    //减去
    $("#sub").click(function() {
        var num = parseInt($("#bookNum").val()) || 0;
        num = num - 1;
        num = num < 1 ? 1 : num;
        $("#bookNum").val(num);
    });
</script>
</body>
</html>