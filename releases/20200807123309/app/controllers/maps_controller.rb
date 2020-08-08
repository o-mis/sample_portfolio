class MapsController < ApplicationController
  def index
    @microposts = Micropost.all
  end
end
