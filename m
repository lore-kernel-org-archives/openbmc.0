Return-Path: <patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id A86A31A0979
 for <openbmc@lists.ozlabs.org>; Wed, 14 Oct 2015 01:30:46 +1100 (AEDT)
Received: from localhost (32.97.110.55 [32.97.110.55]) by mx.zohomail.com
 with SMTPS id 1444746639688274.6165774617598;
 Tue, 13 Oct 2015 07:30:39 -0700 (PDT)
From: OpenBMC Patches <patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH openbmc 0/3] A couple more changes for flash images.
Date: Tue, 13 Oct 2015 09:30:34 -0500
Message-Id: <1444746637-10175-1-git-send-email-patches@stwcx.xyz>
X-Mailer: git-send-email 2.6.0
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
X-List-Received-Date: Tue, 13 Oct 2015 14:30:47 -0000

https://github.com/openbmc/openbmc/pull/16

Brad Bishop (3):
  Use lzma compression for rootfs
  Fix initrd load address
  Palmetto u-boot console fixes

 .../recipes-bsp/u-boot/files/patch-2013.07/0001-u-boot-openbmc.patch  | 4 ++--
 meta-phosphor/classes/obmc-phosphor-image_types_uboot.bbclass         | 2 +-
 meta-phosphor/conf/machine/include/obmc-bsp-common.inc                | 2 +-
 3 files changed, 4 insertions(+), 4 deletions(-)

-- 
2.6.0
