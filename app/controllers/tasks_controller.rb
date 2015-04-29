class TaskController < ActionController::Base
    def complete_task
      sub = Subscription.find(params[:sub_id])
      run = Run.find(params[:run_id])
      @task = Task.create! (:subscription_id => sub.id, :run_id => run.id, :qty => sub.qty)
      render json: @task
    end
end
