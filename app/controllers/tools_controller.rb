class ToolsController < ApplicationController

  def index
    @tools = Tool.all
  end

  def show
    @tool = Tool.find(params[:id])
  end

  def new
    @tool = Tool.new
  end

  def create
    @user = current_user
    @tool = @user.tools.new(tool_params)
    if @tool.save
      flash[:success] = "You created a new tool!!!"
      redirect_to user_path(@user) # Rails is 'smart' enough to also do => 'redirect_to @tool'
    else
      flash[:error] = "Nope!! Not on my watch!!!"
      render :new
    end
  end

  def edit
    # @tool = Tool.find(params[:id])
    @tool = find_tool
  end

  def update
    @tool = find_tool
    if @tool.update(tool_params)
      redirect_to tool_path(@tool)
    else
      render :edit
    end
  end

  def destroy
    @tool = find_tool
    @tool.destroy
    redirect_to tools_path
  end

  private

  def find_tool
    @tool = Tool.find(params[:id])
  end

  def tool_params
    params.require(:tool).permit(:name, :price, :quantity)
  end

end
