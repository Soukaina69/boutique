<?php
session_start();
require 'php/config.php';

$errors = [];

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $email = trim($_POST['email']);
    $password = $_POST['password'];

    if (empty($email)) {
        $errors[] = "L'email est obligatoire.";
    }

    if (empty($password)) {
        $errors[] = "Le mot de passe est obligatoire.";
    }

    if (empty($errors)) {
        // Requête préparée pour éviter les injections SQL
        $stmt = $conn->prepare("SELECT id, email, mot_de_passe FROM utilisateurs WHERE email = ?");
        $stmt->bind_param("s", $email);
        $stmt->execute();
        $result = $stmt->get_result();

        if ($result->num_rows > 0) {
            $user = $result->fetch_assoc();

            // Vérification du mot de passe haché
            if (password_verify($password, $user['mot_de_passe'])) {
                $_SESSION['user_id'] = $user['id'];
                header("Location: index.php");
                exit;
            } else {
                $errors[] = "Mot de passe incorrect.";
            }
        } else {
            $errors[] = "Aucun compte trouvé avec cet email.";
        }
        $stmt->close();
    }
}
$conn->close();
?>

<main>
    <div class="login">
        <span class="login2">
        <?php if (!empty($errors)) : ?>
            <div class="errors" style="color:red; font-size: 18px; margin-top: 1rem;">
                <?php foreach ($errors as $error) echo "<p>$error</p>"; ?>
            </div>
        <?php endif; ?>

        <h2>Se connecter</h2>
        <form method="POST">
            <input type="email" name="email" placeholder="Email" required>
            <input type="password" name="password" placeholder="Mot de passe" required>
            <button type="submit">Se connecter</button>
            <button type="button" class="register-button">
                <a href="register.php" style="text-decoration: none; color:inherit;">Créer un compte</a>
            </button>
        </form>
        </span>

        <hr>
        <div class="google">
            <button type="button" class="google-button">Se connecter avec Google</button>
        </div>
    </div>
</main>
