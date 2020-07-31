# Bastion SSH Tunnel

Docker image for setting up SSH port forwarding tunnel through a Bastion host.

## Usage

The example command
```bash
export BASTION_SSH_KEYFILE=${PWD}/private.key
docker run --rm -it -e BASTION_HOST=ec2-user@bastion.example.com -e REMOTE_HOST=secret.example.com -e REMOTE_PORT=5432 -v ${BASTION_SSH_KEYFILE}:/private.key:ro -p 127.0.0.1:9005:8000 skylander/bastion-ssh-tunnel
```
will set up a local port forward on port `9005` to port `5432` (`REMOTE_PORT`) on host `secret.example.com` (`REMOTE_HOST`) through the Bastion `bastion.example.com` (`BASTION_HOST`).
This is especially convenient when you have servers hidden behind private networks (e.g., VPC).

Alternatively, you can use the image in Docker compose.
See [`docker-compose.yml`](docker-compose.yml) for an example.
