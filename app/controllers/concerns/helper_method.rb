module HelperMethod
  extend ActiveSupport::Concern

  included do
    helper_method :page_identifier
  end

  def page_identifier
    # admin/courses#index => admin-courses_index
    controller = params[:controller].tr("/","-")
    action = params[:action]
    "page-#{controller} _#{action}"
  end

end
