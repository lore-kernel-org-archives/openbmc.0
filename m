Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id DE9C71A0290
 for <openbmc@lists.ozlabs.org>; Sat,  6 Feb 2016 13:10:31 +1100 (AEDT)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1454724627421773.7418706938015;
 Fri, 5 Feb 2016 18:10:27 -0800 (PST)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH phosphor-host-ipmid] Add minimal support for ipmitool
Date: Fri,  5 Feb 2016 20:10:25 -0600
Message-Id: <1454724626-7200-1-git-send-email-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Sat, 06 Feb 2016 02:10:33 -0000

Adding just a couple of ipmi commands that ipmitool always calls.
I'm doing this because in order to run the ipmitool lan 1 <parms>
instead of just the raw command the get channel info was needed.

https://github.com/openbmc/phosphor-host-ipmid/pull/62

Chris Austen (1):
  Add minimal support for ipmitool

 Makefile     |  3 ++-
 apphandler.C | 44 ++++++++++++++++++++++++++++++++++++++++++++
 apphandler.h |  2 ++
 groupext.C   | 31 +++++++++++++++++++++++++++++++
 ipmid-api.h  |  1 +
 5 files changed, 80 insertions(+), 1 deletion(-)
 create mode 100644 groupext.C

-- 
2.6.4
