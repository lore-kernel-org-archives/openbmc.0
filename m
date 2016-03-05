Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 2ADF81A0B4C
 for <openbmc@lists.ozlabs.org>; Sat,  5 Mar 2016 23:30:51 +1100 (AEDT)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 145718104666410.743009215533675;
 Sat, 5 Mar 2016 04:30:46 -0800 (PST)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH openbmc 28/32] init: Add option to copy files into memory
Date: Sat,  5 Mar 2016 06:30:19 -0600
Message-Id: <1457181023-23569-29-git-send-email-openbmc-patches@stwcx.xyz>
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

Add an option to copy files from the rwfs to ram then run in ram.

This allows customizations like user ids and network settings to
be initialized from the read-write filesystem.

Signed-off-by: Milton Miller <miltonm@us.ibm.com>
---
 .../obmc-phosphor-initfs/files/obmc-init.sh               | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/meta-phosphor/common/recipes-phosphor/obmc-phosphor-initfs/files/obmc-init.sh b/meta-phosphor/common/recipes-phosphor/obmc-phosphor-initfs/files/obmc-init.sh
index 7f82d9b..ecf3377 100644
--- a/meta-phosphor/common/recipes-phosphor/obmc-phosphor-initfs/files/obmc-init.sh
+++ b/meta-phosphor/common/recipes-phosphor/obmc-phosphor-initfs/files/obmc-init.sh
@@ -169,6 +169,21 @@ then
 	rwfst=none
 fi
 
+copyfiles=
+if grep -w copy-files-to-ram $optfile
+then
+	rwfst=none
+	copyfiles=y
+fi
+
+# It would be nice to do this after fsck but that mean rofs is mounted
+# which triggers the mtd is mounted check
+if test "$rwfst$copyfiles" = noney
+then
+	touch $trigger
+	$update --copy-files --clean-saved-files --no-restore-files
+fi
+
 if grep -w copy-base-filesystem-to-ram $optfile &&
 	test ! -e /run/image-rofs && ! cp $rodev /run/image-rofs 
 then
-- 
2.7.1
