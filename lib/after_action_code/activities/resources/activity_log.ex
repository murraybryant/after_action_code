defmodule AfterActionCode.Activities.ActivityLog do
  use Ash.Resource,
    domain: AfterActionCode.Activities,
    data_layer: AshPostgres.DataLayer


    postgres do
      table "activity_logs"
      repo AfterActionCode.Repo
    end

    attributes do
      uuid_primary_key :id
      attribute :action, :atom, allow_nil?: false
      attribute :resource_type, :string, allow_nil?: false
      attribute :resource_id, :string, allow_nil?: false
      attribute :details, :map
      create_timestamp :created_at
    end

    actions do
      create :log do
        accept [:action, :resource_type, :resource_id, :details]
      end

      read :list do
        prepare build(sort: [created_at: :desc])
      end

      read :for_resource do
        argument :resource_type, :string
        argument :resource_id, :string

        filter expr(resource_type == ^arg(:resource_type) and resource_id == ^arg(:resource_id))
      end
    end
end
