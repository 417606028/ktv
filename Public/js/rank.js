/**
 * Created by MACHENIKE on 2017/6/20.
 */
$(function () {
    let ser=$('.search ul li');
    let month=$('.month');
    let seation=$('.seation');
    let year=$('.year');
    let box=$('.box ul');
    let urls;
    ser.on('click',function () {
        ser.removeClass('active');
        $(this).addClass('active');
        if(month.hasClass('active')){
            urls='/index.php/sing/months';
        }else if(seation.hasClass('active')){
            urls='/index.php/sing/seation';
        }else{
            urls='/index.php/sing/year';
        }
        $.ajax({
            url:urls,
            success:function (data) {
                data=JSON.parse(data);
                box.empty();
                $.each(data,function (i,v) {
                    $(`<ul class="songsitems">
                            <li data='${v}' class="${v.id}">
                                <div class="left" >
                                    <?php echo "0${i}"?>
                                </div>
                                <div class="middle">
                                    <p>${v.name}</p>
                                    <p>${v.duration}</p>
                                </div>
                                <div class="right"></div>
                            </li>
                       </ul>
                    `).appendTo(box);
                })
            }
        })
    })
});