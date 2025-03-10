<?php
session_start();
include 'php/config.php';
$user_id = $_SESSION['user_id'];
$sql = "SELECT * FROM utilisateurs WHERE id = $user_id";
$result = $conn->query($sql);
if ($result->num_rows > 0) {
    $user = $result->fetch_assoc();
}else{
    header("Location: erreur.php");
}



?>
<div class="user_info">
<h1>Mon Compte</h1>

    <h3>Informations Personnelles</h3>
    <table>
        <tr>
            <th>Nom : </th>
            <td><?php echo $user['nom']; ?></td>
        </tr>
        <tr>
            <th>Email : </th>
            <td><?php echo $user['email']; ?></td>
        </tr>
        <tr>
            <th>Password : </th>
            <td>* * * * * * </td>
        </tr>
    </table>
    <a href="modifier.php"><button>Modifier <span class="material-symbols-outlined"> manage_accounts </span></button></a>
    <a href="logout.php" class=" logout"><button >Déconection<span class="material-symbols-outlined"> logout </span></button></a>
    
    </div>
    