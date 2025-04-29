import boto3
import os

s3 = boto3.client('s3')

def lambda_handler(event, context):
    source_bucket = event['Records'][0]['s3']['bucket']['name']
    source_key = event['Records'][0]['s3']['object']['key']
    destination_bucket = os.environ['DESTINATION_BUCKET']

    # Example: Copy the file to the destination bucket
    copy_source = {'Bucket': source_bucket, 'Key': source_key}
    s3.copy_object(CopySource=copy_source, Bucket=destination_bucket, Key=source_key)

    print(f"Processed {source_key} from {source_bucket} to {destination_bucket}")