Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 2547E1A02AF
 for <openbmc@lists.ozlabs.org>; Tue, 10 Nov 2015 10:50:31 +1100 (AEDT)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1447113026603255.90799764475526;
 Mon, 9 Nov 2015 15:50:26 -0800 (PST)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Cc: Brad Bishop <bradleyb@us.ibm.com>
Subject: [PATCH phosphor-objmgr] Make MapperNotFound a proper dbus exception
Date: Mon,  9 Nov 2015 18:50:25 -0500
Message-Id: <1447113025-1708-2-git-send-email-openbmc-patches@stwcx.xyz>
X-Mailer: git-send-email 2.6.3
In-Reply-To: <1447113025-1708-1-git-send-email-openbmc-patches@stwcx.xyz>
References: <1447113025-1708-1-git-send-email-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Mon, 09 Nov 2015 23:50:32 -0000

From: Brad Bishop <bradleyb@us.ibm.com>

Set the name to org.openbmc.objectmapper.Error.NotFound
---
 OpenBMCMapper.py |  5 +----
 phosphor-mapper  | 10 ++++++++--
 2 files changed, 9 insertions(+), 6 deletions(-)

diff --git a/OpenBMCMapper.py b/OpenBMCMapper.py
index 1233c70..2ed65f7 100644
--- a/OpenBMCMapper.py
+++ b/OpenBMCMapper.py
@@ -23,10 +23,7 @@ MAPPER_NAME = 'org.openbmc.objectmapper'
 MAPPER_IFACE = MAPPER_NAME + '.ObjectMapper'
 MAPPER_PATH = '/org/openbmc/objectmapper/objectmapper'
 ENUMERATE_IFACE = 'org.openbmc.Object.Enumerate'
-
-class MapperNotFoundException(Exception):
-	def __init__(self, msg):
-		super(MapperNotFoundException, self).__init__(msg)
+MAPPER_NOT_FOUND = 'org.openbmc.objectmapper.Error.NotFound'
 
 class Path:
 	def __init__(self, path):
diff --git a/phosphor-mapper b/phosphor-mapper
index 36bf09b..011dc56 100644
--- a/phosphor-mapper
+++ b/phosphor-mapper
@@ -16,14 +16,20 @@
 # implied. See the License for the specific language governing
 # permissions and limitations under the License.
 
-import sys
 import dbus
 import dbus.service
+import dbus.exceptions
 import dbus.mainloop.glib
 import gobject
-from OpenBMCMapper import Path, IntrospectionParser, PathTree
+from OpenBMCMapper import IntrospectionParser, PathTree
 import OpenBMCMapper
 
+class MapperNotFoundException(dbus.exceptions.DBusException):
+	_dbus_error_name = OpenBMCMapper.MAPPER_NOT_FOUND
+	def __init__(self, path):
+		super(MapperNotFoundException, self).__init__(
+				"path or object not found: %s" %(path))
+
 class ObjectMapper(dbus.service.Object):
 	def __init__(self, bus, path,
 			name_match = OpenBMCMapper.org_dot_openbmc_match,
-- 
2.6.3
