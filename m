Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3rpxHW5z3zzDqDy
 for <openbmc@lists.ozlabs.org>; Wed, 13 Jul 2016 08:20:39 +1000 (AEST)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 146836203447580.83253897031534;
 Tue, 12 Jul 2016 15:20:34 -0700 (PDT)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH openbmc v3] initfs: Store whiltelist in a directory of files
Date: Tue, 12 Jul 2016 17:20:32 -0500
Message-Id: <20160712222032.31868-2-openbmc-patches@stwcx.xyz>
X-Mailer: git-send-email 2.9.0
In-Reply-To: <20160712222032.31868-1-openbmc-patches@stwcx.xyz>
References: <20160712222032.31868-1-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Tue, 12 Jul 2016 22:20:40 -0000

From: Milton Miller <miltonm@us.ibm.com>

Change the whiltelist definition to be files in a directory instead
of a single file.  This will allow us to store which files should
be saved in individual recipes and also supports comments in the
whitelist.

The actual split into separate files is deferred for prototyping
what assistance classes should look like to make the whitelist
(eg systemd service files); also the packages will need to be
added to the package list for the initramfs image.

Signed-off-by: Milton Miller <miltonm@us.ibm.com>
---
 .../common/recipes-phosphor/obmc-phosphor-initfs/files/obmc-init.sh | 2 +-
 .../recipes-phosphor/obmc-phosphor-initfs/files/obmc-update.sh      | 6 ++++--
 .../recipes-phosphor/obmc-phosphor-initfs/obmc-phosphor-initfs.bb   | 5 +++--
 3 files changed, 8 insertions(+), 5 deletions(-)

diff --git a/meta-phosphor/common/recipes-phosphor/obmc-phosphor-initfs/files/obmc-init.sh b/meta-phosphor/common/recipes-phosphor/obmc-phosphor-initfs/files/obmc-init.sh
index 70af93d..1f54d39 100644
--- a/meta-phosphor/common/recipes-phosphor/obmc-phosphor-initfs/files/obmc-init.sh
+++ b/meta-phosphor/common/recipes-phosphor/obmc-phosphor-initfs/files/obmc-init.sh
@@ -18,7 +18,7 @@ fi
 
 mkdir -p $rodir $rwdir
 
-cp -rp init shutdown update whitelist bin sbin usr lib etc var run/initramfs
+cp -rp init shutdown update whitelist.d bin sbin usr lib etc var run/initramfs
 
 # To start a interactive shell with job control at this point, run
 # getty 38400 ttyS4
diff --git a/meta-phosphor/common/recipes-phosphor/obmc-phosphor-initfs/files/obmc-update.sh b/meta-phosphor/common/recipes-phosphor/obmc-phosphor-initfs/files/obmc-update.sh
index f0c41a7..b061e26 100755
--- a/meta-phosphor/common/recipes-phosphor/obmc-phosphor-initfs/files/obmc-update.sh
+++ b/meta-phosphor/common/recipes-phosphor/obmc-phosphor-initfs/files/obmc-update.sh
@@ -100,7 +100,7 @@ toram=
 checksize=y
 checkmount=y
 
-whitelist=/run/initramfs/whitelist
+whitelist=/run/initramfs/whitelist.d/
 image=/run/initramfs/image-
 imglist=
 
@@ -191,7 +191,9 @@ then
 		done
 		mkdir -p "${d%/*}"
 		cp -rp "$upper/$f" "${d%/*}/"
-	done < $whitelist
+	done << HERE
+$(grep -v ^# $whitelist*)
+HERE
 
 	if test -n "$mounted"
 	then
diff --git a/meta-phosphor/common/recipes-phosphor/obmc-phosphor-initfs/obmc-phosphor-initfs.bb b/meta-phosphor/common/recipes-phosphor/obmc-phosphor-initfs/obmc-phosphor-initfs.bb
index f81e21d..70b6686 100644
--- a/meta-phosphor/common/recipes-phosphor/obmc-phosphor-initfs/obmc-phosphor-initfs.bb
+++ b/meta-phosphor/common/recipes-phosphor/obmc-phosphor-initfs/obmc-phosphor-initfs.bb
@@ -21,10 +21,11 @@ do_install() {
         install -m 0755 ${WORKDIR}/obmc-init.sh ${D}/init
         install -m 0755 ${WORKDIR}/obmc-shutdown.sh ${D}/shutdown
         install -m 0755 ${WORKDIR}/obmc-update.sh ${D}/update
-        install -m 0644 ${WORKDIR}/whitelist ${D}/whitelist
+        install -d ${D}/whitelist.d
+        install -m 0644 ${WORKDIR}/whitelist ${D}/whitelist.d/whitelist
         install -d ${D}/dev
         mknod -m 622 ${D}/dev/console c 5 1
 }
 
-FILES_${PN} += " /init /shutdown /update /whitelist /dev "
+FILES_${PN} += " /init /shutdown /update /whitelist.d/whitelist /dev "
 FILES_${PN} += " /init-options /init-download-url "
-- 
2.9.0
