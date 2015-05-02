class RunsController < ApplicationController

  def begin_run
    route_id = params[:route_id]
    run_type = params[:run_type]
    user_ids = params[:user_ids]
    users = User.find(user_ids)
    @run = Run.create!(:route_id => route_id, :am_pm => run_type, datetime_started => DateTime.now())
    run.users = users
    render json: {:run => @run }
  end

  def end_run
    @run = Run.find(params[:run_id])
    run.datetime_ended = Datetime.now()
    render json: {:run => @run }
  end

  def get_run_progress
    @run = run.find(params[:run_id])
    render json: {:run => @run, :progress => @run.get_run_progress}
  end

end
