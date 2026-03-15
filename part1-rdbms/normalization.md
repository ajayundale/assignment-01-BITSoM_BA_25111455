## Anamoly Analysis
Insert Anamoly:
We cannot add a new customer without creating a full record in the orders file when an order does not exist.

Update Anamoly:
If a customer details have to be changed, we need to change the details in every row where the customer details appear.

Delete Anamoly:
If we delete the only order containing a product, all information about the product is also deleted. Also if we delete a product, all orders for the product will be deleted resulting in inconsistent order details.
