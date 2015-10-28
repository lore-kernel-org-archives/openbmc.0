Return-Path: <patches@stwcx.xyz>
Received: from sender-p126.zohomail.com (sender-p126.zohomail.com
 [74.201.154.126])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 05FA81A042A
 for <openbmc@lists.ozlabs.org>; Thu, 29 Oct 2015 09:04:26 +1100 (AEDT)
Received: from localhost (32.97.110.55 [32.97.110.55]) by mx.zohomail.com
 with SMTPS id 1446069861794129.4295825518958;
 Wed, 28 Oct 2015 15:04:21 -0700 (PDT)
From: OpenBMC Patches <patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH phosphor-host-ipmid v2 0/3] Allow esels to be sent to dbus
 event log
Date: Wed, 28 Oct 2015 17:04:17 -0500
Message-Id: <1446069860-19280-1-git-send-email-patches@stwcx.xyz>
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
X-List-Received-Date: Wed, 28 Oct 2015 22:04:27 -0000

https://github.com/openbmc/phosphor-host-ipmid/pull/22

Adriana Kobylak (2):
  Add Get Device UUID
  Add get sel time cmd

Chris Austen (1):
  Allow esels to be sent to dbus event log     switched to find_if
    vectoring     moved const structure to dynamic length

 Makefile         |  17 +++-
 ipmid.C          |   6 +-
 ipmid.H          |   5 ++
 storageaddsel.C  | 255 +++++++++++++++++++++++++++++++++++++++++++++++++++++++
 storageaddsel.h  |   3 +
 storagehandler.C |  24 +++---
 storagehandler.h |  12 +++
 testaddsel.C     | 107 +++++++++++++++++++++++
 8 files changed, 410 insertions(+), 19 deletions(-)
 create mode 100644 storageaddsel.C
 create mode 100644 storageaddsel.h
 create mode 100644 testaddsel.C

-- 
2.6.0
