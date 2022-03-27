### [612\. Shortest Distance in a Plane](https://leetcode.com/problems/shortest-distance-in-a-plane/)

Difficulty: **Medium**  

Related Topics: [Database](https://leetcode.com/tag/database/)


Table: `Point2D`

```
+-------------+------+
| Column Name | Type |
+-------------+------+
| x           | int  |
| y           | int  |
+-------------+------+
(x, y) is the primary key column for this table.
Each row of this table indicates the position of a point on the X-Y plane.
```

The distance between two points `p<sub style="display: inline;">1</sub>(x<sub style="display: inline;">1</sub>, y<sub style="display: inline;">1</sub>)` and `p<sub style="display: inline;">2</sub>(x<sub style="display: inline;">2</sub>, y<sub style="display: inline;">2</sub>)` is `sqrt((x<sub style="display: inline;">2</sub> - x<sub style="display: inline;">1</sub>)<sup>2</sup> + (y<sub style="display: inline;">2</sub> - y<sub style="display: inline;">1</sub>)<sup>2</sup>)`.

Write an SQL query to report the shortest distance between any two points from the `Point2D` table. Round the distance to **two decimal points**.

The query result format is in the following example.

**Example 1:**

```
Input: 
Point2D table:
+----+----+
| x  | y  |
+----+----+
| -1 | -1 |
| 0  | 0  |
| -1 | -2 |
+----+----+
Output: 
+----------+
| shortest |
+----------+
| 1.00     |
+----------+
Explanation: The shortest distance is 1.00 from point (-1, -1) to (-1, 2).
```


#### Solution

Language: **MySQL**

```mysql
# Write your MySQL query statement below
SELECT ROUND(SQRT(POWER((A.x- B.x),2) + POWER((A.y- B.y),2)),2) as shortest
FROM POINT2D A
CROSS JOIN POINT2D B
WHERE A.x <> B.x or A.y <> B.y
ORDER BY shortest LIMIT 1
```
