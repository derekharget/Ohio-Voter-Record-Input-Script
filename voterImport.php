<?php

/**
 * @author Derek Harget
 * @copyright 2021 Derek Harget
 * @license MIT https://opensource.org/licenses/MIT
 */

set_time_limit(0);
$databaseIP = "localhost";
$databaseUsername = "username";
$databasePassword = "password";
$databaseName = "ohioer";





/**
 * @throws Exception Verifies -f param is used
 * @throws Exception Verifies file exists before continuing in the application
 * @return bool
 */

function checkInputParamsAndData(): bool
    {
        $params = getopt('f:');

        if(!isset($params['f'])) {
            throw new Exception('You need to use -f <filename>');
            return false;
        }

        if(!file_exists($params['f'])) {
            throw new Exception('You need to select a valid csv file from the state of Ohio');
            return false;
        }

        return true;
    }

/**
 * @return string Returns filename
 */

    function getInputFile(): string
    {
        $fileArray = getopt('f:');
        return $fileArray['f'];
    }

    try{
        checkInputParamsAndData();
    } catch (Exception $e) {
        echo 'Error Found: '. $e->getMessage(). PHP_EOL;
        die(0);
    }






//Record Tracking
$q = 1;
$file = fopen(getInputFile(), 'r');
$headers = array_map('strtolower', fgetcsv($file));

try {
    $dbconn = new PDO("mysql:host=$databaseIP;dbname=$databaseName", $databaseUsername, $databasePassword);
    $dbconn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
    $dbquery = $dbconn->prepare("INSERT INTO ohio_citizen_data (
                               first_name, 
                               middle_name, 
                               last_name, 
                               date_of_birth, 
                               residential_address, 
                               residential_city, 
                               residential_state, 
                               residential_zip, 
                               county_number,
                               registered_city,
                               county_court_district,
                               congressional_district,
                               court_of_appeals,
                               township,
                               village,
                               ward,
                               edu_service_center_district,
                               exempted_vill_school_district,
                               library,
                               local_school_district,
                               state_board_of_education,
                               municipal_court_district,
                               precinct_name,
                               precinct_code,
                               state_representative_district,
                               state_senate_district,
                               voter_registration_date,
                               party_affiliation
                               
                               ) VALUES (
                                         
                                   :first_name, 
                                   :middle_name, 
                                   :last_name, 
                                   :date_of_birth, 
                                   :residential_address, 
                                   :residential_city, 
                                   :residential_state, 
                                   :residential_zip, 
                                   :county_number,
                                   :registered_city,
                                   :county_court_district,
                                   :congressional_district,
                                   :court_of_appeals,
                                   :township,
                                   :village,
                                   :ward,
                                   :edu_service_center_district,
                                   :exempted_vill_school_district,
                                   :library,
                                   :local_school_district,
                                   :state_board_of_education,
                                   :municipal_court_district,
                                   :precinct_name,
                                   :precinct_code,
                                   :state_representative_district,
                                   :state_senate_district,
                                   :voter_registration_date,
                                   :party_affiliation
                                         
                                         
                                         )");

    while ($row = fgetcsv($file)) {
        // Fix data errors where keys don't match
        if(count($row) === count($headers)) {
            $row = array_combine($headers, $row);

            $dbquery->execute([
                                   ':first_name' => $row['first_name'],
                                   ':middle_name' => $row['middle_name'],
                                   ':last_name' => $row['last_name'],
                                   ':date_of_birth' => $row['date_of_birth'],
                                   ':residential_address' => $row['residential_address1'],
                                   ':residential_city' => $row['residential_city'],
                                   ':residential_state' => $row['residential_state'],
                                   ':residential_zip' => $row['residential_zip'],
                                   ':county_number' => $row['county_number'],
                                   ':registered_city' => $row['city'],
                                   ':county_court_district' => $row['county_court_district'],
                                   ':congressional_district' => $row['congressional_district'],
                                   ':court_of_appeals' => $row['court_of_appeals'],
                                   ':township' => $row['township'],
                                   ':village' => $row['village'],
                                   ':ward' => $row['ward'],
                                    ':edu_service_center_district' => $row['edu_service_center_district'],
                                   ':exempted_vill_school_district' => $row['exempted_vill_school_district'],
                                   ':library' => $row['library'],
                                   ':local_school_district' => $row['local_school_district'],
                                   ':state_board_of_education' => $row['state_board_of_education'],
                                   ':municipal_court_district' => $row['municipal_court_district'],
                                   ':precinct_name' => $row['precinct_name'],
                                   ':precinct_code' => $row['precinct_code'],
                                   ':state_representative_district' => $row['state_representative_district'],
                                   ':state_senate_district' => $row['state_senate_district'],
                                   ':voter_registration_date' => $row['registration_date'],
                                   ':party_affiliation' => $row['party_affiliation']
                                         
                                         
                                         ]);


                print('Added Record: '.$q . ' To Database'.PHP_EOL);

        }
        $q++;
    }


} catch (PDOException $e) {
    echo "Database Error: " . $e->getMessage();
}


