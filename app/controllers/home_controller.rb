class HomeController < ApplicationController
  def index
    query = "{allGroups{
      id
      name
    }}" 
  
    exe = BillsplitSchema.execute(query)
  
    @group = exe['data']['allGroups']
  end

  helper_method :find_user
  def find_user(group)
    query = "{
      findUsers(groupId: \""+group["id"]+"\"){
        email
      }
    }"

    exe = BillsplitSchema.execute(query)
    exe["data"]["findUsers"]
  end
end
