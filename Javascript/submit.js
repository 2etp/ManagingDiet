(function () {
    $(document).on('click', '.btn-submit', function () {
        if (!$(this).hasClass('loading')) {
            $(this).addClass('loading');
            let self = this;

            setTimeout(function () {
                $(self).removeClass('loading');
                $(self).addClass('checked');
            }, 1500);
        }
    });
})();

// 2.5초후에 frm라는 id를 가진 form를 submit
window.onload = function () {
    let man = document.getElementById('gentle1')
    let woman = document.getElementById('gentle2')
    let inp1 = document.getElementById('inp')
    let inp2 = document.getElementById('inp2')
    let inp3 = document.getElementById('inp3')
    document.getElementById('btn').onclick = function () {
        setTimeout(function () {
            if (man.checked == false && woman.checked == false) {
                alert("성별을 지정해주세요!")
            }
            else if (inp1.value < '100' || inp1.value > '250') {
                alert("신장을 100~250 사이로 입력하세요!")
            }
            else if (inp2.value < '1' || inp2.value > '250') {
                alert("체중을 1~250 사이로 입력하세요!")
            }
            else if (inp3.value < '1' || inp3.value > '150') {
                alert("나이를 1~150 사이로 입력하세요!")
            }
            else {
                if ((man.checked == true && woman.checked == false) || (man.checked == false && woman.checked == true)) {
                    document.getElementById('frm').submit();
                    location.href = 'choice_diet2.html'
                    return false;
                }
            }
        }, 2500);
    };
};