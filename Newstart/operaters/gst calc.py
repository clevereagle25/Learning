#gst bill calculator
price = float(input("Enter the price of the item: "))
quantity = int(input("Enter the quantity: "))
gst_rate = float(input("Enter the GST rate (in percentage): "))
# Calculate total price before GST
total_price_before_gst = price * quantity
# Calculate GST amount
gst_amount = (total_price_before_gst * gst_rate) / 100
# Calculate total price after adding GST
total_price_after_gst = total_price_before_gst + gst_amount
print("Total price before GST: ", total_price_before_gst)
print("GST amount: ", gst_amount)
print("Total price after adding GST: ", total_price_after_gst)
