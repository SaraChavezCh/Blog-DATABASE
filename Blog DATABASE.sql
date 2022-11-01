CREATE TABLE "User" (
  "id" SERIAL PRIMARY KEY,
  "name" varchar,
  "email" varchar UNIQUE NOT NULL,
  "password" numeric NOT NULL,
  "age" numeric
);

CREATE TABLE "Post" (
  "id" SERIAL PRIMARY KEY,
  "writer_id" integer,
  "title" varchar,
  "description" varchar,
  "tags_id" integer,
);

CREATE TABLE "comment" (
  "id" SERIAL PRIMARY KEY,
  "description" varchar,
  "writer_id_author" integer,
  "post_id" integer
);

CREATE TABLE "tags" (
  "id" SERIAL PRIMARY KEY,
  "description" varchar
);

CREATE TABLE "Author" (
  "id" SERIAL PRIMARY KEY,
  "name" varchar
);

CREATE TABLE "related_tags" (
  "id" SERIAL PRIMARY KEY,
  "post_id" integer,
  "tags_id" integer
);

ALTER TABLE "Post" ADD FOREIGN KEY ("writer_id") REFERENCES "User" ("id");

ALTER TABLE "comment" ADD FOREIGN KEY ("writer_id_author") REFERENCES "Author" ("id");

ALTER TABLE "comment" ADD FOREIGN KEY ("post_id") REFERENCES "Post" ("id");

ALTER TABLE "related_tags" ADD FOREIGN KEY ("tags_id") REFERENCES "tags" ("id");

ALTER TABLE "related_tags" ADD FOREIGN KEY ("post_id") REFERENCES "Post" ("id");

insert into "User" (name, email , "password", age) values
('salvador', 'salvador@gmail.com', 12345, 31),
('miguel', 'miguel@gmail.com', 98765, 27),
('sara', 'sara@gmail.com', 374652, 30);

select  * from "User" u ;

insert into "Author" (name) values ('Alma'), ('Luis');

select * from "Author" a ;

insert into tags (description) values ('#Food'), ('#Vallarta'), ('#Food'),('#Beautiful'),('#Love');

select *  from tags;

insert into "Post" (id, writer_id, title,description,tags_id) values
(1, 1, 'Enchiladas', 'The best food ever', 1),
(2, 2, 'PtoVallarta', 'its amazing', 2);

select  * from "Post" p ;


insert into "comment"  (id, description, writer_id_author, post_id) values 
(1,'Provecho', 2, 1);
insert into "comment"  (id, description, writer_id_author, post_id) values 
(2,'Dviiertete', 1, 2);

select * from "comment" c 


select u.name, p.title ,a.name, c.description  from "Post" p
inner join "User" u 
on writer_id  = u.id 
inner join "comment" c 
on p.id = c.post_id
inner join "Author" a 
on c.writer_id_author  = a.id;