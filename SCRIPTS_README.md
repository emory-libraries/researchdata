

### Dataverse Export Script

#### Prerequisites

1. The API's URL, up to and including `/api`.
2. The API's Token.
3. All necessary gems; can be installed by running `sudo gem install dataverse dotenv fileutils json` in your terminal.
4. Files located in the same folder as the script named `.env.dataverse` and `dataverse_api_interface.rb`.
  - A sample is provided within this repository entitled `.env.dataverse.sample`. Feel free to rename this file and fill out the fields.
  - All fields must be filled.
  - The PERSISTENT_IDS variable can accept multiple DOI ids by separating ids with a comma (,). For example, `doi:12.34567/S3/ABCDEF,doi:89.12345/S3/GHIJKL,hdl:1234.56/78912`.

#### Usage

1. Ensure that the script (`dataverse_export_script.rb`), the ENV file (`.env.dataverse`), and the interface class (`dataverse_api_interface.rb`) are in the same folder on the computer.
2. If the script doesn't already have execute permission, assign them (`sudo chmod +x dataverse_export_script.rb`).
3. Note the full path of the script location.
4. Change directory to the desired download location.
5. Execute this command in your terminal: `/<full path to>/dataverse_export_script.rb`
6. The resulting downloads will be separated within folders named by the alphanumeric characters of the PIDs.


### Retrieve Emory Collection PIDS Script

#### Prerequisites

1. The API's URL, up to and including `/api`.
2. The API's Token.
3. All necessary gems; can be installed by running `sudo gem install dataverse dotenv fileutils json` in your terminal.
4. Files located in the same folder as the script named `.env.dataverse` and `dataverse_api_interface.rb`.
  - A sample is provided within this repository entitled `.env.dataverse.sample`. Feel free to rename this file and fill out the fields.
  - Only `API_URL` and `API_TOKEN` must be filled.

#### Usage

1. Ensure that the script (`retrieve_emory_collection_pids_script.rb`), the ENV file (`.env.dataverse`), and the interface class (`dataverse_api_interface.rb`) are in the same folder on the computer.
2. If the script doesn't already have execute permission, assign them (`sudo chmod +x retrieve_emory_collection_pids_script.rb`).
3. Note the full path of the script location.
4. Change directory to the desired download location.
5. Execute this command in your terminal: `/<full path to>/retrieve_emory_collection_pids_script.rb`
6. The resulting report (`dataset_pids.txt`) will be downloaded to the same folder that the command was executed in.

