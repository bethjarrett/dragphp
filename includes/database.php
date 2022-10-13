<?php

$connect = mysqli_connect(
    "localhost",
    "root",
    "",
    "dragrace"
);

if (!$connect) 
{
    echo 'Error Code: ' . mysqli_connect_errno() . '<br>';
    echo 'Error Message: ' . mysqli_connect_error() . '<br>';
    exit;
}

mysqli_set_charset( $connect, 'UTF8' );