# Order System

python3.11 is used for the code

## Order function
Steps:
1. Start with a Lambda with some simple python inline Code:
2. Use the Makefile to zip the code and upload the Python code
    1. `make build-order` - Zip the Python code
    2. `make deploy-order` - Update the Lambda code
3. Check the console to see the deployed Lambda code
4. Test the Lambda code from the Console with the object found below
5. Check CloudWatch logs

The order Lambda should be invoked with an event object like this:
```json
{
  "order_id": "12345",
  "client_name": "John Johnson"
}
```

In the console you can use the 'Test' functionality to invoke the Lambda.
To check if the Lambda function runs correctly check the CloudWatch logs.

This function has an environment variable `SNS_TOPIC_ARN` make sure to pass the SNS topic ARN to the Lambda function as an environment variable.
Do not hard code it :)

## SNS Topic

The Order Lambda should have the right permissions to be able to publish to the SNS topic.
The Lambda itself needs the right permission and the SNS topic needs to allow messages from the Lambda being published.

Create a SUBSCRIPTION with the Shipment Lambda as target.

## Shipment Lambda

The Shipment LAMBDA should have the right PERMISSIONS to allow being INVOKED by the SNS topic.

After the Lambda is invoked the Lambda should put a message in DynamoDB. Make sure the Lambda has the correct permissions to put an item in DynamoDB.
