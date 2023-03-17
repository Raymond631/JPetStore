var xiaomi = {
    // 初始化方法
    start() {
        this.sectionHeader();
        this.categoryList();
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