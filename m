Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 5B8ED1A0A85
 for <openbmc@lists.ozlabs.org>; Sat, 14 Nov 2015 08:00:27 +1100 (AEDT)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1447448424395972.6040360099771;
 Fri, 13 Nov 2015 13:00:24 -0800 (PST)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH phosphor-host-ipmid] ipmid taking too many dbus connections
Date: Fri, 13 Nov 2015 16:00:22 -0500
Message-Id: <1447448423-12662-1-git-send-email-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Fri, 13 Nov 2015 21:00:27 -0000

https://github.com/openbmc/phosphor-host-ipmid/pull/38

Chris Austen (1):
  ipmid taking too many dbus connections

 ipmid-api.h     |  2 ++
 ipmid.C         | 11 ++++++++---
 storageaddsel.C | 11 +----------
 3 files changed, 11 insertions(+), 13 deletions(-)

-- 
2.6.3
