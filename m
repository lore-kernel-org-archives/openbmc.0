Return-Path: <andrew@aj.id.au>
Received: from homiemail-a13.g.dreamhost.com (sub3.mail.dreamhost.com
 [69.163.253.7])
 (using TLSv1 with cipher ADH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3qVMX72qJTzDq6W
 for <openbmc@lists.ozlabs.org>; Wed, 23 Mar 2016 19:03:51 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b=f23UUHEq; 
 dkim-atps=neutral
Received: from homiemail-a13.g.dreamhost.com (localhost [127.0.0.1])
 by homiemail-a13.g.dreamhost.com (Postfix) with ESMTP id D232F334072
 for <openbmc@lists.ozlabs.org>; Wed, 23 Mar 2016 01:03:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=aj.id.au; h=from:to
 :subject:date:message-id:in-reply-to:references; s=aj.id.au; bh=
 nJvIs6m9vLHJslWrTQvq/b4vSks=; b=f23UUHEq1uECK/xu7r0N+cNJ4VGS30cc
 WciQdl0prN4oFHPkemXWlNFL4tgnWvQlsyR3y8/Q/NckmAtz8SsHIhw1nDTUkWWY
 6Q2m4yPoml3TVf/2AG7IXKZwaTJz9sNO/z+dezV+mZYtkVoa4EomAubrRYdJmwDM
 QMXVB8Yolo8=
Received: from keelia.au.ibm.com (ppp203-122-213-247.static.internode.on.net
 [203.122.213.247])
 (using TLSv1 with cipher AES128-SHA (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: andrew@aj.id.au)
 by homiemail-a13.g.dreamhost.com (Postfix) with ESMTPSA id 2A0FD33406F
 for <openbmc@lists.ozlabs.org>; Wed, 23 Mar 2016 01:03:48 -0700 (PDT)
From: Andrew Jeffery <andrew@aj.id.au>
To: OpenBMC <openbmc@lists.ozlabs.org>
Subject: [RFC PATCH openbmc v3 4/8] linux-obmc: Allow processing of multiple
 device trees
Date: Wed, 23 Mar 2016 18:33:31 +1030
Message-Id: <1458720215-25302-5-git-send-email-andrew@aj.id.au>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <1458720215-25302-1-git-send-email-andrew@aj.id.au>
References: <1458720215-25302-1-git-send-email-andrew@aj.id.au>
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
X-List-Received-Date: Wed, 23 Mar 2016 08:03:51 -0000

Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
---
 meta-phosphor/common/recipes-kernel/linux/linux-obmc_4.3.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-phosphor/common/recipes-kernel/linux/linux-obmc_4.3.bb b/meta-phosphor/common/recipes-kernel/linux/linux-obmc_4.3.bb
index 3e74f7c..05dff55 100644
--- a/meta-phosphor/common/recipes-kernel/linux/linux-obmc_4.3.bb
+++ b/meta-phosphor/common/recipes-kernel/linux/linux-obmc_4.3.bb
@@ -20,7 +20,7 @@ inherit kernel
 require recipes-kernel/linux/linux-yocto.inc
 
 do_patch_append() {
-        for DTB in "${KERNEL_DEVICETREE}"; do
+        for DTB in ${KERNEL_DEVICETREE}; do
 		DT=`basename ${DTB} .dtb`
                 if [ -r "${WORKDIR}/${DT}.dts" ]; then
                         cp ${WORKDIR}/${DT}.dts \
-- 
2.5.0
