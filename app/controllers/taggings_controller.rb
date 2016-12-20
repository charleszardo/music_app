class TaggingsController < ApplicationController
  def create
    @tagging = Tagging.new(tagging_params)

    @tagging.save
    redirect_to root_url
  end

  private
  def tagging_params
    params.require(:tagging).permit(:tag, :taggable_id, :taggable_type)
  end
end
