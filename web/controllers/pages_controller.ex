defmodule SinetrisBlog.PagesController do
  use SinetrisBlog.Helper.Application
  alias SinetrisBlog.Page

  plug :action

  def index(conn, _params) do
    page = Page.get("home")
    if !page do
      page = %Page{body: "Create an 'home' Page"}
    end
    render conn, "show.html", %{title: "Sinetris Blog", page: page}
  end

  def show(conn, params) do
    page = Page.get(params["slug"])
    if page do
      render conn, "show.html", %{page: page}
    else
      put_status(conn, :not_found)
    end
  end

  def not_found(conn, _params) do
    render conn, "not_found.html"
  end

  def error(conn, _params) do
    render conn, "error.html"
  end
end
