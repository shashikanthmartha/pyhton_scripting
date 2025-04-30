import boto3
import os

s3 = boto3.client('s3')

def lambda_handler(event, context):
    # Get bucket names from environment variables
    source_bucket = os.environ['SOURCE_BUCKET']
    destination_bucket = os.environ['DESTINATION_BUCKET']

    # Get the object key from the event
    source_key = event['Records'][0]['s3']['object']['key']

    # Copy the file to the destination bucket
    copy_source = {'Bucket': source_bucket, 'Key': source_key}
    s3.copy_object(CopySource=copy_source, Bucket=destination_bucket, Key=source_key)

    print(f"Processed {source_key} from {source_bucket} to {destination_bucket}")