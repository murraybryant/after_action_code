defmodule AfterActionCode.TaskTest do
  use ExUnit.Case, async: true
  require Ash.Query

  setup do
    Ecto.Adapters.SQL.Sandbox.checkout(AfterActionCode.Repo)
    Ecto.Adapters.SQL.Sandbox.mode(AfterActionCode.Repo, {:shared, self()})
    :ok
  end

  describe "task creation" do
    test "create task" do
      task = AfterActionCode.Projects.create_task("Test Task")
      assert {:ok, %AfterActionCode.Projects.Task{} = _task} = task
    end

    test "create task with activity log" do
      task = AfterActionCode.Projects.create_task("Test Task")
      assert {:ok, %AfterActionCode.Projects.Task{} = task} = task
      activity_logs = AfterActionCode.Activities.for_resource!("Task", task.id)
      assert length(activity_logs) == 1
    end
  end

  describe "test create activity log" do
    test "create activity" do
      assert {:ok,_activity} = AfterActionCode.Activities.log(:create_task, "Task", "1000", %{title: "Test Task"})
      activity_logs = AfterActionCode.Activities.for_resource!("Task", "1000")
      assert length(activity_logs) == 1
    end



  end

end
