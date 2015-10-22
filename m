Return-Path: <patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 8C0641A051F
 for <openbmc@lists.ozlabs.org>; Thu, 22 Oct 2015 13:32:10 +1100 (AEDT)
Received: from localhost (108-215-4-10.lightspeed.austtx.sbcglobal.net
 [108.215.4.10]) by mx.zohomail.com
 with SMTPS id 1445481127489862.5915146397127;
 Wed, 21 Oct 2015 19:32:07 -0700 (PDT)
From: OpenBMC Patches <patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH phosphor-host-ipmid v2] add dynamic lookup of sensor types
Date: Wed, 21 Oct 2015 21:32:04 -0500
Message-Id: <1445481125-30036-1-git-send-email-patches@stwcx.xyz>
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
X-List-Received-Date: Thu, 22 Oct 2015 02:32:11 -0000

Why yes the testit file does need to compile Chris

https://github.com/openbmc/phosphor-host-ipmid/pull/15

Chris Austen (1):
  add dynamic lookup of sensor types

 ipmid.C         |  79 ++++++++++++++---------
 ipmisensor.C    |  22 +++----
 sensorhandler.C | 194 +++++++++++++++++++++-----------------------------------
 sensorhandler.h |  14 ++++
 testit.C        |   9 +--
 5 files changed, 146 insertions(+), 172 deletions(-)

-- 
2.6.0
