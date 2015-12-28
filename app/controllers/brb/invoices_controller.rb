module Brb
  class InvoicesController < ApplicationController

    def index
    end

    def new
      @invoice = Invoice.new
    end

    def create
      @invoice = Invoice.new(set_params)

      if @invoice.save
        redirect_to action: 'index'
      else
        render action: 'new'
      end
    end

    private

    def set_params
      params.require(:invoice).permit(:category_id)
    end
  end
end