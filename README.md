# jenkins-pipeline-validator
Validate Jenkins pipelines easily in CI or locally

## About
When developing Jenkins pipelines, it is often helpful to validate that pipeline as you go. This currently requires using an up and running Jenkins instance, but what if you don't have access to one?

By using the included `Dockerfile` and shell wrapper (only requiring `curl`) you can validate your Jenkins pipelines.

If a pipeline is valid, the script will exit cleanly. If the pipeline is _invalid_, it will return a non-zero exit code. This is useful for running in CI.

## Usage

### Running Jenkins
First, you must run an instance of Jenkins, defined via the included Dockerfile. This can done with the following:

```bash
docker run --name jenkins -d -p 8080:8080 joshphp/jenkins-pipeline-validator
```

### Validating pipelines
To validate a Jenkins pipeline, run `./validate.sh -f <filename.groovy>`

This will hit `localhost:8080` to validate the pipeline. If you are running on a different port, modify the script to reflect that change.
