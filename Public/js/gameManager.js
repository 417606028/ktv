/**
 * Created by MACHENIKE on 2017/6/23.
 */
$(function () {
    let tbEl=$('tbody');
    let sub=$('button.btn-default');
    let name=$('input[name=name]');
    let regExp=new RegExp();
    let proEl=$('.progress-bar');
    //hashchange
    if(!location.hash){
    location.href=location.pathname+'#list';
    }
    $(window).on('hashchange',function () {

        $('.nav-tabs li').removeClass('active');
        $(`${location.hash}`).addClass('active');
        $('.tab-pane').removeClass('active');
        $(`${location.hash}`+'-pane').addClass('active')

    })
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
        // console.log(trEl)
        $.ajax({
            url:'/index.php/gameManager/delete_admins',
            data:{id:id},
            success:function (data) {
                trEl.detach();
            }
        });
        return false;

    });
    //input更新
    tbEl.on('change','.name,.type',function () {
        let id=$(this).closest('tr').attr('data-id');
        let val=$(this).val();
        let cid=$(this).attr("class");
        $.ajax({
            url:'/index.php/gameManager/update',
            data:{id:id,name:cid,value:val},
            success:function (data) {

            }
        })
    })
    //更改
    tbEl.on('click','.update',function () {
        let trEl=$(this).closest('tr');
        let id=trEl.attr('data-id');
        let formstring=$('#form').serialize()+`&id=${id}`;
        let formData=$('#form').serializeArray();
        if(name.val()){
            $.ajax({
                url:'/index.php/gameManager/update_admins?'+formstring,
                success:function (data) {
                    trEl.html(`
                   <td>${id}</td>
                <td>
                    <input class="name" type="text" value="${formData[0].value}">
                </td>
                <td>
                    <input class="price" type="text" value="${formData[1].value}">
                </td> 
                <td>
                    <a href="javascript:;" class="del">删除</a>&nbsp;/&nbsp;
                    <a href="javascript:;" class="update">更新</a>
                </td>
                `);
                    name.val('');
                }
            });
        }
        return false;

    });
    //增加
    sub.on('click',function () {
        let formstring=$('#form').serialize();
        let formData=$('#form').serializeArray();
        // console.log(formstring);
        if(name.val()){
            $.ajax({
                url:'/index.php/gameManager/add_admins?'+formstring,
                success:function (data) {
                    let html=`
            <tr data-id="${data}">
                <td>${data}</td>
                <td>
                    <input name="name" type="text" value='${formData[0].value}'>
                </td>
                <td>
                    <input name="name" type="text" value='${formData[1].value}'>
                </td>
                <td>
                    <a href="javascript:;" class="del">删除</a>&nbsp;/&nbsp;
                    <a href="javascript:;" class="update">更新</a>
                </td>
            </tr>        
        `;
                    $(html).prependTo(tbEl);
                    location.href=location.pathname+'#list';
                }
            })
        }
        return false;
    })
    function render(data) {
        tbEl.empty();
        $.each(data,function (i,v) {
            let htmls=`
            <tr data-id="${v.id}">
                <td>${v['id']}</td>
                <td>
                    <input class="name" type="text" value='${v['content']}'>
                </td>
                <td>
                   <input class="type" type="text" value='${v['type']}'>
                </td> 
                <td>
                    <a href="javascript:;" class="del">删除</a>&nbsp;/&nbsp;
                    <a href="javascript:;" class="update">更新</a>
                </td>
            </tr>        
        `;
            $(htmls).appendTo(tbEl);
        })
    }
    //创建页面元素
    $.ajax({
        url:'/index.php/gameManager/adinfo',
        success:function (data) {
            // console.log(data);
            data=JSON.parse(data);
            render(data);
        }
    })
    //更改
});