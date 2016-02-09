Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id BFA301A0399
 for <openbmc@lists.ozlabs.org>; Wed, 10 Feb 2016 05:00:36 +1100 (AEDT)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1455040832490532.2512477269156;
 Tue, 9 Feb 2016 10:00:32 -0800 (PST)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH openbmc 4/9] obmc-initfs: look for images in
 /run/initramfs/image-
Date: Tue,  9 Feb 2016 12:00:17 -0600
Message-Id: <1455040822-14038-5-git-send-email-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Tue, 09 Feb 2016 18:00:37 -0000

From: Milton Miller <miltonm@us.ibm.com>

Teach update to look for /run/initramfs/image- not /image-*.

When describing how to recover from a corrupted flash by grabbing
the images and running update from the init debug shell, it
became apparent that while at systemd shutdown /run/initramfs/
is mounted at /, it is not the case during init.  Use the
variable image to hold this pathname.

Signed-off-by: Milton Miller <miltonm@us.ibm.com>
---
 .../obmc-phosphor-initfs/files/obmc-shutdown.sh              |  7 ++++---
 .../obmc-phosphor-initfs/files/obmc-update.sh                | 12 ++++++------
 2 files changed, 10 insertions(+), 9 deletions(-)

diff --git a/meta-phosphor/common/recipes-phosphor/obmc-phosphor-initfs/files/obmc-shutdown.sh b/meta-phosphor/common/recipes-phosphor/obmc-phosphor-initfs/files/obmc-shutdown.sh
index c550e06..d530265 100644
--- a/meta-phosphor/common/recipes-phosphor/obmc-phosphor-initfs/files/obmc-shutdown.sh
+++ b/meta-phosphor/common/recipes-phosphor/obmc-phosphor-initfs/files/obmc-shutdown.sh
@@ -25,13 +25,14 @@ do
 done
 set +x
 
-if test -s /run/fw_env -a -c /run/mtd:u-boot-env -a ! -e /image-u-boot-env &&
+image=/run/initramfs/image-
+if test -s /run/fw_env -a -c /run/mtd:u-boot-env -a ! -e ${image}u-boot-env &&
 	! cmp /run/mtd:u-boot-env /run/fw_env
 then
-	ln -sn /run/fw_env /image-u-boot-env
+	ln -sn /run/fw_env ${image}u-boot-env
 fi
 
-if test -x /update && ls /image-* > /dev/null 2>&1
+if test -x /update && ls $image* > /dev/null 2>&1
 then
 	exec /update ${1+"$@"}
 fi
diff --git a/meta-phosphor/common/recipes-phosphor/obmc-phosphor-initfs/files/obmc-update.sh b/meta-phosphor/common/recipes-phosphor/obmc-phosphor-initfs/files/obmc-update.sh
index 1122e83..f83b1ad 100755
--- a/meta-phosphor/common/recipes-phosphor/obmc-phosphor-initfs/files/obmc-update.sh
+++ b/meta-phosphor/common/recipes-phosphor/obmc-phosphor-initfs/files/obmc-update.sh
@@ -61,10 +61,10 @@ then
 	umount rw
 fi
 
-
-for f in image-*
+image=/run/initramfs/image-
+for f in $image*
 do
-	m=$(findmtd ${f#image-})
+	m=$(findmtd ${f#$image})
 	if test -z "$m"
 	then
 		echo 1>&2  "Unable to find mtd partiton for $f"
@@ -72,10 +72,10 @@ do
 	fi
 done
 
-for f in image-*
+for f in $image*
 do
-	m=$(findmtd ${f#image-})
-	echo "Updating ${f#image-}"
+	m=$(findmtd ${f#$image})
+	echo "Updating ${f#$image}..."
 	# flasheraseall /dev/$m && dd if=$f of=/dev/$m
 	flashcp -v $f /dev/$m
 done
-- 
2.6.4
