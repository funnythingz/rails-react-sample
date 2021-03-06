module Api
  class EntriesController < ApplicationController
    def index
      @entries = Entry.all.order(created_at: :desc)
      render json: @entries
    end

    def show
      @entry = Entry.find_by_id(params[:id])
    end

    def create
      @entry = Entry.new(entry_params)

      if @entry.save
        render json: @entry, status: :created
      else
        render json: @entry.errors, status: :unprocessable_entity
      end
    end

    private

    def entry_params
      params.require(:entries).permit(:title, :content)
    end
  end
end
