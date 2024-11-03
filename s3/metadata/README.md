
## Create bucket
```sh
aws s3 mb s3://metadata-example-ks
```

## Create folder
```sh
echo "Hello Mars" > hello.txt
```

## Upload file with metadata
```sh
aws s3api put-object --bucket metadata-example-ks --key hello.txt --body hello.txt --metadata Planet=Mars
```

## Get Metadata through head object

```sh
aws s3api head-object --bucket metadata-example-ks --key hello.txt
```

## Cleanup
```sh
aws s3 rm s3://metadata-example-ks/hello.txt
aws s3 rb s3://metadata-example-ks
```