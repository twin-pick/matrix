FROM python:3.12.11-alpine AS builder 

ENV POETRY_VERSION=2.1.3 \
    POETRY_HOME="/opt/poetry" \
    PATH="/opt/poetry/bin:$PATH" \
    POETRY_NO_INTERACTION=1 \
    PYTHONUNBUFFERED=1

RUN apk add --no-cache \
    git \
    curl \
    build-base \
    libffi-dev \
    openssl-dev \
    musl-dev

RUN curl -sSL https://install.python-poetry.org | python3 -

WORKDIR /app

RUN git clone -b dev https://github.com/twin-pick/wall-e .

RUN poetry install --no-root

RUN mkdir /install && cp -r /app /install/app && cp -r ~/.cache/pypoetry /install/poetry_cache && cp -r $(poetry env info --path) /install/venv

FROM python:3.12.11-alpine

RUN apk add --no-cache libffi openssl


WORKDIR /app
COPY --from=builder /install/app /app
COPY --from=builder /install/venv /venv

ENV PATH="/venv/bin:$PATH"

CMD ["uvicorn", "src.wall_e.main:app", "--host", "0.0.0.0", "--port", "8000"]
