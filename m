Return-Path: <patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 54B441A03A4
 for <openbmc@lists.ozlabs.org>; Sat, 31 Oct 2015 07:18:02 +1100 (AEDT)
Received: from localhost (108-215-4-10.lightspeed.austtx.sbcglobal.net
 [108.215.4.10]) by mx.zohomail.com
 with SMTPS id 1446236278340991.2158911786365;
 Fri, 30 Oct 2015 13:17:58 -0700 (PDT)
From: OpenBMC Patches <patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH phosphor-host-ipmid v2] IPMI support for get and set lan
Date: Fri, 30 Oct 2015 15:17:55 -0500
Message-Id: <1446236276-24173-1-git-send-email-patches@stwcx.xyz>
X-Mailer: git-send-email 2.6.0
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
X-List-Received-Date: Fri, 30 Oct 2015 20:18:02 -0000

Add enough support to query common network parameters
and be able to setup the network vi IPMI.
Use command line for now.

https://github.com/openbmc/phosphor-host-ipmid/pull/26

Adriana Kobylak (1):
  IPMI support for get and set lan

 Makefile           |   1 +
 ipmid-api.h        |  20 +++---
 transporthandler.C | 200 +++++++++++++++++++++++++++++++++++++++++++++++++++++
 transporthandler.h |  18 +++++
 4 files changed, 229 insertions(+), 10 deletions(-)
 create mode 100644 transporthandler.C
 create mode 100644 transporthandler.h

-- 
2.6.0
