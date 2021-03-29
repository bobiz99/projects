<?php

session_destroy();
include_once 'helper.php';

redirect('index.php', 303);
