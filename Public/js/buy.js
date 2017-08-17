/**
 * Created by MACHENIKE on 2017/6/23.
 */
$(function () {
    let date=JSON.parse(localStorage.getItem('data'));
    let container=$('.wrap-box ul');
    let str='',str1='';
    let countEl=$('.nav-wraps .tit .num');
    let sumEl=$('.bottom-one .num');
    //创建页面元素
    sumEl.html(getTotal());
    countEl.html(date.length);
    date.forEach(function (v,i) {
        let info=JSON.stringify(v);
        if(v.type==1){
            str='可以让你飞的鸡尾酒';
            str1='300ml';
        }else{
            str='可以乐的可比克薯片';
            str1='150g';
        }
      let el= $(`
            <li data='${info}' class="wyf_items">
                <div class="lis-left">
                     <div class="left"><img src="${v['pic']}" alt=""></div>
                </div>
                     <div class="lis-right">
                           <div class="right1">
                               <div class="name">${v.name}</div>
                               <div class="wenzi content">
                                    ${str}&nbsp <span>${str1}</span>
                               </div>
                               <div class="xt"></div>
                               <div class="zong">
                                   <div class="left operate">
                                       <div class="zong-left subtract"></div>
                                       <div class="zong-center num"><span>${v.num}</span></div>
                                       <div class="zong-right plus"></div>
                                   </div>
                               <div class="right price"><span class="num">${v.price}</span>RMB</div>
                           </div>
                     </div>
                </div>
             </li>
      `);
       el.appendTo(container);
    })

    let adds=$('.operate .plus');
    let subtract=$('.operate .subtract');
    //创建渲染函数
    function renderAll() {
        sumEl.html(getTotal());
        let data=JSON.stringify(date);
        localStorage.setItem("data",data);
    }
    function getTotal() {
        let total=0;
        date.forEach(function (v,i) {
            total+=v.num * v.price;
        })
        return total.toFixed(2);
    }
    adds.on('click',function () {
        let parent=$(this).closest('.wyf_items');
        let o=JSON.parse(parent.attr('data'));
        // console.log(o);
        let inputs=$(this).siblings('.num');
        o.num=0;
        r=date.filter(function (v,i) {
            return  v.id==o.id;
        });
        if(!r.length){
            o.num+=1;
            inputs.html(o.num);
            date.push(o)
        }else{
            r[0].num+=1;
            inputs.html(r[0].num);
        }
        renderAll();
    });
    subtract.on('click',function () {
        let parent=$(this).closest('.wyf_items');
        let o=JSON.parse(parent.attr('data'));
        let inputs=$(this).siblings('.num');
        r=date.filter(function (v,i) {
            return  v.id==o.id;
        });
        if(r.length){
            r[0].num-=1;
            inputs.html(r[0].num);
            if(r[0].num<=0){
                date=date.filter(function (v,i) {
                    return v.id!=r[0].id;
                });
                inputs.html(0);
            }
        }else{
            return;
        }
        renderAll();

    });
});