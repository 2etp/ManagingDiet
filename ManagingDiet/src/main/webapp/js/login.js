jQuery(document).ready(function ($) {
    var $form_modal = $('.user-modal'),
        $form_login = $form_modal.find('#login'),
        $form_signup = $form_modal.find('#signup'),
        $form_forgot_password = $form_modal.find('#reset-password'),
        $form_modal_tab = $('.switcher'),
        $tab_login = $form_modal_tab.children('li').eq(0).children('a'),
        $tab_signup = $form_modal_tab.children('li').eq(1).children('a'),
        $forgot_password_link = $form_login.find('.form-bottom-message a'),
        $back_to_login_link = $form_forgot_password.find('.form-bottom-message a'),
        $main_nav = $('.main-nav');

    //open modal
    $main_nav.on('click', function (event) {

        if ($(event.target).is($main_nav)) {
            // on mobile open the submenu
            $(this).children('ul').toggleClass('is-visible');
        } else {
            // on mobile close submenu
            $main_nav.children('ul').removeClass('is-visible');
            //show modal layer
            $form_modal.addClass('is-visible');
            //show the selected form
            ($(event.target).is('.signup')) ? signup_selected() : login_selected();
        }

    });

    //close modal
    $('.user-modal').on('click', function (event) {
        if ($(event.target).is($form_modal) || $(event.target).is('.close-form')) {
            $form_modal.removeClass('is-visible');
        }
    });
    //close modal when clicking the esc keyboard button
    $(document).keyup(function (event) {
        if (event.which == '27') {
            $form_modal.removeClass('is-visible');
        }
    });

    //switch from a tab to another
    $form_modal_tab.on('click', function (event) {
        event.preventDefault();
        ($(event.target).is($tab_login)) ? login_selected() : signup_selected();
    });

    //hide or show password
    $('.hide-password').on('click', function () {
        var $this = $(this),
            $password_field = $this.prev('input');

        ('password' == $password_field.attr('type')) ? $password_field.attr('type', 'text') : $password_field.attr('type', 'password');
        ('Show' == $this.text()) ? $this.text('Hide') : $this.text('Show');
        //focus and move cursor to the end of input field
        $password_field.putCursorAtEnd();
    });

    //show forgot-password form 
    $forgot_password_link.on('click', function (event) {
        event.preventDefault();
        forgot_password_selected();
    });

    //back to login from the forgot-password form
    $back_to_login_link.on('click', function (event) {
        event.preventDefault();
        login_selected();
    });

    function login_selected() {
        $form_login.addClass('is-selected');
        $form_signup.removeClass('is-selected');
        $form_forgot_password.removeClass('is-selected');
        $tab_login.addClass('selected');
        $tab_signup.removeClass('selected');
    }

    function signup_selected() {
        $form_login.removeClass('is-selected');
        $form_signup.addClass('is-selected');
        $form_forgot_password.removeClass('is-selected');
        $tab_login.removeClass('selected');
        $tab_signup.addClass('selected');
    }

    function forgot_password_selected() {
        $form_login.removeClass('is-selected');
        $form_signup.removeClass('is-selected');
        $form_forgot_password.addClass('is-selected');
    }

    // // REMOVE THIS - it's just to show error messages 
    // $form_login.find('input[type="submit"]').on('click', function (event) {
    //     $form_login.find('input[type="email"]').toggleClass('has-error').next('span').toggleClass('is-visible');
    // });
    // $form_signup.find('input[type="submit"]').on('click', function (event) {
    //     $form_signup.find('input[type="email"]').toggleClass('has-error').next('span').toggleClass('is-visible');
    // });


    //IE9 placeholder fallback
    //credits http://www.hagenburger.net/BLOG/HTML5-Input-Placeholder-Fix-With-jQuery.html
    if (!Modernizr.input.placeholder) {
        $('[placeholder]').focus(function () {
            var input = $(this);
            if (input.val() == input.attr('placeholder')) {
                input.val('');
            }
        }).blur(function () {
            var input = $(this);
            if (input.val() == '' || input.val() == input.attr('placeholder')) {
                input.val(input.attr('placeholder'));
            }
        }).blur();
        $('[placeholder]').parents('form').submit(function () {
            $(this).find('[placeholder]').each(function () {
                var input = $(this);
                if (input.val() == input.attr('placeholder')) {
                    input.val('');
                }
            })
        });
    }

});


//credits https://css-tricks.com/snippets/jquery/move-cursor-to-end-of-textarea-or-input/
jQuery.fn.putCursorAtEnd = function () {
    return this.each(function () {
        // If this function exists...
        if (this.setSelectionRange) {
            // ... then use it (Doesn't work in IE)
            // Double the length because Opera is inconsistent about whether a carriage return is one character or two. Sigh.
            var len = $(this).val().length * 2;
            this.setSelectionRange(len, len);
        } else {
            // ... otherwise replace the contents with itself
            // (Doesn't work in Google Chrome)
            $(this).val($(this).val());
        }
    });
};


// 비밀번호 확인
$('.pw').focusout(function () {
    let pwd1 = $("#password_1").val();
    let pwd2 = $("#password_2").val();
    if (pwd1 == '' && pwd2 == '') {
        null;
    } else if (pwd1 != "" || pwd2 != "") {
        if (pwd1 == pwd2) {
            $("#alert-success").css('display', 'block');
            $("#alert-danger").css('display', 'none');
            setTimeout(function () {
                $("#alert-success").css('display', 'none');
            }, 3000)

        } else {
            $("#alert-success").css('display', 'none');
            $("#alert-danger").css('display', 'block');
            setTimeout(function () {
                $("#alert-danger").css('display', 'none');
            }, 3000)
        }
    }
});

// 회원가입 예외처리
// 비밀번호 유효성 검사 문법
function checkPassword() {
    let userName = $("#signup-username").val();
    let userEmail = $("#signup-email").val();
    let userPhone = $("#signup-phone").val();
    let pwd1 = $("#password_1").val();
    let pwd2 = $("#password_2").val();
    let agreechecked = $("#accept-terms");

    // 이름 확인
    if (userName == '') {
        $("#user-danger").css('display', 'block')
        setTimeout(function () {
            $("#user-danger").css('display', 'none');
        }, 3000)
        return false;
    }
    // 이름 특수문자 사용막는 정규식
    else if (!/^[가-힝a-zA-Z]{2,}$/.test(userName)) {
        $("#user-danger2").css('display', 'block')
        setTimeout(function () {
            $("#user-danger2").css('display', 'none');
        }, 3000)
        return false;
    }
    // 이메일 확인
    else if (userEmail == '') {
        $("#email-danger").css('display', 'block')
        setTimeout(function () {
            $("#email-danger").css('display', 'none');
        }, 3000)
        return false;
    }
    // 이메일 정규식
    else if (!/^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/.test(userEmail)) {
        $("#email-danger2").css('display', 'block')
        setTimeout(function () {
            $("#email-danger2").css('display', 'none');
        }, 3000)
        return false;
    }

    // 휴대폰 번호 확인
    else if (userPhone == '') {
        $("#phone-danger").css('display', 'block')
        setTimeout(function () {
            $("#phone-danger").css('display', 'none');
        }, 3000)
        return false;
    }

    else if (!/^01([0|1|6|7|8|9])-?([0-9]{3,4})-?([0-9]{4})$/.test(userPhone)) {
        $("#phone-danger2").css('display', 'block')
        setTimeout(function () {
            $("#phone-danger2").css('display', 'none');
        }, 3000)
        return false;
    }

    // 비밀번호 확인
    else if (pwd1 !== pwd2) {
        $('#password_1').val('').focus();
        $('#password_2').val('').focus();
        return false;
    }
    // 비밀번호 정규식
    else if (!/^(?=.*[a-zA-Z])(?=.*[!@#$%^*+=-])(?=.*[0-9]).{8,20}$/.test(pwd1)) {
        if (!/^(?=.*[a-zA-Z])(?=.*[!@#$%^*+=-])(?=.*[0-9]).{8,20}$/.test(pwd2)) {
            $("#password-danger").css('display', 'block');
            $("#password-danger3").css('display', 'none');
            $('#password_1').val('').focus();
            setTimeout(function () {
                $("#password-danger").css('display', 'none');
            }, 5000)
            return false;
        }
    }
    // 약관 동의 체크 안할시
    else if ($(agreechecked).prop("checked") == false) {
        $("#accept-danger").css('display', 'block')
        setTimeout(function () {
            $("#accept-danger").css('display', 'none');
        }, 3000)
        return false;
    }

    else {
        $('#signup-form').submit();
    }
}



function loginchk() {
    let loginEmail = $("#signin-email").val();
    let loginPw = $("#signin-password").val();
    // 로그인 이메일 입력 안할시
    if (loginEmail == '') {
        $("#login-email").css('display', 'block')
        setTimeout(function () {
            $("#login-email").css('display', 'none');
        }, 3000)
        return false;
    }
    // 로그인 이메일 정규식
    else if (!/^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/.test(loginEmail)) {
        $("#login-email2").css('display', 'block')
        setTimeout(function () {
            $("#login-email2").css('display', 'none');
        }, 3000)
        return false;
    }
    // 로그인 비밀번호 입력안할시
    else if (loginPw == '') {
        $("#login-pw").css('display', 'block')
        setTimeout(function () {
            $("#login-pw").css('display', 'none');
        }, 3000)
        return false;
    }
    // 로그인 비밀번호 정규식
    else if (!/^(?=.*[a-zA-Z])(?=.*[!@#$%^*+=-])(?=.*[0-9]).{8,20}$/.test(loginPw)) {
        $("#login-pw2").css('display', 'block')
        setTimeout(function () {
            $("#login-pw2").css('display', 'none');
        }, 3000)
        return false;
    }
    else {
        $('#signin-form').submit();
    }
}