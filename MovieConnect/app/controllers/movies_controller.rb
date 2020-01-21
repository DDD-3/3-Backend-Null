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
            # 일반적인 제목 외에 더 정확한 정보를 위해서 키워드, 감독(박스오피스 등을 검색 후에 정보가 있는 경우), 제작/개봉일(박스오피스 등을 검색 후에 정보가 있는 경우)
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
