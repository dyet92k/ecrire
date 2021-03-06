module Admin
  module Posts
    class TitlesController < Admin::ApplicationController

      def index
        @post = Admin::Post.find(params[:post_id])
        if @post.published? || @post.titles.count > 1
          @title = @post.titles.new
        else
          @title = @post.titles.first
        end
      end

      def create
        @post = Admin::Post.find(params[:post_id])
        @title = @post.titles.create(title_params)

        respond_to do |format|
          format.html { render 'index' }
          format.js
        end
      end

      def update
        @post = Admin::Post.find(params[:post_id])
        @title = Admin::Title.find(params[:id])
        @title.update(title_params)

        respond_to do |format|
          format.html { render 'index' }
          format.js
        end
      end

      protected

      def title_params
        params.require(:title).permit(:name)
      end
    end
  end
end
