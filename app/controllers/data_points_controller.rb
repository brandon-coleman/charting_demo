class DataPointsController < ApiController

  # GET /data_points or /data_points.json
  def index
    if params[:start].present? && params[:end].present?
      render json: DataPoint.where(timestamp: params[:start]..params[:end]).map{ |d| {x: d.timestamp, y: d.value }}
    else
      points = DataPoint.all
      @meta = {max: points.maximum(:timestamp), min: points.minimum(:timestamp)}
      render json: @meta

    end
  end
end
