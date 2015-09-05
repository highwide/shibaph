class DailyProgressesController < ApplicationController
  permits :progress, :practice_id, :goal

  def new(practice_id:)
    @daily_progress = DailyProgress.new practice_id: practice_id
    render json: @daily_progress, status: 201
  end

  def create(daily_progress)
    @daily_progress = DailyProgress.new daily_progress
    @daily_progress.done_at = Time.zone.today
    if @daily_progress.save
      render json: @daily_progress, status: 201, notice: '更新しました'
    else
      render json: { errors: @daily_progress.errors.full_messages }, status: 422
    end
  end
end
