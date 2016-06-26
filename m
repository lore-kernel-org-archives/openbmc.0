Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3rcYQh2QnWzDqmF
 for <openbmc@lists.ozlabs.org>; Sun, 26 Jun 2016 10:50:52 +1000 (AEST)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 146690224733573.7855676867382;
 Sat, 25 Jun 2016 17:50:47 -0700 (PDT)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH openbmc v7 13/15] initfs: update: handle no images to update
Date: Sat, 25 Jun 2016 19:50:31 -0500
Message-Id: <20160626005033.21336-14-openbmc-patches@stwcx.xyz>
X-Mailer: git-send-email 2.9.0
In-Reply-To: <20160626005033.21336-1-openbmc-patches@stwcx.xyz>
References: <20160626005033.21336-1-openbmc-patches@stwcx.xyz>
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.22
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Sun, 26 Jun 2016 00:50:53 -0000

From: Milton Miller <miltonm@us.ibm.com>

Notify the user if image wildcard expansion fails instead of printing
message about failing to find partition to flash.

The update script errors with the message that it can't figure out what
partition to flash for /run/initramfs/image-* if there are no images
pending.

Signed-off-by: Milton Miller <miltonm@us.ibm.com>
---
 .../obmc-phosphor-initfs/files/obmc-update.sh               | 13 +++++++++++--
 1 file changed, 11 insertions(+), 2 deletions(-)

diff --git a/meta-phosphor/common/recipes-phosphor/obmc-phosphor-initfs/files/obmc-update.sh b/meta-phosphor/common/recipes-phosphor/obmc-phosphor-initfs/files/obmc-update.sh
index 268c6ad..97d4402 100755
--- a/meta-phosphor/common/recipes-phosphor/obmc-phosphor-initfs/files/obmc-update.sh
+++ b/meta-phosphor/common/recipes-phosphor/obmc-phosphor-initfs/files/obmc-update.sh
@@ -102,6 +102,7 @@ checkmount=y
 
 whitelist=/run/initramfs/whitelist
 image=/run/initramfs/image-
+imglist=
 
 while test "$1" != "${1#-}"
 do
@@ -187,7 +188,15 @@ then
 	fi
 fi
 
-for f in $image*
+imglist=$(echo $image*)
+if test "$imglist" = "$image*" -a ! -e "$imglist"
+then
+	# shell didn't expand the wildcard, so no files exist
+	echo "No images found to update."
+	imglist=
+fi
+
+for f in $imglist
 do
 	m=$(findmtd ${f#$image})
 	if test -z "$m"
@@ -212,7 +221,7 @@ done
 
 if test -n "$doflash"
 then
-	for f in $image*
+	for f in $imglist
 	do
 		if test ! -s $f
 		then
-- 
2.9.0
