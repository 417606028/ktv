/**
 * Created by MACHENIKE on 2017/6/28.
 */
$(function () {
    let audio=$('#audio').get(0);
    let play=$('.tagger-top .play');
    let name=$('input[type=hidden]').val();
    let wraper=$('.lyric-wraper');
    let result=[];
    //播放暂停
    play.on('click',function () {
        if($(this).hasClass('paused')){
            $(this).removeClass('paused');
            audio.pause();
        }else{
            $(this).addClass('paused');
            audio.play()
        }

    });
    //音量控制
    let jd=$('.valumebox');
    let jdt=$('.progress');
    let point=$('.point');
    let volume=$('.volume');
    let Dtimes=$('.duration');
    jd.on('click',function (e) {
        let widths=jd.width();
        let x=e.offsetX;
        console.dir(e.offsetX);
        jdt.width(x);
        point.css('left',x);
        audio.volume=jdt.width()/widths;
        let valu=Math.round(audio.volume*100);
        volume.html(valu);

    });
    Dtimes.on('click',function (e) {
        let widths=$('.boxwraper').width();
        let x=e.offsetX;
        $('.dTime').width(x);
        $('.dPoint').css('left',x);
        audio.currentTime=Math.floor(($('.dTime').width(x)/widths)*audio.duration);
        // let duration=Math.round($('.dTime').width(x)/widths)+'';
        // volume.html(duration);

    });
    // 歌词跟随
    let index;
    audio.ontimeupdate=function (e) {
        let current=format(audio.currentTime);
        // let duration=format(audio.duration);
        let string="";
        let bili=audio.currentTime/audio.duration*100+"%";
        $('.dTime').css({
            width:'bili'
        });
        result.forEach(function (v,i) {
            if(v.time==current){
                index=v.T_id;
            }
        });
        // console.log(index);
        $('.lyric-wraper li').each(function (i,v) {
            // console.log(v);
            $(v).removeClass('hot');
            if($(v).attr('data')==index){
                $(this).addClass('hot');
            }
            if($(v).attr('data')==(parseInt(index)-1)){
                let that=this;
                $(this).fadeOut('slow');
            }
        })

    };
    //时间转换函数
    function format(time) {
        let m=Math.floor(time/60)>=10?Math.floor(time/60):"0"+Math.floor(time/60);
        let s=Math.floor(time%60>10)?Math.floor(time%60):"0"+Math.floor(time%60);
        // let ms=Math.floor(time*1000%1000)>100?Math.round(time*1000%1000):"0"+Math.round(time*1000%1000);
        return `${m}:${s}`;
    }

    //页面AJAX
    $.ajax({
        url:'/Public/lyric/'+name+'.json',
        success:function (data) {
            wraper.empty();
            let o=data.lrc.lyric;
            let arr=o.split('\n');
            let x;
            let index=0;
            arr.forEach(function (v,i) {
                index++;
                x=
                {
                    time:(v.slice(v.indexOf('[')+1,v.lastIndexOf(']'))).split('.')[0],
                 lyric:v.slice(v.lastIndexOf(']')+1),
                 T_id:index
                };
                result.push(x);
            })
            // console.log(result);
            result.forEach(function (v) {
                v.time=v.time
                let el=
                    `
                    <li data="${v.T_id}" >${v.lyric}</li>
                    `;
                $(el).appendTo(wraper)
            })
        }




    });
});