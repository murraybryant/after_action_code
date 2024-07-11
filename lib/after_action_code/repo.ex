defmodule AfterActionCode.Repo do
  use AshPostgres.Repo, otp_app: :after_action_code

  # Installs extensions that ash commonly uses
  def installed_extensions do
    ["ash-functions", "uuid-ossp", "citext"]
  end
end
