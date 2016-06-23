Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3rZj7C48NRzDql4
 for <openbmc@lists.ozlabs.org>; Thu, 23 Jun 2016 10:31:03 +1000 (AEST)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1466641858820989.1759958554322;
 Wed, 22 Jun 2016 17:30:58 -0700 (PDT)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH openbmc v6 16/18] initfs: update: handle no images to update
Date: Wed, 22 Jun 2016 19:30:36 -0500
Message-Id: <20160623003038.2361-17-openbmc-patches@stwcx.xyz>
X-Mailer: git-send-email 2.9.0
In-Reply-To: <20160623003038.2361-1-openbmc-patches@stwcx.xyz>
References: <20160623003038.2361-1-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Thu, 23 Jun 2016 00:31:04 -0000

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
index 1dbf65f..7120a18 100755
--- a/meta-phosphor/common/recipes-phosphor/obmc-phosphor-initfs/files/obmc-update.sh
+++ b/meta-phosphor/common/recipes-phosphor/obmc-phosphor-initfs/files/obmc-update.sh
@@ -99,6 +99,7 @@ checkmount=y
 whitelist=/run/initramfs/whitelist
 image=/run/initramfs/image-
 E="ERROR:"
+imglist=
 
 while test "$1" != "${1#-}"
 do
@@ -184,7 +185,15 @@ then
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
@@ -209,7 +218,7 @@ done
 
 if test -n "$doflash"
 then
-	for f in $image*
+	for f in $imglist
 	do
 		if test ! -s $f
 		then
-- 
2.9.0
