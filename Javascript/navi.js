$(window).load(function () {
    var height = window.innerHeight,
        x = 0, y = height / 2,
        curveX = 10,
        curveY = 0,
        targetX = 0,
        xitteration = 0,
        yitteration = 0,
        menuExpanded = false;

    blob = $('#blob'),
        blobPath = $('#blob-path'),

        hamburger = $('.hamburger');

    $(this).on('mousemove', function (e) {
        x = e.pageX;

        y = e.pageY;
    });

    $('.hamburger, .menu-inner').on('mouseenter', function () {
        $(this).parent().addClass('expanded');
        menuExpanded = true;
    });

    $('.menu-inner').on('mouseleave', function () {
        menuExpanded = false;
        $(this).parent().removeClass('expanded');
    });

    function easeOutExpo(currentIteration, startValue, changeInValue, totalIterations) {
        return changeInValue * (-Math.pow(2, -10 * currentIteration / totalIterations) + 1) + startValue;
    }

    var hoverZone = 150;
    var expandAmount = 20;

    function svgCurve() {
        if ((curveX > x - 1) && (curveX < x + 1)) {
            xitteration = 0;
        } else {
            if (menuExpanded) {
                targetX = 0;
            } else {
                xitteration = 0;
                if (x > hoverZone) {
                    targetX = 0;
                } else {
                    targetX = -(((60 + expandAmount) / 100) * (x - hoverZone));
                }
            }
            xitteration++;
        }

        if ((curveY > y - 1) && (curveY < y + 1)) {
            yitteration = 0;
        } else {
            yitteration = 0;
            yitteration++;
        }

        curveX = easeOutExpo(xitteration, curveX, targetX - curveX, 100);
        curveY = easeOutExpo(yitteration, curveY, y - curveY, 100);

        var anchorDistance = 200;
        var curviness = anchorDistance - 40;

        var newCurve2 = "M60," + height + "H0V0h60v" + (curveY - anchorDistance) + "c0," + curviness + "," + curveX + "," + curviness + "," + curveX + "," + anchorDistance + "S60," + (curveY) + ",60," + (curveY + (anchorDistance * 2)) + "V" + height + "z";

        blobPath.attr('d', newCurve2);

        blob.width(curveX + 60);

        hamburger.css('transform', 'translate(' + curveX + 'px, ' + curveY + 'px)');

        $('h2').css('transform', 'translateY(' + curveY + 'px)');
        window.requestAnimationFrame(svgCurve);
    }

    window.requestAnimationFrame(svgCurve);

});


// login button animation
const ASCII_CHARS = "abcdefghijklmnñopqrstuvwxyz0123456789!#$%&/?'_-"
const COLORS = ["#ff6188", "#fc9867", "#ffd866", "#a9dc76", "#78dce8", "#ab9df2"]

class RainbowButton {
    constructor(_btn) {
        this.el = _btn
        this.txt = this.el.innerText
        this.overColor = COLORS[4]
        this.fps = 24
        this.events()
    }

    events() {
        this.el.addEventListener("mouseenter", () => this.onMouseEnter(), false)
        this.el.addEventListener("mouseleave", () => this.onMouseLeave(), false)
    }

    onMouseEnter() {
        this.over_active = true
        this.el.innerHTML = ""
        this.rainbow()
    }

    rainbow() {
        let letters = this.txt.split("")
        for (let i = 0; i < letters.length; i++) {
            const span = document.createElement("span")
            this.el.appendChild(span)
            const letter = letters[i]
            span.innerText = letter
            if (letter != " ") {
                let idx = ASCII_CHARS.indexOf(letter.toLowerCase())
                let initChar = idx > 10 ? ASCII_CHARS[idx - 9] : ASCII_CHARS[0]
                setTimeout(() => this.letterTo(span, initChar, letter), 60 * i)
            }
        }
    }

    onMouseLeave() {
        this.over_active = false
        this.el.innerHTML = this.txt
    }

    letterTo(span, from, to) {
        let char = to
        let color = this.overColor
        if (from != to.toLowerCase() && this.over_active) {
            const idx = ASCII_CHARS.indexOf(from.toLowerCase())
            color = COLORS[~~(Math.random() * COLORS.length)]
            char = Math.random() > .5 ? from : from.toUpperCase()
            setTimeout(() => this.letterTo(span, ASCII_CHARS[idx + 1], to), 1000 / this.fps)
        }
        span.style.color = color
        span.innerText = char
    }
}

const _btn = new RainbowButton(document.querySelector("#rainbow-btn"))