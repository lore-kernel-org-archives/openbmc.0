Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id A8CF61A0367
 for <openbmc@lists.ozlabs.org>; Tue,  8 Mar 2016 08:30:42 +1100 (AEDT)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1457386239005435.4142433524306;
 Mon, 7 Mar 2016 13:30:39 -0800 (PST)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH openbmc v2 17/34] update: Remove images as they are
 successfully flashed
Date: Mon,  7 Mar 2016 15:30:06 -0600
Message-Id: <1457386223-5725-18-git-send-email-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Mon, 07 Mar 2016 21:30:43 -0000

From: "Milton D. Miller II" <miltonm@us.ibm.com>

Remove image files as they are flashed so a repeated call to
update does not erase and write the image again.

As we add the ability to call update at runtime repeated calls
are expected.  This both signals successful copy and removes the
need for callers to cleanup.

Also remove commented alternate flash method using eraseall
that was not tested.

Signed-off-by: Milton Miller <miltonm@us.ibm.com>
---
 .../common/recipes-phosphor/obmc-phosphor-initfs/files/obmc-update.sh  | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/meta-phosphor/common/recipes-phosphor/obmc-phosphor-initfs/files/obmc-update.sh b/meta-phosphor/common/recipes-phosphor/obmc-phosphor-initfs/files/obmc-update.sh
index 6b0d7a0..edaf195 100755
--- a/meta-phosphor/common/recipes-phosphor/obmc-phosphor-initfs/files/obmc-update.sh
+++ b/meta-phosphor/common/recipes-phosphor/obmc-phosphor-initfs/files/obmc-update.sh
@@ -138,8 +138,7 @@ for f in $image*
 do
 	m=$(findmtd ${f#$image})
 	echo "Updating ${f#$image}..."
-	# flasheraseall /dev/$m && dd if=$f of=/dev/$m
-	flashcp -v $f /dev/$m
+	flashcp -v $f /dev/$m && rm $f
 done
 
 if test "x$toram" = xy
-- 
2.7.1
