Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3rgbQH2bZkzDq5d
 for <openbmc@lists.ozlabs.org>; Fri,  1 Jul 2016 09:31:03 +1000 (AEST)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1467329458404879.8265276613395;
 Thu, 30 Jun 2016 16:30:58 -0700 (PDT)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH skeleton v2 1/3] bmc_update: save runtime modified u-boot
 environment
Date: Thu, 30 Jun 2016 18:30:53 -0500
Message-Id: <20160630233055.16526-2-openbmc-patches@stwcx.xyz>
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

Copy the version saved by our initfs and pointed to by our fw_setenv
tools via /etc/fw_setenv.  Do this copy by default.

The /etc/fw_env.cnf config file points to /run/fw_env in our systems.

The bmc_update object was copying /dev/mtd2.  That could be very
system specific, and it misses any changes made from elsewhere
in the system.

This variable causes the u-boot environment to be written back
after writing the whole image.  This will save the ethernet mac
which for systems which don't store it elsewhere.

Signed-off-by: Milton Miller <miltonm@us.ibm.com>
---
 pyflashbmc/bmc_update.py | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/pyflashbmc/bmc_update.py b/pyflashbmc/bmc_update.py
index 9fa54ac..cd2f3c1 100644
--- a/pyflashbmc/bmc_update.py
+++ b/pyflashbmc/bmc_update.py
@@ -32,7 +32,7 @@ class BmcFlashControl(DbusProperties,DbusObjectManager):
 		
 		self.Set(DBUS_NAME,"status","Idle")
 		self.Set(DBUS_NAME,"filename","")
-		self.Set(DBUS_NAME,"preserve_network_settings",False)
+		self.Set(DBUS_NAME,"preserve_network_settings",True)
 		self.Set(DBUS_NAME,"restore_application_defaults",False)
 		self.Set(DBUS_NAME,"update_kernel_and_apps",False)
 		self.Set(DBUS_NAME,"clear_persistent_files",False)
@@ -114,7 +114,7 @@ class BmcFlashControl(DbusProperties,DbusObjectManager):
 				os.unlink(UPDATE_PATH+"/whitelist")
 			if (self.Get(DBUS_NAME,"preserve_network_settings") == True):
 				print "Preserving network settings"
-				shutil.copy2("/dev/mtd2",UPDATE_PATH+"/image-u-boot-env")
+				shutil.copy2("/run/fw_env",UPDATE_PATH+"/image-u-boot-env")
 				
 		except Exception as e:
 			print e
-- 
2.9.0
