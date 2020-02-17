<?php
session_start();
$koneksi = new mysqli("localhost", "root", "", "kasir");
?>
<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8">
    <link rel="icon" type="image/png" sizes="16x16" href="dist/img/user.png">
    <title>Halaman Login</title>
    <!-- Tell the browser to be responsive to screen width -->
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- Font Awesome -->
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.2/css/all.css" integrity="sha384-oS3vJWv+0UjzBfQzYUhtDYW+Pj2yciDJxpsK1OYPAYjqT085Qq/1cq5FLXAZQ7Ay" crossorigin="anonymous">
    <!-- Ionicons -->
    <link rel="stylesheet" href="https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css">
    <!-- icheck bootstrap -->
    <link rel="stylesheet" href="plugins/icheck-bootstrap/icheck-bootstrap.min.css">
    <!-- Theme style -->
    <link rel="stylesheet" href="dist/css/adminlte.min.css">
    <!-- Google Font: Source Sans Pro -->
    <link href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700" rel="stylesheet">
</head>

<body class="hold-transition login-page">
    <div class="login-box">
        <div class="login-logo">
            <a href="login.php"><b>Admin</b> Kasir</a>
        </div>
        <!-- /.login-logo -->
        <div class="card">
            <div class="card-body login-card-body">
                <p class="login-box-msg">Masukkan username Dan Password Yang Sesuai</p>

                <form method="post">
                    <div class="input-group mb-3">
                        <input type="name" class="form-control" placeholder="USERNAME" name="USERNAME">
                        <div class="input-group-append input-group-text">
                            <span class="fas fa-envelope"></span>
                        </div>
                    </div>
                    <div class="input-group mb-3">
                        <input type="password" class="form-control" placeholder="PASWORD" name="PASWORD">
                        <div class="input-group-append input-group-text">
                            <span class="fas fa-lock"></span>
                        </div>
                    </div>
                    <div class="row">
                        <!-- /.col -->
                        <div class="col-12">
                            <button type="submit" class="btn btn-primary btn-block btn-flat" name="login">Sign In</button>
                        </div>
                        <!-- /.col -->
                    </div>
                </form>
                <?php
                if (isset($_POST['login'])) {
                    $ambil = $koneksi->query("SELECT * FROM admin WHERE USERNAME='$_POST[USERNAME]' AND PASWORD='$_POST[PASWORD]'");
                    $yangcocok = $ambil->num_rows;

                    if ($yangcocok == 1) {

                        $_SESSION['admin'] = $ambil->fetch_assoc();
                        echo "<br>";
                        echo "<div class='alert alert-info'>Login Sukses</div>";
                        echo "<meta http-equiv='refresh' content='1;url=dashboard.php'>";
                    } else {
                        echo "<br>";
                        echo "<div class='alert alert-danger'>Login Gagal</div>";
                        echo "<meta http-equiv='refresh' content='1;url=login.php'>";
                    }
                }
                ?>

            </div>
            <!-- /.login-card-body -->
        </div>
    </div>
    <!-- /.login-box -->

    <!-- jQuery -->
    <script src="plugins/jquery/jquery.min.js"></script>
    <!-- Bootstrap 4 -->
    <script src="plugins/bootstrap/js/bootstrap.bundle.min.js"></script>

</body>

</html>