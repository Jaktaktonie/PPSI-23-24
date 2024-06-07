<!DOCTYPE html>
<html lang="pl">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Me Gusta+</title>
    <link href="https://cdn.jsdelivr.net/npm/tailwindcss@2.2.19/dist/tailwind.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">

    <style>
        .product-card {
            max-width: 400px;
            aspect-ratio: 1/2;
            margin: auto;
            display: flex;
            flex-direction: column;
            place-content: center;
            overflow: hidden;
            margin-top: 5px;
        }
        img{
            width: 400px;
            aspect-ratio: 1/1;
            object-fit: contain;
        }
        #cards_content{
            display: flex;
            width: 100%;
            flex-direction: row;
            flex-wrap: wrap;
            justify-content: center;
        }
    </style>
</head>
<body class="flex flex-col h-100 min-h-screen">
<header class="bg-blue-500 text-white p-4 text-center">
    <form class="w-10 absolute right-5 top-5" method="post" action="switchLang.php">
        <button onclick="changeLang()">
            <img src="img/en.png">
        </button>
    </form>
    <nav>
        <h1 class="text-3xl font-bold">Me Gusta+</h1>
        <div id="temperature"></div>
    </nav>
    <nav>
        <a href="index" class="mr-4">Strona główna</a>
        <a href="about" class="mr-4">O nas</a>
        <a href="kontakt" class="mr-4">Kontakt</a>
        <span id="login_btn"></span>
    </nav>
</header>
<!--body-->
<footer class="bg-blue-500 text-white p-4 text-center w-full flex-end mt-auto">

<nav>
    <a href="policy" class="mr-4">Polityka Prywatności</a>
</nav>
</footer>
<script>
    function cookieExists(name) {
        return document.cookie.split(';').some(cookie => cookie.trim().startsWith(`${name}=`));
    }

    document.addEventListener('DOMContentLoaded', () => {

        if (!cookieExists('user'))
        {
            document.getElementById("login_btn").innerHTML='<a href="login" class="mr-4">Zaloguj</a>';
        } else
        {
            document.getElementById("login_btn").innerHTML='<a href="logout.php" class="mr-4">Wyloguj</a>';
        }
        const ratings = document.querySelectorAll('.ocena');
        let cards = document.getElementById("cards_content");
        if(cards.childElementCount==0){
            cards.innerHTML="Wyszukaj coś";
        }
        ratings.forEach(rating => {
            const score = parseFloat(rating.getAttribute("ocena"));
            const fullStars = Math.floor(score);
            const halfStar = score % 1 >= 0.5 ? 1 : 0;
            const emptyStars = 5 - fullStars - halfStar;

            for (let i = 0; i < fullStars; i++) {
                rating.innerHTML += '<i class="fas fa-star star"></i>';
            }
            if (halfStar) {
                rating.innerHTML += '<i class="fas fa-star-half-alt star"></i>';
            }
            for (let i = 0; i < emptyStars; i++) {
                rating.innerHTML += '<i class="far fa-star star"></i>';
            }
        });
        if (navigator.geolocation) {
            navigator.geolocation.getCurrentPosition(showPosition, showError);
        } else {
        }

        async function showPosition(position) {
            const latitude = position.coords.latitude;
            const longitude = position.coords.longitude;

            const apiKey = 'f8ac7ef4fb71f2b58a880ab81861e65e';
            const weatherUrl = `https://api.openweathermap.org/data/2.5/weather?lat=${latitude}&lon=${longitude}&units=metric&appid=${apiKey}`;

            try {
                const response = await fetch(weatherUrl);
                const data = await response.json();
                const temperature = data.main.temp;
                const miasto = data.name;
                document.getElementById('temperature').textContent = `Temperatura w ${miasto}: ${temperature}°C`;
            } catch (error) {
                document.getElementById('temperature').textContent = 'Wystąpił poblem z pozyskaniem temperatury.';
                console.error('Error fetching weather data:', error);
            }
        }

        function showError(error) {
            switch(error.code) {
                case error.PERMISSION_DENIED:
                    document.getElementById('temperature').textContent = "Nie pozwoliłeś na lokalizacji to nie ma temeperatury";
                    break;
                case error.POSITION_UNAVAILABLE:
                    document.getElementById('temperature').textContent = "Wystąpił poblem z pozyskaniem temperatury..";
                    break;
                case error.TIMEOUT:
                    document.getElementById('temperature').textContent = "Wystąpił poblem z pozyskaniem temperatury.";
                    break;
                case error.UNKNOWN_ERROR:
                    document.getElementById('temperature').textContent = "Coś nie zadziałało.";
                    break;
            }
        }

    });


</script>
</body>
</html>
