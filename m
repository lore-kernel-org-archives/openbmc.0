Return-Path: <patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id B43211A01D6
 for <openbmc@lists.ozlabs.org>; Wed, 21 Oct 2015 08:40:57 +1100 (AEDT)
Received: from localhost (108-215-4-10.lightspeed.austtx.sbcglobal.net
 [108.215.4.10]) by mx.zohomail.com
 with SMTPS id 144537725355789.10966262196848;
 Tue, 20 Oct 2015 14:40:53 -0700 (PDT)
From: OpenBMC Patches <patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH openbmc 0/2] Move Skeleton up to latest and add devmem
Date: Tue, 20 Oct 2015 16:40:49 -0500
Message-Id: <1445377251-25832-1-git-send-email-patches@stwcx.xyz>
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
X-List-Received-Date: Tue, 20 Oct 2015 21:40:59 -0000

https://github.com/openbmc/openbmc/pull/27

Norman James (2):
  move up to latest commit
  add devmem utility

 meta-phosphor/common/recipes-phosphor/skeleton/skeleton.bb | 2 +-
 yocto-poky/meta/recipes-core/busybox/busybox/defconfig     | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

-- 
2.6.0
