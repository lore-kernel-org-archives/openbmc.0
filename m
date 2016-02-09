Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 24FDC1A0394
 for <openbmc@lists.ozlabs.org>; Wed, 10 Feb 2016 05:00:40 +1100 (AEDT)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1455040835912105.33008033424392;
 Tue, 9 Feb 2016 10:00:35 -0800 (PST)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH openbmc 6/9] obmc-initfs: factor debug and takeover
Date: Tue,  9 Feb 2016 12:00:19 -0600
Message-Id: <1455040822-14038-7-git-send-email-openbmc-patches@stwcx.xyz>
X-Mailer: git-send-email 2.6.4
In-Reply-To: <1455040822-14038-1-git-send-email-openbmc-patches@stwcx.xyz>
References: <1455040822-14038-1-git-send-email-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Tue, 09 Feb 2016 18:00:41 -0000

From: Milton Miller <miltonm@us.ibm.com>

Factor out sulogin and init takeover with a message.  This is
mostly a refactor and message update.   It also makes the repair
opportunity logic consistent in asking for a password during init
and looping over the chroot verification.

Signed-off-by: Milton Miller <miltonm@us.ibm.com>
---
 .../obmc-phosphor-initfs/files/obmc-init.sh        | 66 ++++++++++++++++------
 1 file changed, 49 insertions(+), 17 deletions(-)

diff --git a/meta-phosphor/common/recipes-phosphor/obmc-phosphor-initfs/files/obmc-init.sh b/meta-phosphor/common/recipes-phosphor/obmc-phosphor-initfs/files/obmc-init.sh
index bc7138c..4c2a98a 100644
--- a/meta-phosphor/common/recipes-phosphor/obmc-phosphor-initfs/files/obmc-init.sh
+++ b/meta-phosphor/common/recipes-phosphor/obmc-phosphor-initfs/files/obmc-init.sh
@@ -30,6 +30,34 @@ findmtd() {
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
+
+Takeover of init requested.  Executing /bin/sh as PID 1.
+When finished exec new init or cleanup and run reboot -f.
+
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
@@ -52,21 +80,20 @@ init=/sbin/init
 
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
+
+Mounting read-write $rwdev filesystem failed.  Please fix and run
+	mount $rwdev $rwdir -t $rwfs -o $rwopts
+to to continue, or do change nothing to run from RAM for this boot.
+HERE
+	debug_takeover "$msg"
 fi
 
 mount $rodev $rodir -t $rofst -o $roopts
@@ -77,12 +104,17 @@ mkdir -p $work
 
 mount -t overlay -o lowerdir=$rodir,upperdir=$upper,workdir=$work cow /root
 
-if ! chroot /root /bin/sh -c "test -x '$init' -a -s '$init'"
-then
-	echo "Unable to confirm /sbin/init is an executable non-empty file."
-	echo "Change Root test failed!  Invoking emergency shell."
-	PS1=rescue#\  sulogin
-fi
+while ! chroot /root /bin/sh -c "test -x '$init' -a -s '$init'"
+do
+	msg="$(cat)" << HERE
+
+Unable to confirm /sbin/init is an executable non-empty file
+in merged file system mounted at /root.
+
+Change Root test failed!  Invoking emergency shell.
+HERE
+	debug_takeover "$msg"
+done
 
 for f in $fslist
 do
-- 
2.6.4
