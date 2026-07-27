# EventGuardian Test Cases

## Valid
Processes a valid event successfully and stores the processed result in S3.

## Duplicate
Sends the same request twice to verify idempotency.

## Conflict
Uses the same idempotency key with a different payload to trigger an idempotency validation error.

## Malformed
Sends invalid or incomplete events to verify input validation.

## Poison
Simulates a processing failure to verify retries, DLQ routing, and CloudWatch/SNS alerting.
