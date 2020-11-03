defmodule TimemanagerbackendWeb.Router do
  use TimemanagerbackendWeb, :router

  pipeline :browser do
    plug(:accepts, ["html"])
    plug(:fetch_session)
    plug(:fetch_flash)
    plug(:protect_from_forgery)
    plug(:put_secure_browser_headers)
  end

  pipeline :cors_pipe do
    plug(CORSPlug, origin: "http://localhost:8080/")
    plug(:accepts, ["json"])
  end

  pipeline :authenticate do
    plug(TimemanagerbackendWeb.Plugs.Authenticate)
  end

  scope "/swagger" do
    forward("/", PhoenixSwagger.Plug.SwaggerUI,
      otp_app: :timemanagerbackend,
      swagger_file: "swagger.json"
    )
  end

  scope "/" do
    pipe_through(:cors_pipe)

    scope "/sessions" do
      post("/sign_up", TimemanagerbackendWeb.SessionsController, :sign_up)
      post("/sign_in", TimemanagerbackendWeb.SessionsController, :sign_in)
      # delete("/sign_out", TimemanagerbackendWeb.SessionsController, :sign_out)
    end

    get("/test", TimemanagerbackendWeb.TestController, :index)
    get("/test/roles", TimemanagerbackendWeb.TestController, :roles)

    scope "/api", TimemanagerbackendWeb do
      pipe_through(:authenticate)

      # scope "/test" do
      # end

      resources("/users", UserController, except: [:new])
      # more routes

      get("/workingtimes/:userID", WorkingTimeController, :show)
      get("/workingtimes/:userID/:workingtimeID", WorkingTimeController, :show)
      post("/workingtimes/:userID", WorkingTimeController, :create)
      put("/workingtimes/:id", WorkingTimeController, :update)
      delete("/workingtimes/:id", WorkingTimeController, :delete)

      # resources("/workingtimes", WorkingTimeController, only: [:edit, :create, :update, :delete])

      get("/clock/:id", ClockController, :show)
      post("/clock/:id", ClockController, :toggle)

      get("/teams", TeamController, :index)
      get("/teams/:id", TeamController, :show)
      post("/teams", TeamController, :create)
      put("/teams/:id/:userID", TeamController, :add)
      put("/teams/:id", TeamController, :update)
      delete("/teams/:id", TeamController, :delete)
      delete("/teams/:id/:userID", TeamController, :delete)
    end
  end

  def swagger_info do
    %{
      info: %{
        version: "1.0",
        title: "TimeManager"
      }
    }
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
