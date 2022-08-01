function stampClick() {
    $("#stampIcon").addClass('translate-y');
    setTimeout(function () {
        document.getElementById("stampOffImg").style.display = "none";
        document.getElementById("stampOnImg").style.display = "block";
    }, 1000);
}


$(window).ready(function () {
    $('#stampIcon').on("animationend webkitAnimationEnd oAnimationEnd MSAnimationEnd", function () {
        $(this).removeClass();
    });
});