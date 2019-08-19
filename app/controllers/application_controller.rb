class ApplicationController < ActionController::API

    def secret
        'WhatWouldFreddieDo'
    end

    def token
        request.headers['Authorization'].split(' ')[1] if request.headers['Authorization']
    end

    def encode_token(user)
        payload = {user_id: user.id}
        JWT.encode(payload, secret, 'HS256')
    end

    def decoded_token
        JWT.decode(token, secret, true, {algorithm: 'HS256'}) if token
    end

    def current_user
        user_id = decoded_token[0]['user_id'] if decoded_token
        User.find(user_id) if user_id
    end

end
