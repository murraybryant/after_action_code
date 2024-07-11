defmodule AfterActionCode.Projects do
  use Ash.Domain


  resources do
    resource AfterActionCode.Projects.Task do
      define :create_task, args: [:title], action: :create_task
    end
  end


end
