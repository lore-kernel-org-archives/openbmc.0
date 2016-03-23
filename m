Return-Path: <andrew@aj.id.au>
Received: from homiemail-a13.g.dreamhost.com (sub3.mail.dreamhost.com
 [69.163.253.7])
 (using TLSv1 with cipher ADH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3qVMX626DszDq6W
 for <openbmc@lists.ozlabs.org>; Wed, 23 Mar 2016 19:03:50 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b=Ta5GVszK; 
 dkim-atps=neutral
Received: from homiemail-a13.g.dreamhost.com (localhost [127.0.0.1])
 by homiemail-a13.g.dreamhost.com (Postfix) with ESMTP id B7E66334078
 for <openbmc@lists.ozlabs.org>; Wed, 23 Mar 2016 01:03:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=aj.id.au; h=from:to
 :subject:date:message-id:in-reply-to:references; s=aj.id.au; bh=
 +pqUZNI32dsfRlW0nFVaSp0LkX8=; b=Ta5GVszK/1QWEC8n3wzZPzNBsESUq5ZQ
 VjR4uowkj1NlAwifFMHPcilEemgeZeUEGCj0Vc3y8SSgpJkCR8/NuX9D1We1Igy3
 gbPOOy+bOt6fWBq/EIKWlw3JdLZE5Ey8VbwIJQaRmtvStmiP7unls2U4V2wmQ3xb
 guKXoqh+q64=
Received: from keelia.au.ibm.com (ppp203-122-213-247.static.internode.on.net
 [203.122.213.247])
 (using TLSv1 with cipher AES128-SHA (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: andrew@aj.id.au)
 by homiemail-a13.g.dreamhost.com (Postfix) with ESMTPSA id 110FC33406F
 for <openbmc@lists.ozlabs.org>; Wed, 23 Mar 2016 01:03:47 -0700 (PDT)
From: Andrew Jeffery <andrew@aj.id.au>
To: OpenBMC <openbmc@lists.ozlabs.org>
Subject: [RFC PATCH openbmc v3 3/8] qemu_git.bb: Update to palmetto-bmc model
 with Cadence GEM
Date: Wed, 23 Mar 2016 18:33:30 +1030
Message-Id: <1458720215-25302-4-git-send-email-andrew@aj.id.au>
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
X-List-Received-Date: Wed, 23 Mar 2016 08:03:50 -0000

Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
---
 meta-openbmc-bsp/recipes-devtools/qemu/qemu_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-openbmc-bsp/recipes-devtools/qemu/qemu_git.bb b/meta-openbmc-bsp/recipes-devtools/qemu/qemu_git.bb
index 97667ba..4787a89 100644
--- a/meta-openbmc-bsp/recipes-devtools/qemu/qemu_git.bb
+++ b/meta-openbmc-bsp/recipes-devtools/qemu/qemu_git.bb
@@ -5,7 +5,7 @@
 
 require qemu.inc
 
-SRCREV = "d1f8764099022bc1173f2413331b26d4ff609a0c"
+SRCREV = "0217fbd91faa9acd434d8726555ae35c0bd1f68b"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=441c28d2cf86e15a37fa47e15a72fbac \
                     file://COPYING.LIB;endline=24;md5=c04def7ae38850e7d3ef548588159913"
-- 
2.5.0
