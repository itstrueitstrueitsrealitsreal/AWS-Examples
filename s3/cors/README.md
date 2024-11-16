# Create Website 1

## Create a bucket
```sh
aws s3 mb s3://cors-example-ks
```

## Change block public access
```sh
aws s3api put-public-access-block \
    --bucket cors-example-ks \
    --public-access-block-configuration "BlockPublicAcls=true,IgnorePublicAcls=true,BlockPublicPolicy=false,RestrictPublicBuckets=false"
```

## Create a bucket policy
```sh
aws s3api put-bucket-policy --bucket cors-example-ks --policy file://bucket-policy.json
```

## Turn on static website hosting
```sh
aws s3api put-bucket-website --bucket cors-example-ks --website-configuration file://website.json
```

## Upload our index.html file and include a resource that would be cross-origin
```sh
aws s3 cp index.html s3://cors-example-ks
```

## View the website and see if the index.html is there
```sh
http://cors-example-ks.s3-website.us-west-1.amazonaws.com
```



# Create Website 2

```sh
aws s3 mb s3://cors-example2-ks
```

## Change block public access

```sh
aws s3api put-public-access-block \
--bucket cors-example2-ks \
--public-access-block-configuration "BlockPublicAcls=true,IgnorePublicAcls=true,BlockPublicPolicy=false,RestrictPublicBuckets=false"
```

## Create a bucket policy

```sh
aws s3api put-bucket-policy --bucket cors-example2-ks --policy file://bucket-policy2.json
```

## Turn on static website hosting

```sh
aws s3api put-bucket-website --bucket cors-example2-ks --website-configuration file://website.json
```

## Upload our javascript file

aws s3 cp hello.js s3://cors-example2-ks

## Create API Gateway with mock response and then test the endpoint


curl -X POST -H "Content-Type: application/json" https://1kccnjkm43.execute-api.us-west-1.amazonaws.com/prod/hello


## Set CORS on our bucket

aws s3api put-bucket-cors --bucket cors-example2-ks --cors-configuration file://cors.json