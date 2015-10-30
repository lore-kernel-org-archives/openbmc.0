Return-Path: <patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 81BDB1A0CE9
 for <openbmc@lists.ozlabs.org>; Fri, 30 Oct 2015 23:43:00 +1100 (AEDT)
Received: from localhost (108-215-4-10.lightspeed.austtx.sbcglobal.net
 [108.215.4.10]) by mx.zohomail.com
 with SMTPS id 1446208975649188.20000637532962;
 Fri, 30 Oct 2015 05:42:55 -0700 (PDT)
From: OpenBMC Patches <patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Cc: Brad Bishop <bradleyb@us.ibm.com>
Subject: [PATCH openbmc 1/2] Add btbridged recipe
Date: Fri, 30 Oct 2015 07:42:51 -0500
Message-Id: <1446208972-26266-2-git-send-email-patches@stwcx.xyz>
X-Mailer: git-send-email 2.6.0
In-Reply-To: <1446208972-26266-1-git-send-email-patches@stwcx.xyz>
References: <1446208972-26266-1-git-send-email-patches@stwcx.xyz>
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
X-List-Received-Date: Fri, 30 Oct 2015 12:43:01 -0000

From: Brad Bishop <bradleyb@us.ibm.com>

---
 .../common/recipes-phosphor/host-ipmid/btbridged.bb    | 18 ++++++++++++++++++
 .../host-ipmid/btbridged/btbridged.service             |  8 ++++++++
 .../host-ipmid/btbridged/makefile.patch                | 11 +++++++++++
 3 files changed, 37 insertions(+)
 create mode 100644 meta-phosphor/common/recipes-phosphor/host-ipmid/btbridged.bb
 create mode 100644 meta-phosphor/common/recipes-phosphor/host-ipmid/btbridged/btbridged.service
 create mode 100644 meta-phosphor/common/recipes-phosphor/host-ipmid/btbridged/makefile.patch

diff --git a/meta-phosphor/common/recipes-phosphor/host-ipmid/btbridged.bb b/meta-phosphor/common/recipes-phosphor/host-ipmid/btbridged.bb
new file mode 100644
index 0000000..8572add
--- /dev/null
+++ b/meta-phosphor/common/recipes-phosphor/host-ipmid/btbridged.bb
@@ -0,0 +1,18 @@
+SUMMARY = "Phosphor OpenBMC BT to DBUS"
+DESCRIPTION = "Phosphor OpenBMC BT to DBUS."
+PR = "r1"
+
+inherit obmc-phosphor-sdbus-service
+inherit obmc-phosphor-c-daemon
+
+SYSTEMD_SERVICE_${PN} = "btbridged.service"
+
+inherit obmc-phosphor-host-ipmi-hw
+
+S = "${WORKDIR}/git"
+SRC_URI += "git://github.com/openbmc/btbridge file://makefile.patch"
+SRCREV="5cb9032815aa9d2866229caac4943520d5f40dd8"
+
+# This is how linux-libc-headers says to include custom uapi headers
+EXTRA_OEMAKE_append = "CFLAGS=-I${STAGING_KERNEL_DIR}/include/uapi"
+DEPENDS += "virtual/kernel"
diff --git a/meta-phosphor/common/recipes-phosphor/host-ipmid/btbridged/btbridged.service b/meta-phosphor/common/recipes-phosphor/host-ipmid/btbridged/btbridged.service
new file mode 100644
index 0000000..185119a
--- /dev/null
+++ b/meta-phosphor/common/recipes-phosphor/host-ipmid/btbridged/btbridged.service
@@ -0,0 +1,8 @@
+[Unit]
+Description=Phosphor OpenBMC BT to DBUS
+
+[Service]
+ExecStart=/usr/sbin/btbridged
+
+[Install]
+WantedBy=multi-user.target
diff --git a/meta-phosphor/common/recipes-phosphor/host-ipmid/btbridged/makefile.patch b/meta-phosphor/common/recipes-phosphor/host-ipmid/btbridged/makefile.patch
new file mode 100644
index 0000000..a2cd522
--- /dev/null
+++ b/meta-phosphor/common/recipes-phosphor/host-ipmid/btbridged/makefile.patch
@@ -0,0 +1,11 @@
+diff --git a/Makefile b/Makefile
+index 7f62be2..52e1063 100644
+--- a/Makefile
++++ b/Makefile
+@@ -2,3 +2,6 @@ all: btbridged
+ 
+ btbridged: btbridged.c
+ 	$(CC) $(CFLAGS) `pkg-config --cflags --libs libsystemd` $^ -o $@
++
++clean:
++	rm -f *.o btbridge
-- 
2.6.0
