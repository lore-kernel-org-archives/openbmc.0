Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 2124F1A04B2
 for <openbmc@lists.ozlabs.org>; Wed, 18 Nov 2015 04:00:57 +1100 (AEDT)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1447779624154945.2485612580424;
 Tue, 17 Nov 2015 09:00:24 -0800 (PST)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH openbmc] Too many dbus connections
Date: Tue, 17 Nov 2015 12:00:22 -0500
Message-Id: <1447779623-3494-1-git-send-email-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Tue, 17 Nov 2015 17:00:58 -0000

This code reduces all ipmi connections to just 1

https://github.com/openbmc/openbmc/pull/83

Chris Austen (1):
  Too many dbus connections

 meta-phosphor/common/recipes-phosphor/host-ipmid/host-ipmid-fru.bb | 2 +-
 meta-phosphor/common/recipes-phosphor/host-ipmid/host-ipmid.bb     | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

-- 
2.6.3
