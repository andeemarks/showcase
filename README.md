# Showcase

To start your Phoenix server:

* Run `mix setup` to install and set up dependencies
* Start Phoenix endpoint with `mix phx.server` or inside IEx with `iex -S mix phx.server`

Now you can visit [`localhost:4000`](http://localhost:4000) from your browser.

Static analysis and CI

* Run `mix check` to verify formatting, Credo style checks, Sobelow security checks, and tests
* The repository includes GitHub Actions in `.github/workflows/ci.yml`

Deploying

* Render is the recommended deployment target for this app.
* Configure a Render web service to build and run the Phoenix release.
* Required runtime environment variables include `SECRET_KEY_BASE` and `PHX_HOST`.
* If you keep `.github/workflows/deploy.yml`, store your Render deploy hook as the `RENDER_DEPLOY_HOOK_URL` GitHub Actions secret. The workflow triggers a deploy only after `CI` succeeds on a `main` branch push, and it deploys the exact commit SHA that passed CI.

Example Render commands:

* Build command: `mix local.hex --force && mix local.rebar --force && MIX_ENV=prod mix deps.get --only prod && MIX_ENV=prod mix compile && MIX_ENV=prod mix assets.deploy && MIX_ENV=prod mix release`
* Start command: `PHX_SERVER=true _build/prod/rel/showcase/bin/showcase start`

Ready to run in production? Please [check our deployment guides](https://hexdocs.pm/phoenix/deployment.html).
