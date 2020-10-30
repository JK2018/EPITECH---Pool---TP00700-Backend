defmodule TimemanagerbackendWeb.Router do
  use TimemanagerbackendWeb, :router

  pipeline :browser do
    plug(:accepts, ["html"])
    plug(:fetch_session)
    plug(:fetch_flash)
    plug(:protect_from_forgery)
    plug(:put_secure_browser_headers)
  end

  pipeline :authenticate do
    plug(TimemanagerbackendWeb.Plugs.Authenticate)
  end

  pipeline :test do
    plug CORSPlug, origin: "http://localhost:8080/"
    plug :accepts, ["json"]
  end

   scope "/" do
    pipe_through :test
    scope "/sessions" do
      post("/sign_up", TimemanagerbackendWeb.SessionsController, :sign_up)
      post("/sign_in", TimemanagerbackendWeb.SessionsController, :sign_in)
      # delete("/sign_out", TimemanagerbackendWeb.SessionsController, :sign_out)
    end


    scope "/api", TimemanagerbackendWeb do
      pipe_through(:authenticate)

      scope "/test" do
        get("/", TimemanagerbackendWeb.TestController, :index)
        get("/roles", TimemanagerbackendWeb.TestController, :roles)
      end

      resources("/users", UserController, except: [:new])
      # more routes

      resources("/workingtimes", UserController, except: [:new, :index])

      resources("/clocks", ClockController, only: [:show, :create])
    end
   end


  # Enables LiveDashboard only for development
  #
  # If you want to use the LiveDashboard in production, you should put
  # it behind authentication and allow only admins to access it.
  # If your application does not have an admins-only section yet,
  # you can use Plug.BasicAuth to set up some basic authentication
  # as long as you are also using SSL (which you should anyway).
  if Mix.env() in [:dev, :test] do
    import Phoenix.LiveDashboard.Router

    scope "/" do
      pipe_through(:browser)
      live_dashboard("/dashboard", metrics: TimemanagerbackendWeb.Telemetry)
    end
  end
end
