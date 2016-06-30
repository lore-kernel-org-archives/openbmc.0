Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3rg4785gWgzDq5f
 for <openbmc@lists.ozlabs.org>; Thu, 30 Jun 2016 13:01:08 +1000 (AEST)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1467255663917635.7327153094092;
 Wed, 29 Jun 2016 20:01:03 -0700 (PDT)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Cc: Adriana Kobylak <anoo@us.ibm.com>
Subject: [PATCH skeleton] Add logic to sync/preserve MAC and UUID
Date: Wed, 29 Jun 2016 22:01:00 -0500
Message-Id: <20160630030100.2170-2-openbmc-patches@stwcx.xyz>
X-Mailer: git-send-email 2.9.0
In-Reply-To: <20160630030100.2170-1-openbmc-patches@stwcx.xyz>
References: <20160630030100.2170-1-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Thu, 30 Jun 2016 03:01:09 -0000

From: Adriana Kobylak <anoo@us.ibm.com>

Add logic to sync/preserve the MAC and UUID in case of HW replacement.
The MAC and UUID values are set in VPD by the manufacturer. These
values are mirrored to u-boot. During BMC boot, check that VPD and u-boot
are in sync. If they are different, use the vpd value to update u-boot.
Exception is the MAC when it's been set by the admin to have a locally
administered address.
Updating the MAC takes effect immediately, updating the UUID requires a
BMC reboot.

Signed-off-by: Adriana Kobylak <anoo@us.ibm.com>
---
 configs/Barreleye.py                   |  14 ++++
 pyinventorymgr/setup.py                |   2 +-
 pyinventorymgr/sync_inventory_items.py | 118 +++++++++++++++++++++++++++++++++
 3 files changed, 133 insertions(+), 1 deletion(-)
 create mode 100644 pyinventorymgr/sync_inventory_items.py

diff --git a/configs/Barreleye.py b/configs/Barreleye.py
index 7b74179..a7f962c 100644
--- a/configs/Barreleye.py
+++ b/configs/Barreleye.py
@@ -225,6 +225,20 @@ APPS = {
 		'process_name'    : 'phosphor-read-eeprom',
 		'args'            : ['--eeprom','/sys/bus/i2c/devices/6-0055/eeprom','--fruid','66'],
 	},
+	'sync_mac' : {
+		'system_state'    : 'BMC_READY',
+		'start_process'   : True,
+		'monitor_process' : False,
+		'process_name'    : 'sync_inventory_items.py',
+		'args'            : ['-t','DAUGHTER_CARD','-n','io_board','-p','"Custom Field 2"','-s','mac'],
+	},
+	'sync_uuid' : {
+		'system_state'    : 'BMC_READY',
+		'start_process'   : True,
+		'monitor_process' : False,
+		'process_name'    : 'sync_inventory_items.py',
+		'args'            : ['-t','MAIN_PLANAR','-n','motherboard','-p','"Custom Field 1"','-s','uuid'],
+	},
 	'restore' : {
 		'system_state'    : 'BMC_READY',
 		'start_process'   : True,
diff --git a/pyinventorymgr/setup.py b/pyinventorymgr/setup.py
index 851d961..07e48b4 100644
--- a/pyinventorymgr/setup.py
+++ b/pyinventorymgr/setup.py
@@ -2,5 +2,5 @@ from distutils.core import setup
 
 setup(name='pyinventorymgr',
       version='1.0',
-      scripts=['inventory_items.py'],
+      scripts=['inventory_items.py', 'sync_inventory_items.py'],
       )
diff --git a/pyinventorymgr/sync_inventory_items.py b/pyinventorymgr/sync_inventory_items.py
new file mode 100644
index 0000000..2f10aa3
--- /dev/null
+++ b/pyinventorymgr/sync_inventory_items.py
@@ -0,0 +1,118 @@
+#!/usr/bin/python -u
+
+import sys
+import dbus
+import getopt
+import subprocess
+import obmc_system_config as System
+
+INV_DBUS_NAME = 'org.openbmc.Inventory'
+INV_INTF_NAME = 'org.openbmc.InventoryItem'
+NET_DBUS_NAME = 'org.openbmc.NetworkManager'
+NET_OBJ_NAME = '/org/openbmc/NetworkManager/Interface'
+CHS_DBUS_NAME = 'org.openbmc.control.Chassis'
+CHS_OBJ_NAME = '/org/openbmc/control/chassis0'
+PROP_INTF_NAME = 'org.freedesktop.DBus.Properties'
+
+FRUS = System.FRU_INSTANCES
+
+# IEEE 802 MAC address mask for locally administered.
+# This means the admin has set the MAC and is no longer
+# the unique number set by the device manufacturer.
+MAC_LOCALLY_ADMIN_MASK = 0x20000000000
+
+# Pop the command name                               
+sys.argv.pop(0)
+
+# Get the inventory dbus path based on the requested fru
+def get_inv_obj_path(fru_type, fru_name):
+    obj_path = ''
+    for f in FRUS.keys():
+       if (FRUS[f]['fru_type'] == fru_type and
+            f.endswith(fru_name)):
+            obj_path = f.replace("<inventory_root>",System.INVENTORY_ROOT)
+    return obj_path
+
+# Get the inventory property value
+def get_inv_value(obj, prop_name):
+    value = ''
+    dbus_method = obj.get_dbus_method("Get", PROP_INTF_NAME)
+    value = dbus_method(INV_INTF_NAME, prop_name)
+    return value
+
+# Get the value of the mac on the system without ':' separators
+def get_sys_mac(obj):
+    sys_mac = ''
+    dbus_method = obj.get_dbus_method("GetHwAddress", NET_DBUS_NAME)
+    sys_mac = dbus_method("eth0")
+    sys_mac = sys_mac.replace(":","")
+    return sys_mac
+
+# Replace the value of the system mac with the value of the inventory
+# MAC if the system MAC is not locally administered because this means
+# the system admin has purposely set the MAC
+def sync_mac(obj, inv_mac, sys_mac):
+    # Convert sys MAC to int to perform bitwise '&'
+    int_sys_mac = int(sys_mac,16)                                                   
+    if not int_sys_mac & MAC_LOCALLY_ADMIN_MASK:                                    
+        # Sys MAC is not locally administered, go replace it with inv value
+        # Add the ':' separators
+        inv_mac_str = ':'.join([inv_mac[i]+inv_mac[i+1] for i in range(0,12,2)])
+        #Set HW Method already has checking for mac format
+        dbus_method = obj.get_dbus_method("SetHwAddress", NET_DBUS_NAME)
+        dbus_method("eth0", inv_mac_str)
+
+# Get sys uuid
+def get_sys_uuid(obj):
+    sys_uuid = ''
+    dbus_method = obj.get_dbus_method("Get", PROP_INTF_NAME)
+    sys_uuid = dbus_method(CHS_DBUS_NAME, "uuid")
+    return sys_uuid
+
+# Set sys uuid, this reboots the BMC for the value to take effect
+def set_sys_uuid(uuid):
+    rc = subprocess.call(["fw_setenv", "uuid", uuid])
+    #TODO Check script that syncs u-boot to /etc/machine-id is in place
+    #rc = subprocess.call(["reboot"])
+
+if __name__ == '__main__':
+    try:
+        opts, args = getopt.getopt(sys.argv,"s:t:n:p:")
+    except getopt.GetoptError:
+        print "getopt error"
+
+    # what type to sync, currently mac and uuid supported
+    sync_type = ''
+    # fru type as specified in System.FRU_INSTANCES
+    fru_type = ''
+    # fru name path as specified in System.FRU_INSTANCES
+    fru_name = ''
+    # the fru inventory property name
+    prop_name = ''
+    for opt, arg in opts:
+        if opt in ("-t"):
+            fru_type = arg
+        elif opt in ("-n"):
+            fru_name = arg
+        elif opt in ("-p"):
+            prop_name = arg
+        elif opt in ("-s"):
+            sync_type = arg
+
+    bus = dbus.SystemBus()
+    inv_obj_path = get_inv_obj_path(fru_type, fru_name)
+    inv_obj = bus.get_object(INV_DBUS_NAME, inv_obj_path)
+    net_obj = bus.get_object(NET_DBUS_NAME, NET_OBJ_NAME)
+    chs_obj = bus.get_object(CHS_DBUS_NAME, CHS_OBJ_NAME)
+
+    # Get the value of the requested inventory property
+    inv_value = get_inv_value(inv_obj, prop_name)
+
+    if sync_type == "mac":
+        sys_mac = get_sys_mac(net_obj)
+        if inv_value != sys_mac:
+            sync_mac(net_obj, inv_value, sys_mac)
+    elif sync_type == "uuid":
+        sys_uuid = get_sys_uuid(chs_obj)
+        if inv_value != sys_uuid:
+            set_sys_uuid(inv_value)
-- 
2.9.0
