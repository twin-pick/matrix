#/bin/bash
set -e

if [ -z "$OMDB_API_KEY" ]; then
  echo "❌ Error : OMDB_API_KEY environment variable is not set."
  echo "Usage : OMDB_API_KEY=xxxx ./run_tars.sh [scrapper_port] [exposed_port]"
  exit 1
fi

SCRAPPER_PORT=${1:-8000}
EXPOSED_PORT=${2:-8085}

echo "🔧 Building image..."
docker build -t tars -f ../docker/tars/Dockerfile ..

echo "🚀 Running container..."
docker run \
  -e OMDB_API_KEY="$OMDB_API_KEY" \
  -e SCRAPPER_PORT="$SCRAPPER_PORT" \
  -e EXPOSED_PORT="$EXPOSED_PORT" \
  -p "$EXPOSED_PORT":"$EXPOSED_PORT" \
  tars
