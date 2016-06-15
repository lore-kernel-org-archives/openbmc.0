Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3rTq3M3t0ZzDqhd
 for <openbmc@lists.ozlabs.org>; Wed, 15 Jun 2016 11:40:47 +1000 (AEST)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1465954841242434.64103571489;
 Tue, 14 Jun 2016 18:40:41 -0700 (PDT)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH openbmc v4 08/10] initfs: update: add check for image size vs
 mtd size
Date: Tue, 14 Jun 2016 20:40:29 -0500
Message-Id: <20160615014031.32062-9-openbmc-patches@stwcx.xyz>
X-Mailer: git-send-email 2.8.4
In-Reply-To: <20160615014031.32062-1-openbmc-patches@stwcx.xyz>
References: <20160615014031.32062-1-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Wed, 15 Jun 2016 01:40:48 -0000

From: "Milton D. Miller II" <miltonm@us.ibm.com>

The flashcp command will check the file size vs the partition size,
so add a check when looking at images.

Use stat -L -c "%s" to get the file size, and compare it to the mtd
size from the sysfs size attribute.

If this check is suppressed the enforcement is left to flashcp.

Signed-off-by: Milton Miller <miltonm@us.ibm.com>
---
 .../obmc-phosphor-initfs/files/obmc-update.sh           | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/meta-phosphor/common/recipes-phosphor/obmc-phosphor-initfs/files/obmc-update.sh b/meta-phosphor/common/recipes-phosphor/obmc-phosphor-initfs/files/obmc-update.sh
index 09348b6..7344438 100755
--- a/meta-phosphor/common/recipes-phosphor/obmc-phosphor-initfs/files/obmc-update.sh
+++ b/meta-phosphor/common/recipes-phosphor/obmc-phosphor-initfs/files/obmc-update.sh
@@ -48,6 +48,14 @@ childmtds() {
 	done
 }
 
+toobig() {
+	if test $(stat -L -c "%s" "$1") -gt $(cat /sys/class/mtd/"$2"/size)
+	then
+		return 0
+	fi
+	return 1
+}
+
 findmtd() {
 	m=$(grep -xl "$1" /sys/class/mtd/*/name)
 	m=${m%/name}
@@ -85,6 +93,7 @@ doclean=
 dosave=y
 dorestore=y
 toram=
+checksize=y
 checkmount=y
 
 whitelist=/run/initramfs/whitelist
@@ -114,6 +123,9 @@ do
 	--no-flash)
 		doflash=
 		shift ;;
+	--ignore-size)
+		checksize=
+		shift ;;
 	--ignore-mount)
 		checkmount=
 		doflash=
@@ -161,6 +173,11 @@ do
 		echo 1>&2  "Unable to find mtd partiton for ${f##*/}."
 		exit 1
 	fi
+	if test -n "$checksize" && toobig "$f" "$m"
+	then
+		echo 1>&1 "Image ${f##*/} too big for $m."
+		exit 1
+	fi
 	for s in $m $(childmtds $m)
 	do
 		if test -n "$checkmount" && mtdismounted $s
-- 
2.8.4
