class UserStockSerializer < ActiveModel::Serializer
  attributes :data

  def data
    object.map { |userStock| 
      {
        id: userStock.stock.id,
        name: userStock.stock.name,
        ticker: userStock.stock.ticker,
        stockNotes: userStock.notes
      }
    } 
  end

end
