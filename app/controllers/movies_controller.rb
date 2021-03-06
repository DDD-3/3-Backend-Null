class MoviesController < ApplicationController
    require 'rest-client'

    def show
        # NOTE : kmdb의 pk는 movieId + movieSeq으로 이루어짐
        #        따라서 id를 전달받는 방식은 pk키인 docId로 전달받고, 파싱해서 movieId와 movieSeq로 검색하도록 함
        #        movieSeq로만 검색하면 중복되는 값이 있기 때문에 위와 같이 검색함

        movie_pk = params[:id]
        response = RestClient.get ENV["MOVIE_ENDPOINT"], params: {
            collection: "kmdb_new",
            movieId: movie_pk[0],
            movieSeq: movie_pk[1..],
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
        # TODO : 매일 24시에 박스오피스가 업데이트 되고 오전동안 계속 수정되기 때문에 매일 12시, 24시에 박스오피스 정보를 업데이트 하고, 해당 정보를 뿌려주도록 함
        #        또한 영화 검색과 통일된 형식에 맞게 보내줄 수 있도록 kmdb에 재검색 또는 가공된 형태의 json형식으로 보내줘야 함
        response = RestClient.get ENV["BOXOFFICE_ENDPOINT"], params: {
            key: ENV["BOXOFFICE_API_KEY"],
            targetDt: Date.yesterday.to_s(:number)
        }

        render json: response
    end
end
