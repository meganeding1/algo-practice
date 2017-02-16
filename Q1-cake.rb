# Stock trading: look at an array of yesterday's stock prices to maximize profit when you buy/sell
	# must buy before you sell
	# return the profit (integer)


def max_profit(stock_prices)
	min_val_1 = stock_prices.min 
	min_val_1_index = stock_prices.index(min_val_1)
	modified_stock_prices_1 = stock_prices[(min_val_1_index + 1)..-1]
	max_val_1 = modified_stock_prices_1.max 
	profit_1 = max_val_1 - min_val_1

	max_val_2 = stock_prices.max 
	max_val_2_index = stock_prices.index(max_val_2)
	modified_stock_prices_2 = stock_prices[()]

end 

stock_prices = [10, 7, 5, 8, 11, 9]

p max_profit(stock_prices)