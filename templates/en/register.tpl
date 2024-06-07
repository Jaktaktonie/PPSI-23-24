<section class="p-8 text-center bg-gray-100">
    <h2 class="text-2xl font-bold mb-4">Register</h2>
    <form method="post" action="register.php" class="max-w-md mx-auto bg-white p-6 rounded-lg shadow-md" onsubmit="return validateForm()">
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
        <div class="mb-4">
            <label for="repassword" class="block text-gray-700">Password:</label>
            <input type="password" id="repassword" name="repassword" class="w-full px-3 py-2 border rounded-lg" required>
        </div>
        <div class="mb-4 flex flex-row place-items-center">
            <input type="checkbox" id="accept" name="accept" class="px-3 py-2 border rounded-lg" required>
            <p class="px-2">I agree with <a href="policy" class="text-blue-600">private policy</a> </p>
        </div>
        <button type="submit" class="w-full bg-blue-500 text-white py-2 rounded-lg">Register</button>
    </form>
    <p>Check email</p>
    <p>You have an acoount - <a style="color: deepskyblue" href="login">Login</a></p>

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