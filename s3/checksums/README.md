## Create a new S3 Bucket

```sh
aws s3 mb s3://checksums-examples-ab-ks
```

## CReate a file that we will do a checksum on

```sh
echo "Hello Mars" > myfile.txt
```

## Get a checksum of a file for md5

```sh
md5sum myfile.txt
# 8ed2d86f12620cdba4c976ff6651637f  myfile.txt
```

## Upload our file to S3

```sh
aws s3 cp myfile.txt s3://checksums-examples-ab-ks
aws s3api head-object --bucket checksums-examples-ab-ks --key myfile.txt
```

## Let's upload a file with a different type of checksum
```sh
bundle exec ruby crc.rb
```

```sh
aws s3api put-object \
--bucket checksums-examples-ab-ks \
--key myfilesha1.txt \
--body myfile.txt \
--checksum-algorithm="SHA1" \
--checksum-sha1="c28ccc2c5e214036806014df9fb43634f3e770b2"
```