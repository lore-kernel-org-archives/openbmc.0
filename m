Return-Path: <patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 6F7361A0026
 for <openbmc@lists.ozlabs.org>; Thu,  8 Oct 2015 11:20:27 +1100 (AEDT)
Received: from localhost (32.97.110.52 [32.97.110.52]) by mx.zohomail.com
 with SMTPS id 1444262670564541.1360856158727;
 Wed, 7 Oct 2015 17:04:30 -0700 (PDT)
From: OpenBMC Patches <patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH phosphor-host-ipmid 0/3] Initial IPMI Net Function router
Date: Wed,  7 Oct 2015 19:04:26 -0500
Message-Id: <1444262669-18679-1-git-send-email-patches@stwcx.xyz>
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
X-List-Received-Date: Thu, 08 Oct 2015 00:20:28 -0000

https://github.com/openbmc/phosphor-host-ipmid/pull/1

vishwabmc (3):
  Initial IPMI Net Function router
  Patch set-2 for IPMI function router
  Patch set-3 for IPMI function router

 Makefile      |  24 +++++
 apphandler.C  |  58 +++++++++++
 apphandler.H  |  32 ++++++
 apphandler.h  |  11 ++
 ipmid-api.h   |  91 ++++++++++++++++
 ipmid.C       | 329 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 ipmid.H       |  15 +++
 ipmidcommon.H |  63 +++++++++++
 8 files changed, 623 insertions(+)
 create mode 100755 Makefile
 create mode 100755 apphandler.C
 create mode 100644 apphandler.H
 create mode 100644 apphandler.h
 create mode 100755 ipmid-api.h
 create mode 100644 ipmid.C
 create mode 100755 ipmid.H
 create mode 100755 ipmidcommon.H

-- 
2.6.0
