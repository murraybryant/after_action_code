# AfterActionCode

Example of issue using after action in the task.ex

#mix test test/after_action_code/test_task.exs

This is the three IO.inspects in the code

IO.inspect(changeset)
```elixir
#Ash.Changeset<
  domain: AfterActionCode.Projects,
  action_type: :create,
  action: :create_task,
  attributes: %{
    id: "b3f45789-a435-4582-af0d-fd02ba39a0d7",
    title: "Test Task",
    created_at: ~U[2024-07-11 10:10:02.594657Z],
    updated_at: ~U[2024-07-11 10:10:02.594657Z]
  },
  relationships: %{},
  errors: [],
  data: #AfterActionCode.Projects.Task<
    __meta__: #Ecto.Schema.Metadata<:built, "tasks">,
    id: nil,
    title: nil,
    created_at: nil,
    updated_at: nil,
    aggregates: %{},
    calculations: %{},
    ...
  >,
  context: %{changed?: true},
  valid?: true
>

IO.inspect(record)

#AfterActionCode.Projects.Task<
  __meta__: #Ecto.Schema.Metadata<:loaded, "tasks">,
  id: "b3f45789-a435-4582-af0d-fd02ba39a0d7",
  title: "Test Task",
  created_at: ~U[2024-07-11 10:10:02.594657Z],
  updated_at: ~U[2024-07-11 10:10:02.594657Z],
  aggregates: %{},
  calculations: %{},
  ...
>

IO.inspect(results)

#this changeset does not corrospond to the activity_log

{:error,
 %Ash.Error.Invalid{
   changeset: "#Changeset<>", 
   errors: [
     %Ash.Error.Changes.InvalidAttribute{
       field: :action,
       message: "is invalid",
       private_vars: nil,
       value: %Ash.Resource.Actions.Create{
         name: :create_task,
         primary?: false,
         description: nil,
         error_handler: nil,
         accept: [:title],
         require_attributes: [],
         allow_nil_input: [],
         manual: nil,
         notifiers: [],
         touches_resources: [],
         delay_global_validations?: false,
         skip_global_validations?: false,
         upsert?: false,
         upsert_identity: nil,
         upsert_fields: nil,
         arguments: [],
         changes: [],
         reject: [],
         metadata: [],
         transaction?: true,
         type: :create
       },
       splode: Ash.Error,
       bread_crumbs: [],
       vars: [],
       path: [],
       stacktrace: #Splode.Stacktrace<>,
       class: :invalid
     }
   ]
 }}