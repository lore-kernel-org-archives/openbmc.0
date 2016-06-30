Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3rgbQJ10cgzDqhC
 for <openbmc@lists.ozlabs.org>; Fri,  1 Jul 2016 09:31:03 +1000 (AEST)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1467329459653653.8506732913663;
 Thu, 30 Jun 2016 16:30:59 -0700 (PDT)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH skeleton v2 2/3] bmc_update: allow whitelist to be files in a
 directory
Date: Thu, 30 Jun 2016 18:30:54 -0500
Message-Id: <20160630233055.16526-3-openbmc-patches@stwcx.xyz>
X-Mailer: git-send-email 2.9.0
In-Reply-To: <20160630233055.16526-1-openbmc-patches@stwcx.xyz>
References: <20160630233055.16526-1-openbmc-patches@stwcx.xyz>
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.22
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Thu, 30 Jun 2016 23:31:04 -0000

From: Milton Miller <miltonm@us.ibm.com>

The whitelist is moveing from a file to a set of files in a directory.
Use try when deleting whitelist entries.

It would be better to call update without saving the files in the
first place but this will suffice for now.

Signed-off-by: Milton Miller <miltonm@us.ibm.com>
---
 pyflashbmc/bmc_update.py | 22 +++++++++++++++++++++-
 1 file changed, 21 insertions(+), 1 deletion(-)

diff --git a/pyflashbmc/bmc_update.py b/pyflashbmc/bmc_update.py
index cd2f3c1..50042c1 100644
--- a/pyflashbmc/bmc_update.py
+++ b/pyflashbmc/bmc_update.py
@@ -111,7 +111,27 @@ class BmcFlashControl(DbusProperties,DbusObjectManager):
 
 			if (self.Get(DBUS_NAME,"clear_persistent_files") == True):
 				print "Removing persistent files"
-				os.unlink(UPDATE_PATH+"/whitelist")
+				try:
+					os.unlink(UPDATE_PATH+"/whitelist")
+				except OSError as e:
+					if (e.errno == errno.EISDIR):
+						pass
+					elif (e.errno == errno.ENOENT):
+						pass
+					else:
+						raise
+
+				try:
+					wldir = UPDATE_PATH + "/whitelist.d"
+
+					for file in os.listdir(wldir):
+						os.unlink(os.path.join(wldir,file))
+				except OSError as e:
+					if (e.errno == errno.EISDIR):
+						pass
+					else:
+						raise
+
 			if (self.Get(DBUS_NAME,"preserve_network_settings") == True):
 				print "Preserving network settings"
 				shutil.copy2("/run/fw_env",UPDATE_PATH+"/image-u-boot-env")
-- 
2.9.0
