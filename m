Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 578071A0396
 for <openbmc@lists.ozlabs.org>; Wed, 10 Feb 2016 05:00:47 +1100 (AEDT)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1455040840894359.82605937198207;
 Tue, 9 Feb 2016 10:00:40 -0800 (PST)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH openbmc 9/9] obmc-initfs: shutdown when rofs is a loop mounted
 image in /run
Date: Tue,  9 Feb 2016 12:00:22 -0600
Message-Id: <1455040822-14038-10-git-send-email-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Tue, 09 Feb 2016 18:00:48 -0000

From: Milton Miller <miltonm@us.ibm.com>

If one sets rodir=/run/image-rofs roopts=ro,loop and transfers
an image one can run from a base image in ram.  However, the
shutdown will fail to unmount /run because it is busy and then
fails to unmount /cow which causes oldroot to be still mounted.

By moving the mount to the side everything cleans up (as long
as there are no other mounts under run, and systemd-shutdown
tried to do as much as possible).

Signed-off-by: Milton Miller <miltonm@us.ibm.com>
---
 .../recipes-phosphor/obmc-phosphor-initfs/files/obmc-shutdown.sh | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/meta-phosphor/common/recipes-phosphor/obmc-phosphor-initfs/files/obmc-shutdown.sh b/meta-phosphor/common/recipes-phosphor/obmc-phosphor-initfs/files/obmc-shutdown.sh
index 7d1157a..3eff1ea 100644
--- a/meta-phosphor/common/recipes-phosphor/obmc-phosphor-initfs/files/obmc-shutdown.sh
+++ b/meta-phosphor/common/recipes-phosphor/obmc-phosphor-initfs/files/obmc-shutdown.sh
@@ -15,11 +15,16 @@ else
 	umount_proc=
 fi
 
-# remove an empty oldroot, that means we are not invoked from systemd-shutdown
+# Remove an empty oldroot, that means we are not invoked from systemd-shutdown
 rmdir /oldroot 2>/dev/null
 
+# Move /oldroot/run to /mnt in case it has the underlying rofs loop mounted.
+# Ordered before /oldroot the overlay is unmounted before the loop mount
+mkdir -p /mnt
+mount --move /oldroot/run /mnt
+
 set -x
-for f in $( awk '/oldroot/ { print $2 }' < /proc/mounts | sort -r )
+for f in $( awk '/oldroot|mnt/ { print $2 }' < /proc/mounts | sort -r )
 do
 	umount $f
 done
-- 
2.6.4
