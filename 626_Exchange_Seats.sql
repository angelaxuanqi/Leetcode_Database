### [626\. Exchange Seats](https://leetcode.com/problems/exchange-seats/)

Difficulty: **Medium**  

Related Topics: [Database](https://leetcode.com/tag/database/)


Table: `Seat`

```
+-------------+---------+
| Column Name | Type    |
+-------------+---------+
| id          | int     |
| name        | varchar |
+-------------+---------+
id is the primary key column for this table.
Each row of this table indicates the name and the ID of a student.
id is a continuous increment.
```

Write an SQL query to swap the seat id of every two consecutive students. If the number of students is odd, the id of the last student is not swapped.

Return the result table ordered by `id` **in ascending order**.

The query result format is in the following example.

**Example 1:**

```
Input: 
Seat table:
+----+---------+
| id | student |
+----+---------+
| 1  | Abbot   |
| 2  | Doris   |
| 3  | Emerson |
| 4  | Green   |
| 5  | Jeames  |
+----+---------+
Output: 
+----+---------+
| id | student |
+----+---------+
| 1  | Doris   |
| 2  | Abbot   |
| 3  | Green   |
| 4  | Emerson |
| 5  | Jeames  |
+----+---------+
Explanation: 
Note that if the number of students is odd, there is no need to change the last one's seat.
```


#### Solution

Language: **MySQL**

```mysql
# Write your MySQL query statement below
SELECT A.id-1 as id, A.student 
FROM Seat A
WHERE A.id %2 =0
UNION
SELECT B.id+1 as id, B.student
FROM Seat B
WHERE B.id % 2 =1 and B.id != (SELECT max(id) FROM Seat)
UNION
SELECT C.id, C.student
FROM Seat C
WHERE C.id = (SELECT max(id) FROM Seat) AND C.id %2 = 1
ORDER BY id
```
