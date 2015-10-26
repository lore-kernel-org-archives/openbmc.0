Return-Path: <patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 389CC1A0900
 for <openbmc@lists.ozlabs.org>; Mon, 26 Oct 2015 12:40:12 +1100 (AEDT)
Received: from localhost (108-215-4-10.lightspeed.austtx.sbcglobal.net
 [108.215.4.10]) by mx.zohomail.com
 with SMTPS id 1445823607131943.5438324816042;
 Sun, 25 Oct 2015 18:40:07 -0700 (PDT)
From: OpenBMC Patches <patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Cc: OpenBMC Patches <patches@stwcx.xyz>
Subject: [PATCH phosphor-host-ipmid] Allow esels to be sent to dbus event log
Date: Sun, 25 Oct 2015 20:40:04 -0500
Message-Id: <1445823605-7513-1-git-send-email-patches@stwcx.xyz>
X-Mailer: git-send-email 2.6.0
X-ZohoMail: Ss  SS_10 UW1 CHF_KNW_WHT_EXT  SGR4_1_19105_3
X-ZohoMail-Owner: <1445823605-7513-1-git-send-email-patches@stwcx.xyz>+zmo_0_<patches@stwcx.xyz>
X-ZohoMail-Sender: 108.215.4.10
X-Zoho-Virus-Status: 2
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
X-List-Received-Date: Mon, 26 Oct 2015 01:40:12 -0000

https://github.com/openbmc/phosphor-host-ipmid/pull/22

Chris Austen (1):
  Allow esels to be sent to dbus event log

 Makefile         |  11 ++-
 ipmid.C          |   6 +-
 ipmid.H          |   5 +
 storageaddsel.C  | 280 +++++++++++++++++++++++++++++++++++++++++++++++++++++++
 storageaddsel.h  |   3 +
 storagehandler.C |  24 ++---
 storagehandler.h |  12 +++
 testaddsel.C     | 107 +++++++++++++++++++++
 8 files changed, 431 insertions(+), 17 deletions(-)
 create mode 100644 storageaddsel.C
 create mode 100644 storageaddsel.h
 create mode 100644 testaddsel.C

-- 
2.6.0
