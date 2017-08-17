/**
 * Created by MACHENIKE on 2017/6/7.
 */
$(function () {
    let designWidth=750;
    function resize() {
        let cw=document.documentElement.clientWidth;
        let fontSizes=cw/designWidth*100;
        if(cw<769){
            document.documentElement.style.fontSize=fontSizes+'px';
        }else{
            document.documentElement.style.fontSize=100+'px';
        }
    }
    $(window).resize(resize);
    resize();
});
