class PostsController < ApplicationController
    http_basic_authenticate_with name: 'desafiovamoscontodo', password: 'XAHTJEAS23123%23', except: :index

    def index
        @posts= Post.all.order(created_at: :desc)
    end

    def new
        @post= Post.new
    end

    
    def create
        @post = Post.new(post_params)

        if @post.content.include?("spoiler")
            d = @post.content.split(" ")
            d.delete("spoiler")
            d = d.join(" ")
            @post.content = d
        end

        if @post.save
            redirect_to root_path, notice: 'Se ha creado con exito'
        else
            redirect_to posts_dashboard_path, alert: 'No se pudo crear'
        end
    end
    

    private

    def post_params
        params.require(:post).permit(:title, :content, :img_url)
    end
end