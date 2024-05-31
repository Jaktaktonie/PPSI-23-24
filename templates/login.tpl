<!DOCTYPE html>
<html lang="pl">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Register - Me Gusta+</title>
    <link href="https://cdn.jsdelivr.net/npm/tailwindcss@2.2.19/dist/tailwind.min.css" rel="stylesheet">
</head>
<body>
<header class="bg-blue-500 text-white p-4 text-center">
    <h1 class="text-3xl font-bold">Me Gusta+</h1>
    <nav>
        <a href="index" class="mr-4">Home</a>
        <a href="about" class="mr-4">O nas</a>
        <a href="kontakt" class="mr-4">Kontakt</a>
    </nav>
</header>

<section class="p-8 text-center bg-gray-100">
    <h2 class="text-2xl font-bold mb-4">Login</h2>
    <form method="post" action="login.php" class="max-w-md mx-auto bg-white p-6 rounded-lg shadow-md" onsubmit="return validateForm()">
        <div class="mb-4">
            <label for="username" class="block text-gray-700">Username:</label>
            <input type="text" id="username" name="username" class="w-full px-3 py-2 border rounded-lg" required>
        </div>
        <div class="mb-4">
            <label for="email" class="block text-gray-700">Email:</label>
            <input type="email" id="email" name="email" class="w-full px-3 py-2 border rounded-lg" required>
        </div>
        <div class="mb-4">
            <label for="password" class="block text-gray-700">Password:</label>
            <input type="password" id="password" name="password" class="w-full px-3 py-2 border rounded-lg" required>
        </div>
        <button type="submit" class="w-full bg-blue-500 text-white py-2 rounded-lg">Zaloguj</button>
    </form>
    <p>Jeśli nie masz konta <a style="color: deepskyblue" href="register">zarejstruj się</a></p>
</section>
<script>
    function validateForm() {
        const password = document.getElementById('password').value;
        const confirmPassword = document.getElementById('repassword').value;
        if (password !== confirmPassword) {
            alert('Passwords do not match!');
            return false;
        }
        return true;
    }
</script>
</body>
</html>