# mac-setup

```bash
/bin/bash -c "$(curl -fsSL "https://raw.githubusercontent.com/meparry/mac-setup/main/bootstrap.sh?$(date +%s)")"
```

> The `?$(date +%s)` query string busts GitHub's raw CDN cache (`max-age=300`),
> so you always fetch the latest `bootstrap.sh` instead of a stale copy.

