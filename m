Return-Path: <patches@stwcx.xyz>
Received: from sender-p126.zohomail.com (sender1.zohomail.com [74.201.84.157])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3E2E11A0A8C
 for <openbmc@lists.ozlabs.org>; Wed, 28 Oct 2015 11:30:03 +1100 (AEDT)
Received: from localhost (32.97.110.52 [32.97.110.52]) by mx.zohomail.com
 with SMTPS id 144598361325733.20772576332115;
 Tue, 27 Oct 2015 15:06:53 -0700 (PDT)
From: OpenBMC Patches <patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH phosphor-host-ipmid v3] 1Add Get Device UUID
Date: Tue, 27 Oct 2015 17:06:50 -0500
Message-Id: <1445983611-2785-1-git-send-email-patches@stwcx.xyz>
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
X-List-Received-Date: Wed, 28 Oct 2015 00:30:04 -0000

https://github.com/openbmc/phosphor-host-ipmid/pull/13

Adriana Kobylak (1):
  Add Get Device UUID

 apphandler.C | 92 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 apphandler.h |  1 +
 ipmid-api.h  |  7 +++--
 3 files changed, 97 insertions(+), 3 deletions(-)

-- 
2.6.0
