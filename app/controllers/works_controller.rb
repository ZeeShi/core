class WorksController < ApplicationController
  def index
    @works = Work.published.recent
    @featured_works = Work.featured.published.recent
  end

  def show
    @work = Work.find_by!(slug: params[:id])
  end
end
