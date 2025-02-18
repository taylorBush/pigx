SPISNONc                 �   �    F/     Header                SYS_DEPT      DEPT_ID   NUMBER   NAME   VARCHAR2   SORT   NUMBER   CREATE_TIME   DATE   UPDATE_TIME   DATE   DEL_FLAG   VARCHAR2	   PARENT_ID   NUMBER	   TENANT_ID   NUMBER7  create table SYS_DEPT
(
  dept_id     NUMBER not null,
  name        VARCHAR2(50),
  sort        NUMBER,
  create_time DATE,
  update_time DATE,
  del_flag    VARCHAR2(1),
  parent_id   NUMBER,
  tenant_id   NUMBER
)
;
alter table SYS_DEPT
  add constraint PRIMARYSYS_DEPT1 primary key (DEPT_ID);
   SYS_DEPT_RELATION      ANCESTOR   NUMBER
   DESCENDANT   NUMBERi  create table SYS_DEPT_RELATION
(
  ancestor   NUMBER not null,
  descendant NUMBER not null
)
;
create index IDX_IDX1SYS_DEPT_RELATION on SYS_DEPT_RELATION (ANCESTOR);
create index IDX_IDX2SYS_DEPT_RELATION on SYS_DEPT_RELATION (DESCENDANT);
alter table SYS_DEPT_RELATION
  add constraint PRIMARYSYS_DEPT_RELATION1 primary key (ANCESTOR, DESCENDANT);
   SYS_DICT      ID   NUMBER   VALUE   VARCHAR2   LABEL   VARCHAR2   TYPE   VARCHAR2   DESCRIPTION   VARCHAR2   SORT   NUMBER   CREATE_TIME   DATE   UPDATE_TIME   DATE   REMARKS   VARCHAR2   DEL_FLAG   VARCHAR2	   TENANT_ID   NUMBERT  create table SYS_DICT
(
  id          NUMBER not null,
  value       VARCHAR2(100),
  label       VARCHAR2(100),
  type        VARCHAR2(100),
  description VARCHAR2(100),
  sort        NUMBER,
  create_time DATE,
  update_time DATE,
  remarks     VARCHAR2(255),
  del_flag    VARCHAR2(1),
  tenant_id   NUMBER
)
;
create index IDX_SYS_DICT_DEL_FLAGSYS_DICT on SYS_DICT (DEL_FLAG);
create index IDX_SYS_DICT_LABELSYS_DICT on SYS_DICT (LABEL);
create index IDX_SYS_DICT_VALUESYS_DICT on SYS_DICT (VALUE);
alter table SYS_DICT
  add constraint PRIMARYSYS_DICT1 primary key (ID);
   SYS_LOG      ID   NUMBER   TYPE   VARCHAR2   TITLE   VARCHAR2
   SERVICE_ID   VARCHAR2	   CREATE_BY   VARCHAR2   CREATE_TIME   DATE   UPDATE_TIME   DATE   REMOTE_ADDR   VARCHAR2
   USER_AGENT   VARCHAR2   REQUEST_URI   VARCHAR2   METHOD   VARCHAR2   PARAMS   BLOB   TIME   BLOB   DEL_FLAG   VARCHAR2	   EXCEPTION   BLOB	   TENANT_ID   NUMBER  create table SYS_LOG
(
  id          NUMBER not null,
  type        VARCHAR2(1),
  title       VARCHAR2(255),
  service_id  VARCHAR2(32),
  create_by   VARCHAR2(64),
  create_time DATE,
  update_time DATE,
  remote_addr VARCHAR2(255),
  user_agent  VARCHAR2(1000),
  request_uri VARCHAR2(255),
  method      VARCHAR2(10),
  params      BLOB,
  time        BLOB,
  del_flag    VARCHAR2(1),
  exception   BLOB,
  tenant_id   NUMBER
)
;
create index IDX_SYS_LOG_CREATE_BYSYS_LOG on SYS_LOG (CREATE_BY);
create index IDX_SYS_LOG_CREATE_DATESYS_LOG on SYS_LOG (CREATE_TIME);
create index IDX_SYS_LOG_REQUEST_URISYS_LOG on SYS_LOG (REQUEST_URI);
create index IDX_SYS_LOG_TYPESYS_LOG on SYS_LOG (TYPE);
alter table SYS_LOG
  add constraint PRIMARYSYS_LOG1 primary key (ID);
   SYS_MENU      MENU_ID   NUMBER   NAME   VARCHAR2
   PERMISSION   VARCHAR2   PATH   VARCHAR2	   PARENT_ID   NUMBER   ICON   VARCHAR2	   COMPONENT   VARCHAR2   SORT   NUMBER
   KEEP_ALIVE   VARCHAR2   TYPE   VARCHAR2   CREATE_TIME   DATE   UPDATE_TIME   DATE   DEL_FLAG   VARCHAR2	   TENANT_ID   NUMBER�  create table SYS_MENU
(
  menu_id     NUMBER not null,
  name        VARCHAR2(32),
  permission  VARCHAR2(32),
  path        VARCHAR2(128),
  parent_id   NUMBER,
  icon        VARCHAR2(32),
  component   VARCHAR2(64),
  sort        NUMBER,
  keep_alive  VARCHAR2(1),
  type        VARCHAR2(1),
  create_time DATE,
  update_time DATE,
  del_flag    VARCHAR2(1),
  tenant_id   NUMBER
)
;
alter table SYS_MENU
  add constraint PRIMARYSYS_MENU1 primary key (MENU_ID);
   SYS_OAUTH_CLIENT_DETAILS   	   CLIENT_ID   VARCHAR2   RESOURCE_IDS   VARCHAR2   CLIENT_SECRET   VARCHAR2   SCOPE   VARCHAR2   AUTHORIZED_GRANT_TYPES   VARCHAR2   WEB_SERVER_REDIRECT_URI   VARCHAR2   AUTHORITIES   VARCHAR2   ACCESS_TOKEN_VALIDITY   NUMBER   REFRESH_TOKEN_VALIDITY   NUMBER   ADDITIONAL_INFORMATION   BLOB   AUTOAPPROVE   VARCHAR2	   TENANT_ID   NUMBER�  create table SYS_OAUTH_CLIENT_DETAILS
(
  client_id               VARCHAR2(32) not null,
  resource_ids            VARCHAR2(256),
  client_secret           VARCHAR2(256),
  scope                   VARCHAR2(256),
  authorized_grant_types  VARCHAR2(256),
  web_server_redirect_uri VARCHAR2(256),
  authorities             VARCHAR2(256),
  access_token_validity   NUMBER,
  refresh_token_validity  NUMBER,
  additional_information  BLOB,
  autoapprove             VARCHAR2(256),
  tenant_id               NUMBER
)
;
alter table SYS_OAUTH_CLIENT_DETAILS
  add constraint PRIMARYSYS_OAUTH_CLIENT_DETAIL primary key (CLIENT_ID);
   SYS_ROLE
      ROLE_ID   NUMBER	   ROLE_NAME   VARCHAR2	   ROLE_CODE   VARCHAR2	   ROLE_DESC   VARCHAR2   DS_TYPE   VARCHAR2   DS_SCOPE   VARCHAR2   CREATE_TIME   DATE   UPDATE_TIME   DATE   DEL_FLAG   VARCHAR2	   TENANT_ID   NUMBER�  create table SYS_ROLE
(
  role_id     NUMBER not null,
  role_name   VARCHAR2(64),
  role_code   VARCHAR2(64),
  role_desc   VARCHAR2(255),
  ds_type     VARCHAR2(1),
  ds_scope    VARCHAR2(255),
  create_time DATE,
  update_time DATE,
  del_flag    VARCHAR2(1),
  tenant_id   NUMBER
)
;
create index IDX_ROLE_IDX1_ROLE_CODESYS_ROL on SYS_ROLE (ROLE_CODE);
alter table SYS_ROLE
  add constraint PRIMARYSYS_ROLE1 primary key (ROLE_ID);
   SYS_ROLE_MENU      ROLE_ID   NUMBER   MENU_ID   NUMBER�   create table SYS_ROLE_MENU
(
  role_id NUMBER not null,
  menu_id NUMBER not null
)
;
alter table SYS_ROLE_MENU
  add constraint PRIMARYSYS_ROLE_MENU1 primary key (ROLE_ID, MENU_ID);
   SYS_ROUTE_CONF
      ID   NUMBER
   ROUTE_NAME   VARCHAR2   ROUTE_ID   VARCHAR2
   PREDICATES   VARCHAR2   FILTERS   VARCHAR2   URI   VARCHAR2   ROUTE_ORDER   NUMBER   CREATE_TIME   DATE   UPDATE_TIME   DATE   DEL_FLAG   VARCHAR2�  create table SYS_ROUTE_CONF
(
  id          NUMBER not null,
  route_name  VARCHAR2(30),
  route_id    VARCHAR2(30),
  predicates  VARCHAR2(500),
  filters     VARCHAR2(500),
  uri         VARCHAR2(50),
  route_order NUMBER,
  create_time DATE,
  update_time DATE,
  del_flag    VARCHAR2(1)
)
;
alter table SYS_ROUTE_CONF
  add constraint PRIMARYSYS_ROUTE_CONF1 primary key (ID);
   SYS_SOCIAL_DETAILS
      ID   NUMBER   TYPE   VARCHAR2   REMARK   VARCHAR2   APP_ID   VARCHAR2
   APP_SECRET   VARCHAR2   REDIRECT_URL   VARCHAR2   CREATE_TIME   DATE   UPDATE_TIME   DATE   DEL_FLAG   VARCHAR2	   TENANT_ID   NUMBER�  create table SYS_SOCIAL_DETAILS
(
  id           NUMBER not null,
  type         VARCHAR2(16),
  remark       VARCHAR2(64),
  app_id       VARCHAR2(64),
  app_secret   VARCHAR2(64),
  redirect_url VARCHAR2(128),
  create_time  DATE,
  update_time  DATE,
  del_flag     VARCHAR2(50),
  tenant_id    NUMBER
)
;
alter table SYS_SOCIAL_DETAILS
  add constraint PRIMARYSYS_SOCIAL_DETAILS1 primary key (ID);
   SYS_USER      USER_ID   NUMBER   USERNAME   VARCHAR2   PASSWORD   VARCHAR2   SALT   VARCHAR2   PHONE   VARCHAR2   AVATAR   VARCHAR2   DEPT_ID   NUMBER   CREATE_TIME   DATE   UPDATE_TIME   DATE	   LOCK_FLAG   VARCHAR2   DEL_FLAG   VARCHAR2	   WX_OPENID   VARCHAR2	   QQ_OPENID   VARCHAR2	   TENANT_ID   NUMBER�  create table SYS_USER
(
  user_id     NUMBER not null,
  username    VARCHAR2(64),
  password    VARCHAR2(255),
  salt        VARCHAR2(255),
  phone       VARCHAR2(20),
  avatar      VARCHAR2(255),
  dept_id     NUMBER,
  create_time DATE,
  update_time DATE,
  lock_flag   VARCHAR2(1),
  del_flag    VARCHAR2(1),
  wx_openid   VARCHAR2(32),
  qq_openid   VARCHAR2(32),
  tenant_id   NUMBER
)
;
create index IDX_USER_IDX1_USERNAMESYS_USER on SYS_USER (USERNAME);
create index IDX_USER_QQ_OPENIDSYS_USER on SYS_USER (QQ_OPENID);
create index IDX_USER_WX_OPENIDSYS_USER on SYS_USER (WX_OPENID);
alter table SYS_USER
  add constraint PRIMARYSYS_USER1 primary key (USER_ID);
   SYS_USER_ROLE      USER_ID   NUMBER   ROLE_ID   NUMBER�   create table SYS_USER_ROLE
(
  user_id NUMBER not null,
  role_id NUMBER not null
)
;
alter table SYS_USER_ROLE
  add constraint PRIMARYSYS_USER_ROLE1 primary key (USER_ID, ROLE_ID);
       �  �    �      0.0   1   山东农信����   22-01-2018 19:00:23   13-09-2018 01:46:29   0   0   1   2   沙县国际����   22-01-2018 19:00:38   13-09-2018 01:46:30   0   0   1   3   潍坊农信����   22-01-2018 19:00:44   13-09-2018 01:46:31   0   1   1   4   高新农信����   22-01-2018 19:00:52   06-10-2018 10:41:52   0   3   1   5   院校农信����   22-01-2018 19:00:57   06-10-2018 10:42:51   0   4   1   6   潍院农信����   22-01-2018 19:01:06   09-01-2019 10:58:18   1   5   1   7   山东沙县����   22-01-2018 19:01:57   13-09-2018 01:46:42   0   2   1   8   潍坊沙县����   22-01-2018 19:02:03   13-09-2018 01:46:43   0   7   1   9   高新沙县����   22-01-2018 19:02:14   13-09-2018 01:46:44   1   8   1   10   租户2����   18-11-2018 13:27:11   18-11-2018 13:42:19   0   0   2   11   院校沙县����   10-12-2018 21:19:26����   0   8   1       �   �    
      1.0   1   1   1   3   1   4   1   5   2   2   2   7   2   8   2   11   3   3   3   4   3   5   4   4   4   5   5   5   7   7   7   8   7   11   8   8   8   11   10   10   11   11       k  k   H*     2.0   1   9   异常   log_type   日志异常   1   09-07-2018 06:16:14   24-11-2018 07:25:11   日志异常   0   1   2   0   正常   log_type   正常   0   09-07-2018 06:15:40   24-11-2018 07:25:14   正常   0   0   3   WX   微信   social_type   微信登录   0   16-08-2018 14:01:45   24-11-2018 07:25:16   微信登录   0   0   4   QQ   QQ   social_type   QQ登录   1   09-07-2018 06:15:40   24-11-2018 07:25:18   QQ登录   0   0   5   0   正常   log_type   日志类型   0   30-09-2018 02:33:53   24-11-2018 07:25:20   日志正常   0   1   6   0	   未提交   leave_status   请假状态   0   30-09-2018 02:34:45   24-11-2018 07:25:23   请假状态   0   1   7   1	   审批中   leave_status   请假状态   1   30-09-2018 02:35:16   24-11-2018 07:25:25   请假状态   0   1   8   2   完成   leave_status   请假状态   2   30-09-2018 02:35:58   24-11-2018 07:25:28   请假状态   0   1   9   9   驳回   leave_status   请假状态   9   30-09-2018 02:36:31   24-11-2018 07:25:31   请假状态   0   1       �  �   ��      3.0   1   0   添加用户   pig   admin   13-01-2019 22:43:11����	   127.0.0.1r   Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36   /user   POST       194   0       1   2   0   添加用户   pig   admin   13-01-2019 22:48:24����	   127.0.0.1r   Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36   /user   POST       114   0       1   3   0   添加角色   pig   admin   14-01-2019 09:27:11����	   127.0.0.1r   Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36   /role   POST       25   0       1       �%  �%   �
     4.0   1000   权限管理����   /upms   -1   icon-quanxianguanli   Layout   0   0   0   28-09-2018 08:29:53   28-09-2018 08:53:01   0   1   1100   用户管理����   user   1000   icon-yonghuguanli   views/admin/user/index   1   0   0   02-11-2017 22:24:37   28-09-2018 09:00:41   0   1   1101   用户新增   sys_user_add����   1100������������   0   1   08-11-2017 09:52:09   28-09-2018 09:06:34   0   1   1102   用户修改   sys_user_edit����   1100������������   0   1   08-11-2017 09:52:48   28-09-2018 09:06:37   0   1   1103   用户删除   sys_user_del����   1100������������   0   1   08-11-2017 09:54:01   28-09-2018 09:06:42   0   1   1200   菜单管理����   menu   1000   icon-caidanguanli   views/admin/menu/index   2   0   0   08-11-2017 09:57:27   28-09-2018 09:00:45   0   1   1201   菜单新增   sys_menu_add����   1200������������   0   1   08-11-2017 10:15:53   28-09-2018 09:07:16   0   1   1202   菜单修改   sys_menu_edit����   1200������������   0   1   08-11-2017 10:16:23   28-09-2018 09:07:18   0   1   1203   菜单删除   sys_menu_del����   1200������������   0   1   08-11-2017 10:16:43   28-09-2018 09:07:22   0   1   1300   角色管理����   role   1000   icon-jiaoseguanli   views/admin/role/index   3   0   0   08-11-2017 10:13:37   28-09-2018 09:00:48   0   1   1301   角色新增   sys_role_add����   1300������������   0   1   08-11-2017 10:14:18   28-09-2018 09:07:46   0   1   1302   角色修改   sys_role_edit����   1300������������   0   1   08-11-2017 10:14:41   28-09-2018 09:07:49   0   1   1303   角色删除   sys_role_del����   1300������������   0   1   08-11-2017 10:14:59   28-09-2018 09:07:53   0   1   1304   分配权限   sys_role_perm����   1300������������   0   1   20-04-2018 07:22:55   28-09-2018 09:13:23   0   1   1400   部门管理����   dept   1000   icon-web-icon-   views/admin/dept/index   4   0   0   20-01-2018 13:17:19   09-12-2018 16:35:12   0   1   1401   部门新增   sys_dept_add����   1400������������   0   1   20-01-2018 14:56:16   28-09-2018 09:08:13   0   1   1402   部门修改   sys_dept_edit����   1400������������   0   1   20-01-2018 14:56:59   28-09-2018 09:08:16   0   1   1403   部门删除   sys_dept_del����   1400������������   0   1   20-01-2018 14:57:28   28-09-2018 09:08:18   0   1   2000   系统管理����   /admin   -1   icon-xitongguanli   Layout   1   0   0   07-11-2017 20:56:00   28-09-2018 08:53:18   0   1   2100   日志管理����   log   2000   icon-rizhiguanli   views/admin/log/index   5   0   0   20-11-2017 14:06:22   28-09-2018 09:01:52   0   1   2101   日志删除   sys_log_del����   2100������������   0   1   20-11-2017 20:37:37   28-09-2018 09:08:44   0   1   2200   字典管理����   dict   2000   icon-navicon-zdgl   views/admin/dict/index   6   0   0   29-11-2017 11:30:52   28-09-2018 09:01:47   0   1   2201   字典删除   sys_dict_del����   2200������������   0   1   29-11-2017 11:30:11   28-09-2018 09:09:10   0   1   2202   字典新增   sys_dict_add����   2200������������   0   1   11-05-2018 22:34:55   28-09-2018 09:09:12   0   1   2203   字典修改   sys_dict_edit����   2200������������   0   1   11-05-2018 22:36:03   28-09-2018 09:09:16   0   1   2300   代码生成����   gen   2000   icon-weibiaoti46   views/gen/index   8   0   0   20-01-2018 13:17:19   24-11-2018 05:21:01   0   1   2400   终端管理����   client   2000   icon-shouji   views/admin/client/index   9   0   0   20-01-2018 13:17:19   28-09-2018 09:01:43   0   1   2401   客户端新增   sys_client_add����   2400   1��������   0   1   15-05-2018 21:35:18   28-09-2018 09:10:25   0   1   2402   客户端修改   sys_client_edit����   2400������������   0   1   15-05-2018 21:37:06   28-09-2018 09:10:27   0   1   2403   客户端删除   sys_client_del����   2400������������   0   1   15-05-2018 21:39:16   28-09-2018 09:10:30   0   1   2500   密钥管理����   social   2000
   icon-miyue   views/admin/social/index   10   0   0   20-01-2018 13:17:19   28-09-2018 09:01:41   0   1   2501   密钥新增   generator_syssocialdetails_add����   2500   1����   0   0   1   15-05-2018 21:35:18   28-09-2018 09:11:02   0   1   2502   密钥修改   generator_syssocialdetails_edit����   2500   1����   1   0   1   15-05-2018 21:35:18   28-09-2018 09:11:04   0   1   2503   密钥删除   generator_syssocialdetails_del����   2500   1����   2   0   1   15-05-2018 21:35:18   28-09-2018 09:11:06   0   1   2600   令牌管理����   token   2000   icon-denglvlingpai   views/admin/token/index   11   0   0   04-09-2018 05:58:41   28-09-2018 09:01:38   0   1   2601   令牌删除   sys_token_del����   2600��������   1   0   1   04-09-2018 05:59:50   28-09-2018 09:11:24   0   1   2700   动态路由����   route   2000
   icon-luyou   views/admin/route/index   12   0   0   04-09-2018 05:58:41   28-09-2018 09:01:38   0   1   3000   系统监控����   /daemon   -1   icon-msnui-supervise   Layout   2   0   0   27-07-2018 01:13:21   28-09-2018 08:53:24   0   1   3100   服务监控����   http://139.224.200.249:15001   3000   icon-server����   0   0   0   26-06-2018 10:50:32   11-12-2018 17:17:07   0   1   3200   接口文档����,   http://139.224.200.249:19999/swagger-ui.html   3000   icon-wendang����   1   0   0   26-06-2018 10:50:32   28-09-2018 09:05:16   0   1   3300   事务监控����   tx   3000   icon-gtsquanjushiwufuwuGTS   views/tx/index   5   0   0   19-08-2018 11:02:39   23-11-2018 14:25:08   0   1   3400   在线事务����   model   3000   icon-online   views/tx/model   6   0   0   19-08-2018 11:32:04   23-11-2018 14:25:14   0   1   3500   任务监控����   http://139.224.200.249:8899   3000   icon-msnui-supervise����   7   0   0   26-06-2018 10:50:32   28-09-2018 09:03:33   0   1   3600   任务轨迹����   status-trace-log   3000
   icon-guiji#   views/daemon/status-trace-log/index   8   0   0   20-01-2018 13:17:19   24-11-2018 06:34:52   0   1   3601   删除任务轨迹   daemon_status_trace_log_del����   3600   1����   2   0   1   15-05-2018 21:35:18   24-11-2018 06:37:31   0   1   3700   调用拓扑����   http://139.224.200.249:8081   3000	   icon-line����   10   0   0   25-01-2018 11:08:52   28-09-2018 09:04:29   0   1   3800   缓存状态����   http://139.224.200.249:8585   3000   icon-qingchuhuancun����   12   0   0   23-01-2018 10:56:11   28-09-2018 09:13:56   0   1   3900   任务日志����   execution-log   3000
   icon-guiji    views/daemon/execution-log/index   8   0   0   20-01-2018 13:17:19   24-11-2018 06:34:52   0   1   3901   删除日志   daemon_execution_log_del����   3900   1����   2   0   1   15-05-2018 21:35:18   24-11-2018 06:39:03   0   1   4000   协同管理����   /activti   -1   icon-kuaisugongzuoliu_o   Layout   3   0   0   26-09-2018 01:38:13   28-09-2018 08:58:24   0   1   4100   模型管理����   activiti   4000   icon-weibiaoti13   views/activiti/index   1   0   0   26-09-2018 01:39:07   09-12-2018 16:35:16   0   1   4101   模型管理   act_model_manage����   4100   1����   0   0   1   15-05-2018 21:35:18   28-09-2018 09:12:07   0   1   4200   流程管理����   process   4000   icon-liucheng   views/activiti/process   2   0   0   26-09-2018 06:41:05   23-11-2018 14:25:33   0   1   4201   流程管理   act_process_manage����   4200   1����   0   0   1   15-05-2018 21:35:18   28-09-2018 09:12:07   0   1   4300   请假管理����	   leavebill   4000   icon-qingjia   views/activiti/leave   3   0   0   20-01-2018 13:17:19   09-12-2018 16:35:20   0   1   4301   请假新增   act_leavebill_add����   4300   1����   0   0   1   15-05-2018 21:35:18   28-09-2018 09:12:07   0   1   4302   请假修改   act_leavebill_edit����   4300   1����   1   0   1   15-05-2018 21:35:18   28-09-2018 09:12:09   0   1   4303   请假删除   act_leavebill_del����   4300   1����   2   0   1   15-05-2018 21:35:18   28-09-2018 09:12:14   0   1   4400   待办任务����   task   4000
   icon-renwu   views/activiti/task   4   0   0   27-09-2018 09:52:31   09-12-2018 16:35:26   0   1   4401   流程管理   act_task_manage����   4400   1����   0   0   1   15-05-2018 21:35:18   28-09-2018 09:12:07   0   1   5000   多级菜单����   /crud   -1   icon-caidanguanli����   4   0   0   28-08-2018 01:50:22   28-09-2018 08:58:20   0   1   5001   一级菜单����   index   5000   icon-caidanguanli   views/crud/index   1   0   0   28-08-2018 01:50:48   21-11-2018 17:48:19   1   1   5002   二级菜单����   crud   5001   icon-caidanguanli   views/crud/index   1   0   0   28-08-2018 01:51:23   21-11-2018 17:47:40   1   1   5003   一级菜单��������   5000   icon-caidanguanli����   1   0   0   21-11-2018 17:49:18   21-11-2018 17:53:25   0����   5004   二级菜单����   index   5003   icon-caidanguanli   views/crud/index   1   0   0   21-11-2018 17:53:51   20-12-2018 14:26:53   1����   6000   系统官网����   https://pig4cloud.com#   -1   icon-guanwang����   5   0   0   27-09-2018 02:26:36   17-11-2018 16:18:50   1   1            ��      5.0   app����   app   server   password,refresh_token����������������       true   1   daemon����   daemon   server   password,refresh_token����������������       true   1   gen����   gen   server   password,refresh_token����������������       true   1   pig����   pig   server)   password,refresh_token,authorization_codeA   http://localhost:4040/sso1/login,http://localhost:4041/sso1/login������������       true   1   test����   test   server   password,refresh_token����������������       true   1       9  9   �J      6.0   1	   管理员
   ROLE_ADMIN	   管理员   2   2   29-10-2017 15:45:51   26-12-2018 14:09:11   0   1   2   ROLE_CQQ   ROLE_CQQ   ROLE_CQQ   2����   11-11-2018 19:42:26   26-12-2018 14:09:07   0   2   6	   技术员   Role_Technician	   技术员   2����   14-01-2019 09:27:10����   0   1       �  �   �J      7.0   1   1000   1   1100   1   1101   1   1102   1   1103   1   1200   1   1201   1   1202   1   1203   1   1300   1   1301   1   1302   1   1303   1   1304   1   1400   1   1401   1   1402   1   1403   1   2000   1   2100   1   2101   1   2200   1   2201   1   2202   1   2203   1   2300   1   2400   1   2401   1   2402   1   2403   1   2500   1   2501   1   2502   1   2503   1   2600   1   2601   1   2700   1   3000   1   3100   1   3200   1   3300   1   3400   1   3500   1   3600   1   3601   1   3700   1   3800   1   4000   1   4100   1   4101   1   4200   1   4201   1   4300   1   4301   1   4302   1   4303   1   4400   1   4401   2   1000   2   1100   2   1101   2   1102   2   1103   2   1200   2   1201   2   1202   2   1203   2   1300   2   1301   2   1302   2   1303   2   1304   2   1400   2   1401   2   1402   2   1403       �  �   ��     8.0   1   工作流管理模块   pigx-activiti4   [{"args": {"_genkey_0": "/act/**"}, "name": "Path"}]   []   lb://pigx-activiti   0   28-11-2018 15:56:10   28-11-2018 15:56:25   0   2   认证中心	   pigx-auth5   [{"args": {"_genkey_0": "/auth/**"}, "name": "Path"}]b   [{"args": {}, "name": "ValidateCodeGatewayFilter"}, {"args": {}, "name": "PasswordDecoderFilter"}]   lb://pigx-auth   0   28-11-2018 15:56:10   28-11-2018 15:56:29   0   3   代码生成模块   pigx-codegen4   [{"args": {"_genkey_0": "/gen/**"}, "name": "Path"}]   []   lb://pigx-codegen   0   28-11-2018 15:56:10   28-11-2018 15:56:32   0   4   定时任务模块   pigx-daemon7   [{"args": {"_genkey_0": "/daemon/**"}, "name": "Path"}]   []   lb://pigx-daemon   0   28-11-2018 15:56:10   28-11-2018 15:56:34   0   5   分布式事务模块   pigx-tx-manager3   [{"args": {"_genkey_0": "/tx/**"}, "name": "Path"}]   []   lb://pigx-tx-manager   0   28-11-2018 15:56:10   28-11-2018 15:56:36   0   6   通用权限模块   pigx-upms-biz6   [{"args": {"_genkey_0": "/admin/**"}, "name": "Path"}]  [{"args": {"key-resolver": "#{@remoteAddrKeyResolver}", "redis-rate-limiter.burstCapacity": "20", "redis-rate-limiter.replenishRate": "10"}, "name": "RequestRateLimiter"}, {"args": {"name": "default", "fallbackUri": "forward:/fallback"}, "name": "Hystrix"}]   lb://pigx-upms-biz   0   28-11-2018 15:56:10   28-11-2018 15:56:39   0       �   �    �)      9.0   1   WX   微信互联参数   wxd1678d3f83b1d83a    6ddb043f94da5d2172926abe8533504f   daoweicloud.com   16-08-2018 14:24:25   04-12-2018 11:50:57   0   1       �  �   B�      10.0   1   admin<   $2a$10$QOfWxxFyAMmEEmnuw9UI/..1s4B4eF/u9PzE2ZaGO.ij9YfmcUy.u����   17034642888!   lengleng-oxjkuoy361p6x5snlogo.png   1   20-04-2018 07:15:18   05-01-2019 17:11:20   0   0   o_0FT0uyg_H1vVy2H0JpSwlVGhWQ����   1   2   admin<   $2a$10$RpFJjxYiXdEsAGnWp/8fsOetMuOON96Ntk/Ym2M/RKRyU0GZseaDC����   17034642887����   10   20-04-2018 07:15:18   09-01-2019 11:06:24   0   0   o_0FT0uyg_H1vVy2H0JpSwlVGhWQ����   2   5   zzy<   $2a$10$nAzvB.HNKP9lHmTHnOmQSOUTlqmJWRiIjM4OobGCkeXZc.wdFlv6.����   13111111111����   11   13-01-2019 22:43:10����   0   0��������   1   6   lalala<   $2a$10$e5Ar8LiIFW3NAkfC.TDcG.mDknhE18dmUd9i2BMSm0i0laerBhmce����   13333333333����   5   13-01-2019 22:48:24����   0   0��������   1       (   (    �      11.0   1   1   2   2   5   1   6   1