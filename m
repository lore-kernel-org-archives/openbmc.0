Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3AE391A02B5
 for <openbmc@lists.ozlabs.org>; Tue,  8 Mar 2016 08:30:58 +1100 (AEDT)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1457386249414370.0556579939449;
 Mon, 7 Mar 2016 13:30:49 -0800 (PST)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH openbmc v2 30/34] init: Allow options to be fixed at build time
Date: Mon,  7 Mar 2016 15:30:19 -0600
Message-Id: <1457386223-5725-31-git-send-email-openbmc-patches@stwcx.xyz>
X-Mailer: git-send-email 2.7.1
In-Reply-To: <1457386223-5725-1-git-send-email-openbmc-patches@stwcx.xyz>
References: <1457386223-5725-1-git-send-email-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Mon, 07 Mar 2016 21:30:58 -0000

From: "Milton D. Miller II" <miltonm@us.ibm.com>

If the file /init-options exists copy it to the runtime location
/run/initramfs/init-options.

This allows an initramfs image to be built that will not parse
any u-boot or command line variables by adding a file into the
the image.  This can be done either through a recipe overlay or
additonal package today and could also be a cpio merged into the
initrd in the future.

Signed-off-by: Milton Miller <miltonm@us.ibm.com>
---
 .../common/recipes-phosphor/obmc-phosphor-initfs/files/obmc-init.sh  | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta-phosphor/common/recipes-phosphor/obmc-phosphor-initfs/files/obmc-init.sh b/meta-phosphor/common/recipes-phosphor/obmc-phosphor-initfs/files/obmc-init.sh
index 29c72cf..814ee07 100644
--- a/meta-phosphor/common/recipes-phosphor/obmc-phosphor-initfs/files/obmc-init.sh
+++ b/meta-phosphor/common/recipes-phosphor/obmc-phosphor-initfs/files/obmc-init.sh
@@ -117,6 +117,11 @@ fsckopts=-a
 optfile=/run/initramfs/init-options
 update=/run/initramfs/update
 
+if test -e /${optfile##*/}
+then
+	cp /${optfile##*/} $optfile
+fi
+
 if test ! -f $optfile
 then
 	cat /proc/cmdline > $optfile
-- 
2.7.1
