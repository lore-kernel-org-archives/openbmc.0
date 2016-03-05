Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id CD1791A036D
 for <openbmc@lists.ozlabs.org>; Sat,  5 Mar 2016 23:32:50 +1100 (AEDT)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1457181042701366.22706415634775;
 Sat, 5 Mar 2016 04:30:42 -0800 (PST)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH openbmc 23/32] init: Always move images from root
Date: Sat,  5 Mar 2016 06:30:14 -0600
Message-Id: <1457181023-23569-24-git-send-email-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Sat, 05 Mar 2016 12:32:51 -0000

From: "Milton D. Miller II" <miltonm@us.ibm.com>

If images are to be updated before init continue to move them
to /run/initramfs.  However, if they are not to be flashed before
init instead move them to /run.

This will result in the image-rofs being loop mounted for this run,
and all images will be available at runtime for flash update at
runtime.

Signed-off-by: Milton Miller <miltonm@us.ibm.com>
---
 .../obmc-phosphor-initfs/files/obmc-init.sh               | 15 ++++++++++-----
 1 file changed, 10 insertions(+), 5 deletions(-)

diff --git a/meta-phosphor/common/recipes-phosphor/obmc-phosphor-initfs/files/obmc-init.sh b/meta-phosphor/common/recipes-phosphor/obmc-phosphor-initfs/files/obmc-init.sh
index 89e4538..7953176 100644
--- a/meta-phosphor/common/recipes-phosphor/obmc-phosphor-initfs/files/obmc-init.sh
+++ b/meta-phosphor/common/recipes-phosphor/obmc-phosphor-initfs/files/obmc-init.sh
@@ -115,13 +115,18 @@ then
 	debug_takeover "Debug initial shell requested by command line."
 fi
 
-# If there are images in root move them to run/initramfs/ now.
+# If there are images in root move them to /run/initramfs/ or /run/ now.
 imagebasename=${image##*/}
-if test -n "${imagebasename}" -a "x$flash_images_before_init" = xy &&
-	ls /${imagebasename}* > /dev/null 2>&1
+if test -n "${imagebasename}" && ls /${imagebasename}* > /dev/null 2>&1
 then
-	echo "Pending flash updates found."
-	mv /${imagebasename}* ${image%$imagebasename}
+	if test "x$flash_images_before_init" = xy
+	then
+		echo "Flash images found, will update before starting init."
+		mv /${imagebasename}* ${image%$imagebasename}
+	else
+		echo "Flash images found, will use but deferring flash update."
+		mv /${imagebasename}* /run/
+	fi
 fi
 
 if grep -w clean-rwfs-filesystem $optfile
-- 
2.7.1
