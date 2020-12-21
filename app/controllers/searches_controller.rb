class SearchesController < ApplicationController
    def search

    @user  = User.search(params[:search])

    end
end
