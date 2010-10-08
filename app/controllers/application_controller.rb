# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.
class ApplicationController < ActionController::Base
  
  class ErrorHttp_404 < StandardError; end
  class ErrorHttp_422 < StandardError; end

  helper :all # include all helpers, all the time
  protect_from_forgery # See ActionController::RequestForgeryProtection for details

  # Scrub sensitive parameters from your log
  # filter_parameter_logging :password
  rescue_from ErrorHttp_404, :with => :render_httperr_404
  rescue_from ErrorHttp_422, :with => :render_httperr_422

  def render_httperr (errortext, errno)
    @err = errortext
    @errno = errno
    respond_to do |type| 
      type.html { render :template => "errors/error", :status => @errno, :layout => 'error'} 
      type.all  { render :nothing => true, :status => @errno } 
    end
  end 

  def render_httperr_404 (errortext)
     render_httperr (errortext, 404)
     true
  end

  def render_httperr_422 (errortext)
     render_httperr(errortext, 422)
     true
  end
end
