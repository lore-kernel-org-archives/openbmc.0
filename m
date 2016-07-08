Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3rmCk00sRhzDqlj
 for <openbmc@lists.ozlabs.org>; Fri,  8 Jul 2016 22:00:39 +1000 (AEST)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1467979235119900.1214643539212;
 Fri, 8 Jul 2016 05:00:35 -0700 (PDT)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Cc: tomjose <tomjoseph@in.ibm.com>
Subject: [PATCH openbmc v3] Generate code from conf files from IPMI packages
Date: Fri,  8 Jul 2016 07:00:33 -0500
Message-Id: <20160708120033.2172-2-openbmc-patches@stwcx.xyz>
X-Mailer: git-send-email 2.9.0
In-Reply-To: <20160708120033.2172-1-openbmc-patches@stwcx.xyz>
References: <20160708120033.2172-1-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Fri, 08 Jul 2016 12:00:40 -0000

From: tomjose <tomjoseph@in.ibm.com>

IPMI whitelisted commands for each package is mentioned in the
respective conf file. The conf files are merged and code is
generated to be consumed by ipmi daemon.
---
 .../recipes-phosphor/host-ipmid/host-ipmid.bb      | 18 +++++++++++++++-
 .../host-ipmid/host-ipmid.bbappend                 |  1 +
 .../host-ipmid/files/host-ipmid-whitelist.conf     | 24 ++++++++++++++++++++++
 .../files/ipmi-fru-parser-whitelist.conf           |  2 ++
 .../files/openpower-host-ipmi-oem-whitelist.conf   |  2 ++
 5 files changed, 46 insertions(+), 1 deletion(-)
 create mode 100644 meta-phosphor/common/recipes-phosphor/host-ipmid/host-ipmid.bbappend
 create mode 100644 meta-phosphor/common/recipes-phosphor/host-ipmid/host-ipmid/files/host-ipmid-whitelist.conf
 create mode 100644 meta-phosphor/common/recipes-phosphor/host-ipmid/host-ipmid/files/ipmi-fru-parser-whitelist.conf
 create mode 100644 meta-phosphor/common/recipes-phosphor/host-ipmid/host-ipmid/files/openpower-host-ipmi-oem-whitelist.conf

diff --git a/meta-phosphor/common/recipes-phosphor/host-ipmid/host-ipmid.bb b/meta-phosphor/common/recipes-phosphor/host-ipmid/host-ipmid.bb
index 2a761de..e347488 100644
--- a/meta-phosphor/common/recipes-phosphor/host-ipmid/host-ipmid.bb
+++ b/meta-phosphor/common/recipes-phosphor/host-ipmid/host-ipmid.bb
@@ -17,7 +17,10 @@ TARGET_CFLAGS   += "-fpic"
 RDEPENDS_${PN} += "clear-once"
 RDEPENDS_${PN} += "settings"
 RDEPENDS_${PN} += "network"
-SRC_URI += "git://github.com/openbmc/phosphor-host-ipmid"
+SRC_URI += "git://github.com/openbmc/phosphor-host-ipmid \
+            file://host-ipmid-whitelist.conf \
+            file://ipmi-fru-parser-whitelist.conf \
+            file://openpower-host-ipmi-oem-whitelist.conf"
 
 SRCREV = "b7bcda57ee39616e8937194d281e2476e6ea8df2"
 
@@ -31,3 +34,16 @@ do_install() {
         install -m 0755 -d ${D}${includedir}/host-ipmid
         install -m 0644 ${S}/ipmid-api.h ${D}${includedir}/host-ipmid/
 }
+
+def find_cfgs(d):
+    sources=src_patches(d, True)
+    sources_list=[]
+    for s in sources:
+        if s.endswith('.conf'):
+            sources_list.append(s)
+
+    return sources_list
+
+do_configure () {
+        ${S}/generate_whitelist.sh ${@" ".join(find_cfgs(d))}  > ipmiwhitelist.C
+}
diff --git a/meta-phosphor/common/recipes-phosphor/host-ipmid/host-ipmid.bbappend b/meta-phosphor/common/recipes-phosphor/host-ipmid/host-ipmid.bbappend
new file mode 100644
index 0000000..b2051b6
--- /dev/null
+++ b/meta-phosphor/common/recipes-phosphor/host-ipmid/host-ipmid.bbappend
@@ -0,0 +1 @@
+FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}/files:"
diff --git a/meta-phosphor/common/recipes-phosphor/host-ipmid/host-ipmid/files/host-ipmid-whitelist.conf b/meta-phosphor/common/recipes-phosphor/host-ipmid/host-ipmid/files/host-ipmid-whitelist.conf
new file mode 100644
index 0000000..00e49d2
--- /dev/null
+++ b/meta-phosphor/common/recipes-phosphor/host-ipmid/host-ipmid/files/host-ipmid-whitelist.conf
@@ -0,0 +1,24 @@
+#<NetFn>:<Command>
+0x00:0x02	//<Chassis>:<Chassis Control>
+0x00:0x08	//<Chassis>:<Set System Boot Options>
+0x00:0x09	//<Chassis>:<Get System Boot Options>
+0x04:0x2D	//<Sensor/Event>:<Get Sensor Reading>
+0x04:0x2F	//<Sensor/Event>:<Get Sensor Type>
+0x04:0x30	//<Sensor/Event>:<Set Sensor Reading and Event Status>
+0x06:0x01	//<App>:<Get Device ID>
+0x06:0x08	//<App>:<Get Device GUID>
+0x06:0x22	//<App>:<Reset Watchdog Timer>
+0x06:0x24	//<App>:<Set Watchdog Timer>
+0x06:0x2E	//<App>:<Set BMC Global Enables>
+0x06:0x31	//<App>:<Get Message Flags>
+0x06:0x35	//<App>:<Read Event Message Buffer>
+0x06:0x36	//<App>:<Get BT Interface Capabilities>
+0x06:0x42	//<App>:<Get Channel Info Command>
+0x0A:0x40	//<Storage>:<Get SEL Info>
+0x0A:0x42	//<Storage>:<Reserve SEL>
+0x0A:0x44	//<Storage>:<Add SEL Entry>
+0x0A:0x48	//<Storage>:<Get SEL Time>
+0x0A:0x49	//<Storage>:<Set SEL Time>
+0x0C:0x02	//<Transport>:<Get LAN Configuration Parameters>
+0x2C:0x00	//<Group Extension>:<Group Extension Command>
+0x2C:0x03	//<Group Extension>:<Get Power Limit>
diff --git a/meta-phosphor/common/recipes-phosphor/host-ipmid/host-ipmid/files/ipmi-fru-parser-whitelist.conf b/meta-phosphor/common/recipes-phosphor/host-ipmid/host-ipmid/files/ipmi-fru-parser-whitelist.conf
new file mode 100644
index 0000000..ee5e238
--- /dev/null
+++ b/meta-phosphor/common/recipes-phosphor/host-ipmid/host-ipmid/files/ipmi-fru-parser-whitelist.conf
@@ -0,0 +1,2 @@
+#<NetFn>:<Command>
+0x0A:0x12	//<Storage>:<Write FRU Data>
diff --git a/meta-phosphor/common/recipes-phosphor/host-ipmid/host-ipmid/files/openpower-host-ipmi-oem-whitelist.conf b/meta-phosphor/common/recipes-phosphor/host-ipmid/host-ipmid/files/openpower-host-ipmi-oem-whitelist.conf
new file mode 100644
index 0000000..32fb4c7
--- /dev/null
+++ b/meta-phosphor/common/recipes-phosphor/host-ipmid/host-ipmid/files/openpower-host-ipmi-oem-whitelist.conf
@@ -0,0 +1,2 @@
+#<NetFn>:<Command>
+0x32:0xF0	//<OpenPower OEM>:<Add Partial eSEL command>
-- 
2.9.0
