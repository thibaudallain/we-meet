class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  def home
    @bars = retrieve_bars
  end
end
