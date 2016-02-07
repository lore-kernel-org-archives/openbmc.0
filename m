Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id F0A051A02C0
 for <openbmc@lists.ozlabs.org>; Sun,  7 Feb 2016 11:00:29 +1100 (AEDT)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1454803225546645.9372555939854;
 Sat, 6 Feb 2016 16:00:25 -0800 (PST)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH openbmc 4/7] obmc-initfs: factor debug and takeover
Date: Sat,  6 Feb 2016 18:00:18 -0600
Message-Id: <1454803221-12014-5-git-send-email-openbmc-patches@stwcx.xyz>
X-Mailer: git-send-email 2.6.4
In-Reply-To: <1454803221-12014-1-git-send-email-openbmc-patches@stwcx.xyz>
References: <1454803221-12014-1-git-send-email-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Sun, 07 Feb 2016 00:00:30 -0000

From: Milton Miller <miltonm@us.ibm.com>

Factor out sulogin and init takeover with a message.  This is mostly
a refactor and message update with no significant logic flow.  It
makes the repair opertunity logic consistent.

Signed-off-by: Milton Miller <miltonm@us.ibm.com>
---
 .../obmc-phosphor-initfs/files/obmc-init.sh        | 46 ++++++++++++++++------
 1 file changed, 35 insertions(+), 11 deletions(-)

diff --git a/meta-phosphor/common/recipes-phosphor/obmc-phosphor-initfs/files/obmc-init.sh b/meta-phosphor/common/recipes-phosphor/obmc-phosphor-initfs/files/obmc-init.sh
index 0109925..daa4f5c 100644
--- a/meta-phosphor/common/recipes-phosphor/obmc-phosphor-initfs/files/obmc-init.sh
+++ b/meta-phosphor/common/recipes-phosphor/obmc-phosphor-initfs/files/obmc-init.sh
@@ -30,6 +30,32 @@ findmtd() {
 	echo $m
 }
 
+debug_takeover() {
+	echo "$@"
+	test -n "$@" && echo Enter password to try to manually fix.
+	cat << HERE
+After fixing run exit to continue this script, or reboot -f to retry, or
+touch /takeover and exit to become PID 1 allowing editing of this script.
+HERE
+
+	while ! sulogin && ! test -f /takeover
+	do
+		echo getty failed, retrying
+	done
+
+	# Touch /takeover in the above getty to become pid 1
+	if test -e /takeover
+	then
+		cat << HERE
+Takeover of init requested.  Executing /bin/sh as PID 1.
+When finished exec new init or cleanup and run reboot -f.
+Warning: No job control!  Shell exit will panic the system!
+HERE
+		export PS1=init#\ 
+		exec /bin/sh
+	fi
+}
+
 env=$(findmtd u-boot-env)
 if test -n $env
 then
@@ -52,21 +78,19 @@ init=/sbin/init
 
 echo rofs = $rofs $rofst   rwfs = $rwfs $rwfst
 
-if grep -w debug-init-sh /proc/cmdline ||
-	! mount $rwdev $rwdir -t $rwfst -o $rwopts
+if grep -w debug-init-sh /proc/cmdline
 then
-	echo Please mount the rw file system on $rwdir from this shell
-	while ! sulogin && ! test -f /takeover
-	do
-		echo getty failed, retrying
-	done
+	debug_takeover "Debug initial shell requested by command line."
 fi
 
-# Touch /takeover in the above getty to become pid 1
-if test -e /takeover
+if ! mount $rwdev $rwdir -t $rwfst -o $rwopts
 then
-	export PS1=init#\ 
-	exec /bin/sh
+	msg="$(cat)" << HERE
+Mounting read-write $rwdev filesystem failed.  Please fix and run
+	mount $rwdev $rwdir -t $rwfs -o $rwopts
+to to continue, or do change nothing to run from RAM for this boot.
+HERE
+	debug_takeover "$msg"
 fi
 
 mount $rodev $rodir -t $rofst -o $roopts
-- 
2.6.4
