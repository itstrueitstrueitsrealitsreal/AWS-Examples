
## Create bucket
```sh
aws s3 mb s3://prefixes-example-ks
```

## Create folder
```sh
aws s3api put-object --bucket prefixes-example-ks --key="hello/"
```

## Create multiple folders
```sh
aws s3api put-object --bucket prefixes-example-ks --key="bye/world/peepee/"
```

