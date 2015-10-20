Return-Path: <patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4395D1A06C1
 for <openbmc@lists.ozlabs.org>; Wed, 21 Oct 2015 06:20:53 +1100 (AEDT)
Received: from localhost (108-215-4-10.lightspeed.austtx.sbcglobal.net
 [108.215.4.10]) by mx.zohomail.com
 with SMTPS id 1445368849554499.35999657977663;
 Tue, 20 Oct 2015 12:20:49 -0700 (PDT)
From: OpenBMC Patches <patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH phosphor-host-ipmid 0/3] Add get sel time cmd
Date: Tue, 20 Oct 2015 14:20:45 -0500
Message-Id: <1445368848-31548-1-git-send-email-patches@stwcx.xyz>
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
X-List-Received-Date: Tue, 20 Oct 2015 19:20:53 -0000

Add support for storage ipmi function Add Get SEL Time

https://github.com/openbmc/phosphor-host-ipmid/pull/12

Adriana Kobylak (3):
  Add App Set BMC Global Enables ipmi cmd
  Add get sel time cmd
  Add get sel time cmd

 apphandler.C     | 17 +++++++++++++
 apphandler.h     | 16 ++++++-------
 storagehandler.C | 72 +++++++++++++++++++++++++++++++++++++-------------------
 storagehandler.h |  5 ++--
 4 files changed, 76 insertions(+), 34 deletions(-)

-- 
2.6.0
