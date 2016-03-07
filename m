Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44F651A039A
 for <openbmc@lists.ozlabs.org>; Tue,  8 Mar 2016 08:30:38 +1100 (AEDT)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1457386234962548.7817148619744;
 Mon, 7 Mar 2016 13:30:34 -0800 (PST)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH openbmc v2 12/34] update: Restore files via an alternate mount
 directory
Date: Mon,  7 Mar 2016 15:30:01 -0600
Message-Id: <1457386223-5725-13-git-send-email-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Mon, 07 Mar 2016 21:30:38 -0000

From: "Milton D. Miller II" <miltonm@us.ibm.com>

This will allow us to restore or check-point the whitelisted files
to the read-write filesystem device without causing confusion by
mounting over the upperdir location while at runtime.

Signed-off-by: Milton Miller <miltonm@us.ibm.com>
---
 .../recipes-phosphor/obmc-phosphor-initfs/files/obmc-update.sh      | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/meta-phosphor/common/recipes-phosphor/obmc-phosphor-initfs/files/obmc-update.sh b/meta-phosphor/common/recipes-phosphor/obmc-phosphor-initfs/files/obmc-update.sh
index b066471..cab33e9 100755
--- a/meta-phosphor/common/recipes-phosphor/obmc-phosphor-initfs/files/obmc-update.sh
+++ b/meta-phosphor/common/recipes-phosphor/obmc-phosphor-initfs/files/obmc-update.sh
@@ -132,9 +132,15 @@ done
 
 if test -d $save -a "x$dorestore" = xy
 then
+	odir=$rwdir
+	rwdir=/run/rw
+	upper=$rwdir${upper#$odir}
+
+	mkdir -p $rwdir
 	mount $rwdev $rwdir -t $(probe_fs_type $rwdev) -o $rwopts
 	cp -rp $save/. $upper/
 	umount $rwdir
+	rmdir $rwdir
 fi
 
 if test "x$doclean" = xy
-- 
2.7.1
