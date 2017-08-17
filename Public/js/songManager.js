/**
 * Created by MACHENIKE on 2017/6/27.
 */
$(function () {
    let tbEl=$('tbody');
    let sub=$('button.btn-default');
    let name=$('input[name=name]');
    let src=$('input[name=src]');
    let time=$('input[name=time]');
    let regExp=new RegExp();
    let proEl=$('.progress-bar');
    let result=$('.well.result');
    let historys=$('.well.history');
    let aid=$('input[name=aid]');
    let singer_name=$('input[name=singer_name]');
    //hashchange
    if(!location.hash){
        location.href=location.pathname+'#list';
    }
    $(window).on('hashchange',function () {
        $('.nav-tabs li').removeClass('active');
        $(`${location.hash}`).addClass('active');
        $('.tab-pane').removeClass('active');
        $(`${location.hash}`+'-pane').addClass('active');
        if(location.hash=='#list'){
            $.ajax({
                url:'/index.php/songManager/adinfo',
                dataType:'json',
                success:function (data) {
                    // console.log(data);
                    // data=JSON.parse(data);
                    render(data);
                }
            })
        }else if(location.hash=='#add'){
            if(localStorage.history){
                renderhistory();
            }

        }


    });
    function renderhistory() {
        let history=JSON.parse(localStorage.history);
        renderlist('.well.history',history);
    }
    $(window).trigger('hashchange');
    //进度提示
    $(document).ajaxStart(function () {
        proEl.animate({width:'80%'})
    });
    $(document).ajaxComplete(function () {
        proEl.animate({width:'100%'},function () {
            $(this).remove();
        })
    });
    //删除
    tbEl.on('click','.del',function () {
        let trEl=$(this).closest('tr');
        let id=trEl.attr('data-id');
        let src=trEl.find('.src').val();
        $.ajax({
            url:'/index.php/songManager/delete_admins',
            data:{id:id,src:src},
            success:function (data) {
                trEl.detach();
            }
        });
        return false;

    });
    //input更新
    tbEl.on('change','.name,.src,.time.type',function () {
        let id=$(this).closest('tr').attr('data-id');
        let val=$(this).val();
        let cid=$(this).attr("class");
        $.ajax({
            url:'/index.php/songManager/update',
            data:{id:id,name:cid,value:val},
            success:function (data) {

            }
        })
    });
    //刷新
    if(localStorage.history){
        historyList=JSON.parse(localStorage.history)
    }else{
        historyList=[];
    }
    //上传
    $('#file').on('change',function () {
       $('#upload').html(this.files[0].name);
    });
    //提交
    sub.on('click',function () {
        let formDatas=new FormData($('#form').get(0));
        let formData=$('#form').serializeArray();
        if(name.val()&&time.val()&&aid.val()){
            $.ajax({
                url:'/index.php/songManager/add_admins',
                data:formDatas,
                method:'post',
                contentType:false,
                processData:false,
                success:function (data) {
                        let r=historyList.filter(function (v,i) {
                            return v.id==aid.val();
                        });
                        if(!r.length){
                            historyList.push({id:aid.val(),name:search.val()});
                            localStorage.history=JSON.stringify(historyList);
                        }
                    location.href='#list';
                }
            })
        }
        return false;
    });
    function render(data) {
        tbEl.empty();
        $.each(data,function (i,v) {
            let htmls=`
            <tr data-id="${v.id}">
                <td>${v['id']}</td>
                <td>
                    <input class="name" type="text" value="${v['name']}">
                    </td>
                <td>
                    <input class="src" type="text" value="${v['src']}">
                    <audio src="${v['src']}" controls></audio>
                    </td> 
                <td>
                    <input class="time" type="text" value="${v['duration']}">
                </td>
                <td>
                    <input class="type" type="text" value="${v['singer_name']}">
                </td>
                <td>
                    <a href="" class="del">删除</a>&nbsp;
                </td>
            </tr>        
        `;
            $(htmls).appendTo(tbEl);
        })
    }
    //创建页面元素

    //搜索
    let search=$('#search');
    let timerId;
    search.on('input',function () {
        if(!search.val()||!(search.val().trim())){
            return;
        }
        let that=this;
        clearTimeout(timerId);
        timerId=setTimeout(function () {
            $.ajax({
                url:'/index.php/songManager/search',
                data:{keyword:$(that).val().trim()},
                dataType:'json',
                success:function (data) {
                    renderlist('.well.result',data);

                }

            });
        },800);

    });
    //列表

    function renderlist(selector,data) {
        $(selector).empty();
        data.forEach(function (v,i) {
            let el=
                `
                <span style="margin: 5px;padding: 4px" class="label label-info" data-id="${v.id}">${v.name}</span>
                `;
            $(el).appendTo(selector);
        });
    }


    result.add(historys).on('click','.label',function () {
        search.val($(this).html().trim());
        aid.val($(this).attr('data-id'));
    })
});