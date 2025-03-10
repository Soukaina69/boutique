<?php include 'header.php'; ?>
<?php include 'sidebar.php'; ?>
<?php include 'footer.php'; ?>
<main>
<h2>Nos Catégories</h2>
    
        <div class="category-list">
            <a href="categories.php?categorie=ordinateurs">Ordinateurs</a>
            <a href="categories.php?categorie=Téléphones">Téléphones</a>
            <a href="categories.php?categorie=tablettes">Tablettes</a>
            <a href="categories.php?categorie=televiseurs">Téléviseurs</a>
            <a href="categories.php?categorie=accessoires">Accessoires</a>
        </div>
        <section class="featured-products">
           
        <?php
            include 'php/config.php';

            $categorie = isset($_GET['categorie']) ? $_GET['categorie'] : '';

            if ($categorie) {
                $sql = "SELECT * FROM produits WHERE categorie='$categorie'";
            } else {
                $sql = "SELECT * FROM produits";
            }

            $result = $conn->query($sql);

            if ($result->num_rows > 0) {
                while($row = $result->fetch_assoc()) {
                   
                   echo '<div class="products-container">';
                   echo '<a href="display.php?id='.$row['id'].'">';
                   echo '<img src="images/'.$row['image'].'" alt="'.$row['nom'].'">';
                   echo '</a>';
                   echo '<h4>'.$row['nom'].'</h4>';
                   echo '<p>'.$row['description'].'</p>';
                   echo '<p class="price">Prix: '.$row['prix'].'€</p>';
                   echo '<button><span class="material-symbols-outlined">add_shopping_cart</span>Ajouter</button>';
                   echo '</div>';
                   
               }
           } else {
               echo "Aucun produit trouvé.";
           }?>
          
       </section>

</main>