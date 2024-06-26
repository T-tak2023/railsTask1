class PlansController < ApplicationController
  def index
    @plans = Plan.all
  end

  def new
    @plan = Plan.new
  end

  def create
    @plan = Plan.new(params.require(:plan).permit(:title, :start_date, :end_date, :all_day, :memo))
    if @plan.save
      flash[:notice] = "予定を新規登録しました"
      redirect_to :plans
    else
      render "new"
    end
  end

  def show
    @plan = Plan.find(params[:id])
  end

  def edit
    @plan = Plan.find(params[:id])
  end

  def update
    @plan = Plan.find(params[:id])
    if @plan.update(params.require(:plan).permit(:title, :start_date, :end_date, :all_day, :memo))
      flash[:notice] = "IDが「#{@plan.id}」の予定を更新しました"
      redirect_to :plans
    else
      render "edit"
    end
  end

  def destroy
    @plan =  Plan.find(params[:id])
    @plan.destroy
    flash[:notice] = "予定を削除しました"
    redirect_to :plans    
  end
end
