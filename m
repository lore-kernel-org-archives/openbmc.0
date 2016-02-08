Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3DDC01A001D
 for <openbmc@lists.ozlabs.org>; Tue,  9 Feb 2016 10:40:31 +1100 (AEDT)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1454974828237351.0994076364685;
 Mon, 8 Feb 2016 15:40:28 -0800 (PST)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH phosphor-host-ipmid] Get MAC address
Date: Mon,  8 Feb 2016 17:40:26 -0600
Message-Id: <1454974827-10588-1-git-send-email-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Mon, 08 Feb 2016 23:40:32 -0000

Support for Get MAC address command.
Address review comments from Set MAC command.

https://github.com/openbmc/phosphor-host-ipmid/pull/63

Adriana Kobylak (1):
  Get MAC address

 transporthandler.C | 100 ++++++++++++++++++++++++++++++-----------------------
 transporthandler.h |   9 +++++
 2 files changed, 66 insertions(+), 43 deletions(-)

-- 
2.6.4
