<?php
//execute query
        $result = mysqli_query($connect, $query);
        // display error message if connex fails
        if (!$result)
        {
            echo 'Error Message: ' . mysqli_error($connect) . '<br>';
            exit;
        }
?>