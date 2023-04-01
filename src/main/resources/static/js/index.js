var xiaomi = {
    // 初始化方法
    start() {
        this.getData();
        this.isLogin();
        this.setUrl();
        this.searchTips();
        this.sectionHeader();
        this.categoryList();
    },

    setUrl(){
        let petDiv = $('.more-link');
        petDiv.eq(0).attr("href","/jpetstore/Search.html?keyword="+encodeURIComponent("狗狗"))
        petDiv.eq(1).attr("href","/jpetstore/Search.html?keyword="+encodeURIComponent("猫咪"))
        petDiv.eq(2).attr("href","/jpetstore/Search.html?keyword="+encodeURIComponent("小宠"))
        petDiv.eq(3).attr("href","/jpetstore/Search.html?keyword="+encodeURIComponent("水族"))
        petDiv.eq(4).attr("href","/jpetstore/Search.html?keyword="+encodeURIComponent("爬虫"))

    },

    isLogin(){
        if(document.cookie.indexOf('token')===-1){
            //未登录
            $('#notLogin').show();
            $('#logined').hide();
            $('#userButton').hide();
        }else{
            //已登录
            $('#notLogin').hide();
            $('#logined').show();
            $('#userButton').show();
        }
    },

    getData(){
        var settings = {
            "url": "http://localhost:8080/jpetstore/pets",
            "method": "GET"
        };

        $.ajax(settings).done(function (response) {
            let dog = response.data.dog;
            $('#dogList').html(resolveData1(dog));
            $('#dogSwiper').html(resolveData2(dog));

            let cat = response.data.cat;
            $('#catList').html(resolveData1(cat));
            $('#catSwiper').html(resolveData2(cat));

            let bird = response.data.bird;
            $('#birdList').html(resolveData1(bird));
            $('#birdSwiper').html(resolveData2(bird));

            let fish = response.data.fish;
            $('#fishList').html(resolveData1(fish));
            $('#fishSwiper').html(resolveData2(fish));

            let reptile = response.data.reptile;
            $('#reptileList').html(resolveData1(reptile));
            $('#reptileSwiper').html(resolveData2(reptile));
        });
    },

    searchTips(){
        $("#search").on("input", function () {
            $("#tips").empty();
            let keyword = $(this).val();
            if (keyword !== null && keyword !== "") {
                $.ajax({
                    type: 'GET',
                    url: "/jpetstore/pets/searchTip?keyword=" + encodeURIComponent(keyword),
                    dataType: "json",
                    success: function (res) {
                        let data = res.data;
                        if (data.length > 0) {
                            let str = '';
                            for (let i = 0, len = data.length; i < len; i++) {
                                str += `<li><a href="/jpetstore/Search.html?keyword=${encodeURIComponent(data[i])}">${data[i]}</a></li>`
                            }
                            $("#tips").html(str);
                        }
                    }
                })
            }
        })
    },

    //主体部分的头部方法
    sectionHeader() {
        let J_homeSwiper = document.getElementById('J_homeSwiper');
        let swiperList = J_homeSwiper.getElementsByClassName('swiper-list')[0];
        let pagination = J_homeSwiper.getElementsByClassName('swiper-pagination')[0].querySelectorAll('li');
        let btnPrev = J_homeSwiper.getElementsByClassName('swiper-button-prev')[0];
        let btnNext = J_homeSwiper.getElementsByClassName('swiper-button-next')[0];
        let _index = 0;
        let _time = new Date(); //记录当前时间

        // 页面加载时开启自动播放
        var timer = setInterval(btnNextfn, 4000);
        // 鼠标移入时取消自动播放
        swiperList.onmouseover = function () {
            clearInterval(timer);
        }
        // 鼠标移除时开启自动播放
        swiperList.onmouseout = function () {
            timer = setInterval(btnNextfn, 4000);
        }

        // 分页按钮
        for (let i = 0; i < pagination.length; i++) {
            pagination[i].onclick = function () {
                swiperList.style.transform = "translateX(-" + i * 1226 + "px)";
                pagination[_index].className = '';
                _index = i;
                pagination[_index].className = 'active';
            }
        }

        // 下一张
        btnNext.onclick = btnNextfn;

        function btnNextfn() {
            if (new Date() - _time < 1000) {
                return; //两次点击小于1s，不做任何操作
            }
            _time = new Date();
            var i = _index;
            _index++;
            _index >= pagination.length && (_index = 0);
            swiperList.style.transform = "translateX(-" + _index * 1226 + "px)";
            pagination[i].className = '';
            pagination[_index].className = 'active';
        }

        // 上一张
        btnPrev.onclick = function () {
            if (new Date() - _time < 1000) {
                return; //两次点击小于1s，不做任何操作
            }
            _time = new Date();
            var i = _index;
            _index--;
            _index < 0 && (_index = pagination.length - 1);
            swiperList.style.transform = "translateX(-" + _index * 1226 + "px)";
            pagination[i].className = '';
            pagination[_index].className = 'active';
        }
    },

    //主体部分的头部方法的二级菜单
    categoryList() {
        let J_categoryList = document.getElementById('J_categoryList').getElementsByClassName('category-li');
        for (let i = 0; i < J_categoryList.length; i++) {
            J_categoryList[i].onmousemove = function () {
                this.getElementsByTagName('div')[0].style.display = 'block';
            }
            J_categoryList[i].onmouseout = function () {
                this.getElementsByTagName('div')[0].style.display = 'none';
            }
        }
    },

    // 固定栏
    divHome() {
        let height = document.documentElement.scrollTop || document.body.scrollTop;
        let imgYincang = document.getElementsByClassName('img_yincang')[0];
        if (height > 0) {
            imgYincang.style.display = 'block';
        } else {
            imgYincang.style.display = 'none';
        }
    }
}

// 加载事件
window.onload = function () {
    xiaomi.start();
}
// 回到顶部
window.onscroll = xiaomi.divHome;

function logout() {
    RemoveCookie('token')
    location.reload();
}

function RemoveCookie(cookieName) {
    let cookies = document.cookie.split(";");//将所有cookie键值对通过分号分割为数组
    //循环遍历所有cookie键值对
    for (let i = 0; i < cookies.length; i++) {
        //有些cookie键值对前面会莫名其妙产生一个空格，将空格去掉
        if (cookies[i].indexOf(" ") == 0) {
            cookies[i] = cookies[i].substring(1);
        }
        //比较每个cookie的名称，找到要删除的那个cookie键值对
        if (cookies[i].indexOf(cookieName) == 0) {
            let exp = new Date();//获取客户端本地当前系统时间
            exp.setTime(exp.getTime() - 60 * 1000);//将exp设置为客户端本地时间1分钟以前，将exp赋值给cookie作为过期时间后，就表示该cookie已经过期了, 那么浏览器就会将其立刻删除掉
            document.cookie = cookies[i] + ";expires=" + exp.toUTCString();//设置要删除的cookie的过期时间，即在该cookie的键值对后面再添加一个expires键值对，并将上面的exp赋给expires作为值(注意expires的值必须为UTC或者GMT时间，不能用本地时间），那么浏览器就会将该cookie立刻删除掉
            //注意document.cookie的用法很巧妙，在对其进行赋值的时候是设置单个cookie的信息，但是获取document.cookie的值的时候是返回所有cookie的信息
            break;//要删除的cookie已经在客户端被删除掉，跳出循环
        }
    }
}

function resolveData1(pet){
    let str = '';
    for(let i = 0,temp=pet.length,len=temp>8?8:temp;i<len;i++){
        str += `<li class="brick-item brick-item-m">
                                <a href="/jpetstore/Details.html?productId=${pet[i].productId}">
                                    <div class="figure-img"><img alt="" src="/jpetstore/image/look/${pet[i].productImage}"></div>
                                    <h3 class="title">${pet[i].productNameChinese}</h3>
                                    <p class="desc">${pet[i].productNameEnglish}</p>
                                </a>
                          </li>`
    }
    return str;
}

function resolveData2(pet){
    let str = '';
    for(let i = 0,temp=pet.length,len=temp>6?6:temp;i<len;i++){
        str += `<li>
                    <a class="link myclear" href="/jpetstore/Details.html?productId=${pet[i].productId}">
                        <img alt="" class="small-img" src="/jpetstore/image/look/${pet[i].productImage}">
                        <span class="text">${pet[i].productNameChinese}</span>
                    </a>
                </li>`
    }
    return str;
}