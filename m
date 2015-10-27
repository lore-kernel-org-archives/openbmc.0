Return-Path: <patches@stwcx.xyz>
Received: from sender-p126.zohomail.com (sender1.zohomail.com [74.201.84.157])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 755B41A0CE1
 for <openbmc@lists.ozlabs.org>; Wed, 28 Oct 2015 10:44:48 +1100 (AEDT)
Received: from localhost (32.97.110.52 [32.97.110.52]) by mx.zohomail.com
 with SMTPS id 1445979569906881.0400642582534;
 Tue, 27 Oct 2015 13:59:29 -0700 (PDT)
From: OpenBMC Patches <patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH phosphor-rest-server] REST server work in progress
Date: Tue, 27 Oct 2015 15:59:27 -0500
Message-Id: <1445979568-20445-1-git-send-email-patches@stwcx.xyz>
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
X-List-Received-Date: Tue, 27 Oct 2015 23:44:49 -0000

Supports:
 list, enumerate, attr, instance GET operations
 method, instance POST
 attr, instance PUT

https://github.com/openbmc/phosphor-rest-server/pull/1

Brad Bishop (1):
  REST server work in progress

 phosphor-rest | 342 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 setup.cfg     |   2 +
 setup.py      |   5 +
 3 files changed, 349 insertions(+)
 create mode 100644 phosphor-rest
 create mode 100644 setup.cfg
 create mode 100644 setup.py

-- 
2.6.0
