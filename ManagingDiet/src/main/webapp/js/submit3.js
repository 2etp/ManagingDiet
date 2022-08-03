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
    document.getElementById('btn').onclick = function () {
        setTimeout(function () {
            document.getElementById('frm').submit();
            location.href = 'dietStep4.jsp';
            return false;
        }, 2500);
    };
};