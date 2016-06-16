Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3rVPv866YHzDqmm
 for <openbmc@lists.ozlabs.org>; Thu, 16 Jun 2016 10:50:44 +1000 (AEST)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1466038239867243.26818881737188;
 Wed, 15 Jun 2016 17:50:39 -0700 (PDT)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH openbmc v5 08/12] initfs: update: check individual mtd
 partitions for mounts
Date: Wed, 15 Jun 2016 19:50:26 -0500
Message-Id: <20160616005030.19176-9-openbmc-patches@stwcx.xyz>
X-Mailer: git-send-email 2.8.4
In-Reply-To: <20160616005030.19176-1-openbmc-patches@stwcx.xyz>
References: <20160616005030.19176-1-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Thu, 16 Jun 2016 00:50:45 -0000

From: "Milton D. Miller II" <miltonm@us.ibm.com>

Instead of checking for any mtd device, only check mtd devices
that are to be updated.  Include child mtd devices when looking
for mounted filesystems.

If this check is suppressed flash updates are suppressed.
Suppressing the check may be useful to verify a update could
succeed at shutdown.

Signed-off-by: Milton Miller <miltonm@us.ibm.com>
---
 .../obmc-phosphor-initfs/files/obmc-update.sh      | 47 +++++++++++++++++++---
 1 file changed, 41 insertions(+), 6 deletions(-)

diff --git a/meta-phosphor/common/recipes-phosphor/obmc-phosphor-initfs/files/obmc-update.sh b/meta-phosphor/common/recipes-phosphor/obmc-phosphor-initfs/files/obmc-update.sh
index 4442e5b..22c9dcc 100755
--- a/meta-phosphor/common/recipes-phosphor/obmc-phosphor-initfs/files/obmc-update.sh
+++ b/meta-phosphor/common/recipes-phosphor/obmc-phosphor-initfs/files/obmc-update.sh
@@ -19,11 +19,34 @@ then
 	mount -t devtmpfs dev dev
 fi
 
-if grep mtd /proc/mounts
-then
-	echo 1>&2 "ERROR: A mtd device is mounted."
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
@@ -62,10 +85,10 @@ doclean=
 dosave=y
 dorestore=y
 toram=
+checkmount=y
 
 whitelist=/run/initramfs/whitelist
 image=/run/initramfs/image-
-
 E="ERROR:"
 
 while test "$1" != "${1#-}"
@@ -92,6 +115,10 @@ do
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
@@ -135,6 +162,14 @@ do
 		echo 1>&2 "$E Unable to find mtd partiton for ${f##*/}."
 		exit 1
 	fi
+	for s in $m $(childmtds $m)
+	do
+		if test -n "$checkmount" && mtdismounted $s
+		then
+			echo 1>&2 "$E Device $s is mounted, ${f##*/} is busy."
+			exit 1
+		fi
+	done
 done
 
 if test -n "$doflash"
-- 
2.8.4
