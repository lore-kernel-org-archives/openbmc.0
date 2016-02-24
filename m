Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id E53021A04D4
 for <openbmc@lists.ozlabs.org>; Thu, 25 Feb 2016 05:40:34 +1100 (AEDT)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1456339229871930.8599879017261;
 Wed, 24 Feb 2016 10:40:29 -0800 (PST)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH openbmc 3/9] obmc-{init,
 update}.sh: Cope with alternate RW FS types
Date: Wed, 24 Feb 2016 12:40:18 -0600
Message-Id: <1456339224-27295-4-git-send-email-openbmc-patches@stwcx.xyz>
X-Mailer: git-send-email 2.7.1
In-Reply-To: <1456339224-27295-1-git-send-email-openbmc-patches@stwcx.xyz>
References: <1456339224-27295-1-git-send-email-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Wed, 24 Feb 2016 18:40:35 -0000

From: Andrew Jeffery <andrew@aj.id.au>

Busybox's blkid is a little hamstrung, requiring some processing of the
output to emulate what can be achieved with a couple of options with
blkid from util-linux.

Similar to findmtd(), the code for probe_fs_type() and blkid_fs_type()
is duplicated between obmc-{init,update}.sh. Some consideration should
be given to splitting out common functionality into well-defined
sourcable scripts.

Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
---
 .../obmc-phosphor-initfs/files/obmc-init.sh           | 16 +++++++++++++++-
 .../obmc-phosphor-initfs/files/obmc-update.sh         | 19 ++++++++++++++++---
 2 files changed, 31 insertions(+), 4 deletions(-)

diff --git a/meta-phosphor/common/recipes-phosphor/obmc-phosphor-initfs/files/obmc-init.sh b/meta-phosphor/common/recipes-phosphor/obmc-phosphor-initfs/files/obmc-init.sh
index 9674765..7fc6587 100644
--- a/meta-phosphor/common/recipes-phosphor/obmc-phosphor-initfs/files/obmc-init.sh
+++ b/meta-phosphor/common/recipes-phosphor/obmc-phosphor-initfs/files/obmc-init.sh
@@ -30,6 +30,20 @@ findmtd() {
 	echo $m
 }
 
+blkid_fs_type() {
+	# Emulate util-linux's `blkid -s TYPE -o value $1`
+	# Example busybox blkid output:
+	#    # blkid /dev/mtdblock5
+	#    /dev/mtdblock5: TYPE="squashfs"
+	# Process output to extract TYPE value "squashfs".
+	blkid $1 | sed -e 's/^.*TYPE="//' -e 's/".*$//'
+}
+
+probe_fs_type() {
+	fst=$(blkid_fs_type $1)
+	echo ${fst:=jffs2}
+}
+
 debug_takeover() {
 	echo "$@"
 	test -n "$@" && echo Enter password to try to manually fix.
@@ -72,7 +86,7 @@ rodev=/dev/mtdblock${rofs#mtd}
 rwdev=/dev/mtdblock${rwfs#mtd}
 
 rofst=squashfs
-rwfst=ext4
+rwfst=$(probe_fs_type $rwdev)
 roopts=ro
 rwopts=rw
 
diff --git a/meta-phosphor/common/recipes-phosphor/obmc-phosphor-initfs/files/obmc-update.sh b/meta-phosphor/common/recipes-phosphor/obmc-phosphor-initfs/files/obmc-update.sh
index face06d..367c302 100755
--- a/meta-phosphor/common/recipes-phosphor/obmc-phosphor-initfs/files/obmc-update.sh
+++ b/meta-phosphor/common/recipes-phosphor/obmc-phosphor-initfs/files/obmc-update.sh
@@ -35,10 +35,23 @@ findmtd() {
 	echo $m
 }
 
+blkid_fs_type() {
+	# Emulate util-linux's `blkid -s TYPE -o value $1`
+	# Example busybox blkid output:
+	#    # blkid /dev/mtdblock5
+	#    /dev/mtdblock5: TYPE="squashfs"
+	# Process output to extract TYPE value "squashfs".
+	blkid $1 | sed -e 's/^.*TYPE="//' -e 's/".*$//'
+}
+
+probe_fs_type() {
+	fst=$(blkid_fs_type $1)
+	echo ${fst:=jffs2}
+}
+
 rwfs=$(findmtd rwfs)
 
 rwdev=/dev/mtdblock${rwfs#mtd}
-rwfst=ext4
 rwopts=rw
 rorwopts=ro${rwopts#rw}
 
@@ -50,7 +63,7 @@ if test -n "$rwfs" && test -s whitelist
 then
 
 	mkdir -p $rwdir
-	mount $rwdev $rwdir -t $rwfst -o $rorwopts
+	mount $rwdev $rwdir -t $(probe_fs_type $rwdev) -o $rorwopts
 
 	while read f
 	do
@@ -87,7 +100,7 @@ done
 
 if test -d $save
 then
-	mount $rwdev $rwdir -t $rwfst -o $rwopts
+	mount $rwdev $rwdir -t $(probe_fs_type $rwdev) -o $rwopts
 	cp -rp $save/. $upper/
 	umount $rwdir
 fi
-- 
2.7.1
