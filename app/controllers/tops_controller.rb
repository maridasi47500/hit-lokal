class TopsController < ApplicationController
  def index
    @debutsem = Date.today.wday > 0 ? Date.today.last_week.sunday : Date.today
    @finsem = (Date.today.wday > 0 ? Date.today.monday : Date.today.next_week)+5.days
    @clips=View.mysql
    @clip=@clips.take(1)
    if params[:cat]
      @clips=View.mysqlbytype(params[:cat])
    elsif params[:region]
      @clips=View.mysqlbyregion(params[:region])

    end
    @clips=Kaminari.paginate_array(@clips).page(params[:page]).per(10)
  end
end
