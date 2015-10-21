Return-Path: <patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id EC74A1A03C6
 for <openbmc@lists.ozlabs.org>; Wed, 21 Oct 2015 14:23:29 +1100 (AEDT)
Received: from localhost (108-215-4-10.lightspeed.austtx.sbcglobal.net
 [108.215.4.10]) by mx.zohomail.com
 with SMTPS id 1445397806096434.0903082991781;
 Tue, 20 Oct 2015 20:23:26 -0700 (PDT)
From: OpenBMC Patches <patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH phosphor-host-ipmid] add dynamic lookup of sensor types
Date: Tue, 20 Oct 2015 22:23:22 -0500
Message-Id: <1445397803-31424-1-git-send-email-patches@stwcx.xyz>
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
X-List-Received-Date: Wed, 21 Oct 2015 03:23:31 -0000

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
