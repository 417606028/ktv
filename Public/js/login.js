/**
 * Created by MACHENIKE on 2017/6/30.
 */
$(function () {
    $('#submit').on('click',function (e) {
        // e.preventDefault();
        let formData=$('#form').serializeArray();
        let postData={};
        formData.forEach(function (v) {
           postData[v.name]=v.value;
        });
        $.ajax({
            url:'/index.php/login/check',
            data:postData,
            method:'post',
            success:function (data) {
                console.log(data);
                if(data=='ok'){
                    location.href='/index.php/storeManager';
                }else if(data!='ok'){
                    $('#helpBlock').css('display','block');
                }
            }
        });
        return false;
    })
    $('input[name=username],input[name=password]').on('focus',function () {
        $('#helpBlock').css('display','none');
    })
});