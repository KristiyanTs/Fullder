class ProblemsController < ApplicationController

  before_action :set_restaurant, only: [:show, :edit, :update, :destroy]

  def index
    @problems = Problem.all.page(params[:page]).per(12)
  end

  def show
  end

  def new
    @problem = Problem.new
  end

  def edit
  end

  def create
    @problem = Problem.new(problem_params)

    respond_to do |format|
      if @problem.save
        format.html do
          redirect_to new_problem_path,
                      flash: { notice: 'Your problem was successfully sent. Thank you!' }
        end
        format.json { render :show, status: :created, location: @problem }
      else
        format.html { render :new }
        format.json { render json: @problem.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @problem.update(poblem_params)
        format.html { redirect_to edit_problem_path(@problem), flash: { notice: 'Problem was successfully updated.' } }
        format.json { render :edit, status: :ok, location: @problem }
      else
        format.html { render :edit }
        format.json { render json: @problem.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @problem.destroy
    respond_to do |format|
      format.html { redirect_to new_problem_path, flash: { notice: 'Problem was successfully removed.' } }
      format.json { head :no_content }
      format.js
    end
  end

  private 

  def set_problem
    @problem = Problem.find(params[:id])
  end

  def problem_params
    params.require(:problem).permit(:email, :title, :description)
  end
end
