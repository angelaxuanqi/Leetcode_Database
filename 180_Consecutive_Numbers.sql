### [180\. Consecutive Numbers](https://leetcode.com/problems/consecutive-numbers/)

Difficulty: **Medium**  

Related Topics: [Database](https://leetcode.com/tag/database/)


Table: `Logs`

```
+-------------+---------+
| Column Name | Type    |
+-------------+---------+
| id          | int     |
| num         | varchar |
+-------------+---------+
id is the primary key for this table.
```

Write an SQL query to find all numbers that appear at least three times consecutively.

Return the result table in **any order**.

The query result format is in the following example.

**Example 1:**

```
Input: 
Logs table:
+----+-----+
| id | num |
+----+-----+
| 1  | 1   |
| 2  | 1   |
| 3  | 1   |
| 4  | 2   |
| 5  | 1   |
| 6  | 2   |
| 7  | 2   |
+----+-----+
Output: 
+-----------------+
| ConsecutiveNums |
+-----------------+
| 1               |
+-----------------+
Explanation: 1 is the only number that appears consecutively for at least three times.
```


#### Solution

Language: **MySQL**

```mysql
# Write your MySQL query statement below
SELECT DISTINCT A.num AS ConsecutiveNums
FROM Logs A
JOIN Logs B
ON A.id =B.id -1
JOIN Logs C
ON B.id = C.id -1
WHERE A.num = B.num AND b.num = C.num
```
