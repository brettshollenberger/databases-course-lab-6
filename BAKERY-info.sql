/* Must be a simple SELECT */
/* Cannot use grouping/aggregation */
/* Can use set theory-type statements (union, intersect, minus) */

/* --- Q1 */
SELECT flavor, food, price
FROM goods
WHERE flavor="Chocolate"
AND price < 5;

/* --- Q2 */
SELECT flavor, food, price FROM (
	(SELECT * FROM goods_original
	WHERE food="Cookie"
	AND price > 1.10)
	UNION
	(SELECT * FROM goods_original
	WHERE flavor="Lemon")
	UNION
	(SELECT * FROM goods_original
	WHERE flavor="Apple"
	AND food<>"Pie")
) select_treats
ORDER BY flavor, food;

/* --- Q3 */
SELECT
DISTINCT customers.last_name, customers.first_name
FROM receipts
INNER JOIN customers
ON customers.id=receipts.customer_id
WHERE receipts.date="2007-10-03"
ORDER BY customers.last_name;

/* --- Q4 */
SELECT DISTINCT goods.flavor, goods.food FROM receipts
INNER JOIN receipt_items
ON receipt_items.receipt_id=receipts.id
INNER JOIN goods
ON goods.id=receipt_items.good_id
WHERE receipts.date="2007-10-04"
AND goods.food="Cake"
ORDER BY goods.flavor;

/* --- Q5 */
SELECT goods.flavor, goods.food, goods.price
FROM customers
INNER JOIN receipts
ON customers.id=receipts.customer_id
INNER JOIN receipt_items
ON receipts.id=receipt_items.receipt_id
INNER JOIN goods
ON receipt_items.good_id=goods.id
WHERE first_name="Ariane"
AND last_name="Cruzen"
AND receipts.date="2007-10-25"
ORDER BY receipt_items.ordinal;

/* --- Q6 */
SELECT goods.flavor, goods.food
FROM customers
INNER JOIN receipts
ON receipts.customer_id=customers.id
INNER JOIN receipt_items
ON receipt_items.receipt_id=receipts.id
INNER JOIN goods
ON receipt_items.good_id=goods.id
WHERE first_name="Kip"
AND last_name="Arnn"
AND receipts.date LIKE "2007-10-%"
AND goods.food="Cookie"
ORDER BY goods.flavor;
