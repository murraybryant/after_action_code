defmodule AfterActionCode.Projects.Task do
  use Ash.Resource,
    domain: AfterActionCode.Projects,
    data_layer: AshPostgres.DataLayer

  postgres do
    table "tasks"
    repo AfterActionCode.Repo
  end

  attributes do
    uuid_primary_key :id
    attribute :title, :string, allow_nil?: false
    create_timestamp :created_at
    update_timestamp :updated_at
  end

  actions do
    create :create_task do
      accept [:title]
    end
  end

  changes do
    change after_action(fn changeset, record, _context ->
            IO.inspect(changeset)
            IO.inspect(record)
             results =
               AfterActionCode.Activities.log(
                 changeset.action.name,
                 "Task",
                 record.id,
                 %{title: record.title}
               )

             IO.inspect(results)

             {:ok, record}
           end)
  end
end
