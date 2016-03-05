Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id A5E961A03DF
 for <openbmc@lists.ozlabs.org>; Sat,  5 Mar 2016 23:30:44 +1100 (AEDT)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 145718103955888.76272011953085;
 Sat, 5 Mar 2016 04:30:39 -0800 (PST)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH openbmc 19/32] init: Read options from a file
Date: Sat,  5 Mar 2016 06:30:10 -0600
Message-Id: <1457181023-23569-20-git-send-email-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Sat, 05 Mar 2016 12:30:45 -0000

From: "Milton D. Miller II" <miltonm@us.ibm.com>

Grep options from a file instead of directly from /proc/cmdline
which will allow additonal sources for options.

Initially the options file is just a copy of the kernel command
line, but it may be edited at debug-init-sh or via a later
debug_takeover point or before restarting init.

Signed-off-by: Milton Miller <miltonm@us.ibm.com>
---
 .../recipes-phosphor/obmc-phosphor-initfs/files/obmc-init.sh   | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/meta-phosphor/common/recipes-phosphor/obmc-phosphor-initfs/files/obmc-init.sh b/meta-phosphor/common/recipes-phosphor/obmc-phosphor-initfs/files/obmc-init.sh
index 12c5a2f..d3b4b9f 100644
--- a/meta-phosphor/common/recipes-phosphor/obmc-phosphor-initfs/files/obmc-init.sh
+++ b/meta-phosphor/common/recipes-phosphor/obmc-phosphor-initfs/files/obmc-init.sh
@@ -101,10 +101,16 @@ init=/sbin/init
 fsckbase=/sbin/fsck.
 fsck=$fsckbase$rwfst
 fsckopts=-a
+optfile=/run/initramfs/init-options
+
+if test ! -f $optfile
+then
+	cat /proc/cmdline > $optfile
+fi
 
 echo rofs = $rofs $rofst   rwfs = $rwfs $rwfst
 
-if grep -w debug-init-sh /proc/cmdline
+if grep -w debug-init-sh $optfile
 then
 	debug_takeover "Debug initial shell requested by command line."
 fi
@@ -118,7 +124,7 @@ then
 	mv /${imagebasename}* ${image%$imagebasename}
 fi
 
-if grep -w clean-rwfs-filesystem /proc/cmdline
+if grep -w clean-rwfs-filesystem $optfile
 then
 	echo "Cleaning of read-write overlay filesystem requested."
 	touch $trigger
-- 
2.7.1
