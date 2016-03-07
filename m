Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id E2A9C1A0361
 for <openbmc@lists.ozlabs.org>; Tue,  8 Mar 2016 08:30:48 +1100 (AEDT)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1457386245353247.51568738371566;
 Mon, 7 Mar 2016 13:30:45 -0800 (PST)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH openbmc v2 25/34] init: Add option to copy base read-only
 filesystem into RAM
Date: Mon,  7 Mar 2016 15:30:14 -0600
Message-Id: <1457386223-5725-26-git-send-email-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Mon, 07 Mar 2016 21:30:49 -0000

From: "Milton D. Miller II" <miltonm@us.ibm.com>

If copy-base-filesystem-to-ram is found copy the read-only
filesystem source device to /run/image-rofs.  If the copy fails
then remove the partial copy and invoke debug takeover.

This will allow a new image to be downloaded and flashed while
running from the existing copy for the duration of this boot.

Alternatively with the overlay also in RAM pflash could be used
to update the flash from the host as the BMC would no longer need
the flash or flash controller.

Signed-off-by: Milton Miller <miltonm@us.ibm.com>
---
 .../recipes-phosphor/obmc-phosphor-initfs/files/obmc-init.sh | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/meta-phosphor/common/recipes-phosphor/obmc-phosphor-initfs/files/obmc-init.sh b/meta-phosphor/common/recipes-phosphor/obmc-phosphor-initfs/files/obmc-init.sh
index 2e8467c..f6a6b7b 100644
--- a/meta-phosphor/common/recipes-phosphor/obmc-phosphor-initfs/files/obmc-init.sh
+++ b/meta-phosphor/common/recipes-phosphor/obmc-phosphor-initfs/files/obmc-init.sh
@@ -169,6 +169,18 @@ then
 	rwfst=none
 fi
 
+if grep -w copy-base-filesystem-to-ram $optfile &&
+	test ! -e /run/image-rofs && ! cp $rodev /run/image-rofs
+then
+	# Remove any partial copy to avoid attempted usage later
+	if test -e  /run/image-rofs
+	then
+		ls -l /run/image-rofs
+		rm -f /run/image-rofs
+	fi
+	debug_takeover "Copying $rodev to /run/image-rofs failed."
+fi
+
 if test -s /run/image-rofs
 then
 	rodev=/run/image-rofs
-- 
2.7.1
