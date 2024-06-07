<section class="p-8 text-center bg-gray-100">
    <h2 class="text-2xl font-bold mb-4">Rejestracja</h2>
    <form method="post" action="register.php" class="max-w-md mx-auto bg-white p-6 rounded-lg shadow-md" onsubmit="return validateForm()">
        <div class="mb-4">
            <label for="username" class="block text-gray-700">Nazwa:</label>
            <input type="text" id="username" name="username" class="w-full px-3 py-2 border rounded-lg" required>
        </div>
        <div class="mb-4">
            <label for="email" class="block text-gray-700">Email:</label>
            <input type="email" id="email" name="email" class="w-full px-3 py-2 border rounded-lg" required>
        </div>
        <div class="mb-4">
            <label for="password" class="block text-gray-700">Hasło:</label>
            <input type="password" id="password" name="password" class="w-full px-3 py-2 border rounded-lg" required>
        </div>
        <div class="mb-4">
            <label for="repassword" class="block text-gray-700">Hasło:</label>
            <input type="password" id="repassword" name="repassword" class="w-full px-3 py-2 border rounded-lg" required>
        </div>
        <div class="mb-4 flex flex-row place-items-center">
            <input type="checkbox" id="accept" name="accept" class="px-3 py-2 border rounded-lg" required>
            <p class="px-2">Wyrażam zgodze na <a href="policy" class="text-blue-600">politykę prywatności</a> </p>
        </div>
        <button type="submit" class="w-full bg-blue-500 text-white py-2 rounded-lg">Zarejestruj</button>
    </form>
    <p>Sprawdź skrzynkę pocztową</p>
    <p>Jeśli masz juz konto <a style="color: deepskyblue" href="login">zaloguj się</a></p>

</section>
<script>
    function validateForm() {
        const password = document.getElementById('password').value;
        const confirmPassword = document.getElementById('repassword').value;
        if (password !== confirmPassword) {
            alert('Hasła się nie zgadzają!');
            return false;
        }
        return true;
    }
</script>