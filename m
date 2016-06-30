Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3rgbs36JXnzDqmS
 for <openbmc@lists.ozlabs.org>; Fri,  1 Jul 2016 09:50:47 +1000 (AEST)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1467330642818681.7652929515657;
 Thu, 30 Jun 2016 16:50:42 -0700 (PDT)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH openbmc 08/16] initfs: update: check individual mtd partitions
 for mounts
Date: Thu, 30 Jun 2016 18:50:25 -0500
Message-Id: <20160630235033.17091-9-openbmc-patches@stwcx.xyz>
X-Mailer: git-send-email 2.9.0
In-Reply-To: <20160630235033.17091-1-openbmc-patches@stwcx.xyz>
References: <20160630235033.17091-1-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Thu, 30 Jun 2016 23:50:48 -0000

From: Milton Miller <miltonm@us.ibm.com>

Instead of checking for any mtd device, only check mtd devices
that are to be updated.  Include child mtd devices when looking
for mounted filesystems.

If this check is suppressed flash updates are suppressed.
Suppressing the check may be useful to verify a update could
succeed at shutdown.

Signed-off-by: Milton Miller <miltonm@us.ibm.com>
---
 .../obmc-phosphor-initfs/files/obmc-update.sh      | 46 +++++++++++++++++++---
 1 file changed, 41 insertions(+), 5 deletions(-)

diff --git a/meta-phosphor/common/recipes-phosphor/obmc-phosphor-initfs/files/obmc-update.sh b/meta-phosphor/common/recipes-phosphor/obmc-phosphor-initfs/files/obmc-update.sh
index 9f5bede..9d3c812 100755
--- a/meta-phosphor/common/recipes-phosphor/obmc-phosphor-initfs/files/obmc-update.sh
+++ b/meta-phosphor/common/recipes-phosphor/obmc-phosphor-initfs/files/obmc-update.sh
@@ -23,11 +23,34 @@ then
 	mount -t devtmpfs dev dev
 fi
 
-if grep mtd /proc/mounts
-then
-	echoerr "A mtd device is mounted."
-	exit 1
-fi
+# mtd number N with mtd name Name can be mounted via mtdN, or mtd:Name
+# (with a mtd aware fs) or by /dev/mtdblockN (with a mtd or block fs).
+mtdismounted() {
+	m=${1##mtd}
+	if grep -s "mtdblock$m " /proc/mounts || grep -s "mtd$m " /proc/mounts
+	then
+		return 0
+	fi
+	n=$(cat /sys/class/mtd/mtd$m/name)
+	if test -n "$n" && grep -s "mtd:$n " /proc/mounts
+	then
+		return 0
+	fi
+	return 1
+}
+
+# Detect child partitions when the whole flash is to be updated.
+# Ignore mtdNro and mtdblockN names in the class subsystem directory.
+childmtds() {
+	for m in /sys/class/mtd/$1/mtd*
+	do
+		m=${m##*/}
+		if test "${m%ro}" = "${m#mtdblock}"
+		then
+			echo $m
+		fi
+	done
+}
 
 findmtd() {
 	m=$(grep -xl "$1" /sys/class/mtd/*/name)
@@ -66,6 +89,7 @@ doclean=
 dosave=y
 dorestore=y
 toram=
+checkmount=y
 
 whitelist=/run/initramfs/whitelist
 image=/run/initramfs/image-
@@ -94,6 +118,10 @@ do
 	--no-flash)
 		doflash=
 		shift ;;
+	--ignore-mount)
+		checkmount=
+		doflash=
+		shift ;;
 	--copy-files)
 		toram=y
 		shift ;;
@@ -137,6 +165,14 @@ do
 		echoerr "Unable to find mtd partiton for ${f##*/}."
 		exit 1
 	fi
+	for s in $m $(childmtds $m)
+	do
+		if test -n "$checkmount" && mtdismounted $s
+		then
+			echoerr "Device $s is mounted, ${f##*/} is busy."
+			exit 1
+		fi
+	done
 done
 
 if test -n "$doflash"
-- 
2.9.0
