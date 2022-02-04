module Authorization
  extend ActiveSupport::Concern

  included do
    private

    def user_not_authorized
      redirect_to(request.referer || root_path)
    end
  end
end
