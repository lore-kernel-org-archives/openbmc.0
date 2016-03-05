Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id E8E7F1A0313
 for <openbmc@lists.ozlabs.org>; Sat,  5 Mar 2016 23:30:29 +1100 (AEDT)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1457181024687587.7545306423386;
 Sat, 5 Mar 2016 04:30:24 -0800 (PST)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH openbmc 01/32] shutdown: Conditionally unmount proc
Date: Sat,  5 Mar 2016 06:29:52 -0600
Message-Id: <1457181023-23569-2-git-send-email-openbmc-patches@stwcx.xyz>
X-Mailer: git-send-email 2.7.1
In-Reply-To: <1457181023-23569-1-git-send-email-openbmc-patches@stwcx.xyz>
References: <1457181023-23569-1-git-send-email-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Sat, 05 Mar 2016 12:30:30 -0000
X-List-Received-Date: Sat, 05 Mar 2016 12:30:30 -0000
X-List-Received-Date: Sat, 05 Mar 2016 12:30:30 -0000

From: "Milton D. Miller II" <miltonm@us.ibm.com>

The intention was to test the flag variable set when proc was
mounted earlier in the script, not the constant string containing
the name of the variable.

The unnecessary unmount is not noticeable when a normal shutdown
or reboot is being performed while executing after systemd, but
results in a less usable environment when invoked manually.

Signed-off-by: Milton Miller <miltonm@us.ibm.com>
---
 .../common/recipes-phosphor/obmc-phosphor-initfs/files/obmc-shutdown.sh | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-phosphor/common/recipes-phosphor/obmc-phosphor-initfs/files/obmc-shutdown.sh b/meta-phosphor/common/recipes-phosphor/obmc-phosphor-initfs/files/obmc-shutdown.sh
index fc359c5..216e7e4 100644
--- a/meta-phosphor/common/recipes-phosphor/obmc-phosphor-initfs/files/obmc-shutdown.sh
+++ b/meta-phosphor/common/recipes-phosphor/obmc-phosphor-initfs/files/obmc-shutdown.sh
@@ -45,7 +45,7 @@ fi
 echo Remaining mounts:
 cat /proc/mounts
 
-test "umount_proc" && umount /proc && rmdir /proc
+test "$umount_proc" && umount /proc && rmdir /proc
 
 # ioctl(TIOC_DRAIN) to drain tty messages to console
 test -t 1 && stty cooked 0<&1
-- 
2.7.1
