Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3rgbs61Zy6zDqmd
 for <openbmc@lists.ozlabs.org>; Fri,  1 Jul 2016 09:50:50 +1000 (AEST)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1467330646019242.8191874401275;
 Thu, 30 Jun 2016 16:50:46 -0700 (PDT)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH openbmc 10/16] initfs: update: add --help message
Date: Thu, 30 Jun 2016 18:50:27 -0500
Message-Id: <20160630235033.17091-11-openbmc-patches@stwcx.xyz>
X-Mailer: git-send-email 2.9.0
In-Reply-To: <20160630235033.17091-1-openbmc-patches@stwcx.xyz>
References: <20160630235033.17091-1-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Thu, 30 Jun 2016 23:50:50 -0000

From: Milton Miller <miltonm@us.ibm.com>

Now that update is intended for use at runtime and not just by
the init and shutdown scripts, add a short help message listing
the options so people don't have to understand how to read shell.

Signed-off-by: Milton Miller <miltonm@us.ibm.com>
---
 .../obmc-phosphor-initfs/files/obmc-update.sh        | 20 +++++++++++++++++++-
 1 file changed, 19 insertions(+), 1 deletion(-)

diff --git a/meta-phosphor/common/recipes-phosphor/obmc-phosphor-initfs/files/obmc-update.sh b/meta-phosphor/common/recipes-phosphor/obmc-phosphor-initfs/files/obmc-update.sh
index fa46635..268c6ad 100755
--- a/meta-phosphor/common/recipes-phosphor/obmc-phosphor-initfs/files/obmc-update.sh
+++ b/meta-phosphor/common/recipes-phosphor/obmc-phosphor-initfs/files/obmc-update.sh
@@ -106,6 +106,24 @@ image=/run/initramfs/image-
 while test "$1" != "${1#-}"
 do
 	case "$1" in
+	--help)
+		cat <<HERE
+Usage: $0 [options] -- Write images in /run/initramfs to flash (/dev/mtd*)
+    --help                    Show this message
+    --no-flash                Don't attempt to write images to flash
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
@@ -138,7 +156,7 @@ do
 		toram=y
 		shift ;;
 	*)
-		echoerr "Unknown option $1"
+		echoerr "Unknown option $1.  Try $0 --help."
 		exit 1 ;;
 	esac
 done
-- 
2.9.0
