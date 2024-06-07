<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Panel</title>
    <link href="https://cdn.jsdelivr.net/npm/tailwindcss@2.2.19/dist/tailwind.min.css" rel="stylesheet">
</head>
<body class="bg-gray-100">
<form action="logout.php" method="post">
    <button class="bg-blue-500 hover:bg-blue-600 text-white font-bold py-2 px-4 m-2 rounded-full shadow-lg transition duration-300 ease-in-out">
        Wyloguj
    </button>
</form>
<div class="min-h-screen flex items-center justify-center">
    <div class="bg-white shadow-md rounded-lg max-w-md w-full p-6">
        <h2 class="text-2xl font-bold mb-5 text-center">Dodaj Produkt</h2>

        <form action="addProduct.php" method="POST" enctype="multipart/form-data">
            <div class="mb-4">
                <label class="block text-gray-700 text-sm font-bold mb-2" for="productImage">
                    Zdjęcie produktu
                </label>
                <input type="file" id="productImage" name="productImage" accept="image/*" class="block w-full text-sm text-gray-500
                    file:mr-4 file:py-2 file:px-4
                    file:rounded-full file:border-0
                    file:text-sm file:font-semibold
                    file:bg-blue-50 file:text-blue-700
                    hover:file:bg-blue-100
                    "/>
            </div>

            <div class="mb-4">
                <label class="block text-gray-700 text-sm font-bold mb-2" for="productName">
                    Nazwa produktu
                </label>
                <input type="text" id="productName" name="productName" placeholder="Wpisz nazwe produktu" class="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline" required>
            </div>

            <div class="mb-4">
                <label class="block text-gray-700 text-sm font-bold mb-2" for="productDescription">
                    Opis produktu
                </label>
                <textarea id="productDescription" name="productDescription" placeholder="Opisz produkt" class="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline" rows="3" required></textarea>
            </div>

            <div class="mb-4">
                <label class="block text-gray-700 text-sm font-bold mb-2" for="productPrice">
                    Cena produktu
                </label>
                <input type="number" id="productPrice" name="productPrice" placeholder="Podaj cene Produktu" class="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline" step="0.01" required>
            </div>

            <div class="flex items-center justify-between">
                <button class="bg-blue-500 hover:bg-blue-700 text-white font-bold py-2 px-4 rounded focus:outline-none focus:shadow-outline" type="submit">
                    Dodaj produkt
                </button>
            </div>
        </form>
    </div>
</div>

</body>
</html>
