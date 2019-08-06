class ApplicationController < ActionController::API

    def secret
        'WhatWouldFreddieDo'
    end

    def token
        request.headers['Authorization'].split(' ')[1]
    end

    def encode_token(user)
        payload = {user_id: user.id}
        JWT.encode(payload, secret, 'HS256')
    end

    def decoded_token
        JWT.decode(token, secret, true, {algorithm: 'HS256'})
    end

    def current_user
        user_id = decoded_token[0]['user_id']
        User.find(user_id)
    end

end
