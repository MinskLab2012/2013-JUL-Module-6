
create  index  un_in on paral (id)

drop index un_in

create /*+  PARALLEL(4) */   index  un_in on paral (id)

drop index un_in

create /*+  PARALLEL(10) */   index  un_in on paral (id)

drop index un_in