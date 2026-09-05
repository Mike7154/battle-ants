# Battle Ants

A single-file HTML5 idle/tower-defense game (`ant-colony-battle-game_8.html`). No build step, no
backend — the whole game is one page. Gameplay/feature notes live in
`ant-colony-battle-guide.md`.

This repo is set up so that every push to `main` automatically builds a Docker image and
publishes it to GitHub Container Registry (GHCR), ready to pull straight into Unraid.

## Run it locally with Docker

```bash
docker compose up -d
```

Then open **http://localhost:8080**.

## One-time setup: push this folder to GitHub

Run these from inside this folder. You only need to do this once.

```bash
git init
git add .
git commit -m "Initial commit"
git branch -M main
```

Now create the (empty) GitHub repo — pick ONE of these:

- **GitHub CLI**, if you have `gh` installed and are logged in:
  ```bash
  gh repo create battle-ants --public --source=. --remote=origin --push
  ```
  This creates the repo, sets the remote, and pushes in one step — skip the block below if you use this.

- **GitHub website**: go to https://github.com/new, name it (e.g. `battle-ants`), leave it
  empty (no README/license/.gitignore — this folder already has one), then run:
  ```bash
  git remote add origin https://github.com/<your-username>/<your-repo-name>.git
  git push -u origin main
  ```

Once pushed, open the **Actions** tab on the GitHub repo page — you'll see "Build and publish
Docker image" running. It finishes in a minute or two and publishes the image to
`ghcr.io/<your-username>/<your-repo-name>`.

### Make the package pullable by Unraid

By default a GHCR package inherits your repo's visibility. If your repo is public, the image is
already public and Unraid can pull it with no login. If your repo is private (or the package
still shows as private after the first build), go to:

`github.com/<your-username>?tab=packages` → click the package → **Package settings** →
**Change visibility** → **Public**.

(If you'd rather keep it private, that's fine too — Unraid can pull private GHCR images, but
you'd need to add registry credentials in Unraid's Docker settings first.)

## Installing on Unraid

1. **Docker** tab → **Add Container**.
2. **Repository**: `ghcr.io/<your-username>/<your-repo-name>:latest`
3. Add a **Port** mapping: Container Port `80` → Host Port `8080` (or whatever's free).
4. Apply. Once it pulls and starts, the game is at `http://<your-unraid-ip>:8080`.

Every time you push new changes to `main` on GitHub, the Action rebuilds the image
automatically — just click **Force Update** on the container in Unraid (or wait for its own
auto-update check) to pick up the new version.
