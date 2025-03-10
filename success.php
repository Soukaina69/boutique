<?php

include "header.php";
include "sidebar.php";
include "php/config.php";
?>
<main>
    <?php
    session_start();

// Vérification si l'utilisateur est connecté
if (!isset($_SESSION['user_id'])) {
    $message = "Vous n'êtes pas connecté. Veuillez vous connecter ou vous inscrire.";
} else {
    $user_id = $_SESSION['user_id'];
    $sql = "SELECT * FROM utilisateurs WHERE id = $user_id";
    $result = $conn->query($sql);

    if ($result->num_rows > 0) {
        $user = $result->fetch_assoc();
        $message = "Félicitations " . htmlspecialchars($user['nom']) . "! Vous êtes maintenant enregistré.";
    } else {
        $message = "Erreur : Utilisateur non trouvé.";
    }
}
?>
    <div class="succes">
    <h1> Success</h1>
        <p><?php echo $message; ?></p>
        <?php if (isset($_SESSION['user_id'])): ?>
            <a href="account.php"><button>Voir mon compte</button></a>
        <?php else: ?>
            <a href="login.php"><button>Se connecter</button></a>
            <a href="register.php"><button>S'inscrire</button></a>
        <?php endif; ?>
        </div>
    
</main>