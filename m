Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 0D2081A0B52
 for <openbmc@lists.ozlabs.org>; Sat,  5 Mar 2016 23:30:37 +1100 (AEDT)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1457181027958167.5719112621813;
 Sat, 5 Mar 2016 04:30:27 -0800 (PST)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH openbmc 05/32] shutdown: Call update from /run/initramfs
 directory
Date: Sat,  5 Mar 2016 06:29:56 -0600
Message-Id: <1457181023-23569-6-git-send-email-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Sat, 05 Mar 2016 12:30:38 -0000

From: "Milton D. Miller II" <miltonm@us.ibm.com>

While both are the same directory via bind mount when shutdown
is executing from systemd use the full pathname to the script.

Signed-off-by: Milton Miller <miltonm@us.ibm.com>
---
 .../recipes-phosphor/obmc-phosphor-initfs/files/obmc-shutdown.sh  | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/meta-phosphor/common/recipes-phosphor/obmc-phosphor-initfs/files/obmc-shutdown.sh b/meta-phosphor/common/recipes-phosphor/obmc-phosphor-initfs/files/obmc-shutdown.sh
index bae572b..7d79cf0 100644
--- a/meta-phosphor/common/recipes-phosphor/obmc-phosphor-initfs/files/obmc-shutdown.sh
+++ b/meta-phosphor/common/recipes-phosphor/obmc-phosphor-initfs/files/obmc-shutdown.sh
@@ -30,7 +30,9 @@ do
 done
 set +x
 
+update=/run/initramfs/update
 image=/run/initramfs/image-
+
 if test -s /run/fw_env -a -c /run/mtd:u-boot-env -a ! -e ${image}u-boot-env &&
 	! cmp /run/mtd:u-boot-env /run/fw_env
 then
@@ -39,11 +41,11 @@ fi
 
 if ls $image* > /dev/null 2>&1
 then
-	if test -x /update
+	if test -x $update
 	then
-		/update
+		$update
 	else
-		echo 1>&2 "Flash update requested but /update program missing!"
+		echo 1>&2 "Flash update requested but $update program missing!"
 	fi
 fi
 
-- 
2.7.1
