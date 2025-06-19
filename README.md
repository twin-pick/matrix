# matrix

Twin Pick's Deployment

## Docker

```bash
docker build -t twinpick/tars:latest -f docker/Dockerfile.tars .
docker run -p 8080:8080 --name tars tars:latest
```

## License

We're under the [MIT License](LICENSE)
