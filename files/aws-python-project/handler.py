import json
import boto3


def hello(event, context):
    s3 = boto3.client('s3')
    response = s3.list_buckets()
    dynamodb = boto3.resource('dynamodb')
    table = dynamodb.Table('csvtodynamodb')
    bucket_name = "funguardiancsvtodynamodb"
    item_added = []
    for key in s3.list_objects(Bucket=bucket_name)['Contents']:
        print(key['Key'])
        obj = s3.get_object(Bucket=bucket_name, Key=key['Key'])
        obj = obj['Body'].read().decode('utf-8-sig').splitlines()
        for i in obj:
            table_data = i.split(';')
            if table_data[0] == 'Nama':
                continue
            response = table.put_item(
                Item={
                    'name': table_data[0],
                    'address': table_data[1],
                    'role': table_data[2]
                }
            )
            item_added.append(
                {
                    'name': table_data[0],
                    'address': table_data[1],
                    'role': table_data[2]
                }
            )
    body = {
        "message": "Go Serverless v2.0! Your function executed successfully!",
        "input": event,
    }

    return {"statusCode": 200, "body": json.dumps(item_added)}
