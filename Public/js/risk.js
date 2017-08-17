/**
 * Created by MACHENIKE on 2017/6/19.
 */
$(function () {
    let alert=$('#alert');
    let info=$('#info');
    let cardbox=$('.cardbox');
    let card=$('.cardbox .card');
    let opera=$('.footer div');
    console.log(opera);
    let zxh=$('.footer .zxh');
    let dmx=$('.footer .dmx');
    let lefts=$('.lefts');
    let change=$('.header');
    let index=1;
    cardbox.on('click','.card',function () {
        if($(this).hasClass('active')==false){
            info.html($(this).html());
            $(this).add(alert).addClass('active');
        }else {
            return ;
        }
        if($('.cardbox .active').length == 9){
            lefts.addClass('active');
        }
    });
    alert.on('click',function () {
        $(this).removeClass('active');
        $(this).children().on('click',false);
    });
    opera.on('click',function () {
        index=1;
        opera.add(lefts).removeClass('active');
        $(this).addClass('active');
        if(zxh.hasClass('active')){
            urls='/index.php/play/zxh';
        }else{
            urls='/index.php/play/dmx';
        }
        $.ajax({
                url:urls,
                success:function (data) {
                    data=JSON.parse(data);
                    $('.cardbox').empty();
                    $(data).each(function (i,v) {
                        $(`<li class="card">${v.content}</li>`).appendTo('.cardbox');
                    })
                }
        });
    });
    change.on('click','.active',function () {
        let that=this;
        index +=1;
        let urls;
        if(zxh.hasClass('active')){
           urls='/index.php/play/db';
        }else{
            urls='/index.php/play/dmxs';
        }
        $.ajax({
            url:urls,
            data:{page:index},
            success:function (data) {
                $(that).removeClass('active');
                data=JSON.parse(data);
                $('.cardbox').empty();
                $(data).each(function (i,v) {
                    $(`<li class="card">${v.content}</li>`).appendTo('.cardbox');
                })
            }
        });
    })


});