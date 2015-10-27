Return-Path: <patches@stwcx.xyz>
Received: from sender-p126.zohomail.com (sender-p126.zohomail.com
 [74.201.154.126])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 221FD1A0410
 for <openbmc@lists.ozlabs.org>; Wed, 28 Oct 2015 10:42:07 +1100 (AEDT)
Received: from localhost (32.97.110.52 [32.97.110.52]) by mx.zohomail.com
 with SMTPS id 1445983629171580.2039448440946;
 Tue, 27 Oct 2015 15:07:09 -0700 (PDT)
From: OpenBMC Patches <patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH phosphor-objmgr v4] ObjectManager work in progress
Date: Tue, 27 Oct 2015 17:07:06 -0500
Message-Id: <1445983627-2947-1-git-send-email-patches@stwcx.xyz>
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
X-List-Received-Date: Tue, 27 Oct 2015 23:42:08 -0000

Supports:
 initial discovery
 service name ownership changes
 interfaces added and removed signals
 getobjs, getowners, getownersrecurse methods

https://github.com/openbmc/phosphor-objmgr/pull/1

Brad Bishop (1):
  ObjectManager work in progress

 OpenBMCMapper.py |  43 +++++++
 phosphor-mapper  | 338 +++++++++++++++++++++++++++++++++++++++++++++++++++++++
 setup.cfg        |   2 +
 setup.py         |   6 +
 4 files changed, 389 insertions(+)
 create mode 100644 OpenBMCMapper.py
 create mode 100644 phosphor-mapper
 create mode 100644 setup.cfg
 create mode 100644 setup.py

-- 
2.6.0
