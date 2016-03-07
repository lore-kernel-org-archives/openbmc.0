Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id F33881A036D
 for <openbmc@lists.ozlabs.org>; Tue,  8 Mar 2016 08:30:41 +1100 (AEDT)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1457386237440368.58850514306255;
 Mon, 7 Mar 2016 13:30:37 -0800 (PST)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH openbmc v2 15/34] update: Save whitelist files from RAM or
 mounted read-write filesystem
Date: Mon,  7 Mar 2016 15:30:04 -0600
Message-Id: <1457386223-5725-16-git-send-email-openbmc-patches@stwcx.xyz>
X-Mailer: git-send-email 2.7.1
In-Reply-To: <1457386223-5725-1-git-send-email-openbmc-patches@stwcx.xyz>
References: <1457386223-5725-1-git-send-email-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Mon, 07 Mar 2016 21:30:42 -0000

From: "Milton D. Miller II" <miltonm@us.ibm.com>

Skip mounting and unmounting the read-write file system when
saving files if the upper directory exists.  Instead interpret
this as a sign the system either is or was running from RAM (or
from some future alternative and maybe temporary mounted file
system) and save the files from that upper directory.

It is possible some other filesystem is mounted on the read-write
mountpoint that is not a mtd device, either a tmpfs or some
other future media, so only try to unmount the file system if
this update script mounted it.

Each boot an empty /run filesytem is created and populated by init
with selected directories and mount points for the read-only and
read-write file systems and mounts them on these points.

The upper directory is under the read-write mount point, so if it
exists then either a file system is mounted there or the system
was prepared to run from RAM using the run tmpfs file system and
updates may have been made there.  In either case the files to
be saved exist in that directory.

Background on overlayfs:

The upper directory contains files and directory entries that were
either opened for write or had meta data changed.  Before this
happens the overlayfs copies each file or directory by name into
the work directory then atomically moves it into the corresponding
upper directory.

To form a read-write overlayfs mount, the upper directory must be,
by definition, in a read-write file system along with the work
directory, and both are required to be in the same filesystem.

Signed-off-by: Milton Miller <miltonm@us.ibm.com>
---
 .../obmc-phosphor-initfs/files/obmc-update.sh            | 16 ++++++++++++----
 1 file changed, 12 insertions(+), 4 deletions(-)

diff --git a/meta-phosphor/common/recipes-phosphor/obmc-phosphor-initfs/files/obmc-update.sh b/meta-phosphor/common/recipes-phosphor/obmc-phosphor-initfs/files/obmc-update.sh
index e580561..6f26550 100755
--- a/meta-phosphor/common/recipes-phosphor/obmc-phosphor-initfs/files/obmc-update.sh
+++ b/meta-phosphor/common/recipes-phosphor/obmc-phosphor-initfs/files/obmc-update.sh
@@ -59,6 +59,7 @@ rwdir=/run/initramfs/rw
 upper=$rwdir/cow
 save=/run/save/${upper##*/}
 
+mounted=
 doclean=
 dosave=y
 dorestore=y
@@ -93,10 +94,14 @@ do
 	esac
 done
 
-if test "x$dosave" = xy -a -n "$rwfs"
+if test "x$dosave" = xy
 then
-	mkdir -p $rwdir
-	mount $rwdev $rwdir -t $(probe_fs_type $rwdev) -o $rorwopts
+	if test ! -d $upper -a -n "$rwfs"
+	then
+		mkdir -p $rwdir
+		mount $rwdev $rwdir -t $(probe_fs_type $rwdev) -o $rorwopts
+		mounted=$rwdir
+	fi
 
 	while read f
 	do
@@ -109,7 +114,10 @@ then
 		cp -rp $upper/$f "${d%/*}/"
 	done < $whitelist
 
-	umount $rwdir
+	if test -n "$mounted"
+	then
+		umount $mounted
+	fi
 fi
 
 for f in $image*
-- 
2.7.1
