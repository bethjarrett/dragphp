<?php
include( 'includes/database.php' );
include( 'includes/header.php' );
?>

<section id="contestant" class="container">
<h2 class="pt-2">By Episode</h2>
<hr>
    <!--SEASON 1-->
    <div class="row">
        <div class="col text-center">
            <h3>Season 1</h3>
            <img src="img/s1.jpg" class="img-fluid season-img pb-4">
            <table class="table text-start table-borderless align-middle">

 <?php
    $query = 'SELECT episodechallenge.episode, maxichallenge.maxi_challenge
    FROM episodechallenge
    JOIN maxichallenge
    ON episodechallenge.maxi = maxichallenge.maxi_id
    WHERE episodechallenge.season = 1
    ORDER BY episodechallenge.episode';
    include( 'includes/sqlquery.php' );

        while ($record = mysqli_fetch_assoc($result))
        {
            echo '<tr>
                <td class="text-end"><a href="episode.php?id=' . $record['episode'] . '" class="btn btn-secondary">'. $record['episode'] . '</td></a>
                <td>' .  $record['maxi_challenge'] . '</a></td>
            </tr>';
        }
?>
            </table>
        </div>
        <!--SEASON 2-->
        <div class="col text-center">
            <h3>Season 2</h3>
            <img src="img/s2.jpg" class="img-fluid season-img pb-4">
            <table class="table text-start table-borderless align-middle">
<?php
    $query = 'SELECT episodechallenge.episode, maxichallenge.maxi_challenge
    FROM episodechallenge
    JOIN maxichallenge
    ON episodechallenge.maxi = maxichallenge.maxi_id
    WHERE episodechallenge.season = 2
    ORDER BY episodechallenge.episode';
    include( 'includes/sqlquery.php' );

        while ($record = mysqli_fetch_assoc($result))
        {
            echo '<tr>
                <td class="text-end"><a href="episode.php?id=' . $record['episode'] . '" class="btn btn-secondary">'. $record['episode'] . '</td></a>
                <td>' .  $record['maxi_challenge'] . '</a></td>
            </tr>';
        }
?>
            </table>
        </div>
    </div>
</section>

<?php
include( 'includes/footer.php' );
?>