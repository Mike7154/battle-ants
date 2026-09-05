# Battle Ants

A single-file HTML5 idle/tower-defense game (`ant-colony-battle-game_8.html`). No build step, no
backend — the whole game is one page. Gameplay/feature notes live in
`ant-colony-battle-guide.md`.

This repo is set up so that every push to `main` automatically builds a Docker image via
GitHub Actions ([.github/workflows/docker-publish.yml](.github/workflows/docker-publish.yml))
and publishes it as a package to GitHub Container Registry (GHCR) at:

```
ghcr.io/mike7154/battle-ants:latest
```

## Run it locally with Docker

```bash
docker compose up -d
```

Then open **http://localhost:8080**.

### Make sure the package is public

GHCR packages default to private. So Unraid can pull without logging in, check
[github.com/Mike7154/battle-ants/pkgs/container/battle-ants](https://github.com/Mike7154/battle-ants/pkgs/container/battle-ants)
→ **Package settings** → **Change visibility** → **Public** (one-time check).

(Keeping it private is fine too — Unraid can pull private GHCR images, it just needs registry
credentials added in Unraid's Docker settings first.)

## Installing on Unraid

1. **Docker** tab → **Add Container**.
2. **Repository**: `ghcr.io/mike7154/battle-ants:latest`
3. Add a **Port** mapping: Container Port `80` → Host Port `8080` (or whatever's free).
4. Apply. Once it pulls and starts, the game is at `http://<your-unraid-ip>:8080`.

Every time you push new changes to `main` on GitHub, the Action rebuilds the image
automatically — just click **Force Update** on the container in Unraid (or wait for its own
auto-update check) to pick up the new version.
