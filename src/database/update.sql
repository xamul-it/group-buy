alter table gborder add column user_id bigint not null
alter table gborder add constraint FK16sb6aom9t1duhwrpnqaqtk5r foreign key (user_id) references user (id)
