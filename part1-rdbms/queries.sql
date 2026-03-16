-- Q1: List all customers from Mumbai along with their total order value

select c.customer_id, c.customer_name, c.customer_city, sum(od.quantity * p.unit_price) as total_order_value
 from tbl_customers c
 join tbl_orderheader oh on c.customer_id = oh.customer_id
 join tbl_orderdetail od on oh.order_id = od.order_id
 join tbl_product p on od.product_id = p.product_id
 where c.customer_city = 'Mumbai'
 group by c.customer_id;
 
 
-- Q2: Find the top 3 products by total quantity sold
select p.product_id, p.product_name, SUM(od.quantity) AS total_quantity_sold
from tbl_orderdetail od
join tbl_product p on od.product_id = p.product_id
group by p.product_id, p.product_name
order by total_quantity_sold desc
limit 3;


-- Q3: List all sales representatives and the number of unique customers they have handled
select sr.sales_rep_id, sr.sales_rep_name, count(distinct oh.customer_id) as unique_customers_handled
from tbl_salesrep sr
left join tbl_orderheader oh on sr.sales_rep_id = oh.sales_rep_id
group by sr.sales_rep_id, sr.sales_rep_name;


-- Q4: Find all orders where the total value exceeds 10,000, sorted by value descending
select oh.order_id, c.customer_name, sum(od.quantity * p.unit_price) as order_value
from tbl_orderheader oh
join tbl_customers c on oh.customer_id = c.customer_id
join tbl_orderdetail od on oh.order_id = od.order_id
join tbl_product p on od.product_id = p.product_id
group by oh.order_id, c.customer_name
having sum(od.quantity * p.unit_price) > 10000
order by order_value desc;


-- Q5: Identify any products that have never been ordered
select p.product_id, p.product_name
from tbl_product p
left join tbl_orderdetail od on p.product_id = od.product_id
where od.product_id is null;
