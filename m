Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id F3AB11A03B0
 for <openbmc@lists.ozlabs.org>; Thu, 11 Feb 2016 07:00:35 +1100 (AEDT)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1455134432198676.4173018466712;
 Wed, 10 Feb 2016 12:00:32 -0800 (PST)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH openbmc] Updating network and user recipes.
Date: Wed, 10 Feb 2016 14:00:30 -0600
Message-Id: <1455134431-29383-1-git-send-email-openbmc-patches@stwcx.xyz>
X-Mailer: git-send-email 2.7.1
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
X-List-Received-Date: Wed, 10 Feb 2016 20:00:37 -0000

https://github.com/openbmc/openbmc/pull/173

Hariharasubramanian R (1):
  Updating network and user recipes.

 .../common/recipes-phosphor/network/network.bb      |  2 +-
 meta-phosphor/common/recipes-phosphor/user/user.bb  | 21 +++++++++++++++++++++
 .../common/recipes-phosphor/user/user/user.service  | 10 ++++++++++
 3 files changed, 32 insertions(+), 1 deletion(-)
 create mode 100644 meta-phosphor/common/recipes-phosphor/user/user.bb
 create mode 100644 meta-phosphor/common/recipes-phosphor/user/user/user.service

-- 
2.7.1
