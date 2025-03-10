<?php
include 'header.php';
include 'sidebar.php';
include 'footer.php';
include 'php/config.php';
session_start();

// Vérifier si l'utilisateur est connecté
if (!isset($_SESSION['user_id'])) {
    header("Location: account.php");
    exit;
}

$user_id = $_SESSION['user_id'];


// Récupérer les informations actuelles de l'utilisateur
$stmt = $conn->prepare("SELECT  email FROM utilisateurs WHERE id = ?");
$stmt->bind_param("i", $user_id);
$stmt->execute();
$result = $stmt->get_result();
$user = $result->fetch_assoc();
$stmt->close();

// Si le formulaire est soumis
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $message = $_POST['message'];
    $user_id = $_SESSION['user_id'];
    $errors = [];
    $success = "";
    // Vérifications
    if (empty($message)) {
        $errors[] = "Le message est obligatoire.";
    } elseif (strlen($message) < 10) {
        $errors[] = "Le message doit contenir au moins 10 caractères.";
    }


    

    if (empty($errors)) {
       
        
        // Mettre à jour le mot de passe dans la base de données
        $stmt = $conn->prepare("INSERT INTO messages (user_id, message) VALUES (?, ?)");
        $stmt->bind_param("is", $user_id, $message);
        
        if ($stmt->execute()) {
            $success = "Votre message a été envoyer avec succès.";
        } else {
            $errors[] = "Erreur lors de l'envoi de message.";
        }
        $stmt->close();
        
    }
}

$conn->close();
?>

<main>
    <div class="profile-update">
        <h2>Contacter Support </h2>

        

        <form method="POST">
           
            <label>Email :</label>
            <input type="email" value="<?= htmlspecialchars($user['email']); ?>" readonly>
            <label>Message :</label>
            <textarea name="message"  placeholder="Ecrire un message ..."></textarea>
            
            <?php if (!empty($errors)) : ?>
            <div class="errors" style="color: red; font-size: 18px;">
                <?php foreach ($errors as $error) echo "<p>$error</p>"; ?>
            </div>
        <?php endif; ?>

        <?php if ($success) : ?>
            <div class="success" style="color: green; font-size: 18px;">
                <p><?= $success; ?></p>
            </div>
        <?php endif; ?>

            <button type="submit"><span class="material-symbols-outlined"> send </span></button>
        </form>
    </div>
</main>
