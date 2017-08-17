/**
 * Created by MACHENIKE on 2017/6/28.
 */
$(function () {
    let list;
    if(localStorage.songList){
        list=JSON.parse(localStorage.songList);
    }
    else{
        list=[];
    }
    list.forEach(function (v,i) {
       $(`.c${v.id}`).find('.right').addClass('rotate');
    });
    function fly(el) {
        $('<div>').appendTo('body').css(
            {
              width:20,
                height:20,
                background:'#0085d0',
                zIndex:1000,
                position:"absolute",
                top:$(el).offset().top,
                left:$(el).offset().left,
                borderRadius:'50%',

            }
        ).animate({
            left:$('.songs-selected').offset().left,
            top:$('.songs-selected').offset().top
        },'slow',function () {
            $(this).remove();
        })
    }
    $('.songsitems .right').on('click',function () {
        let o=JSON.parse($(this).closest('li').attr('data'));
        if(!$(this).hasClass('rotate')){
            fly(this);
            list.push(o);
        }else{
           list=list.filter(function (v,i) {
               return v.id!=o.id;
           });
        }
        localStorage.songList=JSON.stringify(list);
        $(this).toggleClass('rotate');
        let number=list.length;
        $('.header .right span').html(number);
    })
});