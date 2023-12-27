class GroupsController < ApplicationController
  def new
      @group = Group.new()
      
  end

  def create

      @name = group_params["name"] 
      @emails = group_params["emails"].split(",")    

      query_for_group = "mutation{
      createGroup(
          input:{
          name: \""+ @name +"\", users: " + @emails.to_s + "
          }
      ){
          id
          name
      }
      }"

      @group = BillsplitSchema.execute(query_for_group)

      puts = query_for_group

      redirect_to root_path 
  
  end

  def group_params
      params.require(:group).permit(:emails, :name)
  end
  def show
    query_for_group = "{
      fetchGroup(groupId: \""+params[:id]+"\"){
        id
        name
      }
    }"
    @group = BillsplitSchema.execute(query_for_group)

  end

  helper_method :find_user, :find_expense
  def find_user(group)
    query = "{
      findUsers(groupId: \""+params[:id]+"\"){
        id
        email
      }
    }"

    exe = BillsplitSchema.execute(query)
    exe["data"]["findUsers"]
  end


  def find_expense(user_id)
    query_for_expense = "{
      fetchExpense(groupId: \""+params[:id]+"\", userId: \""+user_id+"\"){
        amount
      }
    }"

    exe = BillsplitSchema.execute(query_for_expense)
    if exe["data"]
      exe["data"]["fetchExpense"]
    else
      ["amount": nil]
    end
  end
end