## Create a bucket

```sh
aws s3 mb s3://encryption-example-ks
```

## Create a file

```sh
echo "Hello World" > hello.txt
aws s3 cp hello.txt s3://encryption-example-ks
```

## Put object with encryption of KMS

```sh
aws s3api put-object \
--bucket encryption-example-ks \
--key hello.txt \
--body hello.txt \
--server-side-encryption "aws:kms" \
--ssekms-key-id "a1bb2b48-ce90-49ff-bd06-f23705bcc0d8"
```

## Put object with SSE-C [Failed attempt]

```sh
export BASE64_ENCODED_KEY=$(openssl rand -base64 32)
echo $BASE64_ENCODED_KEY
export MD5_VALUE=$(echo -n $BASE64_ENCODED_KEY | md5sum | awk '{print $1}' | base64 -w0)
echo $MD5_VALUE
aws s3api put-object \
--bucket encryption-example-ks \
--key hello.txt \
--body hello.txt \
--sse-customer-algorithm AES256 \
--sse-customer-key $ENCODED_KEY \
--sse-customer-key-md5 $MD5_VALUE

```

### Put Object with SSE-C via aws s3

https://catalog.us-east-1.prod.workshops.aws/workshops/aad9ff1e-b607-45bc-893f-121ea5224f24/en-US/s3/serverside/ssec


openssl rand -out ssec.key 32

aws s3 cp hello.txt s3://encryption-example-ks/hello.txt \
--sse-c AES256 \
--sse-c-key fileb://ssec.key

aws s3 cp s3://encryption-example-ks/hello.txt hello.txt --sse-c AES256 --sse-c-key fileb://ssec.key