## Create a bucket

```sh
aws s3 mb s3://encrypt-client-example-ks
```

## Create a file

```sh
echo "Hello World" > hello.txt
```

### Run our our SDK ruby script

```sh
bundle exec ruby encrypt.rb
```

# Cleanup 
```sh
aws s3 rm s3://encrypt-client-example-ks/hello.txt
aws s3 rb s3://encrypt-client-example-ks
```