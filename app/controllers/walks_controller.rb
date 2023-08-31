class WalksController < ApplicationController
  def index
    @walks = Walk.all

    if params[:query].present?
      sql_subquery = "title @@ :query OR description @@ :query"
      @walks = @walks.where(sql_subquery, query: "%#{params[:query]}%")
    else
      @walks = Walk.all
    end

    @dog = current_user.dog

    # Insere toutes les balades sur la map
    @markers = @walks.map do |walk|
      {
        lat: walk.start_address_latitude,
        lng: walk.start_address_longitude,
        info_window_html: render_to_string(partial: "info_window", locals: { walk: walk }),
        marker_html: render_to_string(partial: "marker")
      }
    end

    # si on veut que le current user

    # si on veut tout les users

    # @users = User.all
    # @users.geocoded.map do |user|
    #   @markers << {
    #     lat: user.latitude,
    #     lng: user.longitude,
    #     # info_window_html: render_to_string(partial: "info_window_user", locals: { user: user }),
    #     marker_html: render_to_string(partial: "marker_user")
    #   }
    # end
  end

  def show
    @walk = Walk.find(params[:id])
    @walk_geometry = @walk.geometry
    @markers = [{
      lat: @walk.start_address_latitude, lng: @walk.start_address_longitude,
      marker_html: render_to_string(partial: "marker"),
      info_window_html: render_to_string(partial: "info_window", locals: { walk: @walk })
    }]
  end
end
