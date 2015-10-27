Return-Path: <patches@stwcx.xyz>
Received: from sender-p126.zohomail.com (sender-p126.zohomail.com
 [74.201.154.126])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id E2A4A1A034F
 for <openbmc@lists.ozlabs.org>; Wed, 28 Oct 2015 10:17:41 +1100 (AEDT)
Received: from localhost (32.97.110.52 [32.97.110.52]) by mx.zohomail.com
 with SMTPS id 1445979561785802.5547311165051;
 Tue, 27 Oct 2015 13:59:21 -0700 (PDT)
From: OpenBMC Patches <patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH phosphor-objmgr v3] ObjectManager work in progress
Date: Tue, 27 Oct 2015 15:59:19 -0500
Message-Id: <1445979560-20342-1-git-send-email-patches@stwcx.xyz>
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
X-List-Received-Date: Tue, 27 Oct 2015 23:17:42 -0000

Supports:
 initial discovery
 service name ownership changes
 interfaces added and removed signals
 getobjs, getowners, getownersrecurse methods

https://github.com/openbmc/phosphor-objmgr/pull/1

Brad Bishop (1):
  ObjectManager work in progress

 OpenBMCMapper.py |  27 +++++
 phosphor-mapper  | 338 +++++++++++++++++++++++++++++++++++++++++++++++++++++++
 setup.cfg        |   2 +
 setup.py         |   6 +
 4 files changed, 373 insertions(+)
 create mode 100644 OpenBMCMapper.py
 create mode 100644 phosphor-mapper
 create mode 100644 setup.cfg
 create mode 100644 setup.py

-- 
2.6.0
