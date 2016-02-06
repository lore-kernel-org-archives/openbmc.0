Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BBCF1A0205
 for <openbmc@lists.ozlabs.org>; Sat,  6 Feb 2016 11:20:36 +1100 (AEDT)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1454718031500182.64258655415517;
 Fri, 5 Feb 2016 16:20:31 -0800 (PST)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH openbmc 1/7] obmc-initfs: minor updates
Date: Fri,  5 Feb 2016 18:20:23 -0600
Message-Id: <1454718029-3441-2-git-send-email-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Sat, 06 Feb 2016 00:20:36 -0000

From: Milton Miller <miltonm@us.ibm.com>

In shutdown, Like init and update, cd to / to be clear the
expected environment.  Although shorter names are not used, it
prevents problems with unmounting filesystems, even if this is
the normal state for a call of this script by systemd.  Also
make a few paths absolute and don't follow symlinks in ln.

In init, check the new init is an executable file with non-zero
size in addition to the shell being executable with its shared
libraries.

Signed-off-by: Milton Miller <miltonm@us.ibm.com>
---
 .../recipes-phosphor/obmc-phosphor-initfs/files/obmc-init.sh       | 4 ++--
 .../recipes-phosphor/obmc-phosphor-initfs/files/obmc-shutdown.sh   | 7 ++++---
 2 files changed, 6 insertions(+), 5 deletions(-)

diff --git a/meta-phosphor/common/recipes-phosphor/obmc-phosphor-initfs/files/obmc-init.sh b/meta-phosphor/common/recipes-phosphor/obmc-phosphor-initfs/files/obmc-init.sh
index 0dc4c35..f0d8522 100644
--- a/meta-phosphor/common/recipes-phosphor/obmc-phosphor-initfs/files/obmc-init.sh
+++ b/meta-phosphor/common/recipes-phosphor/obmc-phosphor-initfs/files/obmc-init.sh
@@ -69,9 +69,9 @@ mkdir -p $work
 
 mount -t overlay -o lowerdir=$rodir,upperdir=$upper,workdir=$work cow /root
 
-if ! chroot /root /bin/sh -c exit
+if ! chroot /root /bin/sh -c "test -x /sbin/init -a -s /sbin/init"
 then
-	echo 'chroot test failed; invoking emergency shell.'
+	echo "Change Root test failed!  Invoking emergency shell."
 	PS1=rescue#\  sulogin
 fi
 
diff --git a/meta-phosphor/common/recipes-phosphor/obmc-phosphor-initfs/files/obmc-shutdown.sh b/meta-phosphor/common/recipes-phosphor/obmc-phosphor-initfs/files/obmc-shutdown.sh
index cc076fd..c550e06 100644
--- a/meta-phosphor/common/recipes-phosphor/obmc-phosphor-initfs/files/obmc-shutdown.sh
+++ b/meta-phosphor/common/recipes-phosphor/obmc-phosphor-initfs/files/obmc-shutdown.sh
@@ -5,10 +5,11 @@ echo shutdown: "$@"
 export PS1=shutdown-sh#\ 
 # exec bin/sh
 
+cd /
 if [ ! -e /proc/mounts ]
 then
 	mkdir -p /proc
-	mount  proc proc -tproc
+	mount  proc /proc -tproc
 	umount_proc=1
 else
 	umount_proc=
@@ -27,10 +28,10 @@ set +x
 if test -s /run/fw_env -a -c /run/mtd:u-boot-env -a ! -e /image-u-boot-env &&
 	! cmp /run/mtd:u-boot-env /run/fw_env
 then
-	ln -s /run/fw_env /image-u-boot-env
+	ln -sn /run/fw_env /image-u-boot-env
 fi
 
-if test -x /update && ls image-* > /dev/null 2>&1
+if test -x /update && ls /image-* > /dev/null 2>&1
 then
 	exec /update ${1+"$@"}
 fi
-- 
2.6.4
