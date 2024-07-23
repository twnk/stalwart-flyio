Sample Fly.io Stalwart Config
=============================

Setup
-----

1. Copy `config.toml.example` and `fly.toml.example`:
```bash
cp config.toml.example config.toml && cp fly.toml.example fly.toml`
```

2. Run [Fly Launch](https://fly.io/docs/reference/fly-launch/): `fly launch --no-deploy`
Say yes to copying existing config.

3. Create an admin password and configure it as a secret
```bash
SALT=$(openssl rand -base64 16)
HASH=$(openssl passwd -6 -salt $SALT) 
fly secrets set STALWART_ADMIN_SECRET="$HASH" --stage
unset SALT && unset HASH
```

4. Deploy with `fly deploy` and access your mail admin at `https://[app-name].fly.dev:8080/login` 

5. You have the initial setup done. Further steps:
  i. register a custom domain name and reconfigure `config.toml` (keys: `lookup.default.domain`, `acme."letsencrypt".domains`)
  ii. try out a mail client