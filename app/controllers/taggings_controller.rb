class TaggingsController < ApplicationController
  def create
    @tagging = Tagging.new(tagging_params)

    @tagging.save
    redirect_to tagging_show
  end

  private
  def tagging_params
    params.require(:tagging).permit(:tag, :taggable_id, :taggable_type)
  end

  def tagging_show
    taggable = @tagging.taggable
    id = taggable.id
    type = taggable.class.to_s.downcase
    self.send("#{type}_url", id)
  end
end
