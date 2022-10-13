<?php
include( 'includes/database.php' );
include( 'includes/header.php' );
?>

<div class="container">

<?php
    $query = 'SELECT episodechallenge.episode, episodechallenge.season, maxichallenge.maxi_challenge
    FROM episodechallenge
    JOIN maxichallenge
    ON episodechallenge.maxi = maxichallenge.maxi_id
    WHERE episodechallenge.episode = '.$_GET['id'].'
    LIMIT 1';
    include( 'includes/sqlquery.php' );
        while ($record = mysqli_fetch_assoc($result))
        {
            echo '
            <div class="row pt-4 text-center">
                <div class="col">Season <h3>' 
                . $record['season'] . '</h3>
                </div><div class="col"> Episode <h3>' 
                . $record['episode'] . '</h3>
                </div><div class="col"> Maxi Challenge <h3>' 
                . $record['maxi_challenge'] .  '</h3>
                </div>
                </div>';
        }
?>

<?php
    $query = 'SELECT episodechallenge.episode, minichallenge.mini_challenge
    FROM episodechallenge
    JOIN minichallenge
    ON episodechallenge.mini = minichallenge.mini_id
    WHERE episodechallenge.episode = '.$_GET['id'].'';
    include( 'includes/sqlquery.php' );
        if ($record = mysqli_fetch_assoc($result))
        {
            echo '<div class="row pt-4 text-center">
                <div class="col">Mini Challenge:<h3>' . $record['mini_challenge'] . '</h3></div>';
        }
?>

<?php
    $query = 'SELECT result.mini_result, contestant.contestant_name, contestant.contestant_id
    FROM result
    JOIN contestant 
    ON result.contestant_id = contestant.contestant_id
    WHERE result.episode_id = '.$_GET['id'].' AND result.mini_result IS NOT NULL';
    include( 'includes/sqlquery.php' );
        while ($record = mysqli_fetch_assoc($result))
        {
            echo '<div class="col">Mini Challenge Winner:
            <h3><a href="details.php?id=' . $record['contestant_id'] . '">' . $record['contestant_name'] . '</a></h3></div>';
        }
?>

        <hr>
        <div class="row pt-2 text-center">

<?php
    $query = 'SELECT result.mini_result, contestant.contestant_name, contestant.contestant_id
    FROM contestant
    JOIN result
    ON result.contestant_id = contestant.contestant_id
    WHERE result.episode_id = '.$_GET['id'].' AND result.maxi_result = 4 OR result.episode_id = '.$_GET['id'].' AND result.maxi_result = 3';
    include( 'includes/sqlquery.php' );
        while ($record = mysqli_fetch_assoc($result))
        {
            echo '<div class="col"><h4>Top</h4>
                <div class="pb-2"><img class="img-fluid img-thumbnail ep-profile-img" src="img/' . $record['contestant_id'] . '.jpg"></div>
                <a href="details.php?id=' . $record['contestant_id'] . '" class="btn btn-secondary">' . $record['contestant_name'] . '</a>
            </div>';
        }
?>

<?php
    $query = 'SELECT result.mini_result, contestant.contestant_name, contestant.contestant_id
    FROM contestant
    JOIN result
    ON result.contestant_id = contestant.contestant_id
    WHERE result.episode_id = '.$_GET['id'].' AND result.maxi_result = 5 ';
    include( 'includes/sqlquery.php' );
        while ($record = mysqli_fetch_assoc($result))
        {
            echo '<div class="col"><h4>Winner</h4>
                <div class="pb-2"><img class="img-fluid img-thumbnail ep-profile-img" src="img/' . $record['contestant_id'] . '.jpg"></div>
                <a href="details.php?id=' . $record['contestant_id'] . '"  class="btn btn-primary text-white">' . $record['contestant_name'] . '</a>
            </div>';
        }
?>

        <div class="row pt-4 text-center">

<?php
    $query = 'SELECT result.mini_result, contestant.contestant_name, contestant.contestant_id
    FROM contestant
    JOIN result
    ON result.contestant_id = contestant.contestant_id
    WHERE result.episode_id = '.$_GET['id'].' AND result.maxi_result = 2 OR result.episode_id = '.$_GET['id'].' AND result.maxi_result = 1';
    include( 'includes/sqlquery.php' );
        while ($record = mysqli_fetch_assoc($result))
        {
            echo '<div class="col"><h4>Bottom</h4>
                <div class="pb-2"><img class="img-fluid img-thumbnail ep-profile-img" src="img/' . $record['contestant_id'] . '.jpg"></div>
                <a href="details.php?id=' . $record['contestant_id'] . '" class="btn btn-secondary">' . $record['contestant_name'] . '</a>
            </div>';
        }
?>

<?php
    $query = 'SELECT result.mini_result, contestant.contestant_name, contestant.contestant_id
    FROM contestant
    JOIN result
    ON result.contestant_id = contestant.contestant_id
    WHERE result.episode_id = '.$_GET['id'].' AND result.maxi_result = 0';
    include( 'includes/sqlquery.php' );
        while ($record = mysqli_fetch_assoc($result))
        {
            echo '<div class="col"><h4>Eliminated</h4>
                <div class="pb-2"><img class="img-fluid img-thumbnail ep-profile-img" src="img/' . $record['contestant_id'] . '.jpg"></div>
                <a href="details.php?id=' . $record['contestant_id'] . '" class="btn btn-dark text-white">' . $record['contestant_name'] . '</a>
            </div>';
        }
?>
</div>
</div>
</div>
</div>
<?php
include( 'includes/footer.php' );
?>