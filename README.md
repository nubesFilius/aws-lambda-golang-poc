Run script in the order:
1. create-bucket create an S3 bucket to upload artifacts
2. deploy creates a CF stack out of the template.yml and outputs the resulting yml file
3. invoke calls the lambda function using the event.json as a mock file
4. cleanup deletes everything

The main.go function outputs some execution context information. It expects an SQS type event, which is provided in the event.json file.