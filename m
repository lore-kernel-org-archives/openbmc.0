Return-Path: <patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id AF1781A051F
 for <openbmc@lists.ozlabs.org>; Thu, 22 Oct 2015 13:32:19 +1100 (AEDT)
Received: from localhost (108-215-4-10.lightspeed.austtx.sbcglobal.net
 [108.215.4.10]) by mx.zohomail.com
 with SMTPS id 1445481136624145.11109428416796;
 Wed, 21 Oct 2015 19:32:16 -0700 (PDT)
From: OpenBMC Patches <patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH phosphor-objmgr v2] ObjectManager work in progress
Date: Wed, 21 Oct 2015 21:32:13 -0500
Message-Id: <1445481134-30158-1-git-send-email-patches@stwcx.xyz>
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
X-List-Received-Date: Thu, 22 Oct 2015 02:32:20 -0000

Supports:
 initial discovery
 service name ownership changes
 interfaces added and removed signals
 getobjs, getowners, getownersrecurse methods

https://github.com/openbmc/phosphor-objmgr/pull/1

Brad Bishop (1):
  ObjectManager work in progress

 Makefile         |  13 ++++
 object-mapper.py | 221 +++++++++++++++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 234 insertions(+)
 create mode 100644 Makefile
 create mode 100644 object-mapper.py

-- 
2.6.0
