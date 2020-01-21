class MoviesController < ApplicationController
    require 'rest-client'

    def show
        render json: { status: :not_found }
    end

    def search
        response = RestClient.get "http://api.koreafilm.or.kr/openapi-data2/wisenut/search_api/search_json.jsp", params: {
            collection: "kmdb_new",
            listCount: 1,
            title: params[:title],
            ServiceKey: ""
        }

        render json: response
    end

    def boxoffice
    end

    private
    # 추후 보이지 않게 수정이 필요함
    # 커밋할 때 지우고 커밋 필요
    def API_KEY
        return ""
    end

    def MOVIE_ENDPOINT
        return "http://api.koreafilm.or.kr/openapi-data2/wisenut/search_api/search_json.jsp"
    end
end
