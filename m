Return-Path: <patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id B125C1A070C
 for <openbmc@lists.ozlabs.org>; Thu, 22 Oct 2015 13:31:46 +1100 (AEDT)
Received: from localhost (108-215-4-10.lightspeed.austtx.sbcglobal.net
 [108.215.4.10]) by mx.zohomail.com
 with SMTPS id 14454811039131023.1735291945233;
 Wed, 21 Oct 2015 19:31:43 -0700 (PDT)
From: OpenBMC Patches <patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH openbmc] Add devmem to busybox config.
Date: Wed, 21 Oct 2015 21:31:40 -0500
Message-Id: <1445481101-29721-1-git-send-email-patches@stwcx.xyz>
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
X-List-Received-Date: Thu, 22 Oct 2015 02:31:47 -0000

https://github.com/openbmc/openbmc/pull/31

Brad Bishop (1):
  Add devmem to busybox config.

 meta-phosphor/common/recipes-core/busybox/busybox/busybox.cfg | 1 +
 meta-phosphor/common/recipes-core/busybox/busybox_%.bbappend  | 2 ++
 meta-phosphor/common/recipes.txt                              | 1 +
 3 files changed, 4 insertions(+)
 create mode 100644 meta-phosphor/common/recipes-core/busybox/busybox/busybox.cfg
 create mode 100644 meta-phosphor/common/recipes-core/busybox/busybox_%.bbappend

-- 
2.6.0
