class Admin::CoursesController < Admin::ApplicationController
  def index
    @courses = Course.all
  end

  def create
    @course = Course.new course_params.slice(:name, :video_url, :description)
    
    if course_params[:is_recommend] == "yes"
      @course.is_recommend = true
    else
      @course.is_recommend = false
    end

    if @course.save
      if course_params[:cover_image]
        attachment = Attachment.create file: course_params[:cover_image]
        @course.update cover_image_id: attachment.id
      end

      @course.score = Score.find course_params[:score_id]
      create_tag_map(@course)
      redirect_to admin_courses_path
    else
      render "new"
    end
  end

  def update
    @course = Course.find params[:id]
    @course.assign_attributes course_params.slice(:name, :video_url, :description)
    
    if course_params[:is_recommend] == "yes"
      @course.is_recommend = true
    else
      @course.is_recommend = false
    end

    if @course.save
      if course_params[:cover_image]
        attachment = Attachment.create file: course_params[:cover_image]
        @course.update cover_image_id: attachment.id
      end

      @course.score = Score.find course_params[:score_id]
      @course.course_tags.destroy_all if @course.course_tags
      create_tag_map(@course)
      redirect_to admin_courses_path
    else
      render 'edit'
    end
  end

  def destroy
    course = Course.find params[:id]
    # course.audio.destroy if course.audio
    course.course_tags.destroy_all
    course.destroy
    head :ok
  end

  def new
    @course = Course.new
    @tags = Tag.all
  end

  def edit
    @course = Course.find params[:id]
    @tags = Tag.all
  end

  def show
    @course = Course.find params[:id]
  end

  private
  def course_params
    params.require(:course).permit(:name, :is_recommend, :video_url, :score_id, :cover_image, :description)
  end

  def create_tag_map(course)
      tag_string = params[:tag].strip
      if tag_string
        tag_list = tag_string.split
        tag_list.each do |t|
          old_tag = Tag.find_by_name(t)
          if old_tag
            CourseTag.create(tag_id: old_tag.id, course_id: course.id)
          else
            tag = Tag.create(name: t)
            CourseTag.create(tag_id: tag.id, course_id: course.id)
          end
        end
      end
    end
end
