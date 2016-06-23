Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3rZj781QRkzDqhV
 for <openbmc@lists.ozlabs.org>; Thu, 23 Jun 2016 10:30:59 +1000 (AEST)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1466641855901101.75519422927698;
 Wed, 22 Jun 2016 17:30:55 -0700 (PDT)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH openbmc v6 13/18] initfs: update: add --help message
Date: Wed, 22 Jun 2016 19:30:33 -0500
Message-Id: <20160623003038.2361-14-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Thu, 23 Jun 2016 00:31:01 -0000

From: Milton Miller <miltonm@us.ibm.com>

Now that update is intended for use at runtime and not just by
the init and shutdown scripts, add a short help message listing
the options so people don't have to understand how to read shell.

Signed-off-by: Milton Miller <miltonm@us.ibm.com>
---
 .../obmc-phosphor-initfs/files/obmc-update.sh        | 20 +++++++++++++++++++-
 1 file changed, 19 insertions(+), 1 deletion(-)

diff --git a/meta-phosphor/common/recipes-phosphor/obmc-phosphor-initfs/files/obmc-update.sh b/meta-phosphor/common/recipes-phosphor/obmc-phosphor-initfs/files/obmc-update.sh
index 06e0e74..1dbf65f 100755
--- a/meta-phosphor/common/recipes-phosphor/obmc-phosphor-initfs/files/obmc-update.sh
+++ b/meta-phosphor/common/recipes-phosphor/obmc-phosphor-initfs/files/obmc-update.sh
@@ -103,6 +103,24 @@ E="ERROR:"
 while test "$1" != "${1#-}"
 do
 	case "$1" in
+	--help)
+		cat <<HERE
+Usage: $0 [options] -- Write images in /run/initramfs to flash (/dev/mtd*)
+    --help                    Show this message
+    --no-flash	              Don't attempt to write images to flash
+    --ignore-size             Don't compare image size to mtd device size
+    --ignore-mount            Don't check if destination is mounted
+    --save-files              Copy whitelisted files to save directory in RAM
+    --no-save-files           Don't copy whitelisted files to save directory
+    --copy-files              Copy files from save directory to rwfs mountpoint
+    --restore-files           Restore files from save directory to rwfs layer
+    --no-restore-files        Don't restore saved files from ram to rwfs layer
+    --clean-saved-files       Delete saved whitelisted files from RAM
+    --no-clean-saved-files    Retain saved whitelisted files in RAM
+HERE
+
+	    exit 0 ;;
+
 	--no-clean-saved-files)
 		doclean=
 		shift ;;
@@ -135,7 +153,7 @@ do
 		toram=y
 		shift ;;
 	*)
-		echo 1>&2 "$E Unknown option $1"
+		echo 1>&2 "$E Unknown option $1.  Try $0 --help."
 		exit 1 ;;
 	esac
 done
-- 
2.9.0
