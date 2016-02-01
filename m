Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id F2CA61A0166
 for <openbmc@lists.ozlabs.org>; Mon,  1 Feb 2016 15:40:25 +1100 (AEDT)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 145430162047358.082993540699476;
 Sun, 31 Jan 2016 20:40:20 -0800 (PST)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Cc: Norman James <nkskjames@gmail.com>
Subject: [PATCH openbmc] Create tarball of update files with correct names
Date: Sun, 31 Jan 2016 22:40:18 -0600
Message-Id: <1454301619-10500-1-git-send-email-openbmc-patches@stwcx.xyz>
X-Mailer: git-send-email 2.6.4
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
X-List-Received-Date: Mon, 01 Feb 2016 04:40:26 -0000

Creates 2 tarballs.  The file names match the /proc/mtd partition names.

1. Contains full flash image (image-bmc)
2. Contains image-u-boot, image-kernel, image-rofs, and image-initramfs

Signed-off-by: Norman James <nkskjames@gmail.com>

https://github.com/openbmc/openbmc/pull/154

Norman James (1):
  Create tarball of update files with correct names

 meta-phosphor/classes/obmc-phosphor-image_types_uboot.bbclass | 9 +++++++++
 1 file changed, 9 insertions(+)

-- 
2.6.4
