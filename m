Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id CF3EF1A05EB
 for <openbmc@lists.ozlabs.org>; Sun, 24 Jan 2016 11:10:24 +1100 (AEDT)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1453594220779326.4562572947443;
 Sat, 23 Jan 2016 16:10:20 -0800 (PST)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH openbmc] Resolve relocation warnings with build
Date: Sat, 23 Jan 2016 18:10:19 -0600
Message-Id: <1453594220-11674-1-git-send-email-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Sun, 24 Jan 2016 00:10:26 -0000

Yocto's QA service identified issues with the build
The -fpic option was not included in .so files.
Resovles issue https://github.com/openbmc/openbmc/issues/105

https://github.com/openbmc/openbmc/pull/145

Chris Austen (1):
  Resolve relocation warnings with build

 meta-phosphor/common/recipes-phosphor/host-ipmid/host-ipmid-fru.bb | 2 +-
 meta-phosphor/common/recipes-phosphor/host-ipmid/host-ipmid-oem.bb | 1 +
 meta-phosphor/common/recipes-phosphor/host-ipmid/host-ipmid.bb     | 3 +++
 3 files changed, 5 insertions(+), 1 deletion(-)

-- 
2.6.4
