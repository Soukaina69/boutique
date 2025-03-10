<?php
include 'config.php';

$sql = "SELECT * FROM produits "; // Afficher seulement 4 produits populaires
$result = $conn->query($sql);
$conn->close();
?>