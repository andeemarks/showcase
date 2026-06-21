defmodule ShowcaseWeb.Router do
  use ShowcaseWeb, :router
  import Phoenix.LiveDashboard.Router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_live_flash
    plug :put_root_layout, html: {ShowcaseWeb.Layouts, :root}
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :app_csp do
    plug :put_secure_browser_headers, %{
      "content-security-policy" =>
        "default-src 'self'; connect-src 'self' ws: wss:;"
    }
  end

  pipeline :dashboard_csp do
    plug :put_secure_browser_headers, %{
      "content-security-policy" =>
        "default-src 'self'; " <>
          "script-src 'self' 'unsafe-inline'; " <>
          "style-src 'self' 'unsafe-inline'; " <>
          "img-src 'self' data:; " <>
          "font-src 'self' data:; " <>
          "connect-src 'self' ws: wss:;"
    }
  end

  scope "/", ShowcaseWeb do
    pipe_through [:browser, :app_csp]

    get "/", PageController, :home
    get "/health", HealthController, :show
  end

  if Application.compile_env(:showcase, :dev_routes) do
    scope "/" do
      pipe_through [:browser, :dashboard_csp]

      live_dashboard "/dashboard", metrics: ShowcaseWeb.Telemetry
    end

    scope "/dev" do
      pipe_through :browser

      forward "/mailbox", Plug.Swoosh.MailboxPreview
    end
  end
end
