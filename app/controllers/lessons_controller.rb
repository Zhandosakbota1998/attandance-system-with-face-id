class LessonsController < ApplicationController
  before_action :set_lesson, only: [:show, :edit, :update, :destroy]

  # GET /lessons
  # GET /lessons.json
  def index
    @lessons = Lesson.where(subject: params[:subject_id])
    @subject = Subject.find(params[:subject_id])
    @group = Group.find(params[:group_id])
  end

  # GET /lessons/1
  # GET /lessons/1.json
  def show
    @group = Group.find(params[:group_id])
    @subject = Subject.find(params[:subject_id])
  end

  # GET /lessons/new
  def new
    @group = Group.find(params[:group_id])
    @subject = Subject.find(params[:subject_id])
    @lesson = Lesson.new(subject_id: params[:subject_id])
  end

  # GET /lessons/1/edit
  def edit
    @group = Group.find(params[:group_id])
    @subject = Subject.find(params[:subject_id])
  end

  # POST /lessons
  # POST /lessons.json
  def create
    @lesson = Lesson.new(lesson_params)
    @lesson.start_time = DateTime.current

    respond_to do |format|
      if @lesson.save
        format.html { redirect_to group_subject_lesson_live_path(params[:group_id], params[:subject_id], @lesson), notice: 'Lesson was successfully created.' }
        format.json { render :show, status: :created, location: group_subject_lesson_live_path(params[:group_id], params[:subject_id], @lesson) }
      else
        @group = Group.find(params[:group_id])
        @subject = Subject.find(params[:subject_id])
        format.html { render :new }
        format.json { render json: @lesson.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /lessons/1
  # PATCH/PUT /lessons/1.json
  def update
    @lesson.end_time = DateTime.now
    respond_to do |format|
      if @lesson.update(lesson_params)
        format.html { redirect_to group_subject_lesson_path(params[:group_id], params[:subject_id], @lesson), notice: 'Lesson was successfully updated.' }
        format.json { render :show, status: :ok, location: group_subject_lesson_path(params[:group_id], params[:subject_id], @lesson) }
      else
        format.html { render :edit }
        format.json { render json: @lesson.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /lessons/1
  # DELETE /lessons/1.json
  def destroy
    @lesson.destroy
    respond_to do |format|
      format.html { redirect_to group_subject_lessons_path(), notice: 'Lesson was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def live
    @group = Group.find(params[:group_id])
    @subject = Subject.find(params[:subject_id])
    @lesson = Lesson.find(params[:lesson_id])
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_lesson
      @lesson = Lesson.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def lesson_params
      params.require(:lesson)
        .merge(subject_id: params[:subject_id])
        .permit(:name, :start_time, :end_time, :subject_id, student_ids: [])
    end
end
