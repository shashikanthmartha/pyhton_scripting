import boto3
from PIL import Image
import io
import os

s3 = boto3.client('s3')
destination_bucket = os.environ['DESTINATION_BUCKET']

def lambda_handler(event, context):
    # Get the uploaded file details
    source_bucket = event['Records'][0]['s3']['bucket']['name']
    key = event['Records'][0]['s3']['object']['key']

    # Download the image from the source bucket
    response = s3.get_object(Bucket=source_bucket, Key=key)
    image_data = response['Body'].read()

    # Process the image (e.g., convert to grayscale)
    image = Image.open(io.BytesIO(image_data))
    grayscale_image = image.convert('L')

    # Save the processed image to a buffer
    buffer = io.BytesIO()
    grayscale_image.save(buffer, format=image.format)
    buffer.seek(0)

    # Upload the processed image to the destination bucket
    processed_key = f"processed-{key}"
    s3.put_object(Bucket=destination_bucket, Key=processed_key, Body=buffer)

    return {
        'statusCode': 200,
        'body': f"Processed image saved as {processed_key} in {destination_bucket}"
    }