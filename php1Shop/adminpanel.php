    <?php
    if (isset($_SESSION['user'])) {
        $user = $_SESSION['user'];
        if ($user['role_id'] == 1) {
            require_once 'logic/connection.php';

            echo "<div class='container'>
                    <div class='row'>
                        <div class='col-12'>
                            <h3 class='mb-5 mt-5 text-center'>Welcome " . $user['name'] . "</h3>
                        </div>
                    </div>
                </div>";

            include 'logic/adminmenu.php';



            echo '<div class="container">
            <div class="row">
            <div class="col-12" id="adminIspis"></div>
            </div></div> </div>';
        }
    }
    ?>






    