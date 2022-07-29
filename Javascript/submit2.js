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
    let cho1 = document.getElementById('choice_1')
    let cho2 = document.getElementById('choice_2')
    let cho3 = document.getElementById('choice_3')
    let cho4 = document.getElementById('choice_4')
    let cho5 = document.getElementById('choice_5')
    document.getElementById('btn').onclick = function () {
        setTimeout(function () {
            if (cho1.checked == false &&
                cho2.checked == false &&
                cho3.checked == false &&
                cho4.checked == false &&
                cho5.checked == false) {
                alert("활동량을 선택해주세요!")
            }
            else {
                document.getElementById('frm').submit();
                location.href = 'choice_diet3.html'
                return false;
            }
        }, 2500);
    };
};