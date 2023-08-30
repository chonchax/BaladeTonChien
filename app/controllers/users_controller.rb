class UsersController < ApplicationController
  def index
    @users = User.all
    # The `geocoded` scope filters only users with coordinates
    @markers = @users.geocoded.map do |user|
      {
        lat: user.latitude,
        lng: user.longitude,
        info_window_html: render_to_string(partial: "info_window", locals: { user: user }),
        marker_html: render_to_string(partial: "marker")
      }
    end
  end
end
