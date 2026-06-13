# Showcase

To start your Phoenix server:

* Run `mix setup` to install and set up dependencies
* Start Phoenix endpoint with `mix phx.server` or inside IEx with `iex -S mix phx.server`

Now you can visit [`localhost:4000`](http://localhost:4000) from your browser.

Static analysis and CI

* Run `mix check` to verify formatting, Credo style checks, Sobelow security checks, and tests
* The repository includes GitHub Actions in `.github/workflows/ci.yml`

Deploying

* Local container build: `docker build -t showcase .`
* Vercel deployment is supported via `vercel.json` and `Dockerfile`

Ready to run in production? Please [check our deployment guides](https://hexdocs.pm/phoenix/deployment.html).

## Learn more

* Official website: https://www.phoenixframework.org/
* Guides: https://hexdocs.pm/phoenix/overview.html
* Docs: https://hexdocs.pm/phoenix
* Forum: https://elixirforum.com/c/phoenix-forum
* Source: https://github.com/phoenixframework/phoenix
