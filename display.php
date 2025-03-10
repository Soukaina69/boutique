<?php 
session_start();
include 'header.php'; 
include 'sidebar.php'; 
include 'php/config.php'; 


// Vérifier si l'utilisateur est connecté
if (!isset($_SESSION['user_id'])) {
    header("Location: account.php");
    exit();
}

$user_id = $_SESSION['user_id'];
$succes=false;
// Vérifier si le bouton "Ajouter au panier" a été cliqué
if (isset($_POST['add_to_cart'])) {
    $product_id = $_POST['product_id'];
    $quantity = $_POST['quantity'];
    // Vérifier si le produit est déjà dans le panier
    $check_sql = "SELECT * FROM panier WHERE user_id = ? AND product_id = ?";
    $check_stmt = $conn->prepare($check_sql);
    $check_stmt->bind_param("ii", $user_id, $product_id);
    $check_stmt->execute();
    $check_result = $check_stmt->get_result();

    if ($check_result->num_rows > 0) {
        // Si le produit existe déjà, mettre à jour la quantité
        $update_sql = "UPDATE panier SET quantity = quantity + ? WHERE user_id = ? AND product_id = ?";
        $update_stmt = $conn->prepare($update_sql);
        $update_stmt->bind_param("iii", $quantity, $user_id, $product_id);
        $update_stmt->execute();
    } else {
        // Sinon, insérer un nouvel enregistrement
        $insert_sql = "INSERT INTO panier (user_id, product_id, quantity) VALUES (?, ?, ?)";
        $insert_stmt = $conn->prepare($insert_sql);
        $insert_stmt->bind_param("iii", $user_id, $product_id, $quantity);
        $insert_stmt->execute();
    }
    $succes=true;
    

}

// Récupérer les détails du produit
$product_id = $_GET['id'];
$sql = "SELECT * FROM produits WHERE id = ?";
$stmt = $conn->prepare($sql);
$stmt->bind_param("i", $product_id);
$stmt->execute();
$result = $stmt->get_result();
$product = $result->fetch_assoc();
?>

<main>
    <div class="product-details">
        <img src="images/<?php echo htmlspecialchars($product['image']); ?>" alt="<?php echo htmlspecialchars($product['nom']); ?>">
        <div class="info">
            <h1><?php echo htmlspecialchars($product['nom']); ?></h1>
            <p><?php echo htmlspecialchars($product['description']); ?></p>
            <p class="price">Prix: <?php echo number_format($product['prix'], 2); ?>€</p>
           <?php if(!$succes): ?>
            <form method="POST">
                <input type="number" name="quantity" value="1" min="1" required>
                <input type="hidden" name="product_id" value="<?php echo $product['id']; ?>">
                <button type="submit" name="add_to_cart">
                    <span class="material-symbols-outlined">add_shopping_cart</span> Ajouter au panier
                </button>
                
            </form>
            <?php endif; ?>
            <?php if($succes): ?>
                    <p class="success" style="color: green; font-size: 18px;">Produit ajouté au panier avec succés !</p>
                    <a href="index.php"><button class="btn-retour"> Retourner
                    <span class="material-symbols-outlined">undo</span>
                </button></a>
                <?php endif; ?>
        </div>
    </div>
</main>

<?php include 'footer.php'; ?>
