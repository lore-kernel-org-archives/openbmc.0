Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id A0B631A0341
 for <openbmc@lists.ozlabs.org>; Sat,  5 Mar 2016 23:30:52 +1100 (AEDT)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1457181045053330.9823679777919;
 Sat, 5 Mar 2016 04:30:45 -0800 (PST)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH openbmc 26/32] init: Be explicit about saving and restoring
 files.
Date: Sat,  5 Mar 2016 06:30:17 -0600
Message-Id: <1457181023-23569-27-git-send-email-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Sat, 05 Mar 2016 12:30:53 -0000

From: "Milton D. Miller II" <miltonm@us.ibm.com>

When calling update for save and restore phases be explicitly tell
update to clean saved files when we are done and not bother trying
to save or restore when we know we will do a split save, erase, and
restore sequence.

Signed-off-by: Milton Miller <miltonm@us.ibm.com>
---
 .../recipes-phosphor/obmc-phosphor-initfs/files/obmc-init.sh       | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/meta-phosphor/common/recipes-phosphor/obmc-phosphor-initfs/files/obmc-init.sh b/meta-phosphor/common/recipes-phosphor/obmc-phosphor-initfs/files/obmc-init.sh
index 82cc77e..725c19c 100644
--- a/meta-phosphor/common/recipes-phosphor/obmc-phosphor-initfs/files/obmc-init.sh
+++ b/meta-phosphor/common/recipes-phosphor/obmc-phosphor-initfs/files/obmc-init.sh
@@ -149,15 +149,14 @@ then
 	elif test -f $trigger -a ! -s $trigger
 	then
 		echo "Saving selected files from read-write overlay filesystem."
-		/update && rm -f $image*
+		/update --no-restore-files
 		echo "Clearing read-write overlay filesystem."
 		flash_eraseall /dev/$rwfs
 		echo "Restoring saved files to read-write overlay filesystem."
 		touch $trigger
-		/update 
-		rm -rf /save $trigger
+		/update --no-save-files --clean-saved-files
 	else
-		/update && rm -f $image*
+		/update --clean-saved-files
 	fi
 
 	rwfst=$(probe_fs_type $rwdev)
-- 
2.7.1
