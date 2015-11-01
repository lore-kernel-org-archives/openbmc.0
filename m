Return-Path: <patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 5181E1A0772
 for <openbmc@lists.ozlabs.org>; Sun,  1 Nov 2015 15:34:25 +1100 (AEDT)
Received: from localhost (108-215-4-10.lightspeed.austtx.sbcglobal.net
 [108.215.4.10]) by mx.zohomail.com
 with SMTPS id 1446352461380492.59172705386106;
 Sat, 31 Oct 2015 21:34:21 -0700 (PDT)
From: OpenBMC Patches <patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Cc: Brad Bishop <bradleyb@us.ibm.com>
Subject: [PATCH openbmc] Patch btbridge makefile.
Date: Sat, 31 Oct 2015 23:34:17 -0500
Message-Id: <1446352457-9325-2-git-send-email-patches@stwcx.xyz>
X-Mailer: git-send-email 2.6.0
In-Reply-To: <1446352457-9325-1-git-send-email-patches@stwcx.xyz>
References: <1446352457-9325-1-git-send-email-patches@stwcx.xyz>
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
X-List-Received-Date: Sun, 01 Nov 2015 04:34:25 -0000

From: Brad Bishop <bradleyb@us.ibm.com>

It doesn't work inside OE at the moment.
---
 .../common/recipes-phosphor/host-ipmid/btbridged.bb    |  2 +-
 .../host-ipmid/btbridged/makefile.patch                | 18 ++++++++++++++++++
 2 files changed, 19 insertions(+), 1 deletion(-)
 create mode 100644 meta-phosphor/common/recipes-phosphor/host-ipmid/btbridged/makefile.patch

diff --git a/meta-phosphor/common/recipes-phosphor/host-ipmid/btbridged.bb b/meta-phosphor/common/recipes-phosphor/host-ipmid/btbridged.bb
index 5c0ec5c..27efa3f 100644
--- a/meta-phosphor/common/recipes-phosphor/host-ipmid/btbridged.bb
+++ b/meta-phosphor/common/recipes-phosphor/host-ipmid/btbridged.bb
@@ -10,7 +10,7 @@ SYSTEMD_SERVICE_${PN} = "btbridged.service"
 inherit obmc-phosphor-host-ipmi-hw
 
 S = "${WORKDIR}/git"
-SRC_URI += "git://github.com/openbmc/btbridge"
+SRC_URI += "git://github.com/openbmc/btbridge file://makefile.patch"
 SRCREV="c0ee3595f9a4784c7cf7ee60fd247d9712ec7e6b"
 
 # This is how linux-libc-headers says to include custom uapi headers
diff --git a/meta-phosphor/common/recipes-phosphor/host-ipmid/btbridged/makefile.patch b/meta-phosphor/common/recipes-phosphor/host-ipmid/btbridged/makefile.patch
new file mode 100644
index 0000000..7cb1abe
--- /dev/null
+++ b/meta-phosphor/common/recipes-phosphor/host-ipmid/btbridged/makefile.patch
@@ -0,0 +1,18 @@
+diff --git a/Makefile b/Makefile
+index a55897f..52e1063 100644
+--- a/Makefile
++++ b/Makefile
+@@ -1,9 +1,7 @@
+-CPPFLAGS=$(shell pkg-config --cflags libsystemd)
+-LDFLAGS=$(shell pkg-config --libs libsystemd)
++all: btbridged
+ 
+-EXE = btbridged
+-
+-all: $(EXE)
++btbridged: btbridged.c
++	$(CC) $(CFLAGS) `pkg-config --cflags --libs libsystemd` $^ -o $@
+ 
+ clean:
+-	rm -rf *.o $(EXE)
++	rm -f *.o btbridge
-- 
2.6.0
