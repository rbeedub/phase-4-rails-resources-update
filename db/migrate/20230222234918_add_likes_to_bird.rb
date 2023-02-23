class AddLikesToBird < ActiveRecord::Migration[6.1]
  def change
    add_column :birds, :likes, :integer, null: false, default: 0
  end

  def update 
    bird = Bird.find_by_(id: params[:id])
    if bird
      bird.update(bird_params)
      render json: bird
    else 
      render json: { error: "Bird not found"}, statuus: :not_found
    end
  end

  def bird_params
    params.permit(:name, :species, :likes)
  end

  def increment_likes
    bird = Bird.find_by(id: params[:id])
    if bird
      bird.update(likes: bird.likes + 1)
      render json: bird
    else
      render json: { error: "Bird not found" }, status: :not_found
    end
  end
end

