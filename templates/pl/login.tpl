<section class="p-8 text-center bg-gray-100">
    <h2 class="text-2xl font-bold mb-4">Logowanie</h2>
    <form method="post" action="login.php" class="max-w-md mx-auto bg-white p-6 rounded-lg shadow-md" onsubmit="return validateForm()">
        <div class="mb-4">
            <label for="email" class="block text-gray-700">Email:</label>
            <input type="email" id="email" name="email" class="w-full px-3 py-2 border rounded-lg" required>
        </div>
        <div class="mb-4">
            <label for="password" class="block text-gray-700">Hasło:</label>
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
