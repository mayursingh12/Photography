class Admin::EnquiriesController < Admin::BaseController

  before_filter :authenticate_admin

  def index
    @enquiries = Enquiry.all.paginate(:page => params[:page], :per_page => 20)
  end

end