Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id D00A11A0311
 for <openbmc@lists.ozlabs.org>; Sat,  5 Mar 2016 23:30:49 +1100 (AEDT)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1457181041934540.8393118944498;
 Sat, 5 Mar 2016 04:30:41 -0800 (PST)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH openbmc 22/32] init: Run from RAM if file system type is
 specified as none
Date: Sat,  5 Mar 2016 06:30:13 -0600
Message-Id: <1457181023-23569-23-git-send-email-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Sat, 05 Mar 2016 12:30:50 -0000

From: "Milton D. Miller II" <miltonm@us.ibm.com>

Allow file system type none for rwfst, which means do not mount a
separate file system but just use the directory in the tmpfs /run.

This will be used to allow the flash controller to not be used by
the running image, allowing flash updates while the BMC is running
the main application.

It could also be used for a file system less prone to corruption
where the read-write overlay is only updated with whitelisted files
at specific points in time with updates to the update script.

Signed-off-by: Milton Miller <miltonm@us.ibm.com>
---
 .../recipes-phosphor/obmc-phosphor-initfs/files/obmc-init.sh      | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/meta-phosphor/common/recipes-phosphor/obmc-phosphor-initfs/files/obmc-init.sh b/meta-phosphor/common/recipes-phosphor/obmc-phosphor-initfs/files/obmc-init.sh
index d4d2cc1..89e4538 100644
--- a/meta-phosphor/common/recipes-phosphor/obmc-phosphor-initfs/files/obmc-init.sh
+++ b/meta-phosphor/common/recipes-phosphor/obmc-phosphor-initfs/files/obmc-init.sh
@@ -183,12 +183,16 @@ then
 	then
 		debug_takeover "fsck of read-write fs on $rwdev failed (rc=$rc)"
 	fi
-elif test "$rwfst" != jffs2
+elif test "$rwfst" != jffs2 -a "$rwfst" != none
 then
 	echo "No '$fsck' in read only fs, skipping fsck."
 fi
 
-if ! mount $rwdev $rwdir -t $rwfst -o $rwopts
+if test "$rwfst" = none
+then
+	echo "Running with read-write overlay in RAM for this boot."
+	echo "No state will be preserved unless flash update performed."
+elif ! mount $rwdev $rwdir -t $rwfst -o $rwopts
 then
 	msg="$(cat)" << HERE
 
-- 
2.7.1
