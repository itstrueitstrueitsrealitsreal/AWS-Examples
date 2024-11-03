## Create bucket
```sh
aws s3 mb s3://class-example-ks
```

## Create file
```sh
echo "Hello Mars" > hello.txt
aws s3 cp hello.txt s3://class-example-ks
```

## Change storage class
```sh
aws s3 cp hello.txt s3://class-example-ks --storage-class STANDARD_IA
```

## Cleanup
```sh
aws s3 rm s3://class-example-ks/hello.txt
aws s3 rb s3://class-example-ks
```