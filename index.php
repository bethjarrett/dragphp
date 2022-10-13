<?php
include( 'includes/database.php' );
include( 'includes/header.php' );
?>

<section id="contestant" class="container">
<h2 class="pt-2">By Contestant</h2>
<hr>
    <div class="row">
        <!--SEASON 1-->
        <div class="col text-center">
            <h3>Season 1</h3>
            <img src="img/s1.jpg" class="img-fluid season-img pb-4">
            <table class="table text-start table-borderless align-middle text-center">

 <?php
    $query = 'SELECT *
    FROM contestant
    WHERE contestant.contestant_season = 1
    ORDER BY contestant.contestant_id';
    include( 'includes/sqlquery.php' );

        while ($record = mysqli_fetch_assoc($result))
        {
            echo '<tr>
                <td><a href="details.php?id=' . $record['contestant_id'] . '" class="btn btn-secondary">' . $record['contestant_name'] . '</a></td>
            </tr>';
        }
?>
            </table>
        </div>
        <!--SEASON 2-->
        <div class="col text-center">
            <h3>Season 2</h3>
            <img src="img/s2.jpg" class="img-fluid season-img pb-4">
            <table class="table text-start table-borderless align-middle text-center ">

 <?php
    $query = 'SELECT *
    FROM contestant
    WHERE contestant.contestant_season = 2
    ORDER BY contestant.contestant_id';
    include( 'includes/sqlquery.php' );

        while ($record = mysqli_fetch_assoc($result))
            echo '<tr>
            <td><a href="details.php?id=' . $record['contestant_id'] . '" class="btn btn-secondary">' . $record['contestant_name'] . '</a></td>
        </tr>';
?>

            </table>
        </div>
</section>

<?php
include( 'includes/footer.php' );
?>