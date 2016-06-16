Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3rVPv50LwqzDqlj
 for <openbmc@lists.ozlabs.org>; Thu, 16 Jun 2016 10:50:40 +1000 (AEST)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1466038236193743.2248258481662;
 Wed, 15 Jun 2016 17:50:36 -0700 (PDT)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH openbmc v5 04/12] initfs: update: Don't exec sh or sulogin on
 error just exit 1
Date: Wed, 15 Jun 2016 19:50:22 -0500
Message-Id: <20160616005030.19176-5-openbmc-patches@stwcx.xyz>
X-Mailer: git-send-email 2.8.4
In-Reply-To: <20160616005030.19176-1-openbmc-patches@stwcx.xyz>
References: <20160616005030.19176-1-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Thu, 16 Jun 2016 00:50:42 -0000

From: "Milton D. Miller II" <miltonm@us.ibm.com>

When update was written it was exec'd from the shutdown script
and hence took over pid 1.  Since exiting in that environment was
a panic situation, the script instead started a rescue shell with
its output presumably on the console.

The calling convention was updated to be a simple invocation in
commit dbacf104885c ("obmc-initfs: run update as a sub-script")
but the error handling was not updated.  That error handling is
now becoming a hinderance to use from additional environments so
change it.

Signed-off-by: Milton Miller <miltonm@us.ibm.com>
---
 .../obmc-phosphor-initfs/files/obmc-update.sh      | 23 ++++++----------------
 1 file changed, 6 insertions(+), 17 deletions(-)

diff --git a/meta-phosphor/common/recipes-phosphor/obmc-phosphor-initfs/files/obmc-update.sh b/meta-phosphor/common/recipes-phosphor/obmc-phosphor-initfs/files/obmc-update.sh
index aa8fd89..f8e551c 100755
--- a/meta-phosphor/common/recipes-phosphor/obmc-phosphor-initfs/files/obmc-update.sh
+++ b/meta-phosphor/common/recipes-phosphor/obmc-phosphor-initfs/files/obmc-update.sh
@@ -2,9 +2,6 @@
 
 echo update: "$@"
 
-export PS1=update-sh#\ 
-# exec /bin/sh
-
 cd /
 if ! test -r /proc/mounts || ! test -f /proc/mounts
 then
@@ -21,12 +18,12 @@ then
 	mkdir -p /dev
 	mount -t devtmpfs dev dev
 fi
-while grep mtd /proc/mounts
-do
+
+if grep mtd /proc/mounts
+then
 	echo 1>&2 "Error: A mtd device is mounted."
-	sulogin
-	# exec /bin/sh
-done
+	exit 1
+fi
 
 findmtd() {
 	m=$(grep -xl "$1" /sys/class/mtd/*/name)
@@ -130,7 +127,7 @@ do
 	if test -z "$m"
 	then
 		echo 1>&2  "Unable to find mtd partiton for ${f##*/}."
-		exec /bin/sh
+		exit 1
 	fi
 done
 
@@ -173,11 +170,3 @@ then
 fi
 
 exit
-
-# NOT REACHED without edit
-# NOT REACHED without edit
-
-echo "Flash completed.  Inspect, cleanup and reboot -f to continue."
-
-export PS1=update-sh#\ 
-exec /bin/sh
-- 
2.8.4
