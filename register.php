<?php
include 'header.php';
include 'sidebar.php';
include 'footer.php';
include 'php/config.php';
session_start();

$errors = [];

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $nom = trim($_POST['nom']);
    $email = trim($_POST['email']);
    $password = $_POST['mot_de_passe'];

    // Vérification des champs
    if (empty($nom)) {
        $errors[] = "Le nom est obligatoire.";
    }

    if (empty($email) || !filter_var($email, FILTER_VALIDATE_EMAIL)) {
        $errors[] = "Adresse email invalide.";
    }

    if (empty($password) || strlen($password) < 6) {
        $errors[] = "Le mot de passe doit contenir au moins 6 caractères.";
    }

    if (empty($errors)) {
        // Vérifier si l'email existe déjà 
        $stmt = $conn->prepare("SELECT id FROM utilisateurs WHERE email = ?");
        $stmt->bind_param("s", $email);
        $stmt->execute();
        $stmt->store_result();

        if ($stmt->num_rows > 0) {
            $errors[] = "Cet email est déjà utilisé.";
        } else {
            // Hachage sécurisé du mot de passe
            $hashed_password = password_hash($password, PASSWORD_DEFAULT);

            // Insérer l'utilisateur en BDD
            $stmt = $conn->prepare("INSERT INTO utilisateurs (nom, email, mot_de_passe) VALUES (?, ?, ?)");
            $stmt->bind_param("sss", $nom, $email, $hashed_password);

            if ($stmt->execute()) {
                $_SESSION['user_id'] = $stmt->insert_id;
                header("Location: success.php");
                exit;
            } else {
                $errors[] = "Erreur lors de la création du compte.";
            }
        }
        $stmt->close();
    }
}

$conn->close();
?>

<main>
  <div class="login">
   

    <span class="register">
      <h2>Créer un compte</h2>
      <form method="POST">
        <input type="text" name="nom" placeholder="Nom" required>
        <input type="email" name="email" placeholder="Email" required>
        <input type="password" name="mot_de_passe" placeholder="Mot de passe" required>
        <?php if (!empty($errors)) : ?>
      <div class='errors' style='color: red; font-size: 18px; margin-top: 1rem;'>
        <?php foreach ($errors as $error) echo "<p>$error</p>"; ?>
      </div>
    <?php endif; ?>
        <button type="submit">Créer un compte</button>
      </form>
    </span>
    <hr>
    <div class="google">
      <button type="button" class="google-button">Se connecter avec Google</button>
    </div>
  </div>
</main>
