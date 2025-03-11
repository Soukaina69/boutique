
<?php
session_start();
include 'php/config.php'; 

$count = 0; 

if (isset($_SESSION['user_id'])) { 
    $user_id = $_SESSION['user_id'];

    $stmt = $conn->prepare("SELECT SUM(quantity) as total FROM panier WHERE user_id = ?");
    $stmt->bind_param("i", $user_id);
    $stmt->execute();
    $result = $stmt->get_result();
    
    if ($row = $result->fetch_assoc()) {
        $count = $row['total'] ? $row['total'] : 0; // 
    }
}
?>

<!DOCTYPE html>
<html lang="fr">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Boutique Électronique</title>
    <link href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined" rel="stylesheet" />
    <link rel="stylesheet" href="css/account.css">
    <link rel="stylesheet" href="css/styles.css">
</head>

<body>
    <header>

        <nav>
       
        <a href="#" id="search-icon"><span class="material-symbols-outlined">search</span></a>
        <form id="search-form" action="search.php" method="GET">
            <input type="text" name="query" placeholder="Rechercher un produit..." required>
            <button type="submit"><span class="material-symbols-outlined">search</span></button>
        </form>
   
       

            <ul>
                <li><a href="painer.php" class="count-prod" "><span class="material-symbols-outlined">
                shopping_cart
                        </span><span class="count-num"><?= $count; ?></span></a></li>
                <li><a href="contact.php"><span class="material-symbols-outlined">
                support_agent
                        </span></a></li>
                <li><a href="account.php"><span class="material-symbols-outlined">
                            account_circle
                        </span></a></li>
            </ul>
        </nav>
    </header>
