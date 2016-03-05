Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id A01561A035C
 for <openbmc@lists.ozlabs.org>; Sat,  5 Mar 2016 23:30:49 +1100 (AEDT)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1457181044283107.30264389333229;
 Sat, 5 Mar 2016 04:30:44 -0800 (PST)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH openbmc 25/32] init: Add option to copy base read-only
 filesystem into RAM
Date: Sat,  5 Mar 2016 06:30:16 -0600
Message-Id: <1457181023-23569-26-git-send-email-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Sat, 05 Mar 2016 12:30:50 -0000

From: "Milton D. Miller II" <miltonm@us.ibm.com>

If copy-base-filesystem-to-ram is found copy the read-only
filesystem source device to /run/image-rofs.  If the copy fails
then remove the partial copy and invoke debug takeover.

This will allow a new image to be downloaded and flashed while
running from the existing copy for the duration of this boot.

Alternatively with the overlay also in RAM pflash could be used
to update the flash from the host as the BMC would no longer need
the flash or flash controller.

Signed-off-by:  Milton Miller <miltonm@us.ibm.com>
---
 .../recipes-phosphor/obmc-phosphor-initfs/files/obmc-init.sh | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/meta-phosphor/common/recipes-phosphor/obmc-phosphor-initfs/files/obmc-init.sh b/meta-phosphor/common/recipes-phosphor/obmc-phosphor-initfs/files/obmc-init.sh
index 2e8467c..82cc77e 100644
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
