defmodule ShowcaseWeb.PageController do
  use ShowcaseWeb, :controller

  def home(conn, _params) do

    :telemetry.execute(
      [:showcase, :widgets, :created],
      %{count: 1},
      %{source: "ui"}
    )

    render(conn, :home)
  end
end
