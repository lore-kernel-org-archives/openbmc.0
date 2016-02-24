Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 983E91A04FA
 for <openbmc@lists.ozlabs.org>; Thu, 25 Feb 2016 05:40:43 +1100 (AEDT)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 14563392373741002.2296821935935;
 Wed, 24 Feb 2016 10:40:37 -0800 (PST)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH openbmc 8/9] initfs: Add flash clear and update during init
Date: Wed, 24 Feb 2016 12:40:23 -0600
Message-Id: <1456339224-27295-9-git-send-email-openbmc-patches@stwcx.xyz>
X-Mailer: git-send-email 2.7.1
In-Reply-To: <1456339224-27295-1-git-send-email-openbmc-patches@stwcx.xyz>
References: <1456339224-27295-1-git-send-email-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Wed, 24 Feb 2016 18:40:44 -0000

From: Milton Miller <miltonm@us.ibm.com>

Add code to clear the rwfs (preserving files from the whitelist)
during init, by a command line option.

Also allow it to be triggered by the file system not being a jffs2.

A console user can download images to /run/initramfs/ at the
debug-init-sh prompt for manual update.

Also add code but do not enable detecting images loaded into
initramfs / for future update options.  If enabled a custom initrd
with update images can be bulit (it would not fit in flash and
need to be netbooted).

Signed-off-by: Milton Miller <miltonm@us.ibm.com>
---
 .../obmc-phosphor-initfs/files/obmc-init.sh        | 54 +++++++++++++++++++++-
 1 file changed, 53 insertions(+), 1 deletion(-)

diff --git a/meta-phosphor/common/recipes-phosphor/obmc-phosphor-initfs/files/obmc-init.sh b/meta-phosphor/common/recipes-phosphor/obmc-phosphor-initfs/files/obmc-init.sh
index f2fe938..12c5a2f 100644
--- a/meta-phosphor/common/recipes-phosphor/obmc-phosphor-initfs/files/obmc-init.sh
+++ b/meta-phosphor/common/recipes-phosphor/obmc-phosphor-initfs/files/obmc-init.sh
@@ -85,13 +85,21 @@ rwfs=$(findmtd rwfs)
 rodev=/dev/mtdblock${rofs#mtd}
 rwdev=/dev/mtdblock${rwfs#mtd}
 
+# Set to y for yes, anything else for no.
+force_rwfst_jffs2=y
+flash_images_before_init=n
+
 rofst=squashfs
 rwfst=$(probe_fs_type $rwdev)
 roopts=ro
 rwopts=rw
 
+image=/run/initramfs/image-
+trigger=${image}rwfs
+
 init=/sbin/init
-fsck=/sbin/fsck.$rwfst
+fsckbase=/sbin/fsck.
+fsck=$fsckbase$rwfst
 fsckopts=-a
 
 echo rofs = $rofs $rofst   rwfs = $rwfs $rwfst
@@ -101,6 +109,50 @@ then
 	debug_takeover "Debug initial shell requested by command line."
 fi
 
+# If there are images in root move them to run/initramfs/ now.
+imagebasename=${image##*/}
+if test -n "${imagebasename}" -a "x$flash_images_before_init" = xy &&
+	ls /${imagebasename}* > /dev/null 2>&1
+then
+	echo "Pending flash updates found."
+	mv /${imagebasename}* ${image%$imagebasename}
+fi
+
+if grep -w clean-rwfs-filesystem /proc/cmdline
+then
+	echo "Cleaning of read-write overlay filesystem requested."
+	touch $trigger
+fi
+
+if test "x$force_rwfst_jffs2" = xy -a $rwfst != jffs2 -a ! -f $trigger
+then
+	echo "Converting read-write overlay filesystem to jffs2 forced."
+	touch $trigger
+fi
+
+if ls $image* > /dev/null 2>&1
+then
+	if ! test -x /update
+	then
+		debug_takeover "Flash update requested but /update missing!"
+	elif test -f $trigger -a ! -s $trigger
+	then
+		echo "Saving selected files from read-write overlay filesystem."
+		/update && rm -f $image*
+		echo "Clearing read-write overlay filesystem."
+		flash_eraseall /dev/$rwfs
+		echo "Restoring saved files to read-write overlay filesystem."
+		touch $trigger
+		/update 
+		rm -rf /save $trigger
+	else
+		/update && rm -f $image*
+	fi
+
+	rwfst=$(probe_fs_type $rwdev)
+	fsck=$fsckbase$rwfst
+fi
+
 mount $rodev $rodir -t $rofst -o $roopts
 
 if test -x $rodir$fsck
-- 
2.7.1
