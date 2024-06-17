defmodule BookshelfWeb.Router do
  use BookshelfWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_live_flash
    plug :put_root_layout, html: {BookshelfWeb.Layouts, :root}
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end
  scope "/", BookshelfWeb do
    pipe_through :browser

    live_session :home do
      live "/", HomeLive
    end

    live_session :navbar do
      scope "/bookshelf" do

        live "/books", BookLive.Index, :index
        live "/books/new", BookLive.Index, :new
        live "/books/:id/edit", BookLive.Index, :edit
        live "/books/:id", BookLive.Show, :show
        live "/books/:id/show/edit", BookLive.Show, :edit

        live "/cassettes", CassetteLive.Index, :index
        live "/cassettes/new", CassetteLive.Index, :new
        live "/cassettes/:id/edit", CassetteLive.Index, :edit
        live "/cassettes/:id", CassetteLive.Show, :show
        live "/cassettes/:id/show/edit", CassetteLive.Show, :edit

        live "/cds", CdLive.Index, :index
        live "/cds/new", CdLive.Index, :new
        live "/cds/:id/edit", CdLive.Index, :edit
        live "/cds/:id", CdLive.Show, :show
        live "/cds/:id/show/edit", CdLive.Show, :edit

        live "/records", RecordLive.Index, :index
        live "/records/new", RecordLive.Index, :new
        live "/records/:id/edit", RecordLive.Index, :edit
        live "/records/:id", RecordLive.Show, :show
        live "/records/:id/show/edit", RecordLive.Show, :edit

        live "/songbooks", SongbookLive.Index, :index
        live "/songbooks/new", SongbookLive.Index, :new
        live "/songbooks/:id/edit", SongbookLive.Index, :edit
        live "/songbooks/:id", SongbookLive.Show, :show
        live "/songbooks/:id/show/edit", SongbookLive.Show, :edit
      end
    end
  end
  # Other scopes may use custom stacks.
  # scope "/api", BookshelfWeb do
  #   pipe_through :api
  # end

  # Enable LiveDashboard and Swoosh mailbox preview in development
  if Application.compile_env(:bookshelf, :dev_routes) do
    # If you want to use the LiveDashboard in production, you should put
    # it behind authentication and allow only admins to access it.
    # If your application does not have an admins-only section yet,
    # you can use Plug.BasicAuth to set up some basic authentication
    # as long as you are also using SSL (which you should anyway).
    import Phoenix.LiveDashboard.Router

    scope "/dev" do
      pipe_through :browser

      live_dashboard "/dashboard", metrics: BookshelfWeb.Telemetry
      forward "/mailbox", Plug.Swoosh.MailboxPreview
    end
  end
end
