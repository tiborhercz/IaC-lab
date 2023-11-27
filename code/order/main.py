import json
import boto3
import os

client = boto3.client('sns')

sns_topic_arn = os.environ['SNS_TOPIC_ARN']


def lambda_handler(event, context):
    message = {"status": "ORDER_PLACED", "order_id": event['order_id'], "client_name": event['client_name']}
    response = client.publish(
        TargetArn=sns_topic_arn,
        Message=json.dumps({'default': json.dumps(message)}),
        MessageStructure='json'
    )

    print(response)

    return response
