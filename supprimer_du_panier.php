<?php
session_start();
include 'php/config.php';

if (!isset($_SESSION['user_id'])) {
    header("Location: account.php");
    exit();
}

if ($_SERVER["REQUEST_METHOD"] == "POST" && isset($_POST['product_id'])) {
    $user_id = $_SESSION['user_id'];
    $product_id = $_POST['product_id'];

    $stmt = $conn->prepare("DELETE FROM panier WHERE user_id = ? AND product_id = ?");
    $stmt->bind_param("ii", $user_id, $product_id);

    if ($stmt->execute()) {
        header("Location: painer.php"); // Rafraîchir la page après suppression
        exit();
    } else {
        echo "Erreur lors de la suppression du produit.";
    }
}
?>
