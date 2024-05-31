<!DOCTYPE html>
<html lang="pl">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Me Gusta+ - Kontakt</title>
    <link href="https://cdn.jsdelivr.net/npm/tailwindcss@2.2.19/dist/tailwind.min.css" rel="stylesheet">
</head>
<body>
<header class="bg-blue-500 text-white p-4 text-center">
    <h1 class="text-3xl font-bold">Me Gusta+</h1>
    <nav>
        <a href="index" class="mr-4">Strona główna</a>
        <a href="about" class="mr-4">O nas</a>
        <a href="kontakt" class="mr-4">Kontakt</a>
    </nav>
</header>

<section class="p-8">
    <h2 class="text-2xl font-bold mb-4 text-center">Kontakt</h2>
    <form id="contactForm" class="max-w-md mx-auto" action="mailer.php" method="post">
        <div class="mb-4">
            <label for="name" class="block text-gray-700 text-sm font-bold mb-2">Imię:</label>
            <input type="text" id="name" name="name" class="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline">
        </div>
        <div class="mb-4">
            <label for="email" class="block text-gray-700 text-sm font-bold mb-2">Email:</label>
            <input type="email" id="email" name="email" class="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline">
        </div>
        <div class="mb-4">
            <label for="message" class="block text-gray-700 text-sm font-bold mb-2">Wiadomość:</label>
            <textarea id="message" name="message" class="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline" rows="4"></textarea>
        </div>
        <div class="flex items-center justify-between">
            <button class="bg-blue-500 hover:bg-blue-700 text-white font-bold py-2 px-4 rounded focus:outline-none focus:shadow-outline" type="submit">
                Wyślij
            </button>
        </div>
    </form>
</section>
</body>
</html>
