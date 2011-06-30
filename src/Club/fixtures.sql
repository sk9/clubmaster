INSERT INTO club_event_event (event_name, description, price, max_attends, start_date, stop_date, created_at, updated_at) VALUES
('BBQ Party','<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras dignissim leo ac ligula auctor molestie. Maecenas egestas mollis velit et adipiscing. Aliquam venenatis leo vitae metus congue suscipit. Nunc viverra suscipit pharetra. Integer eu nibh quis elit gravida imperdiet. Nunc dapibus convallis ipsum, ut sodales orci ultricies eget. Vivamus convallis condimentum ullamcorper. Nullam ac nisi orci, sit amet volutpat velit. Cras quis vestibulum mauris. Morbi sit amet tortor in diam suscipit aliquet at quis libero. Vestibulum mauris lacus, ultrices sollicitudin vulputate dignissim, ultrices sed tellus. Integer in gravida eros. Quisque non vestibulum tellus. Suspendisse dictum pharetra eros quis consectetur. Sed pharetra rutrum sodales. Suspendisse potenti. Nam a sapien lacus.</p>
<p>Aenean dignissim nisi sit amet nisl ultricies vel volutpat dui bibendum. Integer cursus vulputate elit, eu faucibus diam pulvinar nec. Praesent et nulla nisl, nec interdum sapien. Integer vel sapien et risus ultrices pulvinar eget quis enim. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Pellentesque eget tortor sit amet enim rhoncus facilisis non eget est. In hac habitasse platea dictumst. Nunc et nisi lectus. Etiam dictum nisi sodales nunc porttitor ullamcorper. Ut leo tellus, sagittis id volutpat et, sagittis sed diam. Vestibulum venenatis bibendum augue vitae suscipit. Mauris vulputate, augue in scelerisque iaculis, metus orci suscipit purus, eget ornare eros libero ut mi. Fusce sem quam, commodo in semper eu, pulvinar nec metus. Nunc justo diam, laoreet molestie venenatis a, porttitor non tellus. Vivamus vulputate, ligula in tempor viverra, purus turpis dapibus quam, vel eleifend mauris mauris a magna. In hac habitasse platea dictumst. Suspendisse in velit augue.</p>',null,null,'2011-07-12 12:00:00','2011-07-12 18:00:00',now(),now()),
('Senior Tournament','<p>Nunc fermentum dignissim orci rhoncus feugiat. In ullamcorper ligula ac enim congue bibendum. In hendrerit metus nec neque sollicitudin at tempus nisl hendrerit. Integer rutrum urna quis diam consequat blandit. Donec eget libero eros, nec consectetur magna. In sed est nulla. Praesent ornare lorem dui. Fusce pulvinar augue at mauris sollicitudin faucibus. Morbi mollis sagittis nisl ac tincidunt. Curabitur a erat eu risus mattis lacinia eget eu eros.</p>
<p>Proin purus mauris, fringilla eu eleifend quis, tincidunt in felis. Donec ut erat leo. Cras fermentum ultricies ipsum quis ultricies. Proin ut nulla eu libero congue suscipit aliquet eu nunc. Donec elementum, velit sit amet aliquam mattis, justo risus malesuada mauris, ac tempor urna sapien eu lacus. Maecenas mollis, leo quis facilisis bibendum, sem justo pellentesque justo, tristique sagittis justo libero non ipsum. Sed non elit justo. Morbi vitae elit augue, ut blandit massa. Nunc et dolor elit. Donec et magna sem. Quisque bibendum ligula quis sem laoreet fringilla. Suspendisse a nibh neque, consequat sollicitudin nisi. Proin vel fringilla mauris. Integer pellentesque ultricies auctor. Aenean eget risus sed ligula dapibus pellentesque vel euismod nisi. Aenean volutpat magna ut justo vehicula ultricies volutpat sem malesuada. Nullam egestas pulvinar rhoncus. Vivamus eget tellus turpis. Etiam faucibus, lorem et suscipit cursus, nunc eros viverra nulla, at tristique urna leo vel lorem. Nullam ipsum tortor, laoreet in semper nec, pulvinar in mauris.</p>',100,30,'2011-07-24 09:00:00','2011-07-27 18:00:00',now(),now()),
('Kids day','<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Praesent molestie nisi non tellus ornare rhoncus. Nam fermentum purus ut massa fermentum rutrum. Curabitur pretium neque quis est facilisis pulvinar. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Nam eget enim orci. Donec massa mauris, elementum sed suscipit vel, vestibulum sit amet dolor. Etiam pellentesque justo at nisl hendrerit vulputate. Sed imperdiet, mauris eget vulputate consectetur, ligula mauris mollis justo, nec tincidunt arcu nunc et neque. Sed cursus, dolor vitae fermentum consectetur, urna nisl volutpat metus, mollis pellentesque purus risus non lacus. Ut nec lectus dapibus mi venenatis blandit. Cras eros diam, gravida at vulputate quis, tincidunt et mi. Phasellus hendrerit placerat tellus sed mattis. Proin eget ligula congue magna accumsan ultrices. Cras vitae magna non nibh dapibus euismod eget id est. Vivamus turpis erat, aliquam ut varius id, porttitor eu massa. Nullam condimentum condimentum tempus. Morbi mattis libero felis.</p>',200,null,'2011-08-05 12:00:00','2011-08-05 18:00:00',now(),now());

INSERT INTO club_user_location (location_name,location_id) VALUES
  ('Denmark',1),
  ('Aalborg',2),
  ('Copenhagen',2),
  ('Aalborg Tennis Club',3),
  ('Gug Tennis Club',3);

INSERT INTO club_user_group (group_id,group_name,group_type,gender,min_age,max_age,is_active_member) VALUES
  (null,'Senior','dynamic',null,18,45,1),
  (null,'Junior','dynamic',null,0,17,1),
  (null,'Members of honor','static',null,null,null,1),
  (null,'All Members, active','dynamic',null,null,null,1),
  (null,'All Members, inactive','dynamic',null,null,null,0);

INSERT INTO club_shop_category (id,category_id,category_name,description,location_id) VALUES
  (1,null,'Subscriptions','<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. In sagittis, dolor sed tempor feugiat, nibh erat volutpat sapien, ac aliquet urna tellus id urna. Mauris id risus eu ante euismod.</p>',2),
  (2,null,'Ticket coupon','<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. In sagittis, dolor sed tempor feugiat, nibh erat volutpat sapien, ac aliquet urna tellus id urna. Mauris id risus eu ante euismod.</p>',2),
  (3,null,'Food','<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. In sagittis, dolor sed tempor feugiat, nibh erat volutpat sapien, ac aliquet urna tellus id urna. Mauris id risus eu ante euismod.</p>',2),
  (4,null,'Liquid','<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. In sagittis, dolor sed tempor feugiat, nibh erat volutpat sapien, ac aliquet urna tellus id urna. Mauris id risus eu ante euismod.</p>',2),
  (5,null,'Sport equipment','<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. In sagittis, dolor sed tempor feugiat, nibh erat volutpat sapien, ac aliquet urna tellus id urna. Mauris id risus eu ante euismod.</p>',2),
  (6,null,'Other','<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. In sagittis, dolor sed tempor feugiat, nibh erat volutpat sapien, ac aliquet urna tellus id urna. Mauris id risus eu ante euismod.</p>',2),
  (7,5,'Bags','<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. In sagittis, dolor sed tempor feugiat, nibh erat volutpat sapien, ac aliquet urna tellus id urna. Mauris id risus eu ante euismod.</p>',2),
  (8,5,'Rackets','<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. In sagittis, dolor sed tempor feugiat, nibh erat volutpat sapien, ac aliquet urna tellus id urna. Mauris id risus eu ante euismod.</p>',2);

INSERT INTO club_shop_product (id,product_name,description,price,vat_id) VALUES
  (1,'1. md, subscription','<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce tristique est eu nulla iaculis ac sodales lorem accumsan. Nulla aliquam hendrerit mollis. Aliquam erat volutpat. Vestibulum metus est, volutpat eu condimentum id, vulputate sed lectus. Ut luctus laoreet rhoncus. Cras mattis hendrerit dignissim. Integer neque eros, pellentesque luctus tristique quis, tincidunt non libero. Vestibulum scelerisque, magna ac posuere dapibus, elit ligula viverra magna, vitae convallis purus quam a orci. Donec fermentum convallis molestie. Etiam leo augue, sollicitudin vel tristique vestibulum, iaculis in purus. Mauris bibendum, nunc eu sollicitudin pharetra, augue lacus dictum risus, eget gravida velit leo vitae magna. Curabitur quis nisl at mi egestas ultricies.</p>
<p>Nunc facilisis hendrerit mi, non scelerisque enim vehicula sed. Donec viverra, dolor eget egestas aliquet, odio ante luctus odio, id consectetur elit mauris sit amet turpis. Phasellus ac lectus mi, eu vestibulum diam. Cras pulvinar, odio vehicula rhoncus sodales, arcu libero rutrum sem, ac lacinia nisl nibh et lorem. Donec metus mi, cursus ut accumsan a, varius id enim. Aliquam blandit aliquet mauris nec vestibulum. Aenean placerat tempor gravida. Proin id rhoncus justo. Praesent tincidunt elit ut sapien dapibus eu interdum arcu tincidunt. Fusce nec nunc risus. Curabitur sed nulla leo, quis tincidunt nulla. Nulla facilisi. Suspendisse cursus velit in massa bibendum molestie.</p>
<p>Praesent scelerisque aliquam purus, vitae accumsan erat bibendum ut. Curabitur accumsan vestibulum felis, lacinia tempus ligula interdum ac. Morbi vehicula varius diam quis tincidunt. Nulla bibendum laoreet dolor, a feugiat ligula convallis sit amet. Donec mattis quam et libero hendrerit faucibus. Quisque gravida tempus egestas. Curabitur dolor est, facilisis in posuere vitae, dictum nec enim. Cras nec orci ut eros dignissim porttitor vel sit amet urna. Nunc quis erat sit amet tortor tincidunt sagittis. In malesuada odio ac elit facilisis eu condimentum risus gravida. Morbi orci risus, rhoncus vitae mattis sit.</p>',100,1),
  (2,'2. md, subscription','<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce tristique est eu nulla iaculis ac sodales lorem accumsan. Nulla aliquam hendrerit mollis. Aliquam erat volutpat. Vestibulum metus est, volutpat eu condimentum id, vulputate sed lectus. Ut luctus laoreet rhoncus. Cras mattis hendrerit dignissim. Integer neque eros, pellentesque luctus tristique quis, tincidunt non libero. Vestibulum scelerisque, magna ac posuere dapibus, elit ligula viverra magna, vitae convallis purus quam a orci. Donec fermentum convallis molestie. Etiam leo augue, sollicitudin vel tristique vestibulum, iaculis in purus. Mauris bibendum, nunc eu sollicitudin pharetra, augue lacus dictum risus, eget gravida velit leo vitae magna. Curabitur quis nisl at mi egestas ultricies.</p>
<p>Nunc facilisis hendrerit mi, non scelerisque enim vehicula sed. Donec viverra, dolor eget egestas aliquet, odio ante luctus odio, id consectetur elit mauris sit amet turpis. Phasellus ac lectus mi, eu vestibulum diam. Cras pulvinar, odio vehicula rhoncus sodales, arcu libero rutrum sem, ac lacinia nisl nibh et lorem. Donec metus mi, cursus ut accumsan a, varius id enim. Aliquam blandit aliquet mauris nec vestibulum. Aenean placerat tempor gravida. Proin id rhoncus justo. Praesent tincidunt elit ut sapien dapibus eu interdum arcu tincidunt. Fusce nec nunc risus. Curabitur sed nulla leo, quis tincidunt nulla. Nulla facilisi. Suspendisse cursus velit in massa bibendum molestie.</p>
<p>Praesent scelerisque aliquam purus, vitae accumsan erat bibendum ut. Curabitur accumsan vestibulum felis, lacinia tempus ligula interdum ac. Morbi vehicula varius diam quis tincidunt. Nulla bibendum laoreet dolor, a feugiat ligula convallis sit amet. Donec mattis quam et libero hendrerit faucibus. Quisque gravida tempus egestas. Curabitur dolor est, facilisis in posuere vitae, dictum nec enim. Cras nec orci ut eros dignissim porttitor vel sit amet urna. Nunc quis erat sit amet tortor tincidunt sagittis. In malesuada odio ac elit facilisis eu condimentum risus gravida. Morbi orci risus, rhoncus vitae mattis sit.</p>',175,1),
  (3,'Period subscription','<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce tristique est eu nulla iaculis ac sodales lorem accumsan. Nulla aliquam hendrerit mollis. Aliquam erat volutpat. Vestibulum metus est, volutpat eu condimentum id, vulputate sed lectus. Ut luctus laoreet rhoncus. Cras mattis hendrerit dignissim. Integer neque eros, pellentesque luctus tristique quis, tincidunt non libero. Vestibulum scelerisque, magna ac posuere dapibus, elit ligula viverra magna, vitae convallis purus quam a orci. Donec fermentum convallis molestie. Etiam leo augue, sollicitudin vel tristique vestibulum, iaculis in purus. Mauris bibendum, nunc eu sollicitudin pharetra, augue lacus dictum risus, eget gravida velit leo vitae magna. Curabitur quis nisl at mi egestas ultricies.</p>
<p>Nunc facilisis hendrerit mi, non scelerisque enim vehicula sed. Donec viverra, dolor eget egestas aliquet, odio ante luctus odio, id consectetur elit mauris sit amet turpis. Phasellus ac lectus mi, eu vestibulum diam. Cras pulvinar, odio vehicula rhoncus sodales, arcu libero rutrum sem, ac lacinia nisl nibh et lorem. Donec metus mi, cursus ut accumsan a, varius id enim. Aliquam blandit aliquet mauris nec vestibulum. Aenean placerat tempor gravida. Proin id rhoncus justo. Praesent tincidunt elit ut sapien dapibus eu interdum arcu tincidunt. Fusce nec nunc risus. Curabitur sed nulla leo, quis tincidunt nulla. Nulla facilisi. Suspendisse cursus velit in massa bibendum molestie.</p>
<p>Praesent scelerisque aliquam purus, vitae accumsan erat bibendum ut. Curabitur accumsan vestibulum felis, lacinia tempus ligula interdum ac. Morbi vehicula varius diam quis tincidunt. Nulla bibendum laoreet dolor, a feugiat ligula convallis sit amet. Donec mattis quam et libero hendrerit faucibus. Quisque gravida tempus egestas. Curabitur dolor est, facilisis in posuere vitae, dictum nec enim. Cras nec orci ut eros dignissim porttitor vel sit amet urna. Nunc quis erat sit amet tortor tincidunt sagittis. In malesuada odio ac elit facilisis eu condimentum risus gravida. Morbi orci risus, rhoncus vitae mattis sit.</p>',1000,1),
  (4,'Lifetime membership','<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce tristique est eu nulla iaculis ac sodales lorem accumsan. Nulla aliquam hendrerit mollis. Aliquam erat volutpat. Vestibulum metus est, volutpat eu condimentum id, vulputate sed lectus. Ut luctus laoreet rhoncus. Cras mattis hendrerit dignissim. Integer neque eros, pellentesque luctus tristique quis, tincidunt non libero. Vestibulum scelerisque, magna ac posuere dapibus, elit ligula viverra magna, vitae convallis purus quam a orci. Donec fermentum convallis molestie. Etiam leo augue, sollicitudin vel tristique vestibulum, iaculis in purus. Mauris bibendum, nunc eu sollicitudin pharetra, augue lacus dictum risus, eget gravida velit leo vitae magna. Curabitur quis nisl at mi egestas ultricies.</p>
<p>Nunc facilisis hendrerit mi, non scelerisque enim vehicula sed. Donec viverra, dolor eget egestas aliquet, odio ante luctus odio, id consectetur elit mauris sit amet turpis. Phasellus ac lectus mi, eu vestibulum diam. Cras pulvinar, odio vehicula rhoncus sodales, arcu libero rutrum sem, ac lacinia nisl nibh et lorem. Donec metus mi, cursus ut accumsan a, varius id enim. Aliquam blandit aliquet mauris nec vestibulum. Aenean placerat tempor gravida. Proin id rhoncus justo. Praesent tincidunt elit ut sapien dapibus eu interdum arcu tincidunt. Fusce nec nunc risus. Curabitur sed nulla leo, quis tincidunt nulla. Nulla facilisi. Suspendisse cursus velit in massa bibendum molestie.</p>
<p>Praesent scelerisque aliquam purus, vitae accumsan erat bibendum ut. Curabitur accumsan vestibulum felis, lacinia tempus ligula interdum ac. Morbi vehicula varius diam quis tincidunt. Nulla bibendum laoreet dolor, a feugiat ligula convallis sit amet. Donec mattis quam et libero hendrerit faucibus. Quisque gravida tempus egestas. Curabitur dolor est, facilisis in posuere vitae, dictum nec enim. Cras nec orci ut eros dignissim porttitor vel sit amet urna. Nunc quis erat sit amet tortor tincidunt sagittis. In malesuada odio ac elit facilisis eu condimentum risus gravida. Morbi orci risus, rhoncus vitae mattis sit.</p>',5000,1),
  (5,'10 clip','<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce tristique est eu nulla iaculis ac sodales lorem accumsan. Nulla aliquam hendrerit mollis. Aliquam erat volutpat. Vestibulum metus est, volutpat eu condimentum id, vulputate sed lectus. Ut luctus laoreet rhoncus. Cras mattis hendrerit dignissim. Integer neque eros, pellentesque luctus tristique quis, tincidunt non libero. Vestibulum scelerisque, magna ac posuere dapibus, elit ligula viverra magna, vitae convallis purus quam a orci. Donec fermentum convallis molestie. Etiam leo augue, sollicitudin vel tristique vestibulum, iaculis in purus. Mauris bibendum, nunc eu sollicitudin pharetra, augue lacus dictum risus, eget gravida velit leo vitae magna. Curabitur quis nisl at mi egestas ultricies.</p>
<p>Nunc facilisis hendrerit mi, non scelerisque enim vehicula sed. Donec viverra, dolor eget egestas aliquet, odio ante luctus odio, id consectetur elit mauris sit amet turpis. Phasellus ac lectus mi, eu vestibulum diam. Cras pulvinar, odio vehicula rhoncus sodales, arcu libero rutrum sem, ac lacinia nisl nibh et lorem. Donec metus mi, cursus ut accumsan a, varius id enim. Aliquam blandit aliquet mauris nec vestibulum. Aenean placerat tempor gravida. Proin id rhoncus justo. Praesent tincidunt elit ut sapien dapibus eu interdum arcu tincidunt. Fusce nec nunc risus. Curabitur sed nulla leo, quis tincidunt nulla. Nulla facilisi. Suspendisse cursus velit in massa bibendum molestie.</p>
<p>Praesent scelerisque aliquam purus, vitae accumsan erat bibendum ut. Curabitur accumsan vestibulum felis, lacinia tempus ligula interdum ac. Morbi vehicula varius diam quis tincidunt. Nulla bibendum laoreet dolor, a feugiat ligula convallis sit amet. Donec mattis quam et libero hendrerit faucibus. Quisque gravida tempus egestas. Curabitur dolor est, facilisis in posuere vitae, dictum nec enim. Cras nec orci ut eros dignissim porttitor vel sit amet urna. Nunc quis erat sit amet tortor tincidunt sagittis. In malesuada odio ac elit facilisis eu condimentum risus gravida. Morbi orci risus, rhoncus vitae mattis sit.</p>',100,1),
  (6,'20 clip','<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce tristique est eu nulla iaculis ac sodales lorem accumsan. Nulla aliquam hendrerit mollis. Aliquam erat volutpat. Vestibulum metus est, volutpat eu condimentum id, vulputate sed lectus. Ut luctus laoreet rhoncus. Cras mattis hendrerit dignissim. Integer neque eros, pellentesque luctus tristique quis, tincidunt non libero. Vestibulum scelerisque, magna ac posuere dapibus, elit ligula viverra magna, vitae convallis purus quam a orci. Donec fermentum convallis molestie. Etiam leo augue, sollicitudin vel tristique vestibulum, iaculis in purus. Mauris bibendum, nunc eu sollicitudin pharetra, augue lacus dictum risus, eget gravida velit leo vitae magna. Curabitur quis nisl at mi egestas ultricies.</p>
<p>Nunc facilisis hendrerit mi, non scelerisque enim vehicula sed. Donec viverra, dolor eget egestas aliquet, odio ante luctus odio, id consectetur elit mauris sit amet turpis. Phasellus ac lectus mi, eu vestibulum diam. Cras pulvinar, odio vehicula rhoncus sodales, arcu libero rutrum sem, ac lacinia nisl nibh et lorem. Donec metus mi, cursus ut accumsan a, varius id enim. Aliquam blandit aliquet mauris nec vestibulum. Aenean placerat tempor gravida. Proin id rhoncus justo. Praesent tincidunt elit ut sapien dapibus eu interdum arcu tincidunt. Fusce nec nunc risus. Curabitur sed nulla leo, quis tincidunt nulla. Nulla facilisi. Suspendisse cursus velit in massa bibendum molestie.</p>
<p>Praesent scelerisque aliquam purus, vitae accumsan erat bibendum ut. Curabitur accumsan vestibulum felis, lacinia tempus ligula interdum ac. Morbi vehicula varius diam quis tincidunt. Nulla bibendum laoreet dolor, a feugiat ligula convallis sit amet. Donec mattis quam et libero hendrerit faucibus. Quisque gravida tempus egestas. Curabitur dolor est, facilisis in posuere vitae, dictum nec enim. Cras nec orci ut eros dignissim porttitor vel sit amet urna. Nunc quis erat sit amet tortor tincidunt sagittis. In malesuada odio ac elit facilisis eu condimentum risus gravida. Morbi orci risus, rhoncus vitae mattis sit.</p>',175,1),
  (7,'Tennis Balls','<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce tristique est eu nulla iaculis ac sodales lorem accumsan. Nulla aliquam hendrerit mollis. Aliquam erat volutpat. Vestibulum metus est, volutpat eu condimentum id, vulputate sed lectus. Ut luctus laoreet rhoncus. Cras mattis hendrerit dignissim. Integer neque eros, pellentesque luctus tristique quis, tincidunt non libero. Vestibulum scelerisque, magna ac posuere dapibus, elit ligula viverra magna, vitae convallis purus quam a orci. Donec fermentum convallis molestie. Etiam leo augue, sollicitudin vel tristique vestibulum, iaculis in purus. Mauris bibendum, nunc eu sollicitudin pharetra, augue lacus dictum risus, eget gravida velit leo vitae magna. Curabitur quis nisl at mi egestas ultricies.</p>
<p>Nunc facilisis hendrerit mi, non scelerisque enim vehicula sed. Donec viverra, dolor eget egestas aliquet, odio ante luctus odio, id consectetur elit mauris sit amet turpis. Phasellus ac lectus mi, eu vestibulum diam. Cras pulvinar, odio vehicula rhoncus sodales, arcu libero rutrum sem, ac lacinia nisl nibh et lorem. Donec metus mi, cursus ut accumsan a, varius id enim. Aliquam blandit aliquet mauris nec vestibulum. Aenean placerat tempor gravida. Proin id rhoncus justo. Praesent tincidunt elit ut sapien dapibus eu interdum arcu tincidunt. Fusce nec nunc risus. Curabitur sed nulla leo, quis tincidunt nulla. Nulla facilisi. Suspendisse cursus velit in massa bibendum molestie.</p>
<p>Praesent scelerisque aliquam purus, vitae accumsan erat bibendum ut. Curabitur accumsan vestibulum felis, lacinia tempus ligula interdum ac. Morbi vehicula varius diam quis tincidunt. Nulla bibendum laoreet dolor, a feugiat ligula convallis sit amet. Donec mattis quam et libero hendrerit faucibus. Quisque gravida tempus egestas. Curabitur dolor est, facilisis in posuere vitae, dictum nec enim. Cras nec orci ut eros dignissim porttitor vel sit amet urna. Nunc quis erat sit amet tortor tincidunt sagittis. In malesuada odio ac elit facilisis eu condimentum risus gravida. Morbi orci risus, rhoncus vitae mattis sit.</p>',50,1),
  (8,'Club T-shirt','<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce tristique est eu nulla iaculis ac sodales lorem accumsan. Nulla aliquam hendrerit mollis. Aliquam erat volutpat. Vestibulum metus est, volutpat eu condimentum id, vulputate sed lectus. Ut luctus laoreet rhoncus. Cras mattis hendrerit dignissim. Integer neque eros, pellentesque luctus tristique quis, tincidunt non libero. Vestibulum scelerisque, magna ac posuere dapibus, elit ligula viverra magna, vitae convallis purus quam a orci. Donec fermentum convallis molestie. Etiam leo augue, sollicitudin vel tristique vestibulum, iaculis in purus. Mauris bibendum, nunc eu sollicitudin pharetra, augue lacus dictum risus, eget gravida velit leo vitae magna. Curabitur quis nisl at mi egestas ultricies.</p>
<p>Nunc facilisis hendrerit mi, non scelerisque enim vehicula sed. Donec viverra, dolor eget egestas aliquet, odio ante luctus odio, id consectetur elit mauris sit amet turpis. Phasellus ac lectus mi, eu vestibulum diam. Cras pulvinar, odio vehicula rhoncus sodales, arcu libero rutrum sem, ac lacinia nisl nibh et lorem. Donec metus mi, cursus ut accumsan a, varius id enim. Aliquam blandit aliquet mauris nec vestibulum. Aenean placerat tempor gravida. Proin id rhoncus justo. Praesent tincidunt elit ut sapien dapibus eu interdum arcu tincidunt. Fusce nec nunc risus. Curabitur sed nulla leo, quis tincidunt nulla. Nulla facilisi. Suspendisse cursus velit in massa bibendum molestie.</p>
<p>Praesent scelerisque aliquam purus, vitae accumsan erat bibendum ut. Curabitur accumsan vestibulum felis, lacinia tempus ligula interdum ac. Morbi vehicula varius diam quis tincidunt. Nulla bibendum laoreet dolor, a feugiat ligula convallis sit amet. Donec mattis quam et libero hendrerit faucibus. Quisque gravida tempus egestas. Curabitur dolor est, facilisis in posuere vitae, dictum nec enim. Cras nec orci ut eros dignissim porttitor vel sit amet urna. Nunc quis erat sit amet tortor tincidunt sagittis. In malesuada odio ac elit facilisis eu condimentum risus gravida. Morbi orci risus, rhoncus vitae mattis sit.</p>',200,1),
  (9,'Easter subscription','<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce tristique est eu nulla iaculis ac sodales lorem accumsan. Nulla aliquam hendrerit mollis. Aliquam erat volutpat. Vestibulum metus est, volutpat eu condimentum id, vulputate sed lectus. Ut luctus laoreet rhoncus. Cras mattis hendrerit dignissim. Integer neque eros, pellentesque luctus tristique quis, tincidunt non libero. Vestibulum scelerisque, magna ac posuere dapibus, elit ligula viverra magna, vitae convallis purus quam a orci. Donec fermentum convallis molestie. Etiam leo augue, sollicitudin vel tristique vestibulum, iaculis in purus. Mauris bibendum, nunc eu sollicitudin pharetra, augue lacus dictum risus, eget gravida velit leo vitae magna. Curabitur quis nisl at mi egestas ultricies.</p>
<p>Nunc facilisis hendrerit mi, non scelerisque enim vehicula sed. Donec viverra, dolor eget egestas aliquet, odio ante luctus odio, id consectetur elit mauris sit amet turpis. Phasellus ac lectus mi, eu vestibulum diam. Cras pulvinar, odio vehicula rhoncus sodales, arcu libero rutrum sem, ac lacinia nisl nibh et lorem. Donec metus mi, cursus ut accumsan a, varius id enim. Aliquam blandit aliquet mauris nec vestibulum. Aenean placerat tempor gravida. Proin id rhoncus justo. Praesent tincidunt elit ut sapien dapibus eu interdum arcu tincidunt. Fusce nec nunc risus. Curabitur sed nulla leo, quis tincidunt nulla. Nulla facilisi. Suspendisse cursus velit in massa bibendum molestie.</p>
<p>Praesent scelerisque aliquam purus, vitae accumsan erat bibendum ut. Curabitur accumsan vestibulum felis, lacinia tempus ligula interdum ac. Morbi vehicula varius diam quis tincidunt. Nulla bibendum laoreet dolor, a feugiat ligula convallis sit amet. Donec mattis quam et libero hendrerit faucibus. Quisque gravida tempus egestas. Curabitur dolor est, facilisis in posuere vitae, dictum nec enim. Cras nec orci ut eros dignissim porttitor vel sit amet urna. Nunc quis erat sit amet tortor tincidunt sagittis. In malesuada odio ac elit facilisis eu condimentum risus gravida. Morbi orci risus, rhoncus vitae mattis sit.</p>',50,1);

INSERT INTO club_shop_category_product (product_id,category_id) VALUES
  (1,1),
  (2,1),
  (3,1),
  (4,1),
  (5,2),
  (6,2),
  (7,5),
  (8,6),
  (9,1);

INSERT INTO club_shop_product_attribute (product_id,attribute_id,value) VALUES
  (1,1,1),
  (1,7,3),
  (1,8,1),
  (1,5,'2011-06-01'),
  (2,1,2),
  (2,7,5),
  (2,8,1),
  (3,5,'2011-04-01'),
  (3,6,'2011-10-31'),
  (4,4,1),
  (5,2,10),
  (5,8,1),
  (6,2,20),
  (6,8,1),
  (9,5,'2011-04-16'),
  (9,6,'2011-04-30');
