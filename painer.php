<?php 
session_start(); // Démarrer la session
include 'header.php'; 
include 'sidebar.php'; 
include 'php/config.php'; // Connexion à la base de données

// Vérifier si l'utilisateur est connecté
if (!isset($_SESSION['user_id'])) {
    // Rediriger vers la page de connexion si non connecté
    header("Location: account.php");
    exit();
}

$user_id = $_SESSION['user_id'];

// Requête pour récupérer les produits du panier
$sql = "SELECT p.nom, p.prix, panier.quantity ,p.id
        FROM panier 
        JOIN produits p ON panier.product_id = p.id 
        WHERE panier.user_id = ?";

$stmt = $conn->prepare($sql);
$stmt->bind_param("i", $user_id);
$stmt->execute();
$result = $stmt->get_result();
?>

<main>
    <div class="user_info">
        <h2>Mon Panier</h2>
        <table>
            <tr>
                <th>Produit</th>
                <th>Prix</th>
                <th>Quantité</th>
                <th>Total</th>
                
                <th>Action</th>
            </tr>
            <?php 
            $total_general = 0;
            while ($row = $result->fetch_assoc()): 
                $total = $row['prix'] * $row['quantity'];
                $total_general += $total;
            ?>
            <tr>
                <td><?php echo htmlspecialchars($row['nom']); ?></td>
                <td><?php echo number_format($row['prix'], 2); ?> €</td>
                <td><?php echo $row['quantity']; ?></td>
                <td><?php echo number_format($total, 2); ?> €</td>
                

                <td>
                    <form method="POST" action="supprimer_du_panier.php">
                        <input type="hidden" name="product_id" value="<?php echo htmlspecialchars($row['id']); ?>">
                        <button type="submit" class="delete-btn">Supprimer 🗑️</button>
                    </form>
                </td>
            </tr>
            <?php endwhile; ?>
            <tr>
                <th colspan="3">Total général</th>
                <th ><?php echo number_format($total_general, 2); ?> €</th>
                <th></th>
            </tr>
        </table>
    </div>
</main>

<?php include 'footer.php'; ?>
