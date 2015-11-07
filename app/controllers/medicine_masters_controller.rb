class MedicineMastersController < ApplicationController
  def index
    return @medicine_masters = [] unless params[:keyword]

    keywords = params[:keyword].tr('　',' ').split

    @medicine_masters = MedicineMaster
    keywords.each do |key|
      @medicine_masters = @medicine_masters.where('name like ? or yomi like ?', "%#{key}%",  "%#{key}%")
    end
  end
end
