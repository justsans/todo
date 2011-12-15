class TasksController < ApplicationController
  # GET /tasks
  # GET /tasks.json
  def index
    @tasks = Task.all
    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @tasks }
      format.js
    end
  end

  def index_high
    @tasks = Task.find_by_priority_and_complete(1, false);

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @tasks }
    end
  end

  def index_medium
    @tasks = Task.find_by_priority_and_complete(2, false)

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @tasks }
    end
  end

  def index_low
    @tasks = Task.find_by_priority_and_complete(3, false)

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @tasks }
    end
  end

  def index_done
    @tasks = Task.find_by_complete(true)

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @tasks }
    end
  end


  # GET /tasks/1
  # GET /tasks/1.json
  def show
    @task = Task.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @task }
    end
  end

  # GET /tasks/new
  # GET /tasks/new.json
  def new
    @task = Task.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @task }
    end
  end

  # PUT /tasks/1/edit
  def edit
    @task = Task.find(params[:id])
  end

  # PUT /tasks/1/do
  def do
    @task = Task.find(params[:id])
    @task.complete=true;
    @task.save;
    respond_to do |format|
      format.js
      format.html
    end
  end

  # PUT /tasks/1/undo
  def undo
    @task = Task.find(params[:id])
    @task.complete=false;
    @task.save;
    respond_to do |format|
      format.js
      format.html
    end
  end

  # POST /tasks
  # POST /tasks.json
  def create
    @task = Task.new(params[:task])
    if @task.save
      redirect_to tasks_path, :notice => 'Task was successfully created.'
    else
      format.html { render :action => "new" }
      format.json { render :json => @task.errors, :status => :unprocessable_entity }
    end
  end

  # PUT /tasks/1
  # PUT /tasks/1.json
  def update
    @task = Task.find(params[:id])

    respond_to do |format|
      if @task.update_attributes(params[:task])
        format.html { redirect_to @task, :notice => 'Task was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @task.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /tasks/1
  # DELETE /tasks/1.json
  def destroy
    @task = Task.find(params[:id])
    @task.destroy

    respond_to do |format|
      format.html { redirect_to tasks_url }
      format.json { head :ok }
    end
  end
end
