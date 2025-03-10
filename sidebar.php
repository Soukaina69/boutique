<?php
$current_page = basename($_SERVER['PHP_SELF']); // Récupère la page actuelle
?>

<nav class="sidebar">
    <h2><a href="index.php"><span class="material-symbols-outlined">shopping_cart</span>Store</a></h2>
    <ul>
        <li><a href="index.php" class="<?php echo ($current_page == 'index.php') ? 'active' : ''; ?>">
            <span class="material-symbols-outlined">inventory_2</span>Produits</a>
        </li>
        <li><a href="categories.php" class="<?php echo ($current_page == 'categories.php') ? 'active' : ''; ?>">
            <span class="material-symbols-outlined">category</span>Catégories</a>
        </li>
        <li><a href="painer.php" class="<?php echo ($current_page == 'painer.php') ? 'active' : ''; ?>">
            <span class="material-symbols-outlined">shopping_cart_checkout</span>Panier</a>
        </li>
        <li><a href="account.php" class="<?php echo ($current_page == 'account.php'|| $current_page=='modifier.php') ? 'active' : ''; ?>">
            <span class="material-symbols-outlined">settings</span>Settings</a>
        </li>
    </ul>
</nav>
