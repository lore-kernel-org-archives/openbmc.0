Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3rDHt766bvzDqPy
 for <openbmc@lists.ozlabs.org>; Tue, 24 May 2016 11:30:55 +1000 (AEST)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1464053451379630.6854314929911;
 Mon, 23 May 2016 18:30:51 -0700 (PDT)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH openbmc 6/7] initfs: update: check individual mtd partitions
 for mounts
Date: Mon, 23 May 2016 20:30:39 -0500
Message-Id: <20160524013040.30742-7-openbmc-patches@stwcx.xyz>
X-Mailer: git-send-email 2.8.3
In-Reply-To: <20160524013040.30742-1-openbmc-patches@stwcx.xyz>
References: <20160524013040.30742-1-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Tue, 24 May 2016 01:30:56 -0000

From: "Milton D. Miller II" <miltonm@us.ibm.com>

Instead of checking for any mtd device, only check mtd devices that are
to be updated.  Include child mtd devices when looking for mounted
filesystems.

If this check is suppressed flash updates are suppressed.
This may be useful to check deferred updates.

Signed-off-by: Milton Miller <miltonm@us.ibm.com>
---
 .../obmc-phosphor-initfs/files/obmc-update.sh      | 46 +++++++++++++++++++---
 1 file changed, 41 insertions(+), 5 deletions(-)

diff --git a/meta-phosphor/common/recipes-phosphor/obmc-phosphor-initfs/files/obmc-update.sh b/meta-phosphor/common/recipes-phosphor/obmc-phosphor-initfs/files/obmc-update.sh
index 45dcd56..f444040 100755
--- a/meta-phosphor/common/recipes-phosphor/obmc-phosphor-initfs/files/obmc-update.sh
+++ b/meta-phosphor/common/recipes-phosphor/obmc-phosphor-initfs/files/obmc-update.sh
@@ -19,11 +19,34 @@ then
 	mount -t devtmpfs dev dev
 fi
 
-if grep mtd /proc/mounts
-then
-	echo 1>&2 "Error: A mtd device is mounted."
-	exit 1
-fi
+# mtd number N with mtd name Name can be mounted via mtdN, or mtd:Name (with
+# an mtd aware fs) or by /dev/mtdblockN (with a mtd or block fs). 
+mtdismounted() {
+	m=${1##mtd}
+	if grep -s "mtdblock$m" /proc/mounts || grep -s "mtd$m" /proc/mounts
+	then
+		return 0
+	fi
+	n=$(cat /sys/class/mtd/mtd$m/name)
+	if test -n "$n" && grep -s "mtd:$n" /proc/mounts
+	then
+		return 0
+	fi
+	return 1
+}
+
+# We need to detect child partitions when the whole flash is to be updated
+# ignore mtdNro and mtdblockN names in the class subsystem directory
+childmtds() {
+	for m in /sys/class/mtd/$1/mtd*
+	do
+		m=${m##*/}
+		if "${m%ro}" = "${m#mtdblock}"
+		then
+			echo $m
+		fi
+	done
+}
 
 findmtd() {
 	m=$(grep -xl "$1" /sys/class/mtd/*/name)
@@ -62,6 +85,7 @@ doclean=
 dosave=y
 dorestore=y
 toram=
+checkmount=y
 
 whitelist=/run/initramfs/whitelist.d/
 image=/run/initramfs/image-
@@ -90,6 +114,10 @@ do
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
@@ -135,6 +163,14 @@ do
 		echo 1>&2  "Unable to find mtd partiton for ${f##*/}."
 		exit 1
 	fi
+	for s in $m $(childmtds $m)
+	do
+		if test -n "$checkmount" && mtdismounted $s
+		then
+			echo 1>&2 "Device $s is mounted, ${f##*/} is busy."
+			exit 1
+		fi
+	done
 done
 
 if test -n "$doflash"
-- 
2.8.3
