class MedicineMastersController < ApplicationController
  def index
    keywords = params[:keyword].tr('　',' ').split
    @medicine_masters = MedicineMaster
    keywords.each do |key|
      @medicine_masters = @medicine_masters.where('name like ?', "%#{key}%")
    end
    @medicine_masters = [] unless params[:keyword]
  end
end
