/**
 * Created by MACHENIKE on 2017/6/24.
 */
$(function () {
    let tbEl=$('tbody');
    let sub=$('button.btn-default');
    let name=$('input[name=name]');
    let url=$('input[name=url]');
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
        $(`${location.hash}`+'-pane').addClass('active');
        if(location.hash=='#list'){
            $.ajax({
                url:'/index.php/singerClassManager/adinfo',
                dataType:'json',
                success:function (data) {
                    // console.log(data);
                    // data=JSON.parse(data);
                    render(data);
                }
            })
        }

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
    //上传提示
    $('#file').on('change',function () {
        $('#upload').html(this.files[0].name);
    });
    //删除
    tbEl.on('click','.del',function () {
        let trEl=$(this).closest('tr');
        let id=trEl.attr('data-id');
        let pic=trEl.find('.pic').val();
        // console.log(trEl)
        $.ajax({
            url:'/index.php/singerClassManager/delete_admins',
            data:{id:id,pic:pic},
            success:function (data) {
                trEl.detach();
            }
        });
        return false;

    });
    //input更新
    tbEl.on('change','.name,.class,.pic,.hot,.type',function () {
        let id=$(this).closest('tr').attr('data-id');
        let val=$(this).val();
        let cid=$(this).attr("class");
        $.ajax({
            url:'/index.php/singerClassManager/update',
            data:{id:id,name:cid,value:val},
            success:function (data) {

            }
        })
    })
    sub.on('click',function () {
        let formData=new FormData($('#form').get(0));
        if(name.val()){
            $.ajax({
                url:'/index.php/singerClassManager/add_admins',
                data:formData,
                method:'post',
                processData:false,
                contentType:false,
                success:function (data) {
                    location.href='#list';
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
                    <input class="name" type="text" value="${v['name']}">
                    </td>
                <td>
                    <input class="price" type="text" value="${v['url']}">
                    </td> 
                <td>
                    <img src="${v['pic']}" width="100" alt="">
                    <input class="pic" type="text" value="${v['pic']}">
                </td>
                <td>
                    <a href="javascript:;" class="del">删除</a>&nbsp;/&nbsp;
                   <a href="/index.php/singerManager?id=${v.id}#add" class="">添加歌手</a>
                </td>
            </tr>        
        `;
            $(htmls).appendTo(tbEl);
        })
    }
    //创建页面元素

    //更改
});