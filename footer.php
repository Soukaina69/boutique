<script>
    document.getElementById("search-icon").addEventListener("click", function (event) {
        event.preventDefault();
        let searchForm = document.getElementById("search-form");
        searchForm.style.display = (searchForm.style.display === "flex") ? "none" : "flex";
    });
</script>

</body>
</html>
