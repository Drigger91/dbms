## Referential Integrity:
- It is defined as the concept through with data integrity is maintained in different tables for related entries.
- Referential integrity in a database management system (DBMS) ensures that relationships between tables remain consistent. It guarantees that foreign key values in one table match primary key values in another table. In simpler terms, it ensures that a relationship between tables is valid, and no orphaned records exist.

Example: 

Suppose there is a table `Student` which is defined as 

```roomsql
Create table Student(
    roll_no int primary key,
    name varchar(100),
    city varchar(10)
);
```
And one table `Course` which is defined as 

```roomsql
create table Course(
    course_name varchar(10),
    course_id int primary key,
    roll_no int references Student(roll_no)
);
```
lets assume these are the two tables with some example entries : 

| roll_no |  name   | city     |
|---------|:-------:|----------|
| 1       | Piyush  | Indore   |
| 2       | Rishika | Bhopal   |
| 3       | Swapnil | Bhopal   |
| 4       | Mayank  | Jabalpur |

| roll_no | course_id | course_name |
|---------|:---------:|-------------|
| 1       |    178    | Java        |
| 2       |    678    | C++         |
| 3       |    897    | OS          |
| 4       |    676    | DBMS        |

Here we can see student with `roll_no =  1` studies Java and similarly there are entries for other students.

Let's compare scenarios : 
- **Let's consider referenced table first :** 
   - If we want to **`create`** an entry it wouldn't have any effect on the database integrity.
   - If we want to **`update`** an entry it **may** cause violation. Only if the `roll_no` is updated and the entry for that roll_no is present on `Course` table.
   - Similar can happen for delete. 
- There are some syntax methods that can be used to handle this : 
  - on delete cascade : 
      - This will delete the related entry in referencing table as well.
  - on delete set null: 
    - This will set the value to be null if the record is deleted from the referenced table.
    - It can cause error if the foreign key is also the primary key for the table.
  - on delete no action:
    - deletion will not happen in the first place. 
- **Referencing table :** 
  - Creation of an entity an may cause error as to there should be a check whether the `roll_no` exists in the referenced table or not.
  - Deletion will cause no problems
  - Updation may cause problems if the foreign key is updated. similar to create (whether the roll_no exists or not)
Similar syntax can be used in the case of updation as well. Eg : on update cascade.

example : 

```roomsql
Create table Course(
    course_id int primary key,
    course_name varchar(10),
    roll_no int,
    foreign key (roll_no) references Student(roll_no) on update cascade
);
```


