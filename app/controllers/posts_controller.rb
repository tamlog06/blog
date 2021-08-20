class PostsController < ApplicationController

    def index
        @posts = Post.all.order(created_at: 'desc')
    end

    def show
        @post = Post.find(params[:id])
    end

    def new
        @post = Post.new
        # @user = User.find(params[:id])
    end

    def create
        # データの表示
        # render plain: params[:post].inspect

        # save
        # @post = Post.new(params[:post])
        # params[:user_id] = current_user[:id]
        # 送信されたデータが post をキーにして title と body があるハッシュかどうかを確認
        @post = Post.new(post_params)
        @post[:user_id] = current_user[:id]
        # debugger
        # validation に引っかからない場合
        if @post.save
            # redirect
            redirect_to posts_path
        else
            # エラーメッセージの表示
            # render plain: @post.errors.inspect
            render 'new'
        end
    end

    def edit
        @post = Post.find(params[:id])
        unless @post[:user_id] == current_user[:id]
            # flash.now[:danger] = "#{@post[:user_id]}, #{current_user[:id]}"
            redirect_to(root_url)
            flash[:danger] = 'This is not your post'
        end
    end

    def update
        @post = Post.find(params[:id])
        if @post.update(post_params)
            redirect_to posts_path
        else
            render 'edit'
        end
    end

    def destroy
        @post = Post.find(params[:id])
        @post.destroy
        redirect_to posts_path
    end

    private
        def post_params
            params.require(:post).permit(:title, :body)
        end
    
end
