/*
Create game level tables for model 
- Game
- Lineup
- Fielding
- Pitching

*/

drop table if exists baseball.base.game;
create table baseball.base.game (
    game_id varchar(20)
    ,game_dt date
    ,home_team_id varchar(3)
    ,away_team_id varchar(3)
    ,home_team_score int
    ,away_team_score int
    ,park varchar(10)
    ,time_of_day varchar(10)
    ,start_time timestamp
    ,weather varchar(10)
    ,windspeed int
);

insert into baseball.base.game (
    game_id,game_dt
    ,home_team_id
    ,away_team_id
    ,home_team_score
    ,away_team_score
)
select game_id
    ,cast(max(case when var='date' then value end) as date) as game_dt
    ,max(case when var='hometeam' then value end) as home_team_id
    ,max(case when var='visteam' then value end) as away_team_id
    ,cast(max(case when var='hometeam_score' then value end) as int) as home_team_score
    ,cast(max(case when var='awayteam_score' then value end) as int) as away_team_score
from baseball.base.info
group by 1
;



drop table if exists baseball.base.hitting;
create table baseball.base.hitting (
    game_id varchar(20)
    -- ,game_dt date
    ,h1_home_player_id varchar(10)
    ,h2_home_player_id varchar(10)
    ,h3_home_player_id varchar(10)
    ,h4_home_player_id varchar(10)
    ,h5_home_player_id varchar(10)
    ,h6_home_player_id varchar(10)
    ,h7_home_player_id varchar(10)
    ,h8_home_player_id varchar(10)
    ,h9_home_player_id varchar(10)
    ,h10_home_player_id varchar(10)
    ,h1_away_player_id varchar(10)
    ,h2_away_player_id varchar(10)
    ,h3_away_player_id varchar(10)
    ,h4_away_player_id varchar(10)
    ,h5_away_player_id varchar(10)
    ,h6_away_player_id varchar(10)
    ,h7_away_player_id varchar(10)
    ,h8_away_player_id varchar(10)
    ,h9_away_player_id varchar(10)
    ,h10_away_player_id varchar(10)
);
insert into baseball.base.hitting
select a.game_id
    ,a."1" as h1_home_player_id
    -- ,a.2 as h2_home_player_id
    -- ,a.3 as h3_home_player_id
    -- ,a.4 as h4_home_player_id
    -- ,a.5 as h5_home_player_id
    -- ,a.6 as h6_home_player_id
    -- ,a.7 as h7_home_player_id
    -- ,a.8 as h8_home_player_id
    -- ,a.9 as h9_home_player_id
    -- ,a.10 as h10_home_player_id
    -- ,a.1 as h1_away_player_id
    -- ,a.2 as h2_away_player_id
    -- ,a.3 as h3_away_player_id
    -- ,a.4 as h4_away_player_id
    -- ,a.5 as h5_away_player_id
    -- ,a.6 as h6_away_player_id
    -- ,a.7 as h7_away_player_id
    -- ,a.8 as h8_away_player_id
    -- ,a.9 as h9_away_player_id
    -- ,a.10 as h10_away_player_id
from baseball.base.lineup as a
inner join baseball.base.lineup as b
    on a.game_id=b.game_id
    and b.home_away='away'
where a.home_away='home'
;




drop table if exists baseball.base.fielding
create table baseball.base.fielding (
    game_id varchar(20)
    ,game_dt date
    ,pitcher_home_player_id varchar(10)
    ,pitcher_away_player_id varchar(10)
    ,catcher_home_player_id varchar(10)
    ,catcher_away_player_id varchar(10)
    ,bs1_home_player_id varchar(10)
    ,bs1_away_player_id varchar(10)
    ,bs2_home_player_id varchar(10)
    ,bs2_away_player_id varchar(10)
    ,bs3_home_player_id varchar(10)
    ,bs3_away_player_id varchar(10)
    ,ss_home_player_id varchar(10)
    ,ss_away_player_id varchar(10)
    ,rf_home_player_id varchar(10)
    ,rd_away_player_id varchar(10)
    ,cf_home_player_id varchar(10)
    ,cf_away_player_id varchar(10)
    ,lf_home_player_id varchar(10)
    ,lf_away_player_id varchar(10)
);

insert into baseball.base.fielding (
    game_id,game_dt
    ,home_team_id
    ,away_team_id
    ,home_team_score
    ,away_team_score
);


drop table if exists baseball.proc.game;
create table baseball.proc.game as
select * from baseball.base.game
;
drop table if exists baseball.base.game;
