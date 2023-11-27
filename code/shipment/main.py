import json
import boto3
import os

client = boto3.client('dynamodb')

shipment_dynamodb_table_name = os.environ['SHIPMENT_DYNAMODB_TABLE_NAME']


def send_shipment():
    # Shipping order logic here
    return


def lambda_handler(event, context):
    send_shipment()

    message = event['Records'][0]['Sns']['Message']
    message = json.loads(message)

    response = client.put_item(
        TableName=shipment_dynamodb_table_name,
        Item={
            'client_name': {
                'S': message['client_name']
            },
            'order_id': {
                'S': message['order_id'],
            },
            'status': {
                'S': 'SHIPPED',
            },
        },
    )

    print(response)
