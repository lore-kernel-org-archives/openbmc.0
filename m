Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3rgzNN1mQxzDql7
 for <openbmc@lists.ozlabs.org>; Sat,  2 Jul 2016 00:30:43 +1000 (AEST)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1467383439585671.4753615011829;
 Fri, 1 Jul 2016 07:30:39 -0700 (PDT)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Cc: tomjose <tomjoseph@in.ibm.com>
Subject: [PATCH openbmc v2] Generate code from conf files from IPMI packages
Date: Fri,  1 Jul 2016 09:30:37 -0500
Message-Id: <20160701143037.13669-2-openbmc-patches@stwcx.xyz>
X-Mailer: git-send-email 2.9.0
In-Reply-To: <20160701143037.13669-1-openbmc-patches@stwcx.xyz>
References: <20160701143037.13669-1-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Fri, 01 Jul 2016 14:30:44 -0000

From: tomjose <tomjoseph@in.ibm.com>

IPMI whitelisted commands for each package is mentioned in the
respective conf file. The conf files are merged and code is
generated to be consumed by ipmi daemon.
---
 .../recipes-phosphor/host-ipmid/host-ipmid.bb      | 45 +++++++++++++++++++++-
 .../host-ipmid/host-ipmid.bbappend                 |  1 +
 .../host-ipmid/files/host-ipmid-fru-whitelist.conf |  2 +
 .../host-ipmid/files/host-ipmid-oem-whitelist.conf |  3 ++
 .../host-ipmid/files/host-ipmid-whitelist.conf     | 23 +++++++++++
 5 files changed, 73 insertions(+), 1 deletion(-)
 create mode 100644 meta-phosphor/common/recipes-phosphor/host-ipmid/host-ipmid.bbappend
 create mode 100644 meta-phosphor/common/recipes-phosphor/host-ipmid/host-ipmid/files/host-ipmid-fru-whitelist.conf
 create mode 100644 meta-phosphor/common/recipes-phosphor/host-ipmid/host-ipmid/files/host-ipmid-oem-whitelist.conf
 create mode 100644 meta-phosphor/common/recipes-phosphor/host-ipmid/host-ipmid/files/host-ipmid-whitelist.conf

diff --git a/meta-phosphor/common/recipes-phosphor/host-ipmid/host-ipmid.bb b/meta-phosphor/common/recipes-phosphor/host-ipmid/host-ipmid.bb
index 2a761de..c3169c8 100644
--- a/meta-phosphor/common/recipes-phosphor/host-ipmid/host-ipmid.bb
+++ b/meta-phosphor/common/recipes-phosphor/host-ipmid/host-ipmid.bb
@@ -17,7 +17,10 @@ TARGET_CFLAGS   += "-fpic"
 RDEPENDS_${PN} += "clear-once"
 RDEPENDS_${PN} += "settings"
 RDEPENDS_${PN} += "network"
-SRC_URI += "git://github.com/openbmc/phosphor-host-ipmid"
+SRC_URI += "git://github.com/openbmc/phosphor-host-ipmid \
+			file://host-ipmid-whitelist.conf \
+			file://host-ipmid-oem-whitelist.conf \
+			file://host-ipmid-fru-whitelist.conf"
 
 SRCREV = "b7bcda57ee39616e8937194d281e2476e6ea8df2"
 
@@ -31,3 +34,43 @@ do_install() {
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
+        merge_config.sh -m .config ${@" ".join(find_cfgs(d))}
+        generate_whitelist .config  > ipmiwhitelist.C
+}
+
+generate_whitelist() {
+        # Ensure some files have been passed.
+        if [ "x$*" == "x" ]; then
+            echo "Usage: $0 [whitelist_files+]" >&2
+            exit -1
+        fi
+		
+        # Output header of C++ file.
+        echo -e '#include <vector>\n'
+		
+        echo -e 'using netfncmd_pair = std::pair<unsigned char, unsigned char>;\n'
+		
+        echo -e 'const std::vector<netfncmd_pair> whitelist = {\n'
+		
+        # Output each row of whitelist vector.
+        # Concatenate all the passed files.
+        # Remove comments and empty lines.
+        # Sort the list [numerically].
+        # Remove any duplicates.
+        # Turn "a:b" -> "{ a, b },"
+        cat $* | sed "s/#.*//" | sed '/^$/d' | sort -n | uniq | sed "s/^/    { /" | \
+        sed "s/:/, /" | sed "s/$/ }, /"
+    	
+        echo '};'
+}
diff --git a/meta-phosphor/common/recipes-phosphor/host-ipmid/host-ipmid.bbappend b/meta-phosphor/common/recipes-phosphor/host-ipmid/host-ipmid.bbappend
new file mode 100644
index 0000000..b2051b6
--- /dev/null
+++ b/meta-phosphor/common/recipes-phosphor/host-ipmid/host-ipmid.bbappend
@@ -0,0 +1 @@
+FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}/files:"
diff --git a/meta-phosphor/common/recipes-phosphor/host-ipmid/host-ipmid/files/host-ipmid-fru-whitelist.conf b/meta-phosphor/common/recipes-phosphor/host-ipmid/host-ipmid/files/host-ipmid-fru-whitelist.conf
new file mode 100644
index 0000000..46109e6
--- /dev/null
+++ b/meta-phosphor/common/recipes-phosphor/host-ipmid/host-ipmid/files/host-ipmid-fru-whitelist.conf
@@ -0,0 +1,2 @@
+#<NetFn>:<Command>
+0x32:0xF0
diff --git a/meta-phosphor/common/recipes-phosphor/host-ipmid/host-ipmid/files/host-ipmid-oem-whitelist.conf b/meta-phosphor/common/recipes-phosphor/host-ipmid/host-ipmid/files/host-ipmid-oem-whitelist.conf
new file mode 100644
index 0000000..251d38f
--- /dev/null
+++ b/meta-phosphor/common/recipes-phosphor/host-ipmid/host-ipmid/files/host-ipmid-oem-whitelist.conf
@@ -0,0 +1,3 @@
+#<NetFn>:<Command>
+0x2C:0x00
+0x2C:0x03
diff --git a/meta-phosphor/common/recipes-phosphor/host-ipmid/host-ipmid/files/host-ipmid-whitelist.conf b/meta-phosphor/common/recipes-phosphor/host-ipmid/host-ipmid/files/host-ipmid-whitelist.conf
new file mode 100644
index 0000000..06b6648
--- /dev/null
+++ b/meta-phosphor/common/recipes-phosphor/host-ipmid/host-ipmid/files/host-ipmid-whitelist.conf
@@ -0,0 +1,23 @@
+#<NetFn>:<Command>
+0x00:0x02
+0x00:0x08
+0x00:0x09
+0x04:0x2D
+0x04:0x2F
+0x04:0x30
+0x06:0x01
+0x06:0x08
+0x06:0x22
+0x06:0x24
+0x06:0x2E
+0x06:0x31
+0x06:0x35
+0x06:0x36
+0x06:0x42
+0x0A:0x12
+0x0A:0x40
+0x0A:0x42
+0x0A:0x44
+0x0A:0x48
+0x0A:0x49
+0x0C:0x02
-- 
2.9.0
