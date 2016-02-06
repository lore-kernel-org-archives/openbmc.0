Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 02FF01A0272
 for <openbmc@lists.ozlabs.org>; Sat,  6 Feb 2016 11:20:39 +1100 (AEDT)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1454718034793623.7266206702534;
 Fri, 5 Feb 2016 16:20:34 -0800 (PST)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH openbmc 5/7] obmc-initfs: run fsck on read/write file system
Date: Fri,  5 Feb 2016 18:20:27 -0600
Message-Id: <1454718029-3441-6-git-send-email-openbmc-patches@stwcx.xyz>
X-Mailer: git-send-email 2.6.4
In-Reply-To: <1454718029-3441-1-git-send-email-openbmc-patches@stwcx.xyz>
References: <1454718029-3441-1-git-send-email-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Sat, 06 Feb 2016 00:20:40 -0000

From: Milton Miller <miltonm@us.ibm.com>

Good practice is to run fsck to repair minor damage and make a
filesystem consistent before mounting it.  We don't have space
in the initramfs to add fsck, but we can mount the read-only
reference partition first and run fsck from there.

Also a test that init appears to be an executable file in the
combined target filesystem in addition to /bin/sh actually
executing and a minor consolidation of establishing the overly
directories in the read-write filesystem.

Signed-off-by: Milton Miller <miltonm@us.ibm.com>
---
 .../obmc-phosphor-initfs/files/obmc-init.sh        | 29 +++++++++++++++++++---
 1 file changed, 25 insertions(+), 4 deletions(-)

diff --git a/meta-phosphor/common/recipes-phosphor/obmc-phosphor-initfs/files/obmc-init.sh b/meta-phosphor/common/recipes-phosphor/obmc-phosphor-initfs/files/obmc-init.sh
index ec1e7f1..b7ef09f 100644
--- a/meta-phosphor/common/recipes-phosphor/obmc-phosphor-initfs/files/obmc-init.sh
+++ b/meta-phosphor/common/recipes-phosphor/obmc-phosphor-initfs/files/obmc-init.sh
@@ -75,6 +75,8 @@ roopts=ro
 rwopts=rw
 
 init=/sbin/init
+fsck=/sbin/fsck.$rwfst
+fsckopts=-a
 
 echo rofs = $rofs $rofst   rwfs = $rwfs $rwfst
 
@@ -83,6 +85,28 @@ then
 	debug_takeover "Debug initial shell requested by command line."
 fi
 
+mount $rodev $rodir -t $rofst -o $roopts
+
+if test -x $rodir$fsck
+then
+	for fs in $fslist
+	do
+		mount --bind $fs $rodir/$fs
+	done
+	chroot $rodir $fsck $fsckopts $rwdev
+	rc=$?
+	for fs in $fslist
+	do
+		umount $rodir/$fs
+	done
+	if test $rc -gt 1
+	then
+		debug_takeover "fsck of read-write fs on $rwdev failed (rc=$rc)"
+	fi
+else
+	echo "No '$fsck' in read only fs, skipping fsck."
+fi
+
 if ! mount $rwdev $rwdir -t $rwfst -o $rwopts
 then
 	msg="$(cat)" << HERE
@@ -93,11 +117,8 @@ HERE
 	debug_takeover "$msg"
 fi
 
-mount $rodir $rodir -t $rofst -o $roopts
-
 rm -rf $work
-mkdir -p $upper
-mkdir -p $work
+mkdir -p $upper $work
 
 mount -t overlay -o lowerdir=$rodir,upperdir=$upper,workdir=$work cow /root
 
-- 
2.6.4
