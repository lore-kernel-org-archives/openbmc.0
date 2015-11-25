Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 072E31A033E
 for <openbmc@lists.ozlabs.org>; Wed, 25 Nov 2015 18:10:28 +1100 (AEDT)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1448435425699617.7553324693004;
 Tue, 24 Nov 2015 23:10:25 -0800 (PST)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH phosphor-host-ipmid 0/7] Warning fixes
Date: Wed, 25 Nov 2015 02:10:17 -0500
Message-Id: <1448435424-9067-1-git-send-email-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Wed, 25 Nov 2015 07:10:30 -0000

One real bug, a bunch of unused variables and a missing header.

https://github.com/openbmc/phosphor-host-ipmid/pull/45

Joel Stanley (7):
  Remove unused variables and labels
  ipmid-api: wrap in extern "C"
  host-services: Add ipmid-api header
  sensorhandler: remove unused variable
  another unused var
  apphandler: Remove out of bounds array access
  Makefile: build with -Wall

 Makefile           |  3 +++
 apphandler.C       |  3 +--
 host-services.c    |  4 +++-
 ipmid-api.h        | 15 +++++++++++----
 ipmid.C            |  6 ++----
 sensorhandler.C    |  3 ---
 storageaddsel.C    |  4 +---
 transporthandler.C |  2 --
 8 files changed, 21 insertions(+), 19 deletions(-)

-- 
2.6.3
