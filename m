Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id D33C71A0342
 for <openbmc@lists.ozlabs.org>; Tue,  8 Mar 2016 08:30:35 +1100 (AEDT)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 145738623165932.195098298435596;
 Mon, 7 Mar 2016 13:30:31 -0800 (PST)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH openbmc v2 08/34] update: Add options to skip the save and
 restore phases
Date: Mon,  7 Mar 2016 15:29:57 -0600
Message-Id: <1457386223-5725-9-git-send-email-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Mon, 07 Mar 2016 21:30:36 -0000

From: "Milton D. Miller II" <miltonm@us.ibm.com>

Allow the save and/or restore of whitelisted files to be
suppressed.

This reduces the noise and possible problems trying to mount the
read-write filesystem read-write when its dirty.  The filesystem
may be cleaned or repaired between the backup and restore.

Signed-off-by: Milton Miller <miltonm@us.ibm.com>
---
 .../obmc-phosphor-initfs/files/obmc-update.sh         | 19 ++++++++++++++++---
 1 file changed, 16 insertions(+), 3 deletions(-)

diff --git a/meta-phosphor/common/recipes-phosphor/obmc-phosphor-initfs/files/obmc-update.sh b/meta-phosphor/common/recipes-phosphor/obmc-phosphor-initfs/files/obmc-update.sh
index 060073b..dff23d5 100755
--- a/meta-phosphor/common/recipes-phosphor/obmc-phosphor-initfs/files/obmc-update.sh
+++ b/meta-phosphor/common/recipes-phosphor/obmc-phosphor-initfs/files/obmc-update.sh
@@ -60,6 +60,8 @@ upper=$rwdir/cow
 save=save/${upper##*/}
 
 doclean=
+dosave=y
+dorestore=y
 
 while test "$1" != "${1#-}"
 do
@@ -70,15 +72,26 @@ do
 	--clean-saved-files)
 		doclean=y
 		shift ;;
+	--no-save-files)
+		dosave=
+		shift ;;
+	--save-files)
+		dosave=y
+		shift ;;
+	--no-restore-files)
+		dorestore=
+		shift ;;
+	--restore-files)
+		dorestore=y
+		shift ;;
 	*)
 		echo 2>&1 "Unknown option $1"
 		exit 1 ;;
 	esac
 done
 
-if test -n "$rwfs" && test -s whitelist
+if test "x$dosave" = xy -a -n "$rwfs" -a -s whitelist
 then
-
 	mkdir -p $rwdir
 	mount $rwdev $rwdir -t $(probe_fs_type $rwdev) -o $rorwopts
 
@@ -115,7 +128,7 @@ do
 	flashcp -v $f /dev/$m
 done
 
-if test -d $save
+if test -d $save -a "x$dorestore" = xy
 then
 	mount $rwdev $rwdir -t $(probe_fs_type $rwdev) -o $rwopts
 	cp -rp $save/. $upper/
-- 
2.7.1
