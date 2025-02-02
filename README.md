# Docker Sliver C2

Run [Sliver](https://github.com/BishopFox/sliver) Command & Control (C2) framework v1.5.39 using Docker Compose.

## Usage

1. Create a `docker-compose.yml` file:

```yaml
services:
  sliver:
    image: chryzsh/sliver:v1.5.39
    container_name: sliver-c2
    volumes:
      - ./data:/root/.sliver
    ports:
      - "31337:31337"  # Default Sliver HTTP listener
      - "53:53"        # Default DNS listener
      - "80:80"        # Default HTTP listener
      - "443:443"      # Default HTTPS listener
    restart: unless-stopped
```

2. Start the container:
```bash
docker compose up -d
```

The server will be accessible through ports 31337 (Sliver HTTP), 53 (DNS), 80 (HTTP), and 443 (HTTPS).

## Data Persistence

The container uses a local `./data` directory for storing configuration, operators, and implants. You should create this directory or modify the path to a path of your choice.

## Management Commands

```bash
# View logs
docker compose logs -f

# Stop server
docker compose down
```