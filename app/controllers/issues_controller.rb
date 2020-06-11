class IssuesController < ApplicationController
  def index
    @issues = Issue.all
  end

  def new
    @issue = Issue.new
  end

  def show
    @issue = Issue.find_by_id(params[:id])
  end

  def create
    @issue = Issue.new(params_to_permit_new)
    @issue.open = true
    @issue.user = current_user
    if @issue.save
      redirect_to issues_path
    else
      render :new
    end
  end

  def destroy
    Issue.find_by_id(params[:id]).destroy
    redirect_to issues_path
  end

  private

  def params_to_permit_new
    params.require(:issue).permit(:title, :issue)
  end
end
