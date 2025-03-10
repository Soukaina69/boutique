<?php
include 'php/config.php'; // Connexion à la base de données
include 'header.php';
include 'sidebar.php';

echo "<main>";

if (isset($_GET['query']) && !empty($_GET['query'])) {
    $search = "%" . $_GET['query'] . "%";
    
    $stmt = $conn->prepare("SELECT * FROM produits WHERE nom LIKE ? OR description LIKE ?");
    $stmt->bind_param("ss", $search, $search);
    $stmt->execute();
    $result = $stmt->get_result();

    echo "<section class='featured-products'>";
    
    if ($result->num_rows > 0) {
        while ($row = $result->fetch_assoc()) {
            echo '<div class="products-container">';
            echo '<a href="display.php?id=' . htmlspecialchars($row['id']) . '">';
            echo "<img src='images/" . htmlspecialchars($row['image']) . "' alt='" . htmlspecialchars($row['nom']) . "'>";
            echo '</a>';
            echo "<h4>" . htmlspecialchars($row['nom']) . "</h4>";
            echo "<p>" . htmlspecialchars($row['description']) . "</p>";
            echo "<p>Prix: " . number_format($row['prix'], 2) . " €</p>";
            echo '<a href="display.php?id=' . htmlspecialchars($row['id']) . '">';
            echo '<button type="submit"><span class="material-symbols-outlined">add_shopping_cart</span>Ajouter</button>';
            echo '</a>';
            echo '</div>';
        }
    } else {
        echo "<p>Aucun produit trouvé.</p>";
    }

    echo "</section>";
} else {
    echo "<p>Veuillez entrer un mot-clé pour rechercher un produit.</p>";
}

echo "</main>";

include 'footer.php';
?>
