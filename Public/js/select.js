$(function () {
    let list;
    let box=$('.listwraper');
    box.on('click','.del',function () {
        let id=$(this).closest('li').attr('data-id');
        list=JSON.parse(localStorage.songList);
        list=list.filter(function (v) {
            return v.id!=id;
        });
        localStorage.songList=JSON.stringify(list);
        render();
    });
    box.on('click','.tops',function () {
        let id=$(this).closest('li').attr('data-id');
        list=JSON.parse(localStorage.songList);
        let index;
        list.forEach(function (v,i) {
            if(v.id==id){
                index=i;
            }
        });
        list.unshift(list.splice(index,1)[0]);
        localStorage.songList=JSON.stringify(list);
        render();
    });

    function render() {
        $('.listwraper').empty();
        if(localStorage.songList){
            list=JSON.parse(localStorage.songList);
            $('.header .right span').html(list.length);
            list.forEach(function (v) {
                let el=
                    `
                     <li data-id='${v.id}' class="items">
                        <div class="lefts">
                            <div class="wrapers">
                                <div></div>
                                <a href="/index.php/sing/show?id=${v.id}">
                                    <img src="${v.singer_pic}" alt="">
                                </a>
                                
                            </div>
                        </div>
                        <div class="middles">
                            <p>${v.name} - ${v.singer_name}</p>
                            <p>${v.duration}</p>
                        </div>
                        <div class="rights">
                            <div class="del"></div>
                            <div class="tops"></div>
                        </div>
                      </li>
                     `;
                $(el).appendTo('.listwraper');
            });

        }

    }
    render();
});