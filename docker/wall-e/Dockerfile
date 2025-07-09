FROM python:3.12-slim AS builder 

RUN apt-get update && apt-get install -y --no-install-recommends \
    curl \
    git \
    build-essential \
    libssl-dev \
    libffi-dev \
    ca-certificates \
    && rm -rf /var/lib/apt/lists/*

RUN curl -sSL https://install.python-poetry.org | python3 -


ENV PATH="/root/.local/bin:$PATH" \
    POETRY_NO_INTERACTION=1 \
    PYTHONUNBUFFERED=1

WORKDIR /app

RUN git clone -b dev https://github.com/twin-pick/wall-e .

RUN poetry install --no-root \
    && poetry run playwright install

RUN mkdir -p /install && \
    cp -r /app /install/app && \
    cp -r $(poetry env info --path) /install/venv


FROM python:3.12-slim

RUN apt-get update && apt-get install -y --no-install-recommends \
    libnss3 \
    libatk-bridge2.0-0 \
    libgtk-3-0 \
    libx11-xcb1 \
    libxcb-dri3-0 \
    libxcomposite1 \
    libxdamage1 \
    libxrandr2 \
    libasound2 \
    libxshmfence1 \
    libgbm1 \
    libxss1 \
    libxtst6 \
    ca-certificates \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /app
COPY --from=builder /install/app /app
COPY --from=builder /install/venv /venv
ENV PATH="/venv/bin:$PATH" \
    PYTHONPATH=/app/src/wall_e
EXPOSE 8000

CMD ["python", "-m", "uvicorn", "src.wall_e.main:app", "--host", "0.0.0.0", "--port", "8000"]