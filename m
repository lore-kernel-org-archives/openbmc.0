Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id D46551A08A4
 for <openbmc@lists.ozlabs.org>; Thu,  3 Dec 2015 15:40:28 +1100 (AEDT)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1449117621036654.976640251519;
 Wed, 2 Dec 2015 20:40:21 -0800 (PST)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH openbmc] Sprint 3 Candidate
Date: Wed,  2 Dec 2015 23:40:19 -0500
Message-Id: <1449117620-23382-1-git-send-email-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Thu, 03 Dec 2015 04:40:29 -0000

https://github.com/openbmc/openbmc/pull/114

Chris Austen (1):
  Sprint 3 Candidate

 meta-phosphor/common/recipes-phosphor/dbus/obmc-mapper.bb      | 4 +---
 meta-phosphor/common/recipes-phosphor/dbus/obmc-rest.bb        | 4 +---
 meta-phosphor/common/recipes-phosphor/host-ipmid/btbridged.bb  | 2 +-
 meta-phosphor/common/recipes-phosphor/host-ipmid/host-ipmid.bb | 2 +-
 meta-phosphor/common/recipes-phosphor/skeleton/skeleton.bb     | 2 +-
 5 files changed, 5 insertions(+), 9 deletions(-)

-- 
2.6.3
