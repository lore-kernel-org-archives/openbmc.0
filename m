Return-Path: <andrew@aj.id.au>
Received: from homiemail-a76.g.dreamhost.com (sub3.mail.dreamhost.com
 [69.163.253.7])
 by lists.ozlabs.org (Postfix) with ESMTP id A71711A05C9
 for <openbmc@lists.ozlabs.org>; Wed, 24 Feb 2016 01:45:23 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b=cGbzORYb; 
 dkim-atps=neutral
Received: from homiemail-a76.g.dreamhost.com (localhost [127.0.0.1])
 by homiemail-a76.g.dreamhost.com (Postfix) with ESMTP id B3D15458081;
 Tue, 23 Feb 2016 06:45:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=aj.id.au; h=from:to:cc
 :subject:date:message-id:in-reply-to:references; s=aj.id.au; bh=
 9S/BEFpi5s8iu4OBtWL+Oi7NFM0=; b=cGbzORYbvezj+T3mv+GXFsrPnT4J4qPj
 xYjLMduec/oQdSaWuNGtpqpP6yMqwimVlxdPtRAtYwhsktLoIHsRCF7/fPSKqB7P
 372jFP22j3KYXMdaEENZIeb8lfMUUqR/VKzbZRluGAl2mjqw0oM8FlBp6L5N7Cob
 dbSu7rY7KP8=
Received: from keelia.au.ibm.com (ppp203-122-213-247.static.internode.on.net
 [203.122.213.247])
 (using TLSv1 with cipher AES128-SHA (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: andrew@aj.id.au)
 by homiemail-a76.g.dreamhost.com (Postfix) with ESMTPSA id B0543458079;
 Tue, 23 Feb 2016 06:45:21 -0800 (PST)
From: Andrew Jeffery <andrew@aj.id.au>
To: OpenBMC <openbmc@lists.ozlabs.org>
Subject: [PATCH v3 6/6] openbmc: Switch RW FS from ext4 to jffs2
Date: Wed, 24 Feb 2016 01:15:03 +1030
Message-Id: <1456238703-11117-7-git-send-email-andrew@aj.id.au>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <1456238703-11117-1-git-send-email-andrew@aj.id.au>
References: <1456238703-11117-1-git-send-email-andrew@aj.id.au>
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
X-List-Received-Date: Tue, 23 Feb 2016 14:45:23 -0000

Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
---
 meta-phosphor/classes/image-overlay.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-phosphor/classes/image-overlay.bbclass b/meta-phosphor/classes/image-overlay.bbclass
index 1c6137d..8997aae 100644
--- a/meta-phosphor/classes/image-overlay.bbclass
+++ b/meta-phosphor/classes/image-overlay.bbclass
@@ -3,7 +3,7 @@ INITRD_IMAGE ?= "core-image-minimal-initramfs"
 INITRD ?= "${DEPLOY_DIR_IMAGE}/${INITRD_IMAGE}-${MACHINE}.cpio.${INITRD_CTYPE}${uboot}"
 
 IMAGE_BASETYPE ?= "squashfs-xz"
-OVERLAY_BASETYPE ?= "ext4"
+OVERLAY_BASETYPE ?= "jffs2"
 
 IMAGE_TYPES_${PN} += "${IMAGE_BASETYPE}"
 
-- 
2.5.0
