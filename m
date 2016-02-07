Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3CA581A02CE
 for <openbmc@lists.ozlabs.org>; Sun,  7 Feb 2016 11:00:31 +1100 (AEDT)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1454803227148290.76828244503497;
 Sat, 6 Feb 2016 16:00:27 -0800 (PST)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH openbmc 6/7] obmc-initfs: run update as a sub-script
Date: Sat,  6 Feb 2016 18:00:20 -0600
Message-Id: <1454803221-12014-7-git-send-email-openbmc-patches@stwcx.xyz>
X-Mailer: git-send-email 2.6.4
In-Reply-To: <1454803221-12014-1-git-send-email-openbmc-patches@stwcx.xyz>
References: <1454803221-12014-1-git-send-email-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Sun, 07 Feb 2016 00:00:31 -0000

From: Milton Miller <miltonm@us.ibm.com>

The update script has replicated logic to do the final reboot, kexec,
halt, or poweroff command.  Instead of transferring control via exec
just call it as a normal command, and return to shutdown for the
final mounted fs debug print and command.

Signed-off-by: Milton Miller <miltonm@us.ibm.com>
---
 .../obmc-phosphor-initfs/files/obmc-shutdown.sh           |  3 +--
 .../obmc-phosphor-initfs/files/obmc-update.sh             | 15 ++++-----------
 2 files changed, 5 insertions(+), 13 deletions(-)

diff --git a/meta-phosphor/common/recipes-phosphor/obmc-phosphor-initfs/files/obmc-shutdown.sh b/meta-phosphor/common/recipes-phosphor/obmc-phosphor-initfs/files/obmc-shutdown.sh
index d530265..7d1157a 100644
--- a/meta-phosphor/common/recipes-phosphor/obmc-phosphor-initfs/files/obmc-shutdown.sh
+++ b/meta-phosphor/common/recipes-phosphor/obmc-phosphor-initfs/files/obmc-shutdown.sh
@@ -34,7 +34,7 @@ fi
 
 if test -x /update && ls $image* > /dev/null 2>&1
 then
-	exec /update ${1+"$@"}
+	/update ${1+"$@"}
 fi
 
 echo Remaining mounts:
@@ -43,7 +43,6 @@ cat /proc/mounts
 test "umount_proc" && umount /proc && rmdir /proc
 
 
-
 # Execute the command systemd told us to ...
 if test -d /oldroot  && test "$1"
 then
diff --git a/meta-phosphor/common/recipes-phosphor/obmc-phosphor-initfs/files/obmc-update.sh b/meta-phosphor/common/recipes-phosphor/obmc-phosphor-initfs/files/obmc-update.sh
index ec4a769..3cf6bc3 100755
--- a/meta-phosphor/common/recipes-phosphor/obmc-phosphor-initfs/files/obmc-update.sh
+++ b/meta-phosphor/common/recipes-phosphor/obmc-phosphor-initfs/files/obmc-update.sh
@@ -92,19 +92,12 @@ then
 	umount $rwdir
 fi
 
-# Execute the command systemd told us to ...
-if test -d /oldroot && test -x "/sbin/$1" && test -f "/sbin/$1"
-then
-	if test "$1" == kexec
-	then
-		/sbin/$1 -f -e
-	else
-		/sbin/$1 -f
-	fi
-fi
+exit
 
+# NOT REACHED without edit
+# NOT REACHED without edit
 
-echo "Execute ${1-reboot} -f if all is ok"
+echo "Flash completed.  Inspect, cleanup and reboot -f to continue."
 
 export PS1=update-sh#\ 
 exec /bin/sh
-- 
2.6.4
