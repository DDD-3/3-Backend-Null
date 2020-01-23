class MoviesController < ApplicationController
    require 'rest-client'

    def show
        render json: { status: :not_found }
    end

    def search
        response = RestClient.get ENV["MOVIE_ENDPOINT"], params: {
            collection: "kmdb_new",
            listCount: 1,
            title: params[:title],
            # 일반적인 제목 외에 더 정확한 정보를 위해서 키워드, 감독(박스오피스 등을 검색 후에 정보가 있는 경우), 제작/개봉일(박스오피스 등을 검색 후에 정보가 있는 경우)
            ServiceKey: ENV["MOVIE_API_KEY"]
        }

        render json: response
    end

    def boxoffice
    end
end
