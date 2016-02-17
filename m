Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 9D3791A03E9
 for <openbmc@lists.ozlabs.org>; Thu, 18 Feb 2016 09:10:30 +1100 (AEDT)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1455747026379956.3227714141127;
 Wed, 17 Feb 2016 14:10:26 -0800 (PST)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH openbmc v2 1/3] update: look for whitelist in directory with
 images
Date: Wed, 17 Feb 2016 16:10:22 -0600
Message-Id: <1455747024-5936-2-git-send-email-openbmc-patches@stwcx.xyz>
X-Mailer: git-send-email 2.7.1
In-Reply-To: <1455747024-5936-1-git-send-email-openbmc-patches@stwcx.xyz>
References: <1455747024-5936-1-git-send-email-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Wed, 17 Feb 2016 22:10:31 -0000

From: "Milton D. Miller II" <miltonm@us.ibm.com>

Like the images, the whitelist should be found under /run/initramfs/.

Use variable whitelist to hold this path.

Signed-off-by: Milton Miller <miltonm@us.ibm.com>
---
 .../recipes-phosphor/obmc-phosphor-initfs/files/obmc-update.sh       | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/meta-phosphor/common/recipes-phosphor/obmc-phosphor-initfs/files/obmc-update.sh b/meta-phosphor/common/recipes-phosphor/obmc-phosphor-initfs/files/obmc-update.sh
index face06d..70188ad 100755
--- a/meta-phosphor/common/recipes-phosphor/obmc-phosphor-initfs/files/obmc-update.sh
+++ b/meta-phosphor/common/recipes-phosphor/obmc-phosphor-initfs/files/obmc-update.sh
@@ -45,8 +45,9 @@ rorwopts=ro${rwopts#rw}
 rwdir=rw
 upper=$rwdir/cow
 save=save/${upper##*/}
+whitelist=/run/initramfs/whitelist
 
-if test -n "$rwfs" && test -s whitelist
+if test -n "$rwfs" && test -s $whitelist
 then
 
 	mkdir -p $rwdir
@@ -61,7 +62,7 @@ then
 		d="$save/$f"
 		mkdir -p "${d%/*}"
 		cp -rp $upper/$f "${d%/*}/"
-	done < whitelist
+	done < $whitelist
 
 	umount $rwdir
 fi
-- 
2.7.1
