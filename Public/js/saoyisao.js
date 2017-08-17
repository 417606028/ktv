/**
 * Created by MACHENIKE on 2017/6/9.
 */
$(function () {
    let sao=$(".room");
    let view=$('.view');
    let mask=$(".mask");
    let masks=$(".masks");
    let wraper=$(".wraper");
    sao.click(function () {
        masks.toggle();
        view.toggle();
        function slides() {
            mask.animate({height:"2.8rem"},1500,function () {
                mask.css({height:"0"}).animate({height:"2.8rem"},1500)
            })
        }
        setInterval(slides,0);
    });

})