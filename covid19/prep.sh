# git clone https://github.com/CSSEGISandData/COVID-19.git
# vars
REPO=/home/tsj7ww/Github/JHU_COVID19
DATA=$PWD/data
# update repo
(cd $REPO && git pull)
# folder prep
rm -rf $DATA
mkdir $DATA
mkdir $DATA/csse-dly
mkdir $DATA/csse-dly-us
mkdir $DATA/csse-ts
mkdir $DATA/who-ts
# copy files
cp $REPO/csse_covid_19_data/UID_ISO_FIPS_LookUp_Table.csv $DATA/csse-fips-lkup.csv # UID_ISO_FIPS_LookUp_Table
cp $REPO/csse_covid_19_data/csse_covid_19_daily_reports/*.csv $DATA/csse-dly
cp $REPO/csse_covid_19_data/csse_covid_19_daily_reports_us/*.csv $DATA/csse-dly-us
cp $REPO/csse_covid_19_data/csse_covid_19_time_series/*.csv $DATA/csse-ts
cp $REPO/who_covid_19_situation_reports/who_covid_19_sit_rep_time_series/*.csv $DATA/who-ts