/*==============================================================*/
/* DBMS name:      Microsoft SQL Server 2005                    */
/* Created on:     2/14/2018 1:57:10 PM                         */
/*==============================================================*/


alter table CATEGORY
   drop constraint FK_CATEGORY_PARENT_CA_CATEGORY
go

alter table PRODUCT
   drop constraint FK_PRODUCT_HAS_SHOP_SHOP
go

alter table PRODUCT
   drop constraint FK_PRODUCT_IS_CATEGO_CATEGORY
go

alter table PROD_REVIEW
   drop constraint FK_PROD_REV_RELATIONS_USER
go

alter table PROD_REVIEW
   drop constraint FK_PROD_REV_RELATIONS_PRODUCT
go

alter table SHIPPER_IN_SHOP
   drop constraint FK_SHIPPER__RELATIONS_SHIPPER
go

alter table SHIPPER_IN_SHOP
   drop constraint FK_SHIPPER__RELATIONS_SHOP
go

alter table SHOP
   drop constraint FK_SHOP_SELER_USER
go

alter table SHOP_REVIEW
   drop constraint FK_SHOP_REV_RELATIONS_USER
go

alter table SHOP_REVIEW
   drop constraint FK_SHOP_REV_RELATIONS_SHOP
go

alter table "USER"
   drop constraint FK_USER_HAS_ROLE_ROLE
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('CATEGORY')
            and   name  = 'PARENT_CAT_FK'
            and   indid > 0
            and   indid < 255)
   drop index CATEGORY.PARENT_CAT_FK
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('PRODUCT')
            and   name  = 'HAS_SHOP_FK'
            and   indid > 0
            and   indid < 255)
   drop index PRODUCT.HAS_SHOP_FK
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('PRODUCT')
            and   name  = 'IS_CATEGORY_FK'
            and   indid > 0
            and   indid < 255)
   drop index PRODUCT.IS_CATEGORY_FK
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('PROD_REVIEW')
            and   name  = 'RELATIONSHIP_6_FK'
            and   indid > 0
            and   indid < 255)
   drop index PROD_REVIEW.RELATIONSHIP_6_FK
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('PROD_REVIEW')
            and   name  = 'RELATIONSHIP_7_FK'
            and   indid > 0
            and   indid < 255)
   drop index PROD_REVIEW.RELATIONSHIP_7_FK
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('SHIPPER_IN_SHOP')
            and   name  = 'RELATIONSHIP_10_FK'
            and   indid > 0
            and   indid < 255)
   drop index SHIPPER_IN_SHOP.RELATIONSHIP_10_FK
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('SHIPPER_IN_SHOP')
            and   name  = 'RELATIONSHIP_11_FK'
            and   indid > 0
            and   indid < 255)
   drop index SHIPPER_IN_SHOP.RELATIONSHIP_11_FK
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('SHOP')
            and   name  = 'SELER_FK'
            and   indid > 0
            and   indid < 255)
   drop index SHOP.SELER_FK
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('SHOP_REVIEW')
            and   name  = 'RELATIONSHIP_8_FK'
            and   indid > 0
            and   indid < 255)
   drop index SHOP_REVIEW.RELATIONSHIP_8_FK
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('SHOP_REVIEW')
            and   name  = 'RELATIONSHIP_9_FK'
            and   indid > 0
            and   indid < 255)
   drop index SHOP_REVIEW.RELATIONSHIP_9_FK
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('"USER"')
            and   name  = 'HAS_ROLE_FK'
            and   indid > 0
            and   indid < 255)
   drop index "USER".HAS_ROLE_FK
go

if exists (select 1
            from  sysobjects
           where  id = object_id('CATEGORY')
            and   type = 'U')
   drop table CATEGORY
go

if exists (select 1
            from  sysobjects
           where  id = object_id('PRODUCT')
            and   type = 'U')
   drop table PRODUCT
go

if exists (select 1
            from  sysobjects
           where  id = object_id('PROD_REVIEW')
            and   type = 'U')
   drop table PROD_REVIEW
go

if exists (select 1
            from  sysobjects
           where  id = object_id('ROLE')
            and   type = 'U')
   drop table ROLE
go

if exists (select 1
            from  sysobjects
           where  id = object_id('SHIPPER')
            and   type = 'U')
   drop table SHIPPER
go

if exists (select 1
            from  sysobjects
           where  id = object_id('SHIPPER_IN_SHOP')
            and   type = 'U')
   drop table SHIPPER_IN_SHOP
go

if exists (select 1
            from  sysobjects
           where  id = object_id('SHOP')
            and   type = 'U')
   drop table SHOP
go

if exists (select 1
            from  sysobjects
           where  id = object_id('SHOP_REVIEW')
            and   type = 'U')
   drop table SHOP_REVIEW
go

if exists (select 1
            from  sysobjects
           where  id = object_id('"USER"')
            and   type = 'U')
   drop table "USER"
go

/*==============================================================*/
/* Table: CATEGORY                                              */
/*==============================================================*/
create table CATEGORY (
   CATEGORY_ID          int                  not null,
   CAT_CATEGORY_ID      int                  null,
   NAME                 varchar(250)         not null,
   DESCRIPTION          varchar(250)         null,
   constraint PK_CATEGORY primary key nonclustered (CATEGORY_ID)
)
go

/*==============================================================*/
/* Index: PARENT_CAT_FK                                         */
/*==============================================================*/
create index PARENT_CAT_FK on CATEGORY (
CAT_CATEGORY_ID ASC
)
go

/*==============================================================*/
/* Table: PRODUCT                                               */
/*==============================================================*/
create table PRODUCT (
   PRODUCT_ID           int                  not null,
   CATEGORY_ID          int                  not null,
   SHOP_ID              int                  not null,
   NAME                 varchar(250)         not null,
   COLOUR               varchar(250)         not null,
   DIMENSION            varchar(250)         not null,
   WEIGHT               varchar(250)         not null,
   PROD_COUNTRY         varchar(250)         not null,
   MANUFACTURER         varchar(250)         not null,
   PRICE                decimal(15,17)       not null,
   IMAGE                image                not null,
   VIDEO                binary(%n)           null,
   RATING               decimal(5,3)         not null,
   REVIEW               varchar(250)         not null,
   STOCK                int                  not null,
   constraint PK_PRODUCT primary key nonclustered (PRODUCT_ID)
)
go

/*==============================================================*/
/* Index: IS_CATEGORY_FK                                        */
/*==============================================================*/
create index IS_CATEGORY_FK on PRODUCT (
CATEGORY_ID ASC
)
go

/*==============================================================*/
/* Index: HAS_SHOP_FK                                           */
/*==============================================================*/
create index HAS_SHOP_FK on PRODUCT (
SHOP_ID ASC
)
go

/*==============================================================*/
/* Table: PROD_REVIEW                                           */
/*==============================================================*/
create table PROD_REVIEW (
   REVIEW_ID            int                  not null,
   USER_ID              int                  not null,
   PRODUCT_ID           int                  null,
   DATE                 datetime             not null,
   RATING               decimal(5,3)         null,
   COMMENT              varchar(2500)        null,
   constraint PK_PROD_REVIEW primary key nonclustered (REVIEW_ID)
)
go

/*==============================================================*/
/* Index: RELATIONSHIP_6_FK                                     */
/*==============================================================*/
create index RELATIONSHIP_6_FK on PROD_REVIEW (
USER_ID ASC
)
go

/*==============================================================*/
/* Index: RELATIONSHIP_7_FK                                     */
/*==============================================================*/
create index RELATIONSHIP_7_FK on PROD_REVIEW (
PRODUCT_ID ASC
)
go

/*==============================================================*/
/* Table: ROLE                                                  */
/*==============================================================*/
create table ROLE (
   ROLE_ID              int                  not null,
   ROLE                 varchar(250)         not null,
   constraint PK_ROLE primary key nonclustered (ROLE_ID)
)
go

/*==============================================================*/
/* Table: SHIPPER                                               */
/*==============================================================*/
create table SHIPPER (
   SHIPPER_ID           int                  not null,
   NAME                 varchar(250)         not null,
   DESCRIPTION          varchar(250)         null,
   constraint PK_SHIPPER primary key nonclustered (SHIPPER_ID)
)
go

/*==============================================================*/
/* Table: SHIPPER_IN_SHOP                                       */
/*==============================================================*/
create table SHIPPER_IN_SHOP (
   SHIPPER_ID           int                  not null,
   SHOP_ID              int                  not null,
   PRICE                decimal(15,17)       not null,
   constraint PK_SHIPPER_IN_SHOP primary key (SHIPPER_ID, SHOP_ID)
)
go

/*==============================================================*/
/* Index: RELATIONSHIP_10_FK                                    */
/*==============================================================*/
create index RELATIONSHIP_10_FK on SHIPPER_IN_SHOP (
SHIPPER_ID ASC
)
go

/*==============================================================*/
/* Index: RELATIONSHIP_11_FK                                    */
/*==============================================================*/
create index RELATIONSHIP_11_FK on SHIPPER_IN_SHOP (
SHOP_ID ASC
)
go

/*==============================================================*/
/* Table: SHOP                                                  */
/*==============================================================*/
create table SHOP (
   SHOP_ID              int                  not null,
   USER_ID              int                  not null,
   NAME                 varchar(250)         not null,
   ADDRESS              varchar(250)         not null,
   PROD_COUNTRY         varchar(250)         not null,
   PHONE                varchar(250)         not null,
   EMAIL                varchar(250)         not null,
   RATING               decimal(5,3)         not null,
   REVIEW               varchar(250)         not null,
   constraint PK_SHOP primary key nonclustered (SHOP_ID)
)
go

/*==============================================================*/
/* Index: SELER_FK                                              */
/*==============================================================*/
create index SELER_FK on SHOP (
USER_ID ASC
)
go

/*==============================================================*/
/* Table: SHOP_REVIEW                                           */
/*==============================================================*/
create table SHOP_REVIEW (
   REVIEW_ID2           int                  not null,
   SHOP_ID              int                  null,
   USER_ID              int                  null,
   DATE                 datetime             not null,
   RATING               decimal(5,3)         null,
   COMMENT              varchar(2500)        null,
   constraint PK_SHOP_REVIEW primary key nonclustered (REVIEW_ID2)
)
go

/*==============================================================*/
/* Index: RELATIONSHIP_8_FK                                     */
/*==============================================================*/
create index RELATIONSHIP_8_FK on SHOP_REVIEW (
USER_ID ASC
)
go

/*==============================================================*/
/* Index: RELATIONSHIP_9_FK                                     */
/*==============================================================*/
create index RELATIONSHIP_9_FK on SHOP_REVIEW (
SHOP_ID ASC
)
go

/*==============================================================*/
/* Table: "USER"                                                */
/*==============================================================*/
create table "USER" (
   USER_ID              int                  not null,
   ROLE_ID              int                  not null,
   USERNAME             varchar(250)         not null,
   PASSWORD             varchar(250)         not null,
   NAME                 varchar(250)         not null,
   SURNAME              varchar(250)         not null,
   PHONE                varchar(250)         null,
   EMAIL                varchar(250)         not null,
   PROD_COUNTRY         varchar(250)         null,
   ADDRESS              varchar(250)         null,
   constraint PK_USER primary key nonclustered (USER_ID)
)
go

/*==============================================================*/
/* Index: HAS_ROLE_FK                                           */
/*==============================================================*/
create index HAS_ROLE_FK on "USER" (
ROLE_ID ASC
)
go

alter table CATEGORY
   add constraint FK_CATEGORY_PARENT_CA_CATEGORY foreign key (CAT_CATEGORY_ID)
      references CATEGORY (CATEGORY_ID)
go

alter table PRODUCT
   add constraint FK_PRODUCT_HAS_SHOP_SHOP foreign key (SHOP_ID)
      references SHOP (SHOP_ID)
go

alter table PRODUCT
   add constraint FK_PRODUCT_IS_CATEGO_CATEGORY foreign key (CATEGORY_ID)
      references CATEGORY (CATEGORY_ID)
go

alter table PROD_REVIEW
   add constraint FK_PROD_REV_RELATIONS_USER foreign key (USER_ID)
      references "USER" (USER_ID)
go

alter table PROD_REVIEW
   add constraint FK_PROD_REV_RELATIONS_PRODUCT foreign key (PRODUCT_ID)
      references PRODUCT (PRODUCT_ID)
go

alter table SHIPPER_IN_SHOP
   add constraint FK_SHIPPER__RELATIONS_SHIPPER foreign key (SHIPPER_ID)
      references SHIPPER (SHIPPER_ID)
go

alter table SHIPPER_IN_SHOP
   add constraint FK_SHIPPER__RELATIONS_SHOP foreign key (SHOP_ID)
      references SHOP (SHOP_ID)
go

alter table SHOP
   add constraint FK_SHOP_SELER_USER foreign key (USER_ID)
      references "USER" (USER_ID)
go

alter table SHOP_REVIEW
   add constraint FK_SHOP_REV_RELATIONS_USER foreign key (USER_ID)
      references "USER" (USER_ID)
go

alter table SHOP_REVIEW
   add constraint FK_SHOP_REV_RELATIONS_SHOP foreign key (SHOP_ID)
      references SHOP (SHOP_ID)
go

alter table "USER"
   add constraint FK_USER_HAS_ROLE_ROLE foreign key (ROLE_ID)
      references ROLE (ROLE_ID)
go

