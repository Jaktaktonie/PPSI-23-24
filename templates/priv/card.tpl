<div class="product-card bg-white rounded-lg shadow-lg p-4">
<img class="w-full rounded" src="img/<!--img-->" alt="<!--nazwa-->">
<div class="mt-4">
    <h3 class="text-xl font-bold"><!--nazwa--></h3>
    <p class="text-gray-700"><!--opis--></p>
    <p class="text-gray-700">Cena: <!--cena--> zł</p>
    <p class="ocena text-gray-700" ocena="<!--ocena-->">Ocena: <!--ocena--> - </p>
</div>
<div class="mt-4">
    <form action="rate.php" method="POST">
        <div class="mb-4">
            <input type="text" value="<!--id-->" name="id" id="id" style="display: none">
            <label for="rating" class="block text-gray-700 text-sm font-bold mb-2">Ocena:</label>
            <select id="rating" name="rating" class="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline">
                <option value="1" <!--1--> >1 - Bardzo słaby</option>
                <option value="2" <!--2--> >2 - Słaby</option>
                <option value="3" <!--3--> >3 - Przeciętny</option>
                <option value="4" <!--4--> >4 - Dobry</option>
                <option value="5" <!--5--> >5 - Bardzo dobry</option>
            </select>
        </div>
        <div class="mb-4">
            <label for="comment" class="block text-gray-700 text-sm font-bold mb-2">Komentarz:</label>
            <textarea id="comment" name="comment" class="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline" rows="3"><!--comment--></textarea>
        </div>
        <div class="flex items-center justify-between">
            <button class="bg-blue-500 hover:bg-blue-700 text-white font-bold py-2 px-4 rounded focus:outline-none focus:shadow-outline" type="submit">
                Wyślij
            </button>
            <!--info-->
        </div>
    </form>
</div>
</div>
<!--card-->