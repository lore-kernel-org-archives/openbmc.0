Return-Path: <patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 6111D1A03C0
 for <openbmc@lists.ozlabs.org>; Thu, 22 Oct 2015 03:22:13 +1100 (AEDT)
Received: from localhost (32.97.110.55 [32.97.110.55]) by mx.zohomail.com
 with SMTPS id 1445444528625862.5803877839992;
 Wed, 21 Oct 2015 09:22:08 -0700 (PDT)
From: OpenBMC Patches <patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH openbmc] remove systembus.patch
Date: Wed, 21 Oct 2015 11:22:06 -0500
Message-Id: <1445444527-27634-1-git-send-email-patches@stwcx.xyz>
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
X-List-Received-Date: Wed, 21 Oct 2015 16:22:14 -0000

patch no longer applies; source was already changed in skeleton repository

https://github.com/openbmc/openbmc/pull/30

Edward A. James (1):
  remove systembus.patch

 .../recipes-phosphor/host-ipmid/host-ipmi-hw-example.bb       |  1 -
 .../host-ipmid/host-ipmi-hw-example/systembus.patch           | 11 -----------
 2 files changed, 12 deletions(-)
 delete mode 100644 meta-phosphor/common/recipes-phosphor/host-ipmid/host-ipmi-hw-example/systembus.patch

-- 
2.6.0
