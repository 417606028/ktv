$(function () {
    let items=$('.ssj_choice li');
    let left=$('.ssj_choice .left');
    let right=$('.ssj_choice .right');
    let lefti=$('.ssj_choice .left .num');
    let rights=$('.ssj_choice .right .num');
    let box=$('.ssj_wine');
    let res=$('.ssj_bottom .submit');
    let viewport=$('.ssj_xuan .choice-item');
    let star=$('.dataBox .name');
    let sumEl=$('.ssj_footer .result .num');
    let drunk=0,
        foods=0;
    //选项卡组
    items.on('tap',function () {
        items.removeClass('active');
        $(this).addClass('active');
        box.removeClass('show');
        $(box.eq($(this).index())).addClass('show');
    });
    //左右滚动
    left.on('tap',function () {
            $(this).css({
                position:'absolute',
                left:'50%',
                zIndex:'10'
            }).animate({
              left:'0'
            },'slow',function () {
               left.css({
                   zIndex:'1'
               })
            })

    });
    right.on('tap',function () {
            $(this).css({
                position: 'absolute',
                left:'0',
                zIndex: '10'
            }).animate({
                left:'50%'
            }, 'slow',function () {
               right.css({
                   zIndex:'1'
               })
            })
    });
    //添加移除和商品管理
    let adds=$('.operate .plus');
    let subtract=$('.operate .subtract');
    let choicelist=[];
    function renderAll() {
        viewport.empty();
        choicelist.forEach(function (v,i) {
            $(`<div>${v.name}&nbsp;&nbsp;${v.num}/瓶</div>`).addClass('Views').appendTo(viewport)
        });
        rights.html(foodnumber());
        lefti.html(winenumber());
        sumEl.html(getTotal());
        let data=JSON.stringify(choicelist);
        localStorage.setItem("data",data);
    }
    function winenumber() {
        let t=0;
        choicelist.forEach(function (v,i) {
            if(v.type==1){
                t+=v.num;
            }
        })
        return t;
    }
    function foodnumber() {
        let t=0;
        choicelist.forEach(function (v,i) {
            if(v.type==2){
                t+=v.num;
            }
        })
        return t;
    }
    function getTotal() {
        let total=0;
        choicelist.forEach(function (v,i) {
            total+=v.num * v.price;
        })
        return total.toFixed(2);
    }
    adds.on('tap',function () {
        let parent=$(this).closest('.ssj_item');
        let o=JSON.parse(parent.attr('data'));
        let inputs=$(this).siblings('.num');
        o.num=0;
        r=choicelist.filter(function (v,i) {
            return  v.id==o.id;
        });
        if(!r.length){
            o.num+=1;
            inputs.html(o.num);
            choicelist.push(o)
        }else{
           r[0].num+=1;
            inputs.html(r[0].num);
        }
        // console.table(choicelist);
        renderAll();
    });
    subtract.on('tap',function () {
        let parent=$(this).closest('.ssj_item');
        let o=JSON.parse(parent.attr('data'));
        let inputs=$(this).siblings('.num');
        r=choicelist.filter(function (v,i) {
            return  v.id==o.id;
        });
        if(r.length){
            r[0].num-=1;
            inputs.html(r[0].num);
            if(r[0].num<=0){
                choicelist=choicelist.filter(function (v,i) {
                    return v.id!=r[0].id;
                });
                inputs.html(0);
            }
        }else{
            return;
        }
        // console.table(choicelist);
        renderAll();

    });
    //提交
    let submitEl=$('.ssj_bottom .submit');
    submitEl.on('tap',function () {
        window.location.href='/index.php/bussiness/buy';
    })
});
