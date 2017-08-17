/**
 * Created by MACHENIKE on 2017/6/22.
 */
$(function () {
    let tbEl = $('tbody');
    let sub = $('button.btn-default');
    let name = $('input[name=name]');
    let pic = $('input[name=pic]');
    let price = $('input[name=price]');
    let hot = $('input[name=hot]');
    let regExp = new RegExp();
    let proEl = $('.progress-bar');
    //hashchange
    if (!location.hash) {
        location.href = location.pathname + '#list';
    }
    $(window).on('hashchange', function () {
        $('.nav-tabs li').removeClass('active');
        $(`${location.hash}`).addClass('active');
        $('.tab-pane').removeClass('active');
        $(`${location.hash}` + '-pane').addClass('active');
        if(location.hash=='#list'){
            $.ajax({
                url: '/index.php/storeManager/adinfo',
                success: function (data) {
                    // console.log(data);
                    data = JSON.parse(data);
                    render(data);
                }
            })
        }

    });
    $(window).trigger('hashchange');
    //文件上传
    $('#file').on('change',function () {
        $('#upload').html(this.files[0].name)
    })
    //进度提示
    $(document).ajaxStart(function () {
        proEl.animate({width: '80%'})
    });
    $(document).ajaxComplete(function () {
        proEl.animate({width: '100%'}, function () {
            $(this).remove();
        })
    });
    //删除
    tbEl.on('click', '.del', function () {
        let trEl = $(this).closest('tr');
        let id = trEl.attr('data-id');
        let src=trEl.find('.pic').val();
        console.log(src);
        $.ajax({
            url: '/index.php/storeManager/delete_admins',
            data: {id: id,pic:src},
            success: function (data) {
                trEl.detach();
            }
        });
        return false;

    });
    //增加
    sub.on('click', function () {
        let formDatas = new FormData($('#form').get(0));
        let formData = $('#form').serializeArray();
        if (name.val() && price.val() && hot.val()) {
            $.ajax({
                url: '/index.php/storeManager/add_admins',
                data:formDatas,
                method:'post',
                processData:false,
                contentType:false,
                success: function (data) {
                    location.href = location.pathname + '#list';
                }
            })
        }
        return false;
    })
    function render(data) {
        tbEl.empty();
        $.each(data, function (i, v) {
            let htmls = `
            <tr data-id="${v.id}">
                <td>${v['id']}</td>
                <td>
                    <input class="name" type="text" value="${v['name']}">
                    </td>
                <td>
                    <input class="price" type="text" value="${v['price']}">
                    </td> 
                <td>
                    <img src="${v['pic']}" alt="" width="100">
                    <input class="pic" type="text" value="${v['pic']}">
                </td> 
                <td>
                    <input class="hot" type="text" value="${v['hot']}">
                </td> 
                <td>
                   <input class="type" type="text" value="${v['type']}">
                </td> 
                <td>
                    <a href="javascript:;" class="del">删除</a>
                </td>
            </tr>        
        `;
            $(htmls).appendTo(tbEl);
        })
    }

    //创建页面元素
    $.ajax({
        url: '/index.php/storeManager/adinfo',
        success: function (data) {
            // console.log(data);
            data = JSON.parse(data);
            render(data);
        }
    })
});