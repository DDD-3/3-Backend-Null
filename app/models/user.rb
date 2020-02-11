class User < ApplicationRecord
    has_many :posts, dependent: :destroy
    # TODO : password는 추후 어떻게 처리할지 정하여 다시 작업 필요
    #has_secure_password
end
