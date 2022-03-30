/*6.Queremos saber cual es el proveedor que ha proporcionado ,en promedio, más productos que el proveedor
que en promedio ha proporcionado menos productos*/
WITH media AS 	(SELECT avg(quantity)
				FROM order_details 
				)
			/*
SELECT company_name, count(o.quantity)
FROM orders JOIN order_details o USING (order_id) JOIN products USING (product_id) JOIN suppliers USING (supplier_id)
WHERE sum(quantity) > media
GROUP BY company_name
ORDER BY count(o.quantity); */

/*7.Para tener control sobre la tendencia de provisionamiento (en cuanto a unidades se refiere) de los proveedores y poder descartar
aquellos que no son aptos, hemos de tener un listado de los que si lo son.
Se considera que un proveedor es acto si el promedio de unidades que ha proporcionado es superior
al promedio total de unidades vendidas.*/

SELECT round(avg(quantity),0), company_name
FROM order_details o JOIN products USING (product_id) JOIN suppliers USING (supplier_id)
group by supplier_id, company_name 
HAVING round(avg(quantity),0) > (
						SELECT round(avg(quantity),0)
						FROM order_details
						);


/*8.Para tener control sobre los beneficios de los proveedores y poder asi descartar aquellos no aptos, hemos
de tener un listado de los que son aptos.
Se considera que un proveedor es APTO si las ventas obtenidas por el mismo es inferior al 2% de las ventas totales*/

WITH ventas AS (SELECT SUM(od.unit_price*quantity)*2/100
					FROM orders o JOIN order_details od USING (order_id) )
SELECT company_name
FROM order_details o JOIN products USING (product_id) JOIN suppliers s1 USING (supplier_id)
WHERE (
	  SELECT SUM(o2.unit_price*o2.quantity)
	  FROM order_details o2 JOIN products USING (product_id) JOIN suppliers s2 USING (supplier_id)
	  WHERE s1.supplier_id = s2.supplier_id
	  ) < (SELECT SUM(od.unit_price*quantity)*2/100
					FROM orders o JOIN order_details od USING (order_id))
GROUP BY company_name

					


/*9.Queremos saber que proveedores son aptos en cuanto a provisionamiento de unidades
así como en cuanto a beneficio obtenido*/