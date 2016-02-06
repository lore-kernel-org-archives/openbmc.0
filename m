Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 119651A0193
 for <openbmc@lists.ozlabs.org>; Sat,  6 Feb 2016 11:20:36 +1100 (AEDT)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1454718033174586.5749276257543;
 Fri, 5 Feb 2016 16:20:33 -0800 (PST)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH openbmc 3/7] obmc-initfs: use varables for paths and mount
 arguments
Date: Fri,  5 Feb 2016 18:20:25 -0600
Message-Id: <1454718029-3441-4-git-send-email-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Sat, 06 Feb 2016 00:20:37 -0000

From: Milton Miller <miltonm@us.ibm.com>

Create variables for all mount parameters and paths related to
the read-only and read-write mounts, including fs type, full
device name, and options.  Reorder mount arguments to always
place options last.

Also add variables for update save directory and real init.

This allows easy testing of a file systems by changing a few
parameters including making the rofs an image in ram.

Signed-off-by: Milton Miller <miltonm@us.ibm.com>
---
 .../obmc-phosphor-initfs/files/obmc-init.sh        | 22 ++++++++++-----
 .../obmc-phosphor-initfs/files/obmc-update.sh      | 32 ++++++++++++----------
 2 files changed, 33 insertions(+), 21 deletions(-)

diff --git a/meta-phosphor/common/recipes-phosphor/obmc-phosphor-initfs/files/obmc-init.sh b/meta-phosphor/common/recipes-phosphor/obmc-phosphor-initfs/files/obmc-init.sh
index f0d8522..af50953 100644
--- a/meta-phosphor/common/recipes-phosphor/obmc-phosphor-initfs/files/obmc-init.sh
+++ b/meta-phosphor/common/recipes-phosphor/obmc-phosphor-initfs/files/obmc-init.sh
@@ -1,12 +1,13 @@
 #!/bin/sh
 
+fslist="proc sys dev run"
 rodir=run/initramfs/ro
 rwdir=run/initramfs/rw
 upper=$rwdir/cow
 work=$rwdir/work
 
 cd /
-mkdir -p sys proc dev run
+mkdir -p $fslist
 mount dev dev -tdevtmpfs
 mount sys sys -tsysfs
 mount proc proc -tproc
@@ -39,13 +40,20 @@ fi
 rofs=$(findmtd rofs)
 rwfs=$(findmtd rwfs)
 
+rodev=/dev/mtdblock${rofs#mtd}
+rwdev=/dev/mtdblock${rwfs#mtd}
+
 rofst=squashfs
 rwfst=ext4
+roopts=ro
+rwopts=rw
+
+init=/sbin/init
 
 echo rofs = $rofs $rofst   rwfs = $rwfs $rwfst
 
 if grep -w debug-init-sh /proc/cmdline ||
-	! mount -o rw /dev/mtdblock${rwfs#mtd} $rwdir -t $rwfst
+	! mount $rwdev $rwdir -t $rwfst -o $rwopts
 then
 	echo Please mount the rw file system on $rwdir from this shell
 	while ! sulogin && ! test -f /takeover
@@ -61,7 +69,7 @@ then
 	exec /bin/sh
 fi
 
-mount -o ro /dev/mtdblock${rofs#mtd} $rodir -t $rofst
+mount $rodir $rodir -t $rofst -o $roopts
 
 rm -rf $work
 mkdir -p $upper
@@ -69,17 +77,17 @@ mkdir -p $work
 
 mount -t overlay -o lowerdir=$rodir,upperdir=$upper,workdir=$work cow /root
 
-if ! chroot /root /bin/sh -c "test -x /sbin/init -a -s /sbin/init"
+if ! chroot /root /bin/sh -c "test -x '$init' -a -s '$init'"
 then
 	echo "Change Root test failed!  Invoking emergency shell."
 	PS1=rescue#\  sulogin
 fi
 
-for f in sys dev proc run
+for f in $fslist
 do
 	mount --move $f root/$f
 done
 
-# switch_root /root /sbin/init
-exec chroot /root /sbin/init
+# switch_root /root $init
+exec chroot /root $init
 
diff --git a/meta-phosphor/common/recipes-phosphor/obmc-phosphor-initfs/files/obmc-update.sh b/meta-phosphor/common/recipes-phosphor/obmc-phosphor-initfs/files/obmc-update.sh
index f83b1ad..ec4a769 100755
--- a/meta-phosphor/common/recipes-phosphor/obmc-phosphor-initfs/files/obmc-update.sh
+++ b/meta-phosphor/common/recipes-phosphor/obmc-phosphor-initfs/files/obmc-update.sh
@@ -35,30 +35,35 @@ findmtd() {
 	echo $m
 }
 
-rofs=$(findmtd rofs)
 rwfs=$(findmtd rwfs)
 
-rofst=squahsfs
+rwdev=/dev/mtdblock${rwfs#mtd}
 rwfst=ext4
+rwopts=rw
+rorwopts=ro${rwopts#rw}
+
+rwdir=rw
+upper=$rwdir/cow
+save=save/${upper##*/}
 
 if test -n "$rwfs" && test -s whitelist
 then
 
-	mkdir -p rw
-	mount /dev/mtdblock${rwfs#mtd} rw -oro -t $rwfst
+	mkdir -p $rwdir
+	mount $rwdev $rwdir -t $rwfst -o $rorwopts
 
 	while read f
 	do
-		if ! test -e rw/cow/$f
+		if ! test -e $upper/$f
 		then
 			continue
 		fi
-		d="save/cow/$f"
+		d="$save/$f"
 		mkdir -p "${d%/*}"
-		cp -rp rw/cow/$f "${d%/*}/"
+		cp -rp $upper/$f "${d%/*}/"
 	done < whitelist
 
-	umount rw
+	umount $rwdir
 fi
 
 image=/run/initramfs/image-
@@ -67,7 +72,7 @@ do
 	m=$(findmtd ${f#$image})
 	if test -z "$m"
 	then
-		echo 1>&2  "Unable to find mtd partiton for $f"
+		echo 1>&2  "Unable to find mtd partiton for ${f##*/}."
 		exec /bin/sh
 	fi
 done
@@ -80,12 +85,11 @@ do
 	flashcp -v $f /dev/$m
 done
 
-
-if test -d save/cow
+if test -d $save
 then
-	mount /dev/mtdblock${rwfs#mtd} rw -o rw -t $rwfst
-	cp -rp save/cow/. rw/cow/
-	umount rw
+	mount $rwdev rw -t $rwfst -o rw
+	cp -rp $save/. $upper/
+	umount $rwdir
 fi
 
 # Execute the command systemd told us to ...
-- 
2.6.4
