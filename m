Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 890C61A0190
 for <openbmc@lists.ozlabs.org>; Wed, 10 Feb 2016 09:30:39 +1100 (AEDT)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 145505703603323.605486046682017;
 Tue, 9 Feb 2016 14:30:36 -0800 (PST)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH phosphor-host-ipmid v2 0/2] Get MAC address
Date: Tue,  9 Feb 2016 16:30:33 -0600
Message-Id: <1455057035-29247-1-git-send-email-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Tue, 09 Feb 2016 22:30:41 -0000

Support for Get MAC address command.
Address review comments from Set MAC command.

https://github.com/openbmc/phosphor-host-ipmid/pull/63

Adriana Kobylak (2):
  Get MAC address
  Address review comments for IPMI transport functions

 transporthandler.C | 129 ++++++++++++++++++++++++++++++-----------------------
 transporthandler.h |   9 ++++
 2 files changed, 83 insertions(+), 55 deletions(-)

-- 
2.7.1
