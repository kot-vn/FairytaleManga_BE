require 'jwt'

class JsonWebToken
  SECRET_KEY = 'password'

  def self.encode(payload, exp = 24.hours.from_now)
    payload[:exp] = exp.to_i
    JWT.encode(payload, SECRET_KEY)
  end

  def self.decode(token)
    decoded = JWT.decode(token, SECRET_KEY)[0]
    HashWithIndifferentAccess.new decoded
  end

  def self.authorized_user
    if decode(token)
      admin_id = decode(token)[0]
      @admin = Admin.find_by(id: admin_id)
    end
  end

  def authorize
    render json: {
      message: "You need to login"
    }, status: 400 unless authorized_user
  end
end
