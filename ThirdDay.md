## Keys

**1. Candidate Key**

- Candidate key in DBMS is the minimal set of attributes through which we can identify each record uniquely.
  - Uniqueness : No two different records in a table can have the same values that make up the candidate key.
    - This ensures that the data is easily retrievable.
  - Minimal Set : There are no redundant attributes in the candidate key.
- Important Points : 
  - A table can have multiple candidate keys. For example, in a "Customers" table, both "Customer ID" and "Email address" (assuming emails are unique) could be candidate keys.
  - Only one candidate key is chosen as the primary key of the table. The primary key is the officially designated unique identifier, and it enforces additional properties like not allowing null values.
- Candidate keys play a crucial role in data integrity by preventing duplicate records and ensuring data consistency. They also help in efficient data retrieval by allowing quick access to specific records.

**2. Primary Key**

- Primary Key is one of the keys selected from the set of candidate keys that is the most appropriate according to usecase.
- It has two main properties:
  - Uniqueness.
  - Not null.
- Primary key is not taken as an input from user, it is given/assigned to a user.
- There cannot be more than one primary key for one database.

**3. Foreign Key**
- It is an attribute/ set of attributes that reference to primary key of same or other table.
- Maintains referential integrity.
- it is created as : 

```roomsql
create table Course (
    course_id varchar(10),
    course_name varchar(10),
    roll_no int references Student(roll_no)
)
```

- The table whose primary key is being used is called <b>Referenced Table</b>
- The table which uses the foreign key is called **Referencing Table**
- The primary key should be present in the referenced table if it is being entered in the referencing table.
- If the table is already created and we want to add foreign key constraint. It can be done as : 

```
alter table Course 
add constraint fk foreign key (roll_no) references Student(roll_no);

```
- One table can contain multiple foreign keys.
- We can change the name of the attribute if we want.

**Full Code snippet**
<br/>
```roomsql
create table Course (
    course_id varchar(10),
    course_name varchar(10),
    roll_no int references Student(roll_no)
);


create table Student (
    course_id varchar(10),
    course_name varchar(10),
    roll_no int primary key
);


alter table Course
add constraint fk foreign key (roll_no) references Student(roll_no);

```