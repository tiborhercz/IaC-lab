# Order System


## Order function
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

Create a subscription with the Shipment Lambda as target.

## Shipment Lambda

The Shipment Lambda should have the right permissions to allow being invoked by the SNS topic.

After the Lambda is invoked the Lambda should put a message in DynamoDB. Make sure the Lambda has the correct permissions to put an item in DynamoDB.

