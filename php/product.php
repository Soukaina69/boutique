<h2>Bienvenue dans notre boutique d'appareils électroniques</h2>
        <section class="featured-products">
           
            <?php include 'get_products.php'; ?>
            <?php
            if ($result->num_rows > 0) {
                while($row = $result->fetch_assoc()) {
                    
                    echo '<div class="products-container">';
                    echo '<a href="display.php?id='.$row['id'].'">';
                    echo '<img src="images/'.$row['image'].'" alt="'.$row['nom'].'">';
                    echo '</a>';
                    echo '<h4>'.$row['nom'].'</h4>';
                    echo '<p>'.$row['description'].'</p>';
                    echo '<p class="price">Prix: '.$row['prix'].'€</p>';
                    echo '<a href="display.php?id='.$row['id'].'">';
                    echo '<button><span class="material-symbols-outlined">add_shopping_cart</span>Ajouter</button>';
                    echo '</a>';
                    echo '</div>';
                    
                }
            } else {
                echo "Aucun produit trouvé.";
            }?>
           
        </section>