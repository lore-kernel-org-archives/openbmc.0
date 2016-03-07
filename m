Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id C24CF1A02E6
 for <openbmc@lists.ozlabs.org>; Tue,  8 Mar 2016 08:30:34 +1100 (AEDT)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1457386230715632.1286573518419;
 Mon, 7 Mar 2016 13:30:30 -0800 (PST)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH openbmc v2 07/34] update: Add command line parsing to clean or
 preserve saved files
Date: Mon,  7 Mar 2016 15:29:56 -0600
Message-Id: <1457386223-5725-8-git-send-email-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Mon, 07 Mar 2016 21:30:35 -0000

From: "Milton D. Miller II" <miltonm@us.ibm.com>

Because update now returns to shutdown for the final halt or
reboot system call it does not need to handle systemd arguments.
Instead update is being invoked from multiple environments, and
further environments will need alternate behaviors.

Add a code to start parsing the command line.  Start wtih a flag
to clean the saved files at the end of the update process.

This will reclaim the space and prevent stale saved files
from being restored without requiring the calling script to
know the location of the saved files directory.

Parse true and complement actions in case we decide to change
the defaults later.

For now keep the user feature of calling update, flashing some
files by hand, then a final call to update with a possibly
empty image file will have the original saved files merged
into the rwfs.

Signed-off-by: Milton Miller <miltonm@us.ibm.com>
---
 .../obmc-phosphor-initfs/files/obmc-update.sh      | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/meta-phosphor/common/recipes-phosphor/obmc-phosphor-initfs/files/obmc-update.sh b/meta-phosphor/common/recipes-phosphor/obmc-phosphor-initfs/files/obmc-update.sh
index 367c302..060073b 100755
--- a/meta-phosphor/common/recipes-phosphor/obmc-phosphor-initfs/files/obmc-update.sh
+++ b/meta-phosphor/common/recipes-phosphor/obmc-phosphor-initfs/files/obmc-update.sh
@@ -59,6 +59,23 @@ rwdir=rw
 upper=$rwdir/cow
 save=save/${upper##*/}
 
+doclean=
+
+while test "$1" != "${1#-}"
+do
+	case "$1" in
+	--no-clean-saved-files)
+		doclean=
+		shift ;;
+	--clean-saved-files)
+		doclean=y
+		shift ;;
+	*)
+		echo 2>&1 "Unknown option $1"
+		exit 1 ;;
+	esac
+done
+
 if test -n "$rwfs" && test -s whitelist
 then
 
@@ -105,6 +122,11 @@ then
 	umount $rwdir
 fi
 
+if test "x$doclean" = xy
+then
+	rm -rf $save
+fi
+
 exit
 
 # NOT REACHED without edit
-- 
2.7.1
