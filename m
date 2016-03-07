Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 28BCF1A02EE
 for <openbmc@lists.ozlabs.org>; Tue,  8 Mar 2016 08:30:49 +1100 (AEDT)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1457386239792377.72391933576796;
 Mon, 7 Mar 2016 13:30:39 -0800 (PST)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH openbmc v2 18/34] update: Skip calling flashcp for empty files
Date: Mon,  7 Mar 2016 15:30:07 -0600
Message-Id: <1457386223-5725-19-git-send-email-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Mon, 07 Mar 2016 21:30:50 -0000

From: "Milton D. Miller II" <miltonm@us.ibm.com>

Note explicitly when an empty image is provided that will not
alter a flash partition.

While using flashcp on an empty file succeeds and does not alter
the flash, it may be confusing to see 0/0 messages for the erase,
write, and verify phases.

These empty files are used to trigger the save and restore phases
and may also be used by developers to cause the update to fail
and break into a shell at shutdown for maintence.

Signed-off-by: Milton Miller <miltonm@us.ibm.com>
---
 .../recipes-phosphor/obmc-phosphor-initfs/files/obmc-update.sh      | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/meta-phosphor/common/recipes-phosphor/obmc-phosphor-initfs/files/obmc-update.sh b/meta-phosphor/common/recipes-phosphor/obmc-phosphor-initfs/files/obmc-update.sh
index edaf195..aa8fd89 100755
--- a/meta-phosphor/common/recipes-phosphor/obmc-phosphor-initfs/files/obmc-update.sh
+++ b/meta-phosphor/common/recipes-phosphor/obmc-phosphor-initfs/files/obmc-update.sh
@@ -136,6 +136,12 @@ done
 
 for f in $image*
 do
+	if test ! -s $f
+	then
+		echo "Skipping empty update of ${f#$image}."
+		rm $f
+		continue
+	fi
 	m=$(findmtd ${f#$image})
 	echo "Updating ${f#$image}..."
 	flashcp -v $f /dev/$m && rm $f
-- 
2.7.1
