# pipeline-example
This repository contains installation scripts for Concourse CI/CD (with tracing enabled) and a basic Concourse pipeline configuration.
This sample project was created as a POC to file a bug report on Concourse.
https://github.com/concourse/concourse/issues/6988

### Concourse Installation
```
docker-compose -f concourse_installation/docker-compose.yml -f concourse_installation/jaeger.yml up -d
```
Concourse UI is available at http://127.0.0.1:8080

Jager UI is available at http://127.0.0.1:25000

### Concourse Set Pipeline
Install the `fly` cli tool from Concourse to interact with the Concourse CI/CD

#### Authenticate `fly` cli
```
fly -t local login -c http://127.0.0.1:8080
logging in to team 'main'

navigate to the following URL in your browser:

  http://127.0.0.1:8080/login?fly_port=50132
```
Navigate to the above URL and authenticate using username `admin` and password as `admin`

#### Set Pipeline
[pipeline.yaml](pipeline.yaml) is configured to set a new pipeline on Concourse which listens to changes on the current repository's `app` folder.
Any changes in the [app](app) folder is picked up the jobs and prints the contents of the file at [app/fie.txt](app/file.txt)
For Concourse to pull the changes from this repo, a private SSH key needs to be setup which is configured in the `credentials.yaml` file.
Feel free to change the configured repository and the private key as per your needs.
```
fly -t local sp -c pipeline.yaml -p pipe-ex -l credentails.yml
```

#### Generating commits
Run the [commits.sh](commits.sh) script to generate new commits on the [app/file.txt](app/file.txt)
