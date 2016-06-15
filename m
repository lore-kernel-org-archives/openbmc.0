Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3rTq3M3t44zDqhX
 for <openbmc@lists.ozlabs.org>; Wed, 15 Jun 2016 11:40:46 +1000 (AEST)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1465954842309174.86301976159268;
 Tue, 14 Jun 2016 18:40:42 -0700 (PDT)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH openbmc v4 09/10] initfs: init: add file for base options
Date: Tue, 14 Jun 2016 20:40:30 -0500
Message-Id: <20160615014031.32062-10-openbmc-patches@stwcx.xyz>
X-Mailer: git-send-email 2.8.4
In-Reply-To: <20160615014031.32062-1-openbmc-patches@stwcx.xyz>
References: <20160615014031.32062-1-openbmc-patches@stwcx.xyz>
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.22
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Wed, 15 Jun 2016 01:40:48 -0000

From: "Milton D. Miller II" <miltonm@us.ibm.com>

Allow an initrd image to include options for init while still allowing
additional options to come from the kernel command line and/or u-boot
environment variables.

This will allow building a netboot image that can specify to run
from RAM while allowing the command line to initiate debug or skip
copying files from the read-write overlay file system.

Signed-off-by: Milton Miller <miltonm@us.ibm.com>
---
 .../recipes-phosphor/obmc-phosphor-initfs/files/obmc-init.sh   | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/meta-phosphor/common/recipes-phosphor/obmc-phosphor-initfs/files/obmc-init.sh b/meta-phosphor/common/recipes-phosphor/obmc-phosphor-initfs/files/obmc-init.sh
index c37b3d5..70af93d 100644
--- a/meta-phosphor/common/recipes-phosphor/obmc-phosphor-initfs/files/obmc-init.sh
+++ b/meta-phosphor/common/recipes-phosphor/obmc-phosphor-initfs/files/obmc-init.sh
@@ -184,6 +184,7 @@ fsckbase=/sbin/fsck.
 fsck=$fsckbase$rwfst
 fsckopts=-a
 optfile=/run/initramfs/init-options
+optbase=/run/initramfs/init-options-base
 urlfile=/run/initramfs/init-download-url
 update=/run/initramfs/update
 
@@ -192,9 +193,16 @@ then
 	cp /${optfile##*/} $optfile
 fi
 
+if test -e /${optbase##*/}
+then
+	cp /${optbase##*/} $optbase
+else
+	touch $optbase
+fi
+
 if test ! -f $optfile
 then
-	cat /proc/cmdline > $optfile
+	cat /proc/cmdline $optbase > $optfile
 	get_fw_env_var openbmcinit >> $optfile
 	get_fw_env_var openbmconce >> $optfile
 fi
-- 
2.8.4
