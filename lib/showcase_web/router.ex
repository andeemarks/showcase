defmodule ShowcaseWeb.Router do
  use ShowcaseWeb, :router
  import Phoenix.LiveDashboard.Router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_live_flash
    plug :put_root_layout, html: {ShowcaseWeb.Layouts, :root}
    plug :protect_from_forgery

    plug :put_secure_browser_headers, %{
      "content-security-policy" =>
        "default-src 'self'; connect-src 'self' ws: wss:; img-src 'self' data:; style-src 'self' 'unsafe-inline'; script-src 'self';"
    }
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", ShowcaseWeb do
    pipe_through :browser

    get "/", PageController, :home
    get "/health", HealthController, :show
    live_dashboard "/dashboard", metrics: ShowcaseWeb.Telemetry
  end

  # Other scopes may use custom stacks.
  # scope "/api", ShowcaseWeb do
  #   pipe_through :api
  # end

  # Enable Swoosh mailbox preview in development
  if Application.compile_env(:showcase, :dev_routes) do
    scope "/dev" do
      pipe_through :browser

      forward "/mailbox", Plug.Swoosh.MailboxPreview
    end
  end
end
