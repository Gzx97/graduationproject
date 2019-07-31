<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link rel="stylesheet" href="css/pintuer.css">
<link rel="stylesheet" href="css/admin.css">
<script src="js/jquery.js"></script>
<script src="js/pintuer.js"></script>  
  <style>
        body,
        html {
            margin: 0;
            padding: 0;
            border: 0;
            font-family: 'Nunito', sans-serif;
        }
        
        body {
            background: ;
        }
        
        canvas {
            margin: 0;
            padding: 0;
            display: block;
            touch-action: none;
        }
        
        h1 {
            position: absolute;
            top: 50%;
            left: 0;
            margin: auto;
            width: 100%;
            text-align: center;
            color: #000;
        }
    </style>

</head>

<body>

    <h1>
        欢迎来到多媒体素材库
    </h1>

    <canvas></canvas>

    <script>
        var canvas = document.querySelector('canvas');
        canvas.height = window.innerHeight;
        canvas.width = window.innerWidth;
        c = canvas.getContext('2d');

        window.addEventListener('resize', function() {
            canvas.height = window.innerHeight;
            canvas.width = window.innerWidth;

            initCanvas();
        })

        var mouse = {
            x: undefined,
            y: undefined
        }
        window.addEventListener('mousemove',
            function(event) {
                mouse.x = event.x;
                mouse.y = event.y;
                drawCircles();
            }
        )
        window.addEventListener("touchmove",
            function(event) {
                let touch = event.touches[0];
                mouse.x = touch.clientX;
                mouse.y = touch.clientY;
                drawCircles();
            }
        )

        function Circle(x, y, radius, vx, vy, rgb, opacity, birth, life) {
            this.x = x;
            this.y = y;
            this.radius = radius;
            this.minRadius = radius;
            this.vx = vx;
            this.vy = vy;
            this.birth = birth;
            this.life = life;
            this.opacity = opacity;

            this.draw = function() {
                c.beginPath();
                c.arc(this.x, this.y, this.radius, Math.PI * 2, false);
                c.fillStyle = 'rgba(' + rgb + ',' + this.opacity + ')';
                c.fill();
            }

            this.update = function() {
                if (this.x + this.radius > innerWidth || this.x - this.radius < 0) {
                    this.vx = -this.vx;
                }

                if (this.y + this.radius > innerHeight || this.y - this.radius < 0) {
                    this.vy = -this.vy;
                }

                this.x += this.vx;
                this.y += this.vy;

                this.opacity = 1 - (((frame - this.birth) * 1) / this.life);

                if (frame > this.birth + this.life) {
                    for (let i = 0; i < circleArray.length; i++) {
                        if (this.birth == circleArray[i].birth && this.life == circleArray[i].life) {
                            circleArray.splice(i, 1);
                            break;
                        }
                    }
                } else {
                    this.draw();
                }
            }

        }

        var circleArray = [];

        function initCanvas() {
            circleArray = [];
        }

        var colorArray = [
            '355,85,80',
            '9,80,100',
            '343,81,45'
        ]

        function drawCircles() {
            for (let i = 0; i < 6; i++) {
                let radius = Math.floor(Math.random() * 4) + 2;
                let vx = (Math.random() * 2) - 1;
                let vy = (Math.random() * 2) - 1;
                let spawnFrame = frame;
                let rgb = colorArray[Math.floor(Math.random() * colorArray.length)];
                let life = 100;
                circleArray.push(new Circle(mouse.x, mouse.y, radius, vx, vy, rgb, 1, spawnFrame, life));

            }
        }

        var frame = 0;

        function animate() {
            requestAnimationFrame(animate);
            frame += 1;
            c.clearRect(0, 0, innerWidth, innerHeight);
            for (let i = 0; i < circleArray.length; i++) {
                circleArray[i].update();
            }

        }

        initCanvas();
        animate();

        for (let i = 1; i < 110; i++) {
            (function(index) {
                setTimeout(function() {
                    mouse.x = 100 + i * 10;
                    mouse.y = 100;
                    drawCircles();
                }, i * 10);
            })(i);
        }
    </script>
</html>