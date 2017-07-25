defmodule CanvassApp.PageController do
  use CanvassApp.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
