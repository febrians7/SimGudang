<!DOCTYPE html>

<html>

<head>
    <title>LOGIN MULTIUSER PHP</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="css/style.css">

</head>

<body>

    <?php
    if (isset($_GET['pesan'])) {
        if ($_GET['pesan'] == "gagal") {
            echo "<div class='alert'>Username dan Password Salah !</div>";
        }
    }
    ?>

    <div class="login-container">
        <form action="login.php" method="post">
            <h1>Sistem Informasi Gudang V.2023</h1>
            <h5>Login Aplikasi</h5>
            <div class="form-group row">
                <label class="col-4 col-form-label">Username</label>
                <div class="col-8">
                    <input type="text" name="username" class="form-control" placeholder="Username" required="required">
                </div>
            </div>

            <div class="form-group row">
                <label class="col-4 col-form-label">Password</label>
                <div class="col-8">
                    <input type="password" name="password" class="form-control" placeholder="Password" required="required">
                </div>
            </div>

            <div class="form-group row">
                <div class="col-11">
                    <input type="submit" class="btn btn-primary" value="Login">
                </div>
            </div>

        </form>

    </div>


</body>

</html>