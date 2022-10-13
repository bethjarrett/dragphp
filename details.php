<?php
include( 'includes/database.php' );
include( 'includes/header.php' );
?>
<section id="contestant" class="container">

<!--CONTESTANT CARD-->
    <div class="card m-2 mx-auto" style="max-width: 400px;">
        <div class="row g-0">
            <div class="col-6">
<?php
$query = 'SELECT *
    FROM contestant
    JOIN contestantxlocation
    ON contestant.contestant_id = contestantxlocation.contestant_id
    JOIN location
    ON contestantxlocation.location_id = location.location_id
    WHERE contestant.contestant_id = '.$_GET['id'].'
    LIMIT 1';
    include( 'includes/sqlquery.php' );
        while ($record = mysqli_fetch_assoc($result))
        {
            echo '<img class="img-fluid rounded " src="img/' . $record['contestant_id'] . '.jpg"></div>
            <div class="col-6 pt-2 ps-2"><h3 class="card-title">' . $record['contestant_name'] . '</h3>
            <dl class="row row-cols-1">
                <dt class ="col">Age:</dt><dd class="col">' . $record['contestant_age'] . '</dd>
                <dt class ="col">First Language:</dt><dd class="col">' . $record['location_lang'] . '</dd>
                <dt class ="col">Hometown:</dt><dd class="col">' . $record['location_city'] . ', ' . $record['location_prov'] . '</dd>
                <dt class ="col">Region:</dt><dd class="col">' . $record['location_reg'] . '</dd></dl>';
        }
?>
            </div>
        </div>
    </div>
<div class="pt-2"></div>
<!--MINI CHALLENGE-->
<?php
    $query = 'SELECT episodechallenge.episode, minichallenge.mini_challenge, result.mini_result, contestant.contestant_name, result.episode_id
    FROM contestant
    JOIN result 
    ON result.contestant_id = contestant.contestant_id
    JOIN episodechallenge
    ON result.episode_id = episodechallenge.episode
    JOIN minichallenge 
    ON episodechallenge.mini = minichallenge.mini_id
    WHERE contestant.contestant_id = '.$_GET['id'].' AND result.mini_result = 1
    ORDER BY result.episode_id';
    include( 'includes/sqlquery.php' );
        if ($record = mysqli_fetch_assoc($result))
        {
                echo '
                <div class="row pt-4">
                <div class="col text-center">
                    <h3>Mini Challenge Wins</h3>
                    <table class="table table-secondary table-hover">
                        <thead>
                            <tr>
                                <th>Episode</th>
                                <th>Mini Challenge</th>
                            </tr>
                        </thead>
                        <tbody>
                        <tr>
                            <td><a href="episode.php?id=' . $record['episode_id'] . '">' . $record['episode_id'] . '</a></td>
                            <td>' . $record['mini_challenge'] . '</td></tr>
                            </tbody>
                            </table>
                        </div>';
        }
?>

<!--MAXI CHALLENGE-->
<!--NOTE: results do not display properly, 'if' statement not working correctly-->
        <div class="col text-center">
            <h3>Maxi Challenge Results</h3>
                <table class="table  table-secondary table-hover">
                    <thead>
                        <tr>
                            <th>Episode</th>
                            <th>Maxi Challenge</th>
                            <th>Result</th>
                        </tr>
                    </thead>
                    <tbody>
<?php
    $query = 'SELECT episodechallenge.episode, maxichallenge.maxi_challenge, result.maxi_result, contestant.contestant_name, result.episode_id
    FROM contestant
    JOIN result 
    ON result.contestant_id = contestant.contestant_id
    JOIN episodechallenge
    ON result.episode_id = episodechallenge.episode
    JOIN maxichallenge 
    ON episodechallenge.maxi = maxichallenge.maxi_id
    WHERE contestant.contestant_id = '.$_GET['id'].'
    ORDER BY result.episode_id';
    include( 'includes/sqlquery.php' );
        while ($record = mysqli_fetch_assoc($result))
        {
            echo '<tr>
                <td><a href="episode.php?id=' . $record['episode_id'] . '">' . $record['episode_id'] . '</a></td>
                <td>' . $record['maxi_challenge'] . '</td>
                <td>' .  $record['maxi_result'] . '</td>

            </tr>';
        }
?>
            </tbody>
            </table>
        </div>
    </div>
</section>

<?php
include( 'includes/footer.php' );
?>