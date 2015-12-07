Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 152F41A0175
 for <openbmc@lists.ozlabs.org>; Mon,  7 Dec 2015 17:41:16 +1100 (AEDT)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1449470424761746.5239426767492;
 Sun, 6 Dec 2015 22:40:24 -0800 (PST)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH phosphor-host-ipmid v2] Host Services plugin support
Date: Mon,  7 Dec 2015 01:40:23 -0500
Message-Id: <1449470424-24743-1-git-send-email-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Mon, 07 Dec 2015 06:41:18 -0000

https://github.com/openbmc/phosphor-host-ipmid/pull/50

vishwa (1):
  Host Services plugin support

 Makefile        |  12 +++-
 host-services.c | 171 +++++++++++++++++++++++++++++++-------------------------
 ipmid-api.h     |   1 +
 ipmid.C         |  14 ++---
 4 files changed, 111 insertions(+), 87 deletions(-)

-- 
2.6.3
