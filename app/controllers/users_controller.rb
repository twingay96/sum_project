class UsersController < ApplicationController
    before_action :authenticate_user!
    # 모든 users 보는 액션
    def index
        @users = User.all
    end
    # 특정 user 페이지 액션
    def show
        @user = User.find(params[:id])
    end
end