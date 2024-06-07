<section id="home" class="p-8 text-center bg-gray-100">
    <h2 class="text-2xl font-bold mb-4">Welcome in Me Gusta+</h2>
    <p>Your best pleace for rate products.</p>
</section>

<form action="search.php" method="POST" class="bg-white shadow-md rounded px-8 pt-6 pb-8 mb-4">
    <div class="mb-4">
        <label class="block text-gray-700 text-sm font-bold mb-2" for="search">
            Search
        </label>
        <input class="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline" id="search" type="text" name="search" placeholder="Search...">
    </div>
    <div class="flex items-center justify-between">
        <button class="bg-blue-500 hover:bg-blue-700 text-white font-bold py-2 px-4 rounded focus:outline-none focus:shadow-outline" type="submit">
            Search
        </button>
    </div>
</form>

<section id="rate" class="p-8 bg-gray-100">
    <h2 class="text-2xl font-bold mb-4 text-center">Rate Products</h2>
    <div id="cards_content">
        <!--card-->
    </div>
</section>
<script>
    document.addEventListener('DOMContentLoaded', () => {
        console.log("juz");
        let cards = document.getElementById("cards_content");
            cards.innerHTML="<p>Search Something</p>";

    }
</script>