/**
 * Created by MACHENIKE on 2017/6/26.
 */
$(function () {
    let tbEl=$('tbody');
    let sub=$('button.btn-default');
    let name=$('input[name=name]');
    let pic=$('input[name=pic]');
    let bac=$('input[name=bac]');
    let count=$('input[name=count]');
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
                url:'/index.php/singerManager/adinfo',
                dataType:'json',
                success:function (data) {
                    // console.log(data);
                    // data=JSON.parse(data);
                    render(data);
                }
            })
        }

    });
    //上传提示更新
    $('#back').on('change',function () {
        $('#upload').html(this.files[0].name)
    });
    $('#file').on('change',function () {
        $('#uploads').html(this.files[0].name)
    });


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
        let pic=trEl.find('.pic').val();
        let bac=trEl.find('.bac').val();
        // console.log(trEl)
        $.ajax({
            url:'/index.php/singerManager/delete_admins',
            data:{id:id,pic:pic,bac:bac},
            success:function (data) {
                trEl.detach();
            }
        });
        return false;

    });
    //input更新
    tbEl.on('change','.name,.count,.pic,.bac,.type',function () {
        let id=$(this).closest('tr').attr('data-id');
        let val=$(this).val();
        let cid=$(this).attr("class");
        $.ajax({
            url:'/index.php/singerManager/update',
            data:{id:id,name:cid,value:val},
            success:function (data) {

            }
        })
    })
    sub.on('click',function () {
        let formData=new FormData($('#form').get(0));
        if(name.val()&&count.val()){
            $.ajax({
                url:'/index.php/singerManager/add_admins',
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
                    <img src="${v['bac']}" alt="" width="100">
                    <input class="bac" type="text" value="${v['bac']}">
                    </td> 
                <td>
                    <img src="${v['pic']}" alt="" width="100">
                    <input class="pic" type="text" value="${v['pic']}">
                </td>
                <td>
                    <input class="count" type="text" value="${v['count']}">
                </td>
                <td>
                    <input class="type" type="text" value="${v['class_name']}">
                </td>
                <td>
                    <a href="javascript:;" class="del">删除</a>&nbsp;/&nbsp;
                   <a href="/index.php/songsManager?id=${v.id}#add" class="">添加歌曲</a>
                </td>
            </tr>        
        `;
            $(htmls).appendTo(tbEl);
        })
    }
    //创建页面元素

    //更改
});