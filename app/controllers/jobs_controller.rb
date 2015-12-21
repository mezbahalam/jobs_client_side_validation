class JobsController < ApplicationController
  before_action :find_job, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index, :show]

  def index
    @jobs = Job.all.order("created_at DESC")
  end

  def show
  end

  def new
    @job = current_user.jobs.build
     # @maximum_length = Job.validators_on( :description ).second.options[:maximum]

  end

  def create
    @job = current_user.jobs.build(job_params)
     # @maximum_length = Job.validators_on( :description ).second.options[:maximum]

    if @job.save
      redirect_to @job, notice: "Job was successfully created"
    else
      render 'new'
    end

  end


  def edit
         # @maximum_length = Job.validators_on( :description ).second.options[:maximum]

  end

  def update
    if @job.update(job_params)
      redirect_to @job, notice: "Job was successfully updated"
    else
      render 'edit'
    end
  end

  def destroy
    @job.destroy
    redirect_to root_path
  end

  def upvote
    @job.upvote_by current_user
    redirect_to :back
  end

  private

  def job_params
    params.require(:job).permit(:title, :description)
  end

  def find_job
    @job = Job.find(params[:id])
  end

end