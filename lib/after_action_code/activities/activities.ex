defmodule AfterActionCode.Activities do

  use Ash.Domain


  resources do
    resource AfterActionCode.Activities.ActivityLog do
      define :log, args: [:action, :resource_type, :resource_id, :details], action: :log
      define :list_activities, action: :list
      define :for_resource, args: [:resource_type, :resource_id], action: :for_resource
    end
  end

 
end
