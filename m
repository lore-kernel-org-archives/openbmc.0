Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id D27A51A01B2
 for <openbmc@lists.ozlabs.org>; Sun, 22 Nov 2015 05:10:30 +1100 (AEDT)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1448129425472672.4405404910057;
 Sat, 21 Nov 2015 10:10:25 -0800 (PST)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH phosphor-host-ipmid v2] IPMI soft power off
Date: Sat, 21 Nov 2015 13:10:23 -0500
Message-Id: <1448129424-11374-1-git-send-email-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Sat, 21 Nov 2015 18:10:31 -0000

https://github.com/openbmc/phosphor-host-ipmid/pull/41

vishwa (1):
  IPMI soft power off

 Makefile         |   5 +--
 apphandler.C     |  67 +++++++++++++++++++++++++++++--
 apphandler.h     |  33 ++++++++++++++-
 chassishandler.C |  85 ++++++++++++++++++++++++++++++++++++++-
 chassishandler.h |  15 +++++++
 host-services.c  | 119 +++++++++++++++++++++++++++++++++++++++++++++++++++++++
 host-services.h  |   3 ++
 ipmid-api.h      |   4 +-
 ipmid.C          |   6 ++-
 ipmid.H          |   1 +
 10 files changed, 325 insertions(+), 13 deletions(-)
 create mode 100644 host-services.c
 create mode 100644 host-services.h

-- 
2.6.3
