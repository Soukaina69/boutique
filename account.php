

<?php
include 'header.php';
include 'sidebar.php';
include 'footer.php';
?>
<main>
    <?php
    session_start();
    if (isset($_SESSION['user_id'])) {
       include 'user_info.php';
    } else {
        include 'login.php';
    }
    ?>
</main>
    