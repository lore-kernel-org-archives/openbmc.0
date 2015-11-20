Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id DB51D1A0018
 for <openbmc@lists.ozlabs.org>; Fri, 20 Nov 2015 15:40:23 +1100 (AEDT)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1447994421441959.6195326189469;
 Thu, 19 Nov 2015 20:40:21 -0800 (PST)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH openbmc 0/2] switch back to in-tree device trees
Date: Thu, 19 Nov 2015 23:40:17 -0500
Message-Id: <1447994419-11491-1-git-send-email-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Fri, 20 Nov 2015 04:40:24 -0000

https://github.com/openbmc/openbmc/pull/89

Brad Bishop (2):
  Switch back to using in-tree Palmetto device tree
  Switch back to using in-tree Barreleye device tree

 .../meta-openpower/meta-ibm/meta-palmetto/conf/machine/palmetto.conf    | 2 +-
 .../meta-ibm/meta-palmetto/recipes-kernel/linux/linux-obmc_%.bbappend   | 2 +-
 .../meta-rackspace/meta-barreleye/conf/machine/barreleye.conf           | 2 +-
 .../meta-barreleye/recipes-kernel/linux/linux-obmc_%.bbappend           | 1 -
 4 files changed, 3 insertions(+), 4 deletions(-)

-- 
2.6.3
