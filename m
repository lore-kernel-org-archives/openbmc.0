Return-Path: <andrew@aj.id.au>
Received: from homiemail-a76.g.dreamhost.com (sub3.mail.dreamhost.com
 [69.163.253.7])
 by lists.ozlabs.org (Postfix) with ESMTP id 0F3961A05FA
 for <openbmc@lists.ozlabs.org>; Wed, 24 Feb 2016 01:45:22 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b=Mlb4RXXW; 
 dkim-atps=neutral
Received: from homiemail-a76.g.dreamhost.com (localhost [127.0.0.1])
 by homiemail-a76.g.dreamhost.com (Postfix) with ESMTP id 34DE2458087;
 Tue, 23 Feb 2016 06:45:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=aj.id.au; h=from:to:cc
 :subject:date:message-id:in-reply-to:references; s=aj.id.au; bh=
 vdMdoKeJSi6ZUb0IWYtwSh+Y7do=; b=Mlb4RXXWbrCdVfsx4UHyBt/wlpp5X2iz
 NGc/zWYg4cwat/nEYLMQswZH2Cpm8Heev20bjI6BAjlSwbGFq6nYPNPIwywRO01D
 1Ujcf6S+S1F0HyWBSkvT3APaCT7yADWMro5ndx7qkqULK0Hb/FpcagcoaWCjbQhZ
 yb9qX2kv3y0=
Received: from keelia.au.ibm.com (ppp203-122-213-247.static.internode.on.net
 [203.122.213.247])
 (using TLSv1 with cipher AES128-SHA (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: andrew@aj.id.au)
 by homiemail-a76.g.dreamhost.com (Postfix) with ESMTPSA id 6C11D45807C;
 Tue, 23 Feb 2016 06:45:20 -0800 (PST)
From: Andrew Jeffery <andrew@aj.id.au>
To: OpenBMC <openbmc@lists.ozlabs.org>
Subject: [PATCH v3 5/6] openbmc: Lift mkfs opts to variables and use OVERRIDES
 capability
Date: Wed, 24 Feb 2016 01:15:02 +1030
Message-Id: <1456238703-11117-6-git-send-email-andrew@aj.id.au>
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
X-List-Received-Date: Tue, 23 Feb 2016 14:45:22 -0000

Moves the ext4-specific mkfs options out to configuration variables.
OVERLAY_MKFS_OPTS can be overridden using the usual bitbake OVERRIDES
mechanism, where the override postfix is 'rwfs-${OVERLAY_BASETYPE}',
e.g. rwfs-ext4.

Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
---
 .../classes/obmc-phosphor-image_types_uboot.bbclass          | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/meta-phosphor/classes/obmc-phosphor-image_types_uboot.bbclass b/meta-phosphor/classes/obmc-phosphor-image_types_uboot.bbclass
index 96193a3..f75cdc1 100644
--- a/meta-phosphor/classes/obmc-phosphor-image_types_uboot.bbclass
+++ b/meta-phosphor/classes/obmc-phosphor-image_types_uboot.bbclass
@@ -23,6 +23,12 @@ FLASH_ROFS_OFFSET ?= "4864"
 FLASH_RWFS_OFFSET ?= "28672"
 RWFS_SIZE ?= "4096"
 
+# Avoid setting 'ext4' or 'jffs2' in OVERRIDES as this breaks the build. Prefix
+# with 'rwfs-' to avoid option collisions.
+DISTROOVERRIDES .= ":rwfs-${OVERLAY_BASETYPE}"
+
+OVERLAY_MKFS_OPTS_rwfs-ext4 = "-b 4096 -F -O^huge_file"
+
 # $(( ${FLASH_SIZE} - ${FLASH_RWFS_OFFSET} ))
 
 # IMAGE_POSTPROCESS_COMMAND += "do_generate_flash"
@@ -58,8 +64,12 @@ do_generate_flash() {
        fi
 
        oe_mkimage  "${initrd}" "${INITRD_CTYPE}" || bbfatal "oe_mkimage initrd"
+
        mk_nor_image ${ddir}/${rwfs} ${RWFS_SIZE}
-       mkfs.${OVERLAY_BASETYPE} -b 4096 -F -O^huge_file ${ddir}/${rwfs} || bbfatal "mkfs rwfs"
+       if [ "${OVERLAY_BASETYPE}" != jffs2 ]; then
+              mkfs.${OVERLAY_BASETYPE} ${OVERLAY_MKFS_OPTS} ${ddir}/${rwfs} || \
+                     bbfatal "mkfs rwfs"
+       fi
 
        dst="${ddir}/${FLASH_IMAGE_NAME}"
        rm -rf $dst
-- 
2.5.0
