Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id ED6351A06C2
 for <openbmc@lists.ozlabs.org>; Sat,  5 Mar 2016 23:30:50 +1100 (AEDT)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1457181045899492.00179265924874;
 Sat, 5 Mar 2016 04:30:45 -0800 (PST)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH openbmc 27/32] init: Call update from initramfs directory
Date: Sat,  5 Mar 2016 06:30:18 -0600
Message-Id: <1457181023-23569-28-git-send-email-openbmc-patches@stwcx.xyz>
X-Mailer: git-send-email 2.7.1
In-Reply-To: <1457181023-23569-1-git-send-email-openbmc-patches@stwcx.xyz>
References: <1457181023-23569-1-git-send-email-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Sat, 05 Mar 2016 12:30:51 -0000

From: "Milton D. Miller II" <miltonm@us.ibm.com>

Use the copy in /run/initramfs/update to call update to be consistent
with other uses.

Signed-off-by: Milton Miller <miltonm@us.ibm.com>
---
 .../recipes-phosphor/obmc-phosphor-initfs/files/obmc-init.sh  | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/meta-phosphor/common/recipes-phosphor/obmc-phosphor-initfs/files/obmc-init.sh b/meta-phosphor/common/recipes-phosphor/obmc-phosphor-initfs/files/obmc-init.sh
index 725c19c..7f82d9b 100644
--- a/meta-phosphor/common/recipes-phosphor/obmc-phosphor-initfs/files/obmc-init.sh
+++ b/meta-phosphor/common/recipes-phosphor/obmc-phosphor-initfs/files/obmc-init.sh
@@ -102,6 +102,7 @@ fsckbase=/sbin/fsck.
 fsck=$fsckbase$rwfst
 fsckopts=-a
 optfile=/run/initramfs/init-options
+update=/run/initramfs/update
 
 if test ! -f $optfile
 then
@@ -143,20 +144,20 @@ fi
 
 if ls $image* > /dev/null 2>&1
 then
-	if ! test -x /update
+	if ! test -x $update
 	then
-		debug_takeover "Flash update requested but /update missing!"
+		debug_takeover "Flash update requested but $update missing!"
 	elif test -f $trigger -a ! -s $trigger
 	then
 		echo "Saving selected files from read-write overlay filesystem."
-		/update --no-restore-files
+		$update --no-restore-files
 		echo "Clearing read-write overlay filesystem."
 		flash_eraseall /dev/$rwfs
 		echo "Restoring saved files to read-write overlay filesystem."
 		touch $trigger
-		/update --no-save-files --clean-saved-files
+		$update --no-save-files --clean-saved-files
 	else
-		/update --clean-saved-files
+		$update --clean-saved-files
 	fi
 
 	rwfst=$(probe_fs_type $rwdev)
-- 
2.7.1
