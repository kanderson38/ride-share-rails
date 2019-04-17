class AddDefaultRatingNillTrip < ActiveRecord::Migration[5.2]
  def change
    def change
      change_column_default(
        :trips,
        :rating,
        nil,
      )
    end
  end
end
