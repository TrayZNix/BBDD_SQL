/*13.Queremos un listado de los empleados y sus edades*/
SELECT first_name, last_name, age(CURRENT_DATE, birth_date)
FROM employees;
/*14.Queremos un listado del numero de empleados contratados cada mes del año*/
SELECT count(*), to_char(hire_date, 'Month')
FROM employees
GROUP BY to_char(hire_date, 'Month')
ORDER BY to_char(hire_date, 'Month');
/*15.Queremos un listado del promedio de edad de los empleados por region*/
SELECT avg(age(CURRENT_DATE, hire_date)), region_id
FROM employees JOIN employee_territories USING (employee_id) JOIN territories USING (territory_id) JOIN region USING (region_id)
GROUP BY region_id
ORDER BY region_id;

/*16.Queremos un listado de los pedidos los cuales tardaron en ser enviados menos de 11 días*/
SELECT age(shipped_date, order_date), product_name
FROM orders JOIN order_details USING (order_id) JOIN products USING (product_id)
WHERE age(shipped_date, order_date) < make_interval(0, 0, 0, 11);

/*17.Queremos un listado de los años laborables pendientes por cada empleado para jubilarse,
suponiendo que se jubilarán pasado los 65 años de edad*/

/*18.Queremos un listado de los 5 empleados que más pronto comenzaron a trabajar y que más tiempo lleven trabajando
en la empresa, con la condición que estos sean de los 5 empleados mas rentables de la empresa, aquellos que más ventas
han realizado*/

/*19.Queremos un listado del promedio de días disponibles para entregar un pedido, agrupando por categoria y producto*/

/*20.Queremos un listado de aquellos empleados que deberían estar jubilados*/

/*21.Queremos un listado del numero de pedidos por fecha para aquellos pedidos de productos nacionales destinados al extranjero
en el año 1998*/