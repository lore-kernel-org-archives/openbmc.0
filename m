Return-Path: <patrick@stwcx.xyz>
Received: from sender-of-o51.zoho.com (sender-of-o51.zoho.com [135.84.80.216])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3xDlt14X0vzDqxl
 for <openbmc@lists.ozlabs.org>; Sat, 22 Jul 2017 08:33:44 +1000 (AEST)
Received: from localhost (76-250-84-236.lightspeed.austtx.sbcglobal.net
 [76.250.84.236]) by mx.zohomail.com
 with SMTPS id 150067642045225.02876766468239;
 Fri, 21 Jul 2017 15:33:40 -0700 (PDT)
From: Patrick Williams <patrick@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH u-boot 0/1] RFC: How to configure boot options?
Date: Fri, 21 Jul 2017 17:33:25 -0500
Message-Id: <20170721223326.28674-1-patrick@stwcx.xyz>
X-Mailer: git-send-email 2.13.0
X-ZohoMailClient: External
X-ZohoMail: Z_56716065 SPT_1 Z_56716064 SPT_1 SLF_D
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Fri, 21 Jul 2017 22:33:46 -0000

As part of the change-over from an initramfs-based boot sequence to a
direct rootfs boot, we need to change some of the boot options for
u-boot.  I expect these to change a few times in the near future as we
also transition to UBI-managed volumes and we figure out how to set
u-boot environment options to switch between different UBI kernels and
rootfses.

This is really independent from the current ast-*-defconfigs, in that
those currently select between different network options.  I suspect
we do not N*M combinations of defconfigs for network*image-structure.
I plan to make a MACHINE_FEATURE (or DISTRO_FEATURE) in bitbake to
control this, but looking for feedback on how we should change u-boot.

Ideally, to me, this would have been passed in via the config file and
we could have used config-snippets in Yocto like we do for the kernel.
Due to the way u-boot builds, I could not find a simple way to even
change this option from a include/config/ast-common.h #define into a
machine_config driven option.

Anyone have ideas?

Patrick Williams (1):
  config/ast-common: hack bootopts

 include/configs/ast-common.h | 6 ++++++
 1 file changed, 6 insertions(+)

-- 
2.13.0
