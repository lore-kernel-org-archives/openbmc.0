Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 76F741A0341
 for <openbmc@lists.ozlabs.org>; Tue,  8 Mar 2016 08:30:42 +1100 (AEDT)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1457386238246483.31712064347437;
 Mon, 7 Mar 2016 13:30:38 -0800 (PST)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH openbmc v2 16/34] update: Add option to copy files to runtime
 cow directory
Date: Mon,  7 Mar 2016 15:30:05 -0600
Message-Id: <1457386223-5725-17-git-send-email-openbmc-patches@stwcx.xyz>
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

Add an option to copy files to the runtime copy-on-write upper
directory from the saved directory to allow init to request the
files for use without knowing the saved files directory.

This will be used to initialize the cow directory from the
persistent rwfs file system when choosing to run in RAM.

Signed-off-by: Milton Miller <miltonm@us.ibm.com>
---
 .../recipes-phosphor/obmc-phosphor-initfs/files/obmc-update.sh | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/meta-phosphor/common/recipes-phosphor/obmc-phosphor-initfs/files/obmc-update.sh b/meta-phosphor/common/recipes-phosphor/obmc-phosphor-initfs/files/obmc-update.sh
index 6f26550..6b0d7a0 100755
--- a/meta-phosphor/common/recipes-phosphor/obmc-phosphor-initfs/files/obmc-update.sh
+++ b/meta-phosphor/common/recipes-phosphor/obmc-phosphor-initfs/files/obmc-update.sh
@@ -63,6 +63,7 @@ mounted=
 doclean=
 dosave=y
 dorestore=y
+toram=
 
 whitelist=/run/initramfs/whitelist
 image=/run/initramfs/image-
@@ -88,6 +89,9 @@ do
 	--restore-files)
 		dorestore=y
 		shift ;;
+	--copy-files)
+		toram=y
+		shift ;;
 	*)
 		echo 2>&1 "Unknown option $1"
 		exit 1 ;;
@@ -138,6 +142,12 @@ do
 	flashcp -v $f /dev/$m
 done
 
+if test "x$toram" = xy
+then
+	mkdir -p $upper
+	cp -rp $save/. $upper/
+fi
+
 if test -d $save -a "x$dorestore" = xy
 then
 	odir=$rwdir
-- 
2.7.1
