<?php
    session_start();
    if (isset($_SESSION['user'])) {
        header('Location: SE.php');
        exit();
    }

    require_once('database.php');


    $error = '';
    $diachi= '';
    $ten = '';
    $email = '';
    $user = '';
    $pass = '';
    $pass_confirm = '';
    $sdt = '';

    if (isset($_POST['ten']) && isset($_POST['diachi']) && isset($_POST['email'])
    && isset($_POST['user']) && isset($_POST['pass']) && isset($_POST['pass-confirm']))
    {
        $email = $_POST['email'];
        $user = $_POST['user'];
        $pass = $_POST['pass'];
        $pass_confirm = $_POST['pass-confirm'];
        $sdt = $_POST['sdt'];
        $diachi= $_POST['diachi'];
        $ten = $_POST['name'];


        if (empty($ten)) {
            $error = 'Please enter your name';
        }
        else if (empty($diachi)) {
            $error = 'Please enter your address';
        }
        else if (empty($email)) {
            $error = 'Please enter your email';
        }
        else if (filter_var($email, FILTER_VALIDATE_EMAIL) == false) {
            $error = 'This is not a valid email address';
        }
        else if (empty($user)) {
            $error = 'Please enter your username';
        }
        else if (empty($pass)) {
            $error = 'Please enter your password';
        }
        else if (strlen($pass) < 6) {
            $error = 'Password must have at least 6 characters';
        }
        else if ($pass != $pass_confirm) {
            $error = 'Password does not match';
        }
        else {

            $rs = signup($user,$pass,$email,$diachi,$ten,$sdt);
            if ($rs == true){
                die('Đăng ký thành công!');
            }
            else{
                $error = $rs;
          }
      }
    }
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="DangKy.css">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.4/font/bootstrap-icons.css">

    <!-- GOOGLE API -->
    <script src="https://apis.google.com/js/platform.js" async defer></script>
    <meta name="google-signin-client_id" content="YOUR_CLIENT_ID.apps.googleusercontent.com">

</head>
<body>
    <div class="container-fluid">
        <div class="row">
            <div class="navbar-wrapper header">
                <nav class="container-navbar">
                    <a class="navbar-text home" href="SE.php">Home</a>
                    <div class="navbar-text sign-up">Đăng Ký</div>
                    <a href="#" class="navbar-text help">Bạn cần giúp đỡ?</a>
                </nav>
            </div>
            <div class="navbar-wrapper content" style="display: flex;justify-content: center;align-items: center;">
                <div class="signup-form" style="border-radius: 5px;">
                    <h2>Đăng ký</h2>
                    <form novalidate method="post" action="">
                      <div class="form-group">
                        <input name="name" type="text" class="form-control" placeholder="Họ tên" required="required">
                      </div>
                      <div class="form-group">
                        <input name="sdt" type="text" class="form-control" placeholder="Số điện thoại" required="required">
                      </div>
                      <div class="form-group">
                        <input name="diachi" type="text" class="form-control" placeholder="Địa chỉ" required="required">
                      </div>
                      <div class="form-group">
                        <input name="user" type="text" class="form-control" placeholder="Tên đăng nhập" required="required">
                      </div>
                      <div class="form-group">
                        <input name="email" type="email" class="form-control" placeholder="Địa chỉ email" required="required">
                      </div>
                      <div class="form-group">
                        <input name="pass" type="password" class="form-control" placeholder="Mật khẩu" required="required">
                      </div>
                      <div class="form-group">
                        <input name="pass-confirm" type="password" class="form-control" placeholder="Xác nhận mật khẩu" required="required">
                      </div>
                        <?php if ($error != ''): ?>
                            <div style="color:red;"><?php echo $error; ?></div>
                        <?php endif; ?>
                      <div class="form-group">
                        <button type="submit" class="btn btn-primary btn-block btn-lg">Đăng ký</button>
                      </div>
                      <hr>
                      <div class="other-way">
                            <button class="login-facebook">Facebook</button>
                            <div>Hoặc</div>
                            <button class="login-google">Google</button>
                    </div>
                    <br>
                    <div class="accounted">
                        <div>Bạn đã có tài khoản?</div>
                        <a href="DangNhap.php">Đăng nhập</a>
                    </div>
                    </form>
                  </div>
                  
            </div>
            <div class="navbar-wrapper more-infomation">

            </div>
        </div>
    </div>
</body>
</html>