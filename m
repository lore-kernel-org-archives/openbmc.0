Return-Path: <andrew@aj.id.au>
Received: from homiemail-a76.g.dreamhost.com (sub3.mail.dreamhost.com
 [69.163.253.7])
 by lists.ozlabs.org (Postfix) with ESMTP id E0C531A0409
 for <openbmc@lists.ozlabs.org>; Wed, 24 Feb 2016 01:45:20 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b=bsZsjmJ8; 
 dkim-atps=neutral
Received: from homiemail-a76.g.dreamhost.com (localhost [127.0.0.1])
 by homiemail-a76.g.dreamhost.com (Postfix) with ESMTP id EC390458085;
 Tue, 23 Feb 2016 06:45:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=aj.id.au; h=from:to:cc
 :subject:date:message-id:in-reply-to:references; s=aj.id.au; bh=
 inrE1ezLPxPAzX7shfUYvElNIkQ=; b=bsZsjmJ8bxJed0AneBjlIvWlB6mBMGtK
 Wtf0/Zgl/FQIwpu1+3gz9z1KT2/DO4i7OP2wD3jDRnDZVbnO9HkP82Ci6fQ0JgZc
 smxY2RfYF1d4upUc+3XKEZ5cbGoQHzO6MKk81o6gOdiJaTh7Gb9nCK/gSVAGzQGz
 1Vsc3hhujqM=
Received: from keelia.au.ibm.com (ppp203-122-213-247.static.internode.on.net
 [203.122.213.247])
 (using TLSv1 with cipher AES128-SHA (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: andrew@aj.id.au)
 by homiemail-a76.g.dreamhost.com (Postfix) with ESMTPSA id 3C6B145807C;
 Tue, 23 Feb 2016 06:45:18 -0800 (PST)
From: Andrew Jeffery <andrew@aj.id.au>
To: OpenBMC <openbmc@lists.ozlabs.org>
Subject: [PATCH v3 4/6] openbmc: Generate images that erase empty NOR sections
Date: Wed, 24 Feb 2016 01:15:01 +1030
Message-Id: <1456238703-11117-5-git-send-email-andrew@aj.id.au>
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
X-List-Received-Date: Tue, 23 Feb 2016 14:45:21 -0000

Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
---
 meta-phosphor/classes/obmc-phosphor-image_types_uboot.bbclass | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/meta-phosphor/classes/obmc-phosphor-image_types_uboot.bbclass b/meta-phosphor/classes/obmc-phosphor-image_types_uboot.bbclass
index bf987bb..96193a3 100644
--- a/meta-phosphor/classes/obmc-phosphor-image_types_uboot.bbclass
+++ b/meta-phosphor/classes/obmc-phosphor-image_types_uboot.bbclass
@@ -27,6 +27,13 @@ RWFS_SIZE ?= "4096"
 
 # IMAGE_POSTPROCESS_COMMAND += "do_generate_flash"
 
+mk_nor_image() {
+       image_dst="$1"
+       image_size_kb=$2
+       dd if=/dev/zero bs=1k count=${image_size_kb} \
+              | tr '\000' '\377' > ${image_dst}
+}
+
 do_generate_flash() {
        INITRD_CTYPE=${INITRAMFS_CTYPE}
        ddir="${DEPLOY_DIR_IMAGE}"
@@ -51,12 +58,12 @@ do_generate_flash() {
        fi
 
        oe_mkimage  "${initrd}" "${INITRD_CTYPE}" || bbfatal "oe_mkimage initrd"
-       dd if=/dev/zero of=${ddir}/${rwfs} bs=1k count=${RWFS_SIZE}
+       mk_nor_image ${ddir}/${rwfs} ${RWFS_SIZE}
        mkfs.${OVERLAY_BASETYPE} -b 4096 -F -O^huge_file ${ddir}/${rwfs} || bbfatal "mkfs rwfs"
 
        dst="${ddir}/${FLASH_IMAGE_NAME}"
        rm -rf $dst
-       dd if=/dev/zero of=${dst} bs=1k count=${FLASH_SIZE}
+       mk_nor_image ${dst} ${FLASH_SIZE}
        dd if=${ddir}/${uboot} of=${dst} bs=1k seek=${FLASH_UBOOT_OFFSET}
        dd if=${ddir}/${kernel} of=${dst} bs=1k seek=${FLASH_KERNEL_OFFSET}
        dd if=${ddir}/${uinitrd} of=${dst} bs=1k seek=${FLASH_INITRD_OFFSET}
-- 
2.5.0
