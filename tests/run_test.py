import json
import sys
import boto3

QUEUE_URL = "https://sqs.ap-south-1.amazonaws.com/070744430204/eventguardian-events"

if len(sys.argv) != 2:
    print("Usage: python run_test.py <json_file>")
    sys.exit(1)

file_path = sys.argv[1]

try:
    with open(file_path, "r") as f:
        message = json.load(f)
except json.JSONDecodeError as e:
    print(f"❌ Invalid JSON: {e}")
    sys.exit(1)
except FileNotFoundError:
    print(f"❌ File not found: {file_path}")
    sys.exit(1)

sqs = boto3.client("sqs", region_name="ap-south-1")

response = sqs.send_message(
    QueueUrl=QUEUE_URL,
    MessageBody=json.dumps(message)
)

print("✅ Message sent successfully!")
print("MessageId:", response["MessageId"])
