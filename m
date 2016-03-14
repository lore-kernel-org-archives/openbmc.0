Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3qP05C2q9qzDq6T
 for <openbmc@lists.ozlabs.org>; Tue, 15 Mar 2016 01:10:22 +1100 (AEDT)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1457964613743283.86373740984277;
 Mon, 14 Mar 2016 07:10:13 -0700 (PDT)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH docs] REST API documentation for OpenBMC user management.
Date: Mon, 14 Mar 2016 09:10:11 -0500
Message-Id: <1457964611-22076-2-git-send-email-openbmc-patches@stwcx.xyz>
X-Mailer: git-send-email 2.7.1
In-Reply-To: <1457964611-22076-1-git-send-email-openbmc-patches@stwcx.xyz>
References: <1457964611-22076-1-git-send-email-openbmc-patches@stwcx.xyz>
X-Zoho-Virus-Status: 1
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.20
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Mon, 14 Mar 2016 14:10:23 -0000

From: Hariharasubramanian R <hramasub@in.ibm.com>

---
 obmc-userman.md | 82 +++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 82 insertions(+)
 create mode 100644 obmc-userman.md

diff --git a/obmc-userman.md b/obmc-userman.md
new file mode 100644
index 0000000..a5075ca
--- /dev/null
+++ b/obmc-userman.md
@@ -0,0 +1,82 @@
+# User management
+
+User management enables administration of users with different authentication credentials. This provides the foundation for restricting access to REST API based on the user.
+
+In order to access the user management REST API, an initial authentication with *root* credentials is required.
+
+User management provides a *restricted/limited* set of options available through the native Unix user administration commands.
+
+The DBus API for user management is a wrapper over the adduser, deluser, addgrp, delgrp and passwd commands.
+
+## User Management DBus Application, Interface and Objects
+UserManager (phosphor-host-userd) implements the org.openbmc.**Enrol**  interface and exposes the following objects:
+- Groups
+- Group
+- Users
+- User
+
+The Groups object is the container object used to *add* a new group. Likewise Users object is the container object used to *add* a new user. Groups and Users objects also provide the iteration interface to list the members.
+
+The Group object and the User object abstract the individual group/user and hence exposes the method to delete the specific entry and change the password.
+
+## User Management DBus API
+### /org/openbmc/UserManager/Groups Object
+    org.openbmc.Enrol.GroupAddUsr string:"groupname"
+    org.openbmc.Enrol.GroupListUsr
+    org.openbmc.Enrol.GroupListSys
+### /org/openbmc/UserManager/Group Object
+    org.openbmc.Enrol.GroupDel string:"groupname"
+### /org/openbmc/UserManager/Users Object
+    org.openbmc.Enrol.UserAdd string:"comment" string:"username" string:"groupname" string:"passwd"
+    org.openbmc.Enrol.UserList
+### /org/openbmc/UserManager/User Object
+    org.openbmc.Enrol.UserDel string:"username"
+    org.openbmc.Enrol.Passswd string:"username" string:"passwd"
+
+
+## Group Operations and Rules
+
+| Method| Params | Description | Remarks|
+|-------|:------:|-------------|-------:|
+| GroupAddUsr | Group Name | Add a User Group.| GID is automatically selected >= 1000.|
+||||- Group name must be unique.|
+| GroupListUsr || List all User Groups.| List All groups with GID >= 1000.      |
+| GroupListSys || List all Sys Groups. | List All groups with 100 < GID >= 1000.|
+| GroupDel | Group Name | Delete this Group. |Group must have no member users|
+
+
+## User Operations and Rules
+
+| Method| Params | Description | Remarks|
+|-------|:------:|-------------|-------:|
+|UserAdd | GECOS, User Name, Group Name, Password | Add a general User Account.| UID is automatically selected >= 1000.|
+||||User name must be unique and non-empty string.|
+||||Group name, if specified, must be unique and non-empty string.|
+|UserList|| List all general User Accounts.| Users with UID >= 1000.|
+|UserDel |User name| Delete this user. | User name must be non-empty string.    |
+| Passwd | User Name, Passwd | Reset the password of the user to this new passwrod. | |
+
+## Group List semantics
+| Group     | Description  |
+|-----------|--------------|
+| Sys Group | List all groups with 100 < GID < 1000. Common system groups with GID < 100 are hence filtered out in the list.|
+| Usr Group | List all groups with GID >= 1000. These groups are typically those created by a group administration operation.|
+
+## Group Add semantics
+| Group     | Description  |
+|-----------|--------------|
+| Sys Group | Add a group with 100 < GID < 1000, which has system group priveleges.|
+| Usr Group | Add a group with GID >= 1000. These groups are typically those created by an administrator to represent a role.|
+
+## User List semantics
+| User Account | Description  |
+|--------------|--------------|
+| Sys Account  | Not Supported|
+| User Account | List all user accounts with UID >= 1000. These users are typically those created by a user administration operation.
+
+## User Add semantics
+| User/Group   | User Group    | Sys Group     |
+|--------------|---------------|---------------|
+| User Account | Supported     | Supported     |
+| Sys Account  | Not Supported | Not Supported |
+
-- 
2.7.1
