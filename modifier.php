<?php
include 'header.php';
include 'sidebar.php';
include 'footer.php';
include 'php/config.php';
session_start();

// Vérifier si l'utilisateur est connecté
if (!isset($_SESSION['user_id'])) {
    header("Location: login.php");
    exit;
}

$user_id = $_SESSION['user_id'];
$errors = [];
$success = "";

// Récupérer les informations actuelles de l'utilisateur
$stmt = $conn->prepare("SELECT nom, email FROM utilisateurs WHERE id = ?");
$stmt->bind_param("i", $user_id);
$stmt->execute();
$result = $stmt->get_result();
$user = $result->fetch_assoc();
$stmt->close();

// Si le formulaire est soumis
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $password = $_POST['mot_de_passe'];
    $confirm_password = $_POST['confirmer_mot_de_passe'];

    // Vérifications
    if (empty($password) || empty($confirm_password)) {
        $errors[] = "Les deux champs de mot de passe sont obligatoires.";
    } elseif ($password !== $confirm_password) {
        $errors[] = "Les mots de passe ne correspondent pas.";
    } elseif (strlen($password) < 6) {
        $errors[] = "Le mot de passe doit contenir au moins 6 caractères.";
    }

    if (empty($errors)) {
        // Hasher le nouveau mot de passe
        $hashed_password = password_hash($password, PASSWORD_DEFAULT);
        
        // Mettre à jour le mot de passe dans la base de données
        $stmt = $conn->prepare("UPDATE utilisateurs SET mot_de_passe = ? WHERE id = ?");
        $stmt->bind_param("si", $hashed_password, $user_id);
        
        if ($stmt->execute()) {
            $success = "Mot de passe mis à jour avec succès.";
        } else {
            $errors[] = "Erreur lors de la mise à jour.";
        }
        $stmt->close();
    }
}

$conn->close();
?>

<main>
    <div class="profile-update">
        <h2>Modifier votre mot de passe</h2>

        

        <form method="POST">
            <label>Nom :</label>
            <input type="text" value="<?= htmlspecialchars($user['nom']); ?>" readonly>

            <label>Email :</label>
            <input type="email" value="<?= htmlspecialchars($user['email']); ?>" readonly>

            <label>Nouveau mot de passe :</label>
            <input type="password" name="mot_de_passe" required>

            <label>Confirmer le nouveau mot de passe :</label>
            <input type="password" name="confirmer_mot_de_passe" required>
            <?php if (!empty($errors)) : ?>
            <div class="errors" style="color: red; font-size: 16px;">
                <?php foreach ($errors as $error) echo "<p>$error</p>"; ?>
            </div>
        <?php endif; ?>

        <?php if ($success) : ?>
            <div class="success" style="color: green; font-size: 16px;">
                <p><?= $success; ?></p>
            </div>
        <?php endif; ?>

            <button type="submit">Mettre à jour</button>
        </form>
    </div>
</main>
