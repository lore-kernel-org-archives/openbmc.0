Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 2518C1A0366
 for <openbmc@lists.ozlabs.org>; Sat,  5 Mar 2016 23:33:14 +1100 (AEDT)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1457181027159121.47639657206935;
 Sat, 5 Mar 2016 04:30:27 -0800 (PST)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH openbmc 04/32] shutdown: Complain if update images exist
 without update script
Date: Sat,  5 Mar 2016 06:29:55 -0600
Message-Id: <1457181023-23569-5-git-send-email-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Sat, 05 Mar 2016 12:33:15 -0000

From: "Milton D. Miller II" <miltonm@us.ibm.com>

Complain if the update program is missing if flash update images
are present.  This is similar to the message in root and will
inform a serial console reader why the update images are not
being applied.

The update script is copied from the initramfs to the run tmpfs
ram file system.  It is built and packaged with the init and
shutdown script.  It would have been removed, unpackaged, or
init changed for unknown reasons by root or the build system
for this to occur.

Signed-off-by: Milton Miller <miltonm@us.ibm.com>
---
 .../recipes-phosphor/obmc-phosphor-initfs/files/obmc-shutdown.sh | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/meta-phosphor/common/recipes-phosphor/obmc-phosphor-initfs/files/obmc-shutdown.sh b/meta-phosphor/common/recipes-phosphor/obmc-phosphor-initfs/files/obmc-shutdown.sh
index 99a7432..bae572b 100644
--- a/meta-phosphor/common/recipes-phosphor/obmc-phosphor-initfs/files/obmc-shutdown.sh
+++ b/meta-phosphor/common/recipes-phosphor/obmc-phosphor-initfs/files/obmc-shutdown.sh
@@ -37,9 +37,14 @@ then
 	ln -sn /run/fw_env ${image}u-boot-env
 fi
 
-if test -x /update && ls $image* > /dev/null 2>&1
+if ls $image* > /dev/null 2>&1
 then
-	/update ${1+"$@"}
+	if test -x /update
+	then
+		/update
+	else
+		echo 1>&2 "Flash update requested but /update program missing!"
+	fi
 fi
 
 echo Remaining mounts:
-- 
2.7.1
