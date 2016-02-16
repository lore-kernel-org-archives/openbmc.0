Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 437861A0274
 for <openbmc@lists.ozlabs.org>; Tue, 16 Feb 2016 11:30:30 +1100 (AEDT)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1455582625835652.3835653770736;
 Mon, 15 Feb 2016 16:30:25 -0800 (PST)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH openbmc 3/3] initfs: split whitelist into a directory of files
Date: Mon, 15 Feb 2016 18:30:22 -0600
Message-Id: <1455582622-9849-4-git-send-email-openbmc-patches@stwcx.xyz>
X-Mailer: git-send-email 2.7.1
In-Reply-To: <1455582622-9849-1-git-send-email-openbmc-patches@stwcx.xyz>
References: <1455582622-9849-1-git-send-email-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Tue, 16 Feb 2016 00:30:30 -0000

From: "Milton D. Miller II" <miltonm@us.ibm.com>

It is desirable to give individual packages the ability to specify
files or directories that should be preserved across a firmware update.
This commit splits the whitelist before distributing the files,
which will require further recipe development.

Covert the whitelist to a whitelist directory.  Read the contents
of all files.  Allow comments by ignoring lines beginning with the
hash (#) character.

Also always create the directory to mount the filesystem, and don't
try to pre-verify there are files save before mounting the rwfs.

Signed-off-by: Milton Miller <miltonm@us.ibm.com>
---
 .../recipes-phosphor/obmc-phosphor-initfs/files/obmc-init.sh |  2 +-
 .../obmc-phosphor-initfs/files/obmc-update.sh                | 12 +++++++-----
 .../recipes-phosphor/obmc-phosphor-initfs/files/whitelist    |  9 ---------
 .../obmc-phosphor-initfs/files/whitelist.d/dropbear          |  1 +
 .../obmc-phosphor-initfs/files/whitelist.d/events            |  1 +
 .../obmc-phosphor-initfs/files/whitelist.d/networkd          |  1 +
 .../obmc-phosphor-initfs/files/whitelist.d/users             |  4 ++++
 .../obmc-phosphor-initfs/files/whitelist.d/uuid              |  1 +
 .../obmc-phosphor-initfs/obmc-phosphor-init.bb               | 11 ++++++++---
 9 files changed, 24 insertions(+), 18 deletions(-)
 delete mode 100644 meta-phosphor/common/recipes-phosphor/obmc-phosphor-initfs/files/whitelist
 create mode 100644 meta-phosphor/common/recipes-phosphor/obmc-phosphor-initfs/files/whitelist.d/dropbear
 create mode 100644 meta-phosphor/common/recipes-phosphor/obmc-phosphor-initfs/files/whitelist.d/events
 create mode 100644 meta-phosphor/common/recipes-phosphor/obmc-phosphor-initfs/files/whitelist.d/networkd
 create mode 100644 meta-phosphor/common/recipes-phosphor/obmc-phosphor-initfs/files/whitelist.d/users
 create mode 100644 meta-phosphor/common/recipes-phosphor/obmc-phosphor-initfs/files/whitelist.d/uuid

diff --git a/meta-phosphor/common/recipes-phosphor/obmc-phosphor-initfs/files/obmc-init.sh b/meta-phosphor/common/recipes-phosphor/obmc-phosphor-initfs/files/obmc-init.sh
index 6750de3..ddff851 100644
--- a/meta-phosphor/common/recipes-phosphor/obmc-phosphor-initfs/files/obmc-init.sh
+++ b/meta-phosphor/common/recipes-phosphor/obmc-phosphor-initfs/files/obmc-init.sh
@@ -18,7 +18,7 @@ fi
 
 mkdir -p $rodir $rwdir
 
-cp -rp init shutdown update whitelist bin sbin usr lib etc var run/initramfs
+cp -rp init shutdown update whitelist.d bin sbin usr lib etc var run/initramfs
 
 # To start a interactive shell with job control at this point, run
 # getty 38400 ttyS4
diff --git a/meta-phosphor/common/recipes-phosphor/obmc-phosphor-initfs/files/obmc-update.sh b/meta-phosphor/common/recipes-phosphor/obmc-phosphor-initfs/files/obmc-update.sh
index 70188ad..690f533 100755
--- a/meta-phosphor/common/recipes-phosphor/obmc-phosphor-initfs/files/obmc-update.sh
+++ b/meta-phosphor/common/recipes-phosphor/obmc-phosphor-initfs/files/obmc-update.sh
@@ -45,12 +45,12 @@ rorwopts=ro${rwopts#rw}
 rwdir=rw
 upper=$rwdir/cow
 save=save/${upper##*/}
-whitelist=/run/initramfs/whitelist
+whitelist=/run/initramfs/whitelist.d
 
-if test -n "$rwfs" && test -s $whitelist
-then
+mkdir -p $rwdir
 
-	mkdir -p $rwdir
+if test -n "$rwfs"
+then
 	mount $rwdev $rwdir -t $rwfst -o $rorwopts
 
 	while read f
@@ -62,7 +62,9 @@ then
 		d="$save/$f"
 		mkdir -p "${d%/*}"
 		cp -rp $upper/$f "${d%/*}/"
-	done < $whitelist
+	done << HERE
+$(grep -vh ^# $whitelist/*)
+HERE
 
 	umount $rwdir
 fi
diff --git a/meta-phosphor/common/recipes-phosphor/obmc-phosphor-initfs/files/whitelist b/meta-phosphor/common/recipes-phosphor/obmc-phosphor-initfs/files/whitelist
deleted file mode 100644
index 603cec7..0000000
--- a/meta-phosphor/common/recipes-phosphor/obmc-phosphor-initfs/files/whitelist
+++ /dev/null
@@ -1,9 +0,0 @@
-/etc/dropbear/dropbear_rsa_host_key
-/etc/systemd/network
-/etc/resolv.conf
-/etc/machine-id
-/etc/passwd
-/etc/group
-/etc/shadow
-/etc/gshadow
-/var/lib/obmc/events/
diff --git a/meta-phosphor/common/recipes-phosphor/obmc-phosphor-initfs/files/whitelist.d/dropbear b/meta-phosphor/common/recipes-phosphor/obmc-phosphor-initfs/files/whitelist.d/dropbear
new file mode 100644
index 0000000..1cc26fb
--- /dev/null
+++ b/meta-phosphor/common/recipes-phosphor/obmc-phosphor-initfs/files/whitelist.d/dropbear
@@ -0,0 +1 @@
+/etc/dropbear/dropbear_rsa_host_key
diff --git a/meta-phosphor/common/recipes-phosphor/obmc-phosphor-initfs/files/whitelist.d/events b/meta-phosphor/common/recipes-phosphor/obmc-phosphor-initfs/files/whitelist.d/events
new file mode 100644
index 0000000..3f6b008
--- /dev/null
+++ b/meta-phosphor/common/recipes-phosphor/obmc-phosphor-initfs/files/whitelist.d/events
@@ -0,0 +1 @@
+/var/lib/obmc/events/
diff --git a/meta-phosphor/common/recipes-phosphor/obmc-phosphor-initfs/files/whitelist.d/networkd b/meta-phosphor/common/recipes-phosphor/obmc-phosphor-initfs/files/whitelist.d/networkd
new file mode 100644
index 0000000..5f1fc91
--- /dev/null
+++ b/meta-phosphor/common/recipes-phosphor/obmc-phosphor-initfs/files/whitelist.d/networkd
@@ -0,0 +1 @@
+/etc/systemd/network
diff --git a/meta-phosphor/common/recipes-phosphor/obmc-phosphor-initfs/files/whitelist.d/users b/meta-phosphor/common/recipes-phosphor/obmc-phosphor-initfs/files/whitelist.d/users
new file mode 100644
index 0000000..59327f1
--- /dev/null
+++ b/meta-phosphor/common/recipes-phosphor/obmc-phosphor-initfs/files/whitelist.d/users
@@ -0,0 +1,4 @@
+/etc/passwd
+/etc/group
+/etc/shadow
+/etc/gshadow
diff --git a/meta-phosphor/common/recipes-phosphor/obmc-phosphor-initfs/files/whitelist.d/uuid b/meta-phosphor/common/recipes-phosphor/obmc-phosphor-initfs/files/whitelist.d/uuid
new file mode 100644
index 0000000..3e4519c
--- /dev/null
+++ b/meta-phosphor/common/recipes-phosphor/obmc-phosphor-initfs/files/whitelist.d/uuid
@@ -0,0 +1 @@
+/etc/machine-id
diff --git a/meta-phosphor/common/recipes-phosphor/obmc-phosphor-initfs/obmc-phosphor-init.bb b/meta-phosphor/common/recipes-phosphor/obmc-phosphor-initfs/obmc-phosphor-init.bb
index cb18dc8..d29b9a7 100644
--- a/meta-phosphor/common/recipes-phosphor/obmc-phosphor-initfs/obmc-phosphor-init.bb
+++ b/meta-phosphor/common/recipes-phosphor/obmc-phosphor-initfs/obmc-phosphor-init.bb
@@ -9,15 +9,20 @@ S = "${WORKDIR}"
 SRC_URI += "file://obmc-init.sh"
 SRC_URI += "file://obmc-shutdown.sh"
 SRC_URI += "file://obmc-update.sh"
-SRC_URI += "file://whitelist"
+SRC_URI += "file://whitelist.d/dropbear"
+SRC_URI += "file://whitelist.d/events"
+SRC_URI += "file://whitelist.d/networkd"
+SRC_URI += "file://whitelist.d/users"
+SRC_URI += "file://whitelist.d/uuid"
 
 do_install() {
         install -m 0755 ${S}/obmc-init.sh ${D}/init
         install -m 0755 ${S}/obmc-shutdown.sh ${D}/shutdown
         install -m 0755 ${S}/obmc-update.sh ${D}/update
-        install -m 0644 ${S}/whitelist ${D}/whitelist
+        install -d ${D}/whitelist.d/
+        install -m 0644 -t ${D}/whitelist.d ${S}/whitelist.d/{dropbear,events,networkd,users,uuid}
         install -d ${D}/dev
         mknod -m 622 ${D}/dev/console c 5 1
 }
 
-FILES_${PN} += " /init /shutdown /update /whitelist /dev "
+FILES_${PN} += " /init /shutdown /update /whitelist.d /dev "
-- 
2.7.1
