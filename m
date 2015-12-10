Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3485A1A0F61
 for <openbmc@lists.ozlabs.org>; Thu, 10 Dec 2015 12:30:39 +1100 (AEDT)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1449711036669968.0340104505475;
 Wed, 9 Dec 2015 17:30:36 -0800 (PST)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH openbmc] Add flash copy commands to busybox
Date: Wed,  9 Dec 2015 19:30:35 -0600
Message-Id: <1449711036-9716-1-git-send-email-openbmc-patches@stwcx.xyz>
X-Mailer: git-send-email 2.6.3
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
X-List-Received-Date: Thu, 10 Dec 2015 01:30:39 -0000

This is useful for updating the bmc u-boot, kernel, etc.

https://github.com/openbmc/openbmc/pull/119

Milton D. Miller II (1):
  Add flash copy commands to busybox

 meta-phosphor/common/recipes-core/busybox/busybox/flash.cfg  | 4 ++++
 meta-phosphor/common/recipes-core/busybox/busybox_%.bbappend | 1 +
 2 files changed, 5 insertions(+)
 create mode 100644 meta-phosphor/common/recipes-core/busybox/busybox/flash.cfg

-- 
2.6.3
