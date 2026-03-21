## Anamoly Analysis
##### **Insert Anamoly**:
We cannot add a new customer without creating a full record in the orders file when an order does not exist.

##### **Update Anamoly**:
If a customer details have to be changed, we need to change the details in every row where the customer details appear.

##### **Delete Anamoly**:
If we delete the only order containing a product, all information about the product is also deleted. Also if we delete a product, all orders for the product will be deleted resulting in inconsistent order details.

---

## Normalization Justification
### Problems with “One Big Table”
There are several issues when you have a single table containing all the details. Some of the major issues are reported below:

1. **Redundancy**  
   - Every time a customer places an order, their name, email, and city would be repeated.  
   - Example: Rohan Mehta from Mumbai places 10 orders → his details are stored 10 times.  

2. **Update Anomalies**  
   - If Sales Rep Ravi Kumar changes his email, you’d have to update it in every row where he appears. Miss one, and your data is inconsistent.  

3. **Insertion Anomalies**  
   - You can’t add a new product category (say “Home Appliances”) unless you also insert a fake order row, because everything is tied together.  

4. **Deletion Anomalies**  
   - If you delete the last order for a product, you might accidentally lose the product’s existence entirely, because product info is only stored in order rows.  

### Benefits of Normalization
By splitting into logical tables, you gain:

- **Customer Table**: One row per customer. Rohan’s info is stored once, no matter how many orders he places.
- **Sales Rep Table**: One row per sales rep. Ravi's info is stored once, no matter how many customers he handles.
- **Product & Category Tables**: Products are linked to categories via foreign keys. If you want to analyze category-wise sales, you don’t need to sift through messy repeated text.  
- **OrderHeader & OrderDetail**: Orders are cleanly separated into headers (who/when) and details (what/how much). This makes queries like “Top 3 products by quantity sold” straightforward.  

##### Example Query Contrast
- **Normalized schema**:  
  ```sql
  select c.customer_name, sum(od.quantity * p.unit_price) as total_value
  from tbl_customer c
  join tbl_orderheader oh on c.customer_id = oh.customer_id
  join tbl_orderdetail od on oh.order_id = od.order_id
  join tbl_product p on od.product_id = p.product_id
  where c.customer_city = 'Mumbai'
  group by c.customer_name;
  ```
  → Clean, efficient, accurate.

- **Single big table**:  
  You’d be filtering through repeated customer info, repeated product info, repeated category names, and risk miscounting because of duplication. Queries become messy and error-prone.

### Conclusion
Normalization is **data hygiene**. It prevents redundancy, ensures consistency, and makes analysis easier. While a single table might look “simpler” to set up, it quickly becomes a nightmare to maintain and query. Our dataset (customers, products, orders) is a textbook case where normalization pays off.
