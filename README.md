# matrix

Twin Pick's Deployment

## Usage

### Tars

```bash
chmod +x ./scripts/run_tars.sh
OMDB_API_KEY=<your_omdb_api_key> ./scripts/run_tars.sh <scrapper_port(optional)> <exposed_port(optional)>
```

With Taskfile:

```bash
task tars -- <OMDB_API_KEY>
```

### Wall-e

### Jarvis

```bash
chmod +x ./scripts/run_jarvis.sh
./scripts/run_jarvis.sh <exposed_port(optional)>
```

With Taskfile:

```bash
task jarvis -- <EXPOSED_PORT(optional)>
```

## License

We're under the [MIT License](LICENSE).
