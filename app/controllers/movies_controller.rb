class MoviesController < ApplicationController
    require 'rest-client'

    def show
        response = RestClient.get ENV["MOVIE_ENDPOINT"], params: {
            collection: "kmdb_new",
            movieSeq: params[:id],
            # 일반적인 제목 외에 더 정확한 정보를 위해서 키워드, 감독(박스오피스 등을 검색 후에 정보가 있는 경우), 제작/개봉일(박스오피스 등을 검색 후에 정보가 있는 경우)과 같은 정보를 추가해줘야 함
            ServiceKey: ENV["MOVIE_API_KEY"]
        }

        render json: response
    end

    def search
        response = RestClient.get ENV["MOVIE_ENDPOINT"], params: {
            collection: "kmdb_new",
            listCount: 1,
            title: params[:title],
            # 일반적인 제목 외에 더 정확한 정보를 위해서 키워드, 감독(박스오피스 등을 검색 후에 정보가 있는 경우), 제작/개봉일(박스오피스 등을 검색 후에 정보가 있는 경우)과 같은 정보를 추가해줘야 함
            ServiceKey: ENV["MOVIE_API_KEY"]
        }

        render json: response
    end

    def boxoffice
        # 매일 24시에 박스오피스가 업데이트 되고 오전동안 계속 수정되기 때문에 매일 12시, 24시에 박스오피스 정보를 업데이트 하고, 해당 정보를 뿌려주도록 함
    end
end
