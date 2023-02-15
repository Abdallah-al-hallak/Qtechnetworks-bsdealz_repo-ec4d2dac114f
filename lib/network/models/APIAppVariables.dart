import 'package:bsdealz/network/models/APIBanner.dart';
import 'package:bsdealz/network/models/APICampaign.dart';
import 'package:bsdealz/network/models/APICart.dart';
import 'package:bsdealz/network/models/APICoupon.dart';
import 'package:bsdealz/network/models/APICreditCard.dart';
import 'package:bsdealz/network/models/APIDraw.dart';
import 'package:bsdealz/network/models/APILevel.dart';
import 'package:bsdealz/network/models/APINotification.dart';
import 'package:bsdealz/network/models/APIProduct.dart';
import 'package:bsdealz/network/models/APISetting.dart';
import 'package:bsdealz/network/models/APITheme.dart';
import 'package:bsdealz/network/models/APIUser.dart';
import 'package:bsdealz/network/models/APIWishListItem.dart';

import 'APIUserCurrentLevel.dart';
import 'ApiAddress.dart';

/// user : {"id":3,"email":"majdsafirat@gmail.com","phone":"0789666494","first_name":null,"last_name":null,"gender":null,"dob":null,"street":null,"city":null,"level_id":1,"created_at":"2022-10-03T16:39:38.000000Z","updated_at":"2022-10-03T16:39:38.000000Z"}
/// banners : [{"id":1,"sort":"1","title":"بانر عربي","sub_title":"وصف  بانر عربي","title_ref_id":5,"sub_title_ref_id":6,"page":"1","campaign_id":1,"image":"images/rangeroverlat.jpg","created_at":"2022-10-04T04:00:00.000000Z","updated_at":null,"status":"active","campaign":{"id":1,"name":"حملة عربي","image":null,"description":"حملة عربي","name_ref_id":1,"description_ref_id":2,"price":"817","donate":null,"early":1,"early_bird_quantity":0,"early_bird_stock":0,"quantity":111,"sold":11,"prize":"Dolor tempora offici","draw_date":"2010-06-16","start_date":"1996-08-09","end_date":"1985-12-04","product_id":1,"created_at":"2022-09-29T09:23:37.000000Z","updated_at":"2022-09-29T09:23:37.000000Z","countdown_date":null,"countdown_quantity":100,"status":"closed","images":[],"products":[{"product_id":1,"product_name":"عربي منتج ","product_image":"images/rangerover.png","product_description":"وصف منتج عربي","product_name_ref_id":3,"product_description_ref_id":4,"created_at":"2022-09-29T09:23:17.000000Z","updated_at":"2022-09-29T09:23:17.000000Z"}],"is_countdown":false}},{"id":2,"sort":"2","title":"Banner 2 Title","sub_title":"Banner 2 SubTitle","title_ref_id":null,"sub_title_ref_id":null,"page":"1","campaign_id":22,"image":"images/rangeroverlat.jpg","created_at":"2022-10-04T04:00:00.000000Z","updated_at":null,"status":"active","campaign":{"id":22,"name":"Sybil Dean","image":"images/rangerover.png","description":"Consequatur Sint am","name_ref_id":0,"description_ref_id":0,"price":"10","donate":1,"early":1,"early_bird_quantity":100,"early_bird_stock":94,"quantity":3000,"sold":110,"prize":"Sit aspernatur excep","draw_date":"2000-10-25","start_date":"2021-12-28","end_date":"2022-10-28","product_id":1,"created_at":"2022-10-02T13:26:05.000000Z","updated_at":"2022-10-05T01:42:11.000000Z","countdown_date":"2022-09-07 00:00:00","countdown_quantity":0,"status":"active","images":[{"id":18,"name":"campaing_image","image_path":"images/1664731565513210.jpg","campaing":"22","created_at":"2022-10-02T13:26:05.000000Z","updated_at":"2022-10-02T13:26:05.000000Z"},{"id":19,"name":"campaing_image","image_path":"images/1664731565470694.jpg","campaing":"22","created_at":"2022-10-02T13:26:05.000000Z","updated_at":"2022-10-02T13:26:05.000000Z"},{"id":20,"name":"campaing_image","image_path":"images/1664731565622484.jpg","campaing":"22","created_at":"2022-10-02T13:26:05.000000Z","updated_at":"2022-10-02T13:26:05.000000Z"},{"id":21,"name":"campaing_image","image_path":"images/1664731565360938.jpg","campaing":"22","created_at":"2022-10-02T13:26:05.000000Z","updated_at":"2022-10-02T13:26:05.000000Z"}],"products":[{"product_id":1,"product_name":"عربي منتج ","product_image":"images/rangerover.png","product_description":"وصف منتج عربي","product_name_ref_id":3,"product_description_ref_id":4,"created_at":"2022-09-29T09:23:17.000000Z","updated_at":"2022-09-29T09:23:17.000000Z"}],"is_countdown":true}}]
/// levels : [{"id":1,"name":"حملة عربي","benefits":"get back 1.5% of your purchase","name_ref_id":7,"benefits_ref_id":8,"xd":"1500","created_at":null,"updated_at":"2022-09-27T06:51:13.000000Z"},{"id":2,"name":"عربي منتج ","benefits":"get back 1.9% of your purchase","name_ref_id":9,"benefits_ref_id":10,"xd":"2500","created_at":null,"updated_at":"2022-09-27T06:51:54.000000Z"},{"id":3,"name":"بانر عربي","benefits":"get back 2.5% of your purchase","name_ref_id":11,"benefits_ref_id":12,"xd":"3500","created_at":null,"updated_at":"2022-09-27T06:53:00.000000Z"},{"id":4,"name":"وصف  بانر عربي","benefits":"get back 3.5% of your purchase","name_ref_id":13,"benefits_ref_id":14,"xd":"4500","created_at":null,"updated_at":"2022-09-27T06:53:39.000000Z"}]
/// closing_soon_campaigns : [{"id":1,"name":"حملة عربي","image":null,"description":"حملة عربي","name_ref_id":1,"description_ref_id":2,"price":"817","donate":null,"early":1,"early_bird_quantity":0,"early_bird_stock":0,"quantity":111,"sold":11,"prize":"Dolor tempora offici","draw_date":"2010-06-16","start_date":"1996-08-09","end_date":"1985-12-04","product_id":1,"created_at":"2022-09-29T09:23:37.000000Z","updated_at":"2022-09-29T09:23:37.000000Z","countdown_date":null,"countdown_quantity":100,"status":"closed","images":[],"products":[{"product_id":1,"product_name":"عربي منتج ","product_image":"images/rangerover.png","product_description":"وصف منتج عربي","product_name_ref_id":3,"product_description_ref_id":4,"created_at":"2022-09-29T09:23:17.000000Z","updated_at":"2022-09-29T09:23:17.000000Z"}],"is_countdown":false},{"id":2,"name":"Reese Leach","image":null,"description":"Voluptate nulla esse","name_ref_id":0,"description_ref_id":0,"price":"405","donate":null,"early":null,"early_bird_quantity":0,"early_bird_stock":0,"quantity":11,"sold":11,"prize":"Sequi beatae accusan","draw_date":"2013-02-19","start_date":"1995-05-14","end_date":"1972-02-02","product_id":1,"created_at":"2022-09-29T12:00:03.000000Z","updated_at":"2022-09-29T12:00:03.000000Z","countdown_date":null,"countdown_quantity":200,"status":"closed","images":[],"products":[{"product_id":1,"product_name":"عربي منتج ","product_image":"images/rangerover.png","product_description":"وصف منتج عربي","product_name_ref_id":3,"product_description_ref_id":4,"created_at":"2022-09-29T09:23:17.000000Z","updated_at":"2022-09-29T09:23:17.000000Z"}],"is_countdown":false},{"id":22,"name":"Sybil Dean","image":"images/rangerover.png","description":"Consequatur Sint am","name_ref_id":0,"description_ref_id":0,"price":"10","donate":1,"early":1,"early_bird_quantity":100,"early_bird_stock":94,"quantity":3000,"sold":110,"prize":"Sit aspernatur excep","draw_date":"2000-10-25","start_date":"2021-12-28","end_date":"2022-10-28","product_id":1,"created_at":"2022-10-02T13:26:05.000000Z","updated_at":"2022-10-05T01:42:11.000000Z","countdown_date":"2022-09-07 00:00:00","countdown_quantity":0,"status":"active","images":[{"id":18,"name":"campaing_image","image_path":"images/1664731565513210.jpg","campaing":"22","created_at":"2022-10-02T13:26:05.000000Z","updated_at":"2022-10-02T13:26:05.000000Z"},{"id":19,"name":"campaing_image","image_path":"images/1664731565470694.jpg","campaing":"22","created_at":"2022-10-02T13:26:05.000000Z","updated_at":"2022-10-02T13:26:05.000000Z"},{"id":20,"name":"campaing_image","image_path":"images/1664731565622484.jpg","campaing":"22","created_at":"2022-10-02T13:26:05.000000Z","updated_at":"2022-10-02T13:26:05.000000Z"},{"id":21,"name":"campaing_image","image_path":"images/1664731565360938.jpg","campaing":"22","created_at":"2022-10-02T13:26:05.000000Z","updated_at":"2022-10-02T13:26:05.000000Z"}],"products":[{"product_id":1,"product_name":"عربي منتج ","product_image":"images/rangerover.png","product_description":"وصف منتج عربي","product_name_ref_id":3,"product_description_ref_id":4,"created_at":"2022-09-29T09:23:17.000000Z","updated_at":"2022-09-29T09:23:17.000000Z"}],"is_countdown":true}]
/// active_campaigns : [{"id":3,"name":"Shelly Shepard","image":null,"description":"Quia est quos possim","name_ref_id":0,"description_ref_id":0,"price":"740","donate":null,"early":null,"early_bird_quantity":0,"early_bird_stock":0,"quantity":55,"sold":44,"prize":"In amet distinctio","draw_date":"1985-02-19","start_date":"2022-06-01","end_date":"1976-03-26","product_id":1,"created_at":"2022-09-29T12:05:13.000000Z","updated_at":"2022-09-29T12:05:13.000000Z","countdown_date":null,"countdown_quantity":0,"status":"active","images":[],"products":[{"product_id":1,"product_name":"عربي منتج ","product_image":"images/rangerover.png","product_description":"وصف منتج عربي","product_name_ref_id":3,"product_description_ref_id":4,"created_at":"2022-09-29T09:23:17.000000Z","updated_at":"2022-09-29T09:23:17.000000Z"}],"is_countdown":false},{"id":4,"name":"Steel Rush","image":null,"description":"Odit quam obcaecati","name_ref_id":0,"description_ref_id":0,"price":"629","donate":null,"early":null,"early_bird_quantity":0,"early_bird_stock":0,"quantity":1212,"sold":11,"prize":"Iure ea numquam in r","draw_date":"1981-11-03","start_date":"2010-06-23","end_date":"1987-11-21","product_id":1,"created_at":"2022-09-29T13:46:10.000000Z","updated_at":"2022-09-29T13:46:10.000000Z","countdown_date":null,"countdown_quantity":0,"status":"active","images":[],"products":[{"product_id":1,"product_name":"عربي منتج ","product_image":"images/rangerover.png","product_description":"وصف منتج عربي","product_name_ref_id":3,"product_description_ref_id":4,"created_at":"2022-09-29T09:23:17.000000Z","updated_at":"2022-09-29T09:23:17.000000Z"}],"is_countdown":false},{"id":5,"name":"Kirsten Thomas","image":null,"description":"Fugit magna dolore","name_ref_id":0,"description_ref_id":0,"price":"267","donate":null,"early":null,"early_bird_quantity":0,"early_bird_stock":0,"quantity":1221,"sold":22,"prize":"Delectus itaque iru","draw_date":"2012-02-13","start_date":"2017-04-17","end_date":"1981-05-24","product_id":1,"created_at":"2022-09-30T10:00:13.000000Z","updated_at":"2022-09-30T10:00:13.000000Z","countdown_date":null,"countdown_quantity":0,"status":"active","images":[],"products":[{"product_id":1,"product_name":"عربي منتج ","product_image":"images/rangerover.png","product_description":"وصف منتج عربي","product_name_ref_id":3,"product_description_ref_id":4,"created_at":"2022-09-29T09:23:17.000000Z","updated_at":"2022-09-29T09:23:17.000000Z"}],"is_countdown":false},{"id":6,"name":"Colette Levine","image":null,"description":"Proident vero volup","name_ref_id":0,"description_ref_id":0,"price":"782","donate":1,"early":null,"early_bird_quantity":0,"early_bird_stock":0,"quantity":11100,"sold":1,"prize":"Sit laboris laborum","draw_date":"1983-08-18","start_date":"1971-12-20","end_date":"2013-07-28","product_id":1,"created_at":"2022-09-30T10:01:21.000000Z","updated_at":"2022-09-30T10:01:21.000000Z","countdown_date":null,"countdown_quantity":0,"status":"active","images":[],"products":[{"product_id":1,"product_name":"عربي منتج ","product_image":"images/rangerover.png","product_description":"وصف منتج عربي","product_name_ref_id":3,"product_description_ref_id":4,"created_at":"2022-09-29T09:23:17.000000Z","updated_at":"2022-09-29T09:23:17.000000Z"}],"is_countdown":false},{"id":7,"name":"Alexandra Patterson","image":null,"description":"Quia in quis libero","name_ref_id":0,"description_ref_id":0,"price":"445","donate":null,"early":null,"early_bird_quantity":0,"early_bird_stock":0,"quantity":1100,"sold":1,"prize":"Exercitation excepte","draw_date":"2010-05-18","start_date":"2005-12-19","end_date":"1970-05-18","product_id":1,"created_at":"2022-09-30T10:02:56.000000Z","updated_at":"2022-09-30T10:02:56.000000Z","countdown_date":null,"countdown_quantity":0,"status":"active","images":[],"products":[{"product_id":1,"product_name":"عربي منتج ","product_image":"images/rangerover.png","product_description":"وصف منتج عربي","product_name_ref_id":3,"product_description_ref_id":4,"created_at":"2022-09-29T09:23:17.000000Z","updated_at":"2022-09-29T09:23:17.000000Z"}],"is_countdown":false},{"id":8,"name":"Kelsey Webster","image":null,"description":"Aperiam qui perferen","name_ref_id":0,"description_ref_id":0,"price":"93","donate":null,"early":null,"early_bird_quantity":0,"early_bird_stock":0,"quantity":1000,"sold":11,"prize":"Qui deleniti ut nesc","draw_date":"1986-02-23","start_date":"1978-06-23","end_date":"1990-06-06","product_id":1,"created_at":"2022-09-30T10:04:00.000000Z","updated_at":"2022-09-30T10:04:00.000000Z","countdown_date":null,"countdown_quantity":0,"status":"active","images":[],"products":[{"product_id":1,"product_name":"عربي منتج ","product_image":"images/rangerover.png","product_description":"وصف منتج عربي","product_name_ref_id":3,"product_description_ref_id":4,"created_at":"2022-09-29T09:23:17.000000Z","updated_at":"2022-09-29T09:23:17.000000Z"}],"is_countdown":false},{"id":9,"name":"Ian Park","image":null,"description":"Ea est ut eos evenie","name_ref_id":0,"description_ref_id":0,"price":"9","donate":null,"early":1,"early_bird_quantity":0,"early_bird_stock":0,"quantity":1100,"sold":11,"prize":"Aut atque itaque und","draw_date":"1998-01-14","start_date":"1970-04-16","end_date":"1989-09-17","product_id":1,"created_at":"2022-09-30T10:18:53.000000Z","updated_at":"2022-09-30T10:18:53.000000Z","countdown_date":null,"countdown_quantity":0,"status":"active","images":[],"products":[{"product_id":1,"product_name":"عربي منتج ","product_image":"images/rangerover.png","product_description":"وصف منتج عربي","product_name_ref_id":3,"product_description_ref_id":4,"created_at":"2022-09-29T09:23:17.000000Z","updated_at":"2022-09-29T09:23:17.000000Z"}],"is_countdown":false},{"id":10,"name":"Wendy Camacho","image":null,"description":"Anim fugiat aut ab","name_ref_id":0,"description_ref_id":0,"price":"99","donate":1,"early":1,"early_bird_quantity":0,"early_bird_stock":0,"quantity":1000,"sold":11,"prize":"Qui odio debitis dui","draw_date":"1977-08-30","start_date":"2021-08-29","end_date":"1988-01-30","product_id":1,"created_at":"2022-09-30T10:31:55.000000Z","updated_at":"2022-09-30T10:31:55.000000Z","countdown_date":null,"countdown_quantity":0,"status":"active","images":[],"products":[{"product_id":1,"product_name":"عربي منتج ","product_image":"images/rangerover.png","product_description":"وصف منتج عربي","product_name_ref_id":3,"product_description_ref_id":4,"created_at":"2022-09-29T09:23:17.000000Z","updated_at":"2022-09-29T09:23:17.000000Z"}],"is_countdown":false},{"id":11,"name":"Basia Logan","image":null,"description":"Eiusmod voluptas lib","name_ref_id":0,"description_ref_id":0,"price":"64","donate":null,"early":null,"early_bird_quantity":0,"early_bird_stock":0,"quantity":1000,"sold":11,"prize":"Qui illum possimus","draw_date":"2017-11-25","start_date":"1992-01-02","end_date":"1981-03-10","product_id":1,"created_at":"2022-09-30T10:37:50.000000Z","updated_at":"2022-09-30T10:37:50.000000Z","countdown_date":null,"countdown_quantity":0,"status":"active","images":[],"products":[{"product_id":1,"product_name":"عربي منتج ","product_image":"images/rangerover.png","product_description":"وصف منتج عربي","product_name_ref_id":3,"product_description_ref_id":4,"created_at":"2022-09-29T09:23:17.000000Z","updated_at":"2022-09-29T09:23:17.000000Z"}],"is_countdown":false},{"id":12,"name":"Fleur Mcdonald","image":null,"description":"Dolore iste eu volup","name_ref_id":0,"description_ref_id":0,"price":"724","donate":null,"early":null,"early_bird_quantity":0,"early_bird_stock":0,"quantity":1000,"sold":11,"prize":"Aliquam magnam cupid","draw_date":"1998-09-26","start_date":"1978-06-28","end_date":"2005-05-22","product_id":1,"created_at":"2022-09-30T10:39:19.000000Z","updated_at":"2022-09-30T10:39:19.000000Z","countdown_date":null,"countdown_quantity":0,"status":"active","images":[],"products":[{"product_id":1,"product_name":"عربي منتج ","product_image":"images/rangerover.png","product_description":"وصف منتج عربي","product_name_ref_id":3,"product_description_ref_id":4,"created_at":"2022-09-29T09:23:17.000000Z","updated_at":"2022-09-29T09:23:17.000000Z"}],"is_countdown":false},{"id":13,"name":"Rama Porter","image":null,"description":"Quis sunt odio nihi","name_ref_id":0,"description_ref_id":0,"price":"673","donate":1,"early":1,"early_bird_quantity":0,"early_bird_stock":0,"quantity":1000,"sold":1,"prize":"Autem omnis voluptat","draw_date":"1984-03-19","start_date":"1997-09-29","end_date":"1985-12-20","product_id":1,"created_at":"2022-09-30T10:40:51.000000Z","updated_at":"2022-09-30T10:40:51.000000Z","countdown_date":null,"countdown_quantity":0,"status":"active","images":[],"products":[{"product_id":1,"product_name":"عربي منتج ","product_image":"images/rangerover.png","product_description":"وصف منتج عربي","product_name_ref_id":3,"product_description_ref_id":4,"created_at":"2022-09-29T09:23:17.000000Z","updated_at":"2022-09-29T09:23:17.000000Z"}],"is_countdown":false},{"id":14,"name":"Illiana Ferguson","image":null,"description":"Rem obcaecati assume","name_ref_id":0,"description_ref_id":0,"price":"844","donate":1,"early":null,"early_bird_quantity":0,"early_bird_stock":0,"quantity":1000,"sold":11,"prize":"Dolores est ducimus","draw_date":"1989-01-23","start_date":"1987-03-12","end_date":"1992-02-20","product_id":1,"created_at":"2022-09-30T10:43:22.000000Z","updated_at":"2022-09-30T10:43:22.000000Z","countdown_date":null,"countdown_quantity":0,"status":"active","images":[],"products":[{"product_id":1,"product_name":"عربي منتج ","product_image":"images/rangerover.png","product_description":"وصف منتج عربي","product_name_ref_id":3,"product_description_ref_id":4,"created_at":"2022-09-29T09:23:17.000000Z","updated_at":"2022-09-29T09:23:17.000000Z"}],"is_countdown":false},{"id":15,"name":"Jenette Jensen","image":null,"description":"Numquam quis non con","name_ref_id":0,"description_ref_id":0,"price":"989","donate":null,"early":1,"early_bird_quantity":0,"early_bird_stock":0,"quantity":1000,"sold":11,"prize":"Qui aut eos pariatur","draw_date":"2013-07-08","start_date":"2014-08-13","end_date":"1997-12-03","product_id":1,"created_at":"2022-09-30T10:46:49.000000Z","updated_at":"2022-09-30T10:46:49.000000Z","countdown_date":null,"countdown_quantity":0,"status":"active","images":[],"products":[{"product_id":1,"product_name":"عربي منتج ","product_image":"images/rangerover.png","product_description":"وصف منتج عربي","product_name_ref_id":3,"product_description_ref_id":4,"created_at":"2022-09-29T09:23:17.000000Z","updated_at":"2022-09-29T09:23:17.000000Z"}],"is_countdown":false},{"id":16,"name":"Reese Reeves","image":null,"description":"Sit voluptatem ut","name_ref_id":0,"description_ref_id":0,"price":"334","donate":null,"early":null,"early_bird_quantity":0,"early_bird_stock":0,"quantity":1000,"sold":11,"prize":"Molestiae eos ipsam","draw_date":"1992-08-27","start_date":"2008-03-03","end_date":"2016-01-06","product_id":1,"created_at":"2022-09-30T11:17:19.000000Z","updated_at":"2022-09-30T11:17:19.000000Z","countdown_date":null,"countdown_quantity":0,"status":"active","images":[],"products":[{"product_id":1,"product_name":"عربي منتج ","product_image":"images/rangerover.png","product_description":"وصف منتج عربي","product_name_ref_id":3,"product_description_ref_id":4,"created_at":"2022-09-29T09:23:17.000000Z","updated_at":"2022-09-29T09:23:17.000000Z"}],"is_countdown":false},{"id":17,"name":"Graham Barber","image":null,"description":"Officiis sint ut dol","name_ref_id":0,"description_ref_id":0,"price":"882","donate":1,"early":null,"early_bird_quantity":0,"early_bird_stock":0,"quantity":1000,"sold":11,"prize":"Non eius distinctio","draw_date":"2017-06-25","start_date":"1977-06-22","end_date":"2008-08-21","product_id":1,"created_at":"2022-09-30T11:18:17.000000Z","updated_at":"2022-09-30T11:18:17.000000Z","countdown_date":null,"countdown_quantity":0,"status":"active","images":[],"products":[{"product_id":1,"product_name":"عربي منتج ","product_image":"images/rangerover.png","product_description":"وصف منتج عربي","product_name_ref_id":3,"product_description_ref_id":4,"created_at":"2022-09-29T09:23:17.000000Z","updated_at":"2022-09-29T09:23:17.000000Z"}],"is_countdown":false},{"id":18,"name":"Francis Schultz","image":null,"description":"Veritatis quibusdam","name_ref_id":0,"description_ref_id":0,"price":"186","donate":null,"early":1,"early_bird_quantity":0,"early_bird_stock":0,"quantity":1000,"sold":11,"prize":"Dignissimos aliquid","draw_date":"1977-05-18","start_date":"2012-05-20","end_date":"1981-10-22","product_id":1,"created_at":"2022-09-30T11:28:01.000000Z","updated_at":"2022-09-30T11:28:01.000000Z","countdown_date":null,"countdown_quantity":0,"status":"active","images":[],"products":[{"product_id":1,"product_name":"عربي منتج ","product_image":"images/rangerover.png","product_description":"وصف منتج عربي","product_name_ref_id":3,"product_description_ref_id":4,"created_at":"2022-09-29T09:23:17.000000Z","updated_at":"2022-09-29T09:23:17.000000Z"}],"is_countdown":false},{"id":19,"name":"Eleanor Valenzuela","image":null,"description":"Proident dolor eaqu","name_ref_id":0,"description_ref_id":0,"price":"723","donate":1,"early":null,"early_bird_quantity":0,"early_bird_stock":0,"quantity":1000,"sold":11,"prize":"Sit ab esse velit a","draw_date":"1981-12-15","start_date":"2003-04-18","end_date":"1986-08-21","product_id":1,"created_at":"2022-09-30T11:28:30.000000Z","updated_at":"2022-09-30T11:28:30.000000Z","countdown_date":null,"countdown_quantity":0,"status":"active","images":[],"products":[{"product_id":1,"product_name":"عربي منتج ","product_image":"images/rangerover.png","product_description":"وصف منتج عربي","product_name_ref_id":3,"product_description_ref_id":4,"created_at":"2022-09-29T09:23:17.000000Z","updated_at":"2022-09-29T09:23:17.000000Z"}],"is_countdown":false},{"id":20,"name":"Colby Mccall","image":null,"description":"In qui in omnis nisi","name_ref_id":0,"description_ref_id":0,"price":"535","donate":null,"early":1,"early_bird_quantity":0,"early_bird_stock":0,"quantity":11,"sold":1,"prize":"In non nihil consequ","draw_date":"1998-04-06","start_date":"1986-02-07","end_date":"1991-05-12","product_id":1,"created_at":"2022-10-02T13:18:19.000000Z","updated_at":"2022-10-02T13:18:19.000000Z","countdown_date":null,"countdown_quantity":0,"status":"active","images":[],"products":[{"product_id":1,"product_name":"عربي منتج ","product_image":"images/rangerover.png","product_description":"وصف منتج عربي","product_name_ref_id":3,"product_description_ref_id":4,"created_at":"2022-09-29T09:23:17.000000Z","updated_at":"2022-09-29T09:23:17.000000Z"}],"is_countdown":false},{"id":21,"name":"Buckminster Harris","image":null,"description":"Amet saepe labore e","name_ref_id":0,"description_ref_id":0,"price":"557","donate":null,"early":null,"early_bird_quantity":0,"early_bird_stock":0,"quantity":111,"sold":1,"prize":"Dolorem nisi molliti","draw_date":"1988-09-05","start_date":"2020-08-14","end_date":"1980-03-27","product_id":1,"created_at":"2022-10-02T13:19:54.000000Z","updated_at":"2022-10-02T13:19:54.000000Z","countdown_date":null,"countdown_quantity":0,"status":"active","images":[],"products":[{"product_id":1,"product_name":"عربي منتج ","product_image":"images/rangerover.png","product_description":"وصف منتج عربي","product_name_ref_id":3,"product_description_ref_id":4,"created_at":"2022-09-29T09:23:17.000000Z","updated_at":"2022-09-29T09:23:17.000000Z"}],"is_countdown":false},{"id":22,"name":"Sybil Dean","image":"images/rangerover.png","description":"Consequatur Sint am","name_ref_id":0,"description_ref_id":0,"price":"10","donate":1,"early":1,"early_bird_quantity":100,"early_bird_stock":94,"quantity":3000,"sold":110,"prize":"Sit aspernatur excep","draw_date":"2000-10-25","start_date":"2021-12-28","end_date":"2022-10-28","product_id":1,"created_at":"2022-10-02T13:26:05.000000Z","updated_at":"2022-10-05T01:42:11.000000Z","countdown_date":"2022-09-07 00:00:00","countdown_quantity":0,"status":"active","images":[{"id":18,"name":"campaing_image","image_path":"images/1664731565513210.jpg","campaing":"22","created_at":"2022-10-02T13:26:05.000000Z","updated_at":"2022-10-02T13:26:05.000000Z"},{"id":19,"name":"campaing_image","image_path":"images/1664731565470694.jpg","campaing":"22","created_at":"2022-10-02T13:26:05.000000Z","updated_at":"2022-10-02T13:26:05.000000Z"},{"id":20,"name":"campaing_image","image_path":"images/1664731565622484.jpg","campaing":"22","created_at":"2022-10-02T13:26:05.000000Z","updated_at":"2022-10-02T13:26:05.000000Z"},{"id":21,"name":"campaing_image","image_path":"images/1664731565360938.jpg","campaing":"22","created_at":"2022-10-02T13:26:05.000000Z","updated_at":"2022-10-02T13:26:05.000000Z"}],"products":[{"product_id":1,"product_name":"عربي منتج ","product_image":"images/rangerover.png","product_description":"وصف منتج عربي","product_name_ref_id":3,"product_description_ref_id":4,"created_at":"2022-09-29T09:23:17.000000Z","updated_at":"2022-09-29T09:23:17.000000Z"}],"is_countdown":true}]
/// closed_campaigns : [{"id":1,"name":"حملة عربي","image":null,"description":"حملة عربي","name_ref_id":1,"description_ref_id":2,"price":"817","donate":null,"early":1,"early_bird_quantity":0,"early_bird_stock":0,"quantity":111,"sold":11,"prize":"Dolor tempora offici","draw_date":"2010-06-16","start_date":"1996-08-09","end_date":"1985-12-04","product_id":1,"created_at":"2022-09-29T09:23:37.000000Z","updated_at":"2022-09-29T09:23:37.000000Z","countdown_date":null,"countdown_quantity":100,"status":"closed","images":[],"products":[{"product_id":1,"product_name":"عربي منتج ","product_image":"images/rangerover.png","product_description":"وصف منتج عربي","product_name_ref_id":3,"product_description_ref_id":4,"created_at":"2022-09-29T09:23:17.000000Z","updated_at":"2022-09-29T09:23:17.000000Z"}],"is_countdown":false},{"id":2,"name":"Reese Leach","image":null,"description":"Voluptate nulla esse","name_ref_id":0,"description_ref_id":0,"price":"405","donate":null,"early":null,"early_bird_quantity":0,"early_bird_stock":0,"quantity":11,"sold":11,"prize":"Sequi beatae accusan","draw_date":"2013-02-19","start_date":"1995-05-14","end_date":"1972-02-02","product_id":1,"created_at":"2022-09-29T12:00:03.000000Z","updated_at":"2022-09-29T12:00:03.000000Z","countdown_date":null,"countdown_quantity":200,"status":"closed","images":[],"products":[{"product_id":1,"product_name":"عربي منتج ","product_image":"images/rangerover.png","product_description":"وصف منتج عربي","product_name_ref_id":3,"product_description_ref_id":4,"created_at":"2022-09-29T09:23:17.000000Z","updated_at":"2022-09-29T09:23:17.000000Z"}],"is_countdown":false},{"id":3,"name":"Shelly Shepard","image":null,"description":"Quia est quos possim","name_ref_id":0,"description_ref_id":0,"price":"740","donate":null,"early":null,"early_bird_quantity":0,"early_bird_stock":0,"quantity":55,"sold":44,"prize":"In amet distinctio","draw_date":"1985-02-19","start_date":"2022-06-01","end_date":"1976-03-26","product_id":1,"created_at":"2022-09-29T12:05:13.000000Z","updated_at":"2022-09-29T12:05:13.000000Z","countdown_date":null,"countdown_quantity":0,"status":"active","images":[],"products":[{"product_id":1,"product_name":"عربي منتج ","product_image":"images/rangerover.png","product_description":"وصف منتج عربي","product_name_ref_id":3,"product_description_ref_id":4,"created_at":"2022-09-29T09:23:17.000000Z","updated_at":"2022-09-29T09:23:17.000000Z"}],"is_countdown":false},{"id":4,"name":"Steel Rush","image":null,"description":"Odit quam obcaecati","name_ref_id":0,"description_ref_id":0,"price":"629","donate":null,"early":null,"early_bird_quantity":0,"early_bird_stock":0,"quantity":1212,"sold":11,"prize":"Iure ea numquam in r","draw_date":"1981-11-03","start_date":"2010-06-23","end_date":"1987-11-21","product_id":1,"created_at":"2022-09-29T13:46:10.000000Z","updated_at":"2022-09-29T13:46:10.000000Z","countdown_date":null,"countdown_quantity":0,"status":"active","images":[],"products":[{"product_id":1,"product_name":"عربي منتج ","product_image":"images/rangerover.png","product_description":"وصف منتج عربي","product_name_ref_id":3,"product_description_ref_id":4,"created_at":"2022-09-29T09:23:17.000000Z","updated_at":"2022-09-29T09:23:17.000000Z"}],"is_countdown":false},{"id":5,"name":"Kirsten Thomas","image":null,"description":"Fugit magna dolore","name_ref_id":0,"description_ref_id":0,"price":"267","donate":null,"early":null,"early_bird_quantity":0,"early_bird_stock":0,"quantity":1221,"sold":22,"prize":"Delectus itaque iru","draw_date":"2012-02-13","start_date":"2017-04-17","end_date":"1981-05-24","product_id":1,"created_at":"2022-09-30T10:00:13.000000Z","updated_at":"2022-09-30T10:00:13.000000Z","countdown_date":null,"countdown_quantity":0,"status":"active","images":[],"products":[{"product_id":1,"product_name":"عربي منتج ","product_image":"images/rangerover.png","product_description":"وصف منتج عربي","product_name_ref_id":3,"product_description_ref_id":4,"created_at":"2022-09-29T09:23:17.000000Z","updated_at":"2022-09-29T09:23:17.000000Z"}],"is_countdown":false},{"id":6,"name":"Colette Levine","image":null,"description":"Proident vero volup","name_ref_id":0,"description_ref_id":0,"price":"782","donate":1,"early":null,"early_bird_quantity":0,"early_bird_stock":0,"quantity":11100,"sold":1,"prize":"Sit laboris laborum","draw_date":"1983-08-18","start_date":"1971-12-20","end_date":"2013-07-28","product_id":1,"created_at":"2022-09-30T10:01:21.000000Z","updated_at":"2022-09-30T10:01:21.000000Z","countdown_date":null,"countdown_quantity":0,"status":"active","images":[],"products":[{"product_id":1,"product_name":"عربي منتج ","product_image":"images/rangerover.png","product_description":"وصف منتج عربي","product_name_ref_id":3,"product_description_ref_id":4,"created_at":"2022-09-29T09:23:17.000000Z","updated_at":"2022-09-29T09:23:17.000000Z"}],"is_countdown":false},{"id":7,"name":"Alexandra Patterson","image":null,"description":"Quia in quis libero","name_ref_id":0,"description_ref_id":0,"price":"445","donate":null,"early":null,"early_bird_quantity":0,"early_bird_stock":0,"quantity":1100,"sold":1,"prize":"Exercitation excepte","draw_date":"2010-05-18","start_date":"2005-12-19","end_date":"1970-05-18","product_id":1,"created_at":"2022-09-30T10:02:56.000000Z","updated_at":"2022-09-30T10:02:56.000000Z","countdown_date":null,"countdown_quantity":0,"status":"active","images":[],"products":[{"product_id":1,"product_name":"عربي منتج ","product_image":"images/rangerover.png","product_description":"وصف منتج عربي","product_name_ref_id":3,"product_description_ref_id":4,"created_at":"2022-09-29T09:23:17.000000Z","updated_at":"2022-09-29T09:23:17.000000Z"}],"is_countdown":false},{"id":8,"name":"Kelsey Webster","image":null,"description":"Aperiam qui perferen","name_ref_id":0,"description_ref_id":0,"price":"93","donate":null,"early":null,"early_bird_quantity":0,"early_bird_stock":0,"quantity":1000,"sold":11,"prize":"Qui deleniti ut nesc","draw_date":"1986-02-23","start_date":"1978-06-23","end_date":"1990-06-06","product_id":1,"created_at":"2022-09-30T10:04:00.000000Z","updated_at":"2022-09-30T10:04:00.000000Z","countdown_date":null,"countdown_quantity":0,"status":"active","images":[],"products":[{"product_id":1,"product_name":"عربي منتج ","product_image":"images/rangerover.png","product_description":"وصف منتج عربي","product_name_ref_id":3,"product_description_ref_id":4,"created_at":"2022-09-29T09:23:17.000000Z","updated_at":"2022-09-29T09:23:17.000000Z"}],"is_countdown":false},{"id":9,"name":"Ian Park","image":null,"description":"Ea est ut eos evenie","name_ref_id":0,"description_ref_id":0,"price":"9","donate":null,"early":1,"early_bird_quantity":0,"early_bird_stock":0,"quantity":1100,"sold":11,"prize":"Aut atque itaque und","draw_date":"1998-01-14","start_date":"1970-04-16","end_date":"1989-09-17","product_id":1,"created_at":"2022-09-30T10:18:53.000000Z","updated_at":"2022-09-30T10:18:53.000000Z","countdown_date":null,"countdown_quantity":0,"status":"active","images":[],"products":[{"product_id":1,"product_name":"عربي منتج ","product_image":"images/rangerover.png","product_description":"وصف منتج عربي","product_name_ref_id":3,"product_description_ref_id":4,"created_at":"2022-09-29T09:23:17.000000Z","updated_at":"2022-09-29T09:23:17.000000Z"}],"is_countdown":false},{"id":10,"name":"Wendy Camacho","image":null,"description":"Anim fugiat aut ab","name_ref_id":0,"description_ref_id":0,"price":"99","donate":1,"early":1,"early_bird_quantity":0,"early_bird_stock":0,"quantity":1000,"sold":11,"prize":"Qui odio debitis dui","draw_date":"1977-08-30","start_date":"2021-08-29","end_date":"1988-01-30","product_id":1,"created_at":"2022-09-30T10:31:55.000000Z","updated_at":"2022-09-30T10:31:55.000000Z","countdown_date":null,"countdown_quantity":0,"status":"active","images":[],"products":[{"product_id":1,"product_name":"عربي منتج ","product_image":"images/rangerover.png","product_description":"وصف منتج عربي","product_name_ref_id":3,"product_description_ref_id":4,"created_at":"2022-09-29T09:23:17.000000Z","updated_at":"2022-09-29T09:23:17.000000Z"}],"is_countdown":false},{"id":11,"name":"Basia Logan","image":null,"description":"Eiusmod voluptas lib","name_ref_id":0,"description_ref_id":0,"price":"64","donate":null,"early":null,"early_bird_quantity":0,"early_bird_stock":0,"quantity":1000,"sold":11,"prize":"Qui illum possimus","draw_date":"2017-11-25","start_date":"1992-01-02","end_date":"1981-03-10","product_id":1,"created_at":"2022-09-30T10:37:50.000000Z","updated_at":"2022-09-30T10:37:50.000000Z","countdown_date":null,"countdown_quantity":0,"status":"active","images":[],"products":[{"product_id":1,"product_name":"عربي منتج ","product_image":"images/rangerover.png","product_description":"وصف منتج عربي","product_name_ref_id":3,"product_description_ref_id":4,"created_at":"2022-09-29T09:23:17.000000Z","updated_at":"2022-09-29T09:23:17.000000Z"}],"is_countdown":false},{"id":12,"name":"Fleur Mcdonald","image":null,"description":"Dolore iste eu volup","name_ref_id":0,"description_ref_id":0,"price":"724","donate":null,"early":null,"early_bird_quantity":0,"early_bird_stock":0,"quantity":1000,"sold":11,"prize":"Aliquam magnam cupid","draw_date":"1998-09-26","start_date":"1978-06-28","end_date":"2005-05-22","product_id":1,"created_at":"2022-09-30T10:39:19.000000Z","updated_at":"2022-09-30T10:39:19.000000Z","countdown_date":null,"countdown_quantity":0,"status":"active","images":[],"products":[{"product_id":1,"product_name":"عربي منتج ","product_image":"images/rangerover.png","product_description":"وصف منتج عربي","product_name_ref_id":3,"product_description_ref_id":4,"created_at":"2022-09-29T09:23:17.000000Z","updated_at":"2022-09-29T09:23:17.000000Z"}],"is_countdown":false},{"id":13,"name":"Rama Porter","image":null,"description":"Quis sunt odio nihi","name_ref_id":0,"description_ref_id":0,"price":"673","donate":1,"early":1,"early_bird_quantity":0,"early_bird_stock":0,"quantity":1000,"sold":1,"prize":"Autem omnis voluptat","draw_date":"1984-03-19","start_date":"1997-09-29","end_date":"1985-12-20","product_id":1,"created_at":"2022-09-30T10:40:51.000000Z","updated_at":"2022-09-30T10:40:51.000000Z","countdown_date":null,"countdown_quantity":0,"status":"active","images":[],"products":[{"product_id":1,"product_name":"عربي منتج ","product_image":"images/rangerover.png","product_description":"وصف منتج عربي","product_name_ref_id":3,"product_description_ref_id":4,"created_at":"2022-09-29T09:23:17.000000Z","updated_at":"2022-09-29T09:23:17.000000Z"}],"is_countdown":false},{"id":14,"name":"Illiana Ferguson","image":null,"description":"Rem obcaecati assume","name_ref_id":0,"description_ref_id":0,"price":"844","donate":1,"early":null,"early_bird_quantity":0,"early_bird_stock":0,"quantity":1000,"sold":11,"prize":"Dolores est ducimus","draw_date":"1989-01-23","start_date":"1987-03-12","end_date":"1992-02-20","product_id":1,"created_at":"2022-09-30T10:43:22.000000Z","updated_at":"2022-09-30T10:43:22.000000Z","countdown_date":null,"countdown_quantity":0,"status":"active","images":[],"products":[{"product_id":1,"product_name":"عربي منتج ","product_image":"images/rangerover.png","product_description":"وصف منتج عربي","product_name_ref_id":3,"product_description_ref_id":4,"created_at":"2022-09-29T09:23:17.000000Z","updated_at":"2022-09-29T09:23:17.000000Z"}],"is_countdown":false},{"id":15,"name":"Jenette Jensen","image":null,"description":"Numquam quis non con","name_ref_id":0,"description_ref_id":0,"price":"989","donate":null,"early":1,"early_bird_quantity":0,"early_bird_stock":0,"quantity":1000,"sold":11,"prize":"Qui aut eos pariatur","draw_date":"2013-07-08","start_date":"2014-08-13","end_date":"1997-12-03","product_id":1,"created_at":"2022-09-30T10:46:49.000000Z","updated_at":"2022-09-30T10:46:49.000000Z","countdown_date":null,"countdown_quantity":0,"status":"active","images":[],"products":[{"product_id":1,"product_name":"عربي منتج ","product_image":"images/rangerover.png","product_description":"وصف منتج عربي","product_name_ref_id":3,"product_description_ref_id":4,"created_at":"2022-09-29T09:23:17.000000Z","updated_at":"2022-09-29T09:23:17.000000Z"}],"is_countdown":false},{"id":16,"name":"Reese Reeves","image":null,"description":"Sit voluptatem ut","name_ref_id":0,"description_ref_id":0,"price":"334","donate":null,"early":null,"early_bird_quantity":0,"early_bird_stock":0,"quantity":1000,"sold":11,"prize":"Molestiae eos ipsam","draw_date":"1992-08-27","start_date":"2008-03-03","end_date":"2016-01-06","product_id":1,"created_at":"2022-09-30T11:17:19.000000Z","updated_at":"2022-09-30T11:17:19.000000Z","countdown_date":null,"countdown_quantity":0,"status":"active","images":[],"products":[{"product_id":1,"product_name":"عربي منتج ","product_image":"images/rangerover.png","product_description":"وصف منتج عربي","product_name_ref_id":3,"product_description_ref_id":4,"created_at":"2022-09-29T09:23:17.000000Z","updated_at":"2022-09-29T09:23:17.000000Z"}],"is_countdown":false},{"id":17,"name":"Graham Barber","image":null,"description":"Officiis sint ut dol","name_ref_id":0,"description_ref_id":0,"price":"882","donate":1,"early":null,"early_bird_quantity":0,"early_bird_stock":0,"quantity":1000,"sold":11,"prize":"Non eius distinctio","draw_date":"2017-06-25","start_date":"1977-06-22","end_date":"2008-08-21","product_id":1,"created_at":"2022-09-30T11:18:17.000000Z","updated_at":"2022-09-30T11:18:17.000000Z","countdown_date":null,"countdown_quantity":0,"status":"active","images":[],"products":[{"product_id":1,"product_name":"عربي منتج ","product_image":"images/rangerover.png","product_description":"وصف منتج عربي","product_name_ref_id":3,"product_description_ref_id":4,"created_at":"2022-09-29T09:23:17.000000Z","updated_at":"2022-09-29T09:23:17.000000Z"}],"is_countdown":false},{"id":18,"name":"Francis Schultz","image":null,"description":"Veritatis quibusdam","name_ref_id":0,"description_ref_id":0,"price":"186","donate":null,"early":1,"early_bird_quantity":0,"early_bird_stock":0,"quantity":1000,"sold":11,"prize":"Dignissimos aliquid","draw_date":"1977-05-18","start_date":"2012-05-20","end_date":"1981-10-22","product_id":1,"created_at":"2022-09-30T11:28:01.000000Z","updated_at":"2022-09-30T11:28:01.000000Z","countdown_date":null,"countdown_quantity":0,"status":"active","images":[],"products":[{"product_id":1,"product_name":"عربي منتج ","product_image":"images/rangerover.png","product_description":"وصف منتج عربي","product_name_ref_id":3,"product_description_ref_id":4,"created_at":"2022-09-29T09:23:17.000000Z","updated_at":"2022-09-29T09:23:17.000000Z"}],"is_countdown":false},{"id":19,"name":"Eleanor Valenzuela","image":null,"description":"Proident dolor eaqu","name_ref_id":0,"description_ref_id":0,"price":"723","donate":1,"early":null,"early_bird_quantity":0,"early_bird_stock":0,"quantity":1000,"sold":11,"prize":"Sit ab esse velit a","draw_date":"1981-12-15","start_date":"2003-04-18","end_date":"1986-08-21","product_id":1,"created_at":"2022-09-30T11:28:30.000000Z","updated_at":"2022-09-30T11:28:30.000000Z","countdown_date":null,"countdown_quantity":0,"status":"active","images":[],"products":[{"product_id":1,"product_name":"عربي منتج ","product_image":"images/rangerover.png","product_description":"وصف منتج عربي","product_name_ref_id":3,"product_description_ref_id":4,"created_at":"2022-09-29T09:23:17.000000Z","updated_at":"2022-09-29T09:23:17.000000Z"}],"is_countdown":false},{"id":20,"name":"Colby Mccall","image":null,"description":"In qui in omnis nisi","name_ref_id":0,"description_ref_id":0,"price":"535","donate":null,"early":1,"early_bird_quantity":0,"early_bird_stock":0,"quantity":11,"sold":1,"prize":"In non nihil consequ","draw_date":"1998-04-06","start_date":"1986-02-07","end_date":"1991-05-12","product_id":1,"created_at":"2022-10-02T13:18:19.000000Z","updated_at":"2022-10-02T13:18:19.000000Z","countdown_date":null,"countdown_quantity":0,"status":"active","images":[],"products":[{"product_id":1,"product_name":"عربي منتج ","product_image":"images/rangerover.png","product_description":"وصف منتج عربي","product_name_ref_id":3,"product_description_ref_id":4,"created_at":"2022-09-29T09:23:17.000000Z","updated_at":"2022-09-29T09:23:17.000000Z"}],"is_countdown":false},{"id":21,"name":"Buckminster Harris","image":null,"description":"Amet saepe labore e","name_ref_id":0,"description_ref_id":0,"price":"557","donate":null,"early":null,"early_bird_quantity":0,"early_bird_stock":0,"quantity":111,"sold":1,"prize":"Dolorem nisi molliti","draw_date":"1988-09-05","start_date":"2020-08-14","end_date":"1980-03-27","product_id":1,"created_at":"2022-10-02T13:19:54.000000Z","updated_at":"2022-10-02T13:19:54.000000Z","countdown_date":null,"countdown_quantity":0,"status":"active","images":[],"products":[{"product_id":1,"product_name":"عربي منتج ","product_image":"images/rangerover.png","product_description":"وصف منتج عربي","product_name_ref_id":3,"product_description_ref_id":4,"created_at":"2022-09-29T09:23:17.000000Z","updated_at":"2022-09-29T09:23:17.000000Z"}],"is_countdown":false}]
/// upcoming_draws : [{"id":1,"campaign_id":22,"winner_id":1,"coupon_id":1,"draw_date":"2022-10-10 00:00:00","upcoming_date":"2022-10-07 14:59:45","status":"","winner_name":null,"winner_address":null,"stream_url":"http://google.com","created_at":"2022-10-06T09:30:29.000000Z","updated_at":null,"campaign":{"id":22,"name":"Sybil Dean","image":"images/rangerover.png","description":"Consequatur Sint am","name_ref_id":0,"description_ref_id":0,"price":"10","donate":1,"early":1,"early_bird_quantity":100,"early_bird_stock":94,"quantity":3000,"sold":110,"prize":"Sit aspernatur excep","draw_date":"2000-10-25","start_date":"2021-12-28","end_date":"2022-10-28","product_id":1,"created_at":"2022-10-02T13:26:05.000000Z","updated_at":"2022-10-05T01:42:11.000000Z","countdown_date":"2022-09-07 00:00:00","countdown_quantity":0,"status":"active","images":[{"id":18,"name":"campaing_image","image_path":"images/1664731565513210.jpg","campaing":"22","created_at":"2022-10-02T13:26:05.000000Z","updated_at":"2022-10-02T13:26:05.000000Z"},{"id":19,"name":"campaing_image","image_path":"images/1664731565470694.jpg","campaing":"22","created_at":"2022-10-02T13:26:05.000000Z","updated_at":"2022-10-02T13:26:05.000000Z"},{"id":20,"name":"campaing_image","image_path":"images/1664731565622484.jpg","campaing":"22","created_at":"2022-10-02T13:26:05.000000Z","updated_at":"2022-10-02T13:26:05.000000Z"},{"id":21,"name":"campaing_image","image_path":"images/1664731565360938.jpg","campaing":"22","created_at":"2022-10-02T13:26:05.000000Z","updated_at":"2022-10-02T13:26:05.000000Z"}],"products":[{"product_id":1,"product_name":"عربي منتج ","product_image":"images/rangerover.png","product_description":"وصف منتج عربي","product_name_ref_id":3,"product_description_ref_id":4,"created_at":"2022-09-29T09:23:17.000000Z","updated_at":"2022-09-29T09:23:17.000000Z"}],"is_countdown":true},"winner":{"id":1,"email":"majdsafira@gmail.com","phone":"0789666494","first_name":null,"last_name":null,"gender":null,"dob":null,"street":null,"city":null,"level_id":1,"created_at":"2022-09-29T07:29:04.000000Z","updated_at":"2022-09-29T07:29:04.000000Z"},"coupon":null}]
/// winners : [{"id":1,"campaign_id":22,"winner_id":1,"coupon_id":1,"draw_date":"2022-10-10 00:00:00","upcoming_date":"2022-10-07 14:59:45","status":"","winner_name":null,"winner_address":null,"stream_url":"http://google.com","created_at":"2022-10-06T09:30:29.000000Z","updated_at":null,"campaign":{"id":22,"name":"Sybil Dean","image":"images/rangerover.png","description":"Consequatur Sint am","name_ref_id":0,"description_ref_id":0,"price":"10","donate":1,"early":1,"early_bird_quantity":100,"early_bird_stock":94,"quantity":3000,"sold":110,"prize":"Sit aspernatur excep","draw_date":"2000-10-25","start_date":"2021-12-28","end_date":"2022-10-28","product_id":1,"created_at":"2022-10-02T13:26:05.000000Z","updated_at":"2022-10-05T01:42:11.000000Z","countdown_date":"2022-09-07 00:00:00","countdown_quantity":0,"status":"active","images":[{"id":18,"name":"campaing_image","image_path":"images/1664731565513210.jpg","campaing":"22","created_at":"2022-10-02T13:26:05.000000Z","updated_at":"2022-10-02T13:26:05.000000Z"},{"id":19,"name":"campaing_image","image_path":"images/1664731565470694.jpg","campaing":"22","created_at":"2022-10-02T13:26:05.000000Z","updated_at":"2022-10-02T13:26:05.000000Z"},{"id":20,"name":"campaing_image","image_path":"images/1664731565622484.jpg","campaing":"22","created_at":"2022-10-02T13:26:05.000000Z","updated_at":"2022-10-02T13:26:05.000000Z"},{"id":21,"name":"campaing_image","image_path":"images/1664731565360938.jpg","campaing":"22","created_at":"2022-10-02T13:26:05.000000Z","updated_at":"2022-10-02T13:26:05.000000Z"}],"products":[{"product_id":1,"product_name":"عربي منتج ","product_image":"images/rangerover.png","product_description":"وصف منتج عربي","product_name_ref_id":3,"product_description_ref_id":4,"created_at":"2022-09-29T09:23:17.000000Z","updated_at":"2022-09-29T09:23:17.000000Z"}],"is_countdown":true},"winner":{"id":1,"email":"majdsafira@gmail.com","phone":"0789666494","first_name":null,"last_name":null,"gender":null,"dob":null,"street":null,"city":null,"level_id":1,"created_at":"2022-09-29T07:29:04.000000Z","updated_at":"2022-09-29T07:29:04.000000Z"},"coupon":null}]
/// theme : [{"id":1,"name":"main_button_color","value":"X0FFFFFF","template":"template 1","created_at":"2022-10-08T12:56:39.000000Z","updated_at":null}]
/// setting : [{"id":1,"name":"is_video_into","value":"true","type":"app_options","template":null,"status":"active","created_at":"2022-10-08T13:02:03.000000Z","updated_at":null}]
/// wish_list : [{"id":1,"campaign_id":22,"user_id":3,"created_at":"2022-10-08T12:56:49.000000Z","updated_at":null,"campaign":{"id":22,"name":"Sybil Dean","image":"images/rangerover.png","description":"Consequatur Sint am","name_ref_id":0,"description_ref_id":0,"price":"10","donate":1,"early":1,"early_bird_quantity":100,"early_bird_stock":94,"quantity":3000,"sold":110,"prize":"Sit aspernatur excep","draw_date":"2000-10-25","start_date":"2021-12-28","end_date":"2022-10-28","product_id":1,"created_at":"2022-10-02T13:26:05.000000Z","updated_at":"2022-10-05T01:42:11.000000Z","countdown_date":"2022-09-07 00:00:00","countdown_quantity":0,"status":"active","images":[{"id":18,"name":"campaing_image","image_path":"images/1664731565513210.jpg","campaing":"22","created_at":"2022-10-02T13:26:05.000000Z","updated_at":"2022-10-02T13:26:05.000000Z"},{"id":19,"name":"campaing_image","image_path":"images/1664731565470694.jpg","campaing":"22","created_at":"2022-10-02T13:26:05.000000Z","updated_at":"2022-10-02T13:26:05.000000Z"},{"id":20,"name":"campaing_image","image_path":"images/1664731565622484.jpg","campaing":"22","created_at":"2022-10-02T13:26:05.000000Z","updated_at":"2022-10-02T13:26:05.000000Z"},{"id":21,"name":"campaing_image","image_path":"images/1664731565360938.jpg","campaing":"22","created_at":"2022-10-02T13:26:05.000000Z","updated_at":"2022-10-02T13:26:05.000000Z"}],"products":[{"product_id":1,"product_name":"عربي منتج ","product_image":"images/rangerover.png","product_description":"وصف منتج عربي","product_name_ref_id":3,"product_description_ref_id":4,"created_at":"2022-09-29T09:23:17.000000Z","updated_at":"2022-09-29T09:23:17.000000Z"}],"is_countdown":true}}]
/// cart : {"items":[{"id":42,"campaign_id":22,"user_id":3,"quantity":5,"cart_total":null,"created_at":"2022-10-05T05:53:33.000000Z","updated_at":"2022-10-05T05:53:33.000000Z","campaign":{"id":22,"name":"Sybil Dean","image":"images/rangerover.png","description":"Consequatur Sint am","name_ref_id":0,"description_ref_id":0,"price":"10","donate":1,"early":1,"early_bird_quantity":100,"early_bird_stock":94,"quantity":3000,"sold":110,"prize":"Sit aspernatur excep","draw_date":"2000-10-25","start_date":"2021-12-28","end_date":"2022-10-28","product_id":1,"created_at":"2022-10-02T13:26:05.000000Z","updated_at":"2022-10-05T01:42:11.000000Z","countdown_date":"2022-09-07 00:00:00","countdown_quantity":0,"status":"active","images":[{"id":18,"name":"campaing_image","image_path":"images/1664731565513210.jpg","campaing":"22","created_at":"2022-10-02T13:26:05.000000Z","updated_at":"2022-10-02T13:26:05.000000Z"},{"id":19,"name":"campaing_image","image_path":"images/1664731565470694.jpg","campaing":"22","created_at":"2022-10-02T13:26:05.000000Z","updated_at":"2022-10-02T13:26:05.000000Z"},{"id":20,"name":"campaing_image","image_path":"images/1664731565622484.jpg","campaing":"22","created_at":"2022-10-02T13:26:05.000000Z","updated_at":"2022-10-02T13:26:05.000000Z"},{"id":21,"name":"campaing_image","image_path":"images/1664731565360938.jpg","campaing":"22","created_at":"2022-10-02T13:26:05.000000Z","updated_at":"2022-10-02T13:26:05.000000Z"}],"products":[{"product_id":1,"product_name":"عربي منتج ","product_image":"images/rangerover.png","product_description":"وصف منتج عربي","product_name_ref_id":3,"product_description_ref_id":4,"created_at":"2022-09-29T09:23:17.000000Z","updated_at":"2022-09-29T09:23:17.000000Z"}],"is_countdown":true}}],"subtotal":10,"promo_code_discount":"0.00","tax":"0.50","total":"10.50"}
/// user_coupons : [{"id":269,"user_id":3,"campaign_id":22,"code":"22-576993-3-E","status":"on_hold","copoun_type":null,"created_at":"2022-10-05T01:42:11.000000Z","updated_at":"2022-10-05T01:42:11.000000Z","order_id":65},{"id":270,"user_id":3,"campaign_id":22,"code":"22-877038-3-O","status":"on_hold","copoun_type":null,"created_at":"2022-10-05T01:42:11.000000Z","updated_at":"2022-10-05T01:42:11.000000Z","order_id":65},{"id":271,"user_id":3,"campaign_id":22,"code":"22-974241-3-O","status":"on_hold","copoun_type":null,"created_at":"2022-10-05T01:42:11.000000Z","updated_at":"2022-10-05T01:42:11.000000Z","order_id":65},{"id":272,"user_id":3,"campaign_id":22,"code":"22-509224-3-O","status":"on_hold","copoun_type":null,"created_at":"2022-10-05T01:42:11.000000Z","updated_at":"2022-10-05T01:42:11.000000Z","order_id":65},{"id":273,"user_id":3,"campaign_id":22,"code":"22-874878-3-O","status":"on_hold","copoun_type":null,"created_at":"2022-10-05T01:42:11.000000Z","updated_at":"2022-10-05T01:42:11.000000Z","order_id":65},{"id":274,"user_id":3,"campaign_id":22,"code":"22-526705-3-O","status":"on_hold","copoun_type":null,"created_at":"2022-10-05T01:42:11.000000Z","updated_at":"2022-10-05T01:42:11.000000Z","order_id":65},{"id":275,"user_id":3,"campaign_id":22,"code":"22-421480-3-O","status":"on_hold","copoun_type":null,"created_at":"2022-10-05T01:46:06.000000Z","updated_at":"2022-10-05T01:46:06.000000Z","order_id":66},{"id":276,"user_id":3,"campaign_id":22,"code":"22-823555-3-O","status":"on_hold","copoun_type":null,"created_at":"2022-10-05T01:46:06.000000Z","updated_at":"2022-10-05T01:46:06.000000Z","order_id":66},{"id":277,"user_id":3,"campaign_id":22,"code":"22-945444-3-O","status":"on_hold","copoun_type":null,"created_at":"2022-10-05T01:46:06.000000Z","updated_at":"2022-10-05T01:46:06.000000Z","order_id":66},{"id":278,"user_id":3,"campaign_id":22,"code":"22-535548-3-O","status":"on_hold","copoun_type":null,"created_at":"2022-10-05T01:46:06.000000Z","updated_at":"2022-10-05T01:46:06.000000Z","order_id":66},{"id":279,"user_id":3,"campaign_id":22,"code":"22-314873-3-O","status":"on_hold","copoun_type":null,"created_at":"2022-10-05T01:46:06.000000Z","updated_at":"2022-10-05T01:46:06.000000Z","order_id":66},{"id":280,"user_id":3,"campaign_id":22,"code":"22-455189-3-O","status":"on_hold","copoun_type":null,"created_at":"2022-10-05T01:46:06.000000Z","updated_at":"2022-10-05T01:46:06.000000Z","order_id":66},{"id":281,"user_id":3,"campaign_id":22,"code":"22-790037-3-O","status":"on_hold","copoun_type":null,"created_at":"2022-10-05T01:46:06.000000Z","updated_at":"2022-10-05T01:46:06.000000Z","order_id":66},{"id":282,"user_id":3,"campaign_id":22,"code":"22-461798-3-O","status":"on_hold","copoun_type":null,"created_at":"2022-10-05T01:46:06.000000Z","updated_at":"2022-10-05T01:46:06.000000Z","order_id":66},{"id":283,"user_id":3,"campaign_id":22,"code":"22-244702-3-O","status":"on_hold","copoun_type":null,"created_at":"2022-10-05T01:46:06.000000Z","updated_at":"2022-10-05T01:46:06.000000Z","order_id":66},{"id":284,"user_id":3,"campaign_id":22,"code":"22-859465-3-O","status":"on_hold","copoun_type":null,"created_at":"2022-10-05T01:46:06.000000Z","updated_at":"2022-10-05T01:46:06.000000Z","order_id":66},{"id":285,"user_id":3,"campaign_id":22,"code":"22-543904-3-O","status":"on_hold","copoun_type":null,"created_at":"2022-10-05T01:49:08.000000Z","updated_at":"2022-10-05T01:49:08.000000Z","order_id":67},{"id":286,"user_id":3,"campaign_id":22,"code":"22-933139-3-O","status":"on_hold","copoun_type":null,"created_at":"2022-10-05T01:49:08.000000Z","updated_at":"2022-10-05T01:49:08.000000Z","order_id":67},{"id":287,"user_id":3,"campaign_id":22,"code":"22-684455-3-O","status":"on_hold","copoun_type":null,"created_at":"2022-10-05T01:49:08.000000Z","updated_at":"2022-10-05T01:49:08.000000Z","order_id":67},{"id":288,"user_id":3,"campaign_id":22,"code":"22-808208-3-O","status":"on_hold","copoun_type":null,"created_at":"2022-10-05T01:49:08.000000Z","updated_at":"2022-10-05T01:49:08.000000Z","order_id":67},{"id":289,"user_id":3,"campaign_id":22,"code":"22-449271-3-O","status":"on_hold","copoun_type":null,"created_at":"2022-10-05T01:49:08.000000Z","updated_at":"2022-10-05T01:49:08.000000Z","order_id":67},{"id":290,"user_id":3,"campaign_id":22,"code":"22-117961-3-O","status":"on_hold","copoun_type":null,"created_at":"2022-10-05T01:49:23.000000Z","updated_at":"2022-10-05T01:49:23.000000Z","order_id":68},{"id":291,"user_id":3,"campaign_id":22,"code":"22-533491-3-O","status":"on_hold","copoun_type":null,"created_at":"2022-10-05T01:49:23.000000Z","updated_at":"2022-10-05T01:49:23.000000Z","order_id":68},{"id":292,"user_id":3,"campaign_id":22,"code":"22-365855-3-O","status":"on_hold","copoun_type":null,"created_at":"2022-10-05T01:49:23.000000Z","updated_at":"2022-10-05T01:49:23.000000Z","order_id":68},{"id":293,"user_id":3,"campaign_id":22,"code":"22-637449-3-O","status":"on_hold","copoun_type":null,"created_at":"2022-10-05T01:49:23.000000Z","updated_at":"2022-10-05T01:49:23.000000Z","order_id":68},{"id":294,"user_id":3,"campaign_id":22,"code":"22-620483-3-O","status":"on_hold","copoun_type":null,"created_at":"2022-10-05T01:49:23.000000Z","updated_at":"2022-10-05T01:49:23.000000Z","order_id":68}]
/// user_credit_cards : [{"id":1,"user_id":3,"last_digits":1234,"card_type":"VISA","token":"token is herkfksmflfka ","status":"active","created_at":"2022-10-08T14:24:33.000000Z","updated_at":null}]
/// intro_content : []
/// user_current_level : [{"id":1,"name":"حملة عربي","benefits":"get back 1.5% of your purchase","name_ref_id":7,"benefits_ref_id":8,"xd":"1500","created_at":null,"updated_at":"2022-09-27T06:51:13.000000Z"}]
/// notifications : [{"id":1,"sender_id":1,"receiver_id":3,"title":"notification title","subtitle":"notification subtitle","campaign_id":22,"draw_id":0,"status":"seen","created_at":"2022-10-08T13:00:50.000000Z","updated_at":null}]

class ApiAppVariables {
  ApiAppVariables({
    ApiUser? user,
    List<ApiBanner>? banners,
    List<ApiLevel>? levels,
    List<ApiCampaign>? closingSoonCampaigns,
    List<ApiCampaign>? activeCampaigns,
    List<ApiCampaign>? closedCampaigns,
    List<ApiDraw>? upcomingDraws,
    List<ApiDraw>? winners,
    List<ApiTheme>? theme,
    List<ApiSetting>? setting,
    List<ApiWishListItem>? wishList,
    ApiCart? cart,
    List<ApiCoupon>? userCoupons,
    List<ApiCreditCard>? userCreditCards,
    ApiUserCurrentLevel? userCurrentLevel,
    List<ApiProduct>? products,
    List<ApiNotification>? notifications,
    List<ApiAddress>? addresses,
  }){
    _user = user;
    _banners = banners;
    _levels = levels;
    _closingSoonCampaigns = closingSoonCampaigns;
    _activeCampaigns = activeCampaigns;
    _closedCampaigns = closedCampaigns;
    _upcomingDraws = upcomingDraws;
    _winners = winners;
    _theme = theme;
    _setting = setting;
    _wishList = wishList;
    _cart = cart;
    _userCoupons = userCoupons;
    _userCreditCards = userCreditCards;
    _userCurrentLevel = userCurrentLevel;
    _products = products;
    _notifications = notifications;
    _addresses = addresses;
  }

  ApiAppVariables.fromJson(dynamic json) {
    _user = json['user'] != null ? ApiUser.fromJson(json['user']) : null;
    if (json['banners'] != null) {
      _banners = [];
      json['banners'].forEach((v) {
        _banners?.add(ApiBanner.fromJson(v));
      });
    }
    if (json['levels'] != null) {
      _levels = [];
      json['levels'].forEach((v) {
        _levels?.add(ApiLevel.fromJson(v));
      });
    }
    if (json['closing_soon_campaigns'] != null) {
      _closingSoonCampaigns = [];
      json['closing_soon_campaigns'].forEach((v) {
        _closingSoonCampaigns?.add(ApiCampaign.fromJson(v));
      });
    }
    if (json['active_campaigns'] != null) {
      _activeCampaigns = [];
      json['active_campaigns'].forEach((v) {
        _activeCampaigns?.add(ApiCampaign.fromJson(v));
      });
    }
    if (json['closed_campaigns'] != null) {
      _closedCampaigns = [];
      json['closed_campaigns'].forEach((v) {
        _closedCampaigns?.add(ApiCampaign.fromJson(v));
      });
    }
    if (json['upcoming_draws'] != null) {
      _upcomingDraws = [];
      json['upcoming_draws'].forEach((v) {
        _upcomingDraws?.add(ApiDraw.fromJson(v));
      });
    }
    if (json['winners'] != null) {
      _winners = [];
      json['winners'].forEach((v) {
        _winners?.add(ApiDraw.fromJson(v));
      });
    }
    if (json['theme'] != null) {
      _theme = [];
      json['theme'].forEach((v) {
        _theme?.add(ApiTheme.fromJson(v));
      });
    }
    if (json['setting'] != null) {
      _setting = [];
      json['setting'].forEach((v) {
        _setting?.add(ApiSetting.fromJson(v));
      });
    }
    if (json['wish_list'] != null) {
      _wishList = [];
      json['wish_list'].forEach((v) {
        _wishList?.add(ApiWishListItem.fromJson(v));
      });
    }
    _cart = json['cart'] != null ? ApiCart.fromJson(json['cart']) : null;
    if (json['user_coupons'] != null) {
      _userCoupons = [];
      json['user_coupons'].forEach((v) {
        _userCoupons?.add(ApiCoupon.fromJson(v));
      });
    }
    if (json['user_credit_cards'] != null) {
      _userCreditCards = [];
      json['user_credit_cards'].forEach((v) {
        _userCreditCards?.add(ApiCreditCard.fromJson(v));
      });
    }

     _userCurrentLevel = json['user_current_level'] != null ? ApiUserCurrentLevel.fromJson(json['user_current_level']) : null;

    if (json['products'] != null) {
      _products = [];
      json['products'].forEach((v) {
        _products?.add(ApiProduct.fromJson(v));
      });
    }
    if (json['notifications'] != null) {
      _notifications = [];
      json['notifications'].forEach((v) {
        _notifications?.add(ApiNotification.fromJson(v));
      });
    }
    if (json['addresses'] != null) {
      _addresses = [];
      json['addresses'].forEach((v) {
        _addresses?.add(ApiAddress.fromJson(v));
      });
    }
  }
  ApiUser? _user;
  List<ApiBanner>? _banners;
  List<ApiLevel>? _levels;
  List<ApiCampaign>? _closingSoonCampaigns;
  List<ApiCampaign>? _activeCampaigns;
  List<ApiCampaign>? _closedCampaigns;
  List<ApiDraw>? _upcomingDraws;
  List<ApiDraw>? _winners;
  List<ApiTheme>? _theme;
  List<ApiSetting>? _setting;
  List<ApiWishListItem>? _wishList;
  ApiCart? _cart;
  List<ApiCoupon>? _userCoupons;
  List<ApiCreditCard>? _userCreditCards;

  ApiUserCurrentLevel? _userCurrentLevel;
  List<ApiProduct>? _products;
  List<ApiNotification>? _notifications;
  List<ApiAddress>? _addresses;
  ApiAppVariables copyWith({  ApiUser? user,
    List<ApiBanner>? banners,
    List<ApiLevel>? levels,
    List<ApiCampaign>? closingSoonCampaigns,
    List<ApiCampaign>? activeCampaigns,
    List<ApiCampaign>? closedCampaigns,
    List<ApiDraw>? upcomingDraws,
    List<ApiDraw>? winners,
    List<ApiTheme>? theme,
    List<ApiSetting>? setting,
    List<ApiWishListItem>? wishList,
    ApiCart? cart,
    List<ApiCoupon>? userCoupons,
    List<ApiCreditCard>? userCreditCards,
    List<dynamic>? introContent,
   ApiUserCurrentLevel? userCurrentLevel,
    List<ApiProduct>? products,
    List<ApiAddress>? addresses,
    List<ApiNotification>? notifications,
  }) => ApiAppVariables(  user: user ?? _user,
    banners: banners ?? _banners,
    levels: levels ?? _levels,
    closingSoonCampaigns: closingSoonCampaigns ?? _closingSoonCampaigns,
    activeCampaigns: activeCampaigns ?? _activeCampaigns,
    closedCampaigns: closedCampaigns ?? _closedCampaigns,
    upcomingDraws: upcomingDraws ?? _upcomingDraws,
    winners: winners ?? _winners,
    theme: theme ?? _theme,
    setting: setting ?? _setting,
    wishList: wishList ?? _wishList,
    cart: cart ?? _cart,
    userCoupons: userCoupons ?? _userCoupons,
    userCreditCards: userCreditCards ?? _userCreditCards,

    userCurrentLevel: userCurrentLevel ?? _userCurrentLevel,
    products: products ?? _products,
    addresses: addresses ?? _addresses,
    notifications: notifications ?? _notifications,
  );
  ApiUser? get user => _user;
  List<ApiBanner>? get banners => _banners;
  List<ApiLevel>? get levels => _levels;
  List<ApiCampaign>? get closingSoonCampaigns => _closingSoonCampaigns;
  List<ApiCampaign>? get activeCampaigns => _activeCampaigns;
  List<ApiCampaign>? get closedCampaigns => _closedCampaigns;
  List<ApiDraw>? get upcomingDraws => _upcomingDraws;
  List<ApiDraw>? get winners => _winners;
  List<ApiTheme>? get theme => _theme;
  List<ApiSetting>? get setting => _setting;
  List<ApiWishListItem>? get wishList => _wishList;
  ApiCart? get cart => _cart;
  List<ApiCoupon>? get userCoupons => _userCoupons;
  List<ApiCreditCard>? get userCreditCards => _userCreditCards;

 ApiUserCurrentLevel? get userCurrentLevel => _userCurrentLevel;
  List<ApiProduct>? get products => _products;
  List<ApiNotification>? get notifications => _notifications;
  List<ApiAddress>? get addresses => _addresses;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_user != null) {
      map['user'] = _user?.toJson();
    }
    if (_banners != null) {
      map['banners'] = _banners?.map((v) => v.toJson()).toList();
    }
    if (_levels != null) {
      map['levels'] = _levels?.map((v) => v.toJson()).toList();
    }
    if (_closingSoonCampaigns != null) {
      map['closing_soon_campaigns'] = _closingSoonCampaigns?.map((v) => v.toJson()).toList();
    }
    if (_activeCampaigns != null) {
      map['active_campaigns'] = _activeCampaigns?.map((v) => v.toJson()).toList();
    }
    if (_closedCampaigns != null) {
      map['closed_campaigns'] = _closedCampaigns?.map((v) => v.toJson()).toList();
    }
    if (_upcomingDraws != null) {
      map['upcoming_draws'] = _upcomingDraws?.map((v) => v.toJson()).toList();
    }
    if (_winners != null) {
      map['winners'] = _winners?.map((v) => v.toJson()).toList();
    }
    if (_theme != null) {
      map['theme'] = _theme?.map((v) => v.toJson()).toList();
    }
    if (_setting != null) {
      map['setting'] = _setting?.map((v) => v.toJson()).toList();
    }
    if (_wishList != null) {
      map['wish_list'] = _wishList?.map((v) => v.toJson()).toList();
    }
    if (_cart != null) {
      map['cart'] = _cart?.toJson();
    }
    if (_userCoupons != null) {
      map['user_coupons'] = _userCoupons?.map((v) => v.toJson()).toList();
    }
    if (_userCreditCards != null) {
      map['user_credit_cards'] = _userCreditCards?.map((v) => v.toJson()).toList();
    }

    if (_userCurrentLevel != null) {
      map['user_current_level'] = _userCurrentLevel?.toJson();
    }
    if (_products != null) {
      map['products'] = _products?.map((v) => v.toJson()).toList();
    }
    if (_notifications != null) {
      map['notifications'] = _notifications?.map((v) => v.toJson()).toList();
    }
    if (_addresses != null) {
      map['addresses'] = _addresses?.map((v) => v.toJson()).toList();
    }
    return map;
  }
  set addresses(List<ApiAddress>? value) {
    _addresses = value;
  }
  set notifications(List<ApiNotification>? value) {
    _notifications = value;
  }

  set products(List<ApiProduct>? value) {
    _products = value;
  }

  set userCurrentLevel(ApiUserCurrentLevel? value) {
    _userCurrentLevel = value;
  }

  set userCreditCards(List<ApiCreditCard>? value) {
    _userCreditCards = value;
  }

  set userCoupons(List<ApiCoupon>? value) {
    _userCoupons = value;
  }

  set cart(ApiCart? value) {
    _cart = value;
  }

  set wishList(List<ApiWishListItem>? value) {
    _wishList = value;
  }

  set setting(List<ApiSetting>? value) {
    _setting = value;
  }

  set theme(List<ApiTheme>? value) {
    _theme = value;
  }

  set winners(List<ApiDraw>? value) {
    _winners = value;
  }

  set upcomingDraws(List<ApiDraw>? value) {
    _upcomingDraws = value;
  }

  set closedCampaigns(List<ApiCampaign>? value) {
    _closedCampaigns = value;
  }

  set activeCampaigns(List<ApiCampaign>? value) {
    _activeCampaigns = value;
  }

  set closingSoonCampaigns(List<ApiCampaign>? value) {
    _closingSoonCampaigns = value;
  }

  set levels(List<ApiLevel>? value) {
    _levels = value;
  }

  set banners(List<ApiBanner>? value) {
    _banners = value;
  }

  set user(ApiUser? value) {
    _user = value;
  }
}
