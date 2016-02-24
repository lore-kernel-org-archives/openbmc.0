Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 63A151A04BF
 for <openbmc@lists.ozlabs.org>; Thu, 25 Feb 2016 05:40:45 +1100 (AEDT)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1456339238785674.2736188554362;
 Wed, 24 Feb 2016 10:40:38 -0800 (PST)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH openbmc 9/9] initfs: Use stty to drain output before reboot
Date: Wed, 24 Feb 2016 12:40:24 -0600
Message-Id: <1456339224-27295-10-git-send-email-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Wed, 24 Feb 2016 18:40:45 -0000

From: "Milton D. Miller II" <miltonm@us.ibm.com>

To see all the messages during shutdown call stty cooked.

A side effect of setting any mode is it will call ioctl(TIOC_DRAIN)
to drain the buffers first without regard to any change in the mode.

Shutdown and flash update now show the final ouptut and "Rebooting"
message before the reboot system call.

Before:
+ set +x
Remaining mounts:
tmpfs / tmpfs rw,nosuid,nodev,mode=755 0 0
dev /dev devtmpfs rw,relatime,size=126384k,nr_inodes=31596,mode=755 0 0
proc /proc proc rw,relatime 0 0
sys /s

U-Boot 2013.07 (Feb 23 2016 - 10:21:23)

After:
+ set +x
Remaining mounts:
tmpfs / tmpfs rw,nosuid,nodev,mode=755 0 0
dev /dev devtmpfs rw,relatime,size=126384k,nr_inodes=31596,mode=755 0 0
proc /proc proc rw,relatime 0 0
sys /sys sysfs rw,relatime 0 0
tmpfs /run tmpfs rw,nosuid,nodev,mode=755 0 0
reboot: Restarting system

U-Boot 2013.07 (Feb 23 2016 - 10:21:23)

Signed-off-by: Milton Miller <miltonm@us.ibm.com>
---
 .../common/recipes-phosphor/obmc-phosphor-initfs/files/obmc-shutdown.sh | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-phosphor/common/recipes-phosphor/obmc-phosphor-initfs/files/obmc-shutdown.sh b/meta-phosphor/common/recipes-phosphor/obmc-phosphor-initfs/files/obmc-shutdown.sh
index 3eff1ea..fc359c5 100644
--- a/meta-phosphor/common/recipes-phosphor/obmc-phosphor-initfs/files/obmc-shutdown.sh
+++ b/meta-phosphor/common/recipes-phosphor/obmc-phosphor-initfs/files/obmc-shutdown.sh
@@ -47,6 +47,8 @@ cat /proc/mounts
 
 test "umount_proc" && umount /proc && rmdir /proc
 
+# ioctl(TIOC_DRAIN) to drain tty messages to console
+test -t 1 && stty cooked 0<&1
 
 # Execute the command systemd told us to ...
 if test -d /oldroot  && test "$1"
-- 
2.7.1
