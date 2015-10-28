Return-Path: <patches@stwcx.xyz>
Received: from sender-p126.zohomail.com (sender-p126.zohomail.com
 [74.201.154.126])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id BDFF11A0475
 for <openbmc@lists.ozlabs.org>; Thu, 29 Oct 2015 10:25:06 +1100 (AEDT)
Received: from localhost (32.97.110.55 [32.97.110.55]) by mx.zohomail.com
 with SMTPS id 1446074703058968.8083279340045;
 Wed, 28 Oct 2015 16:25:03 -0700 (PDT)
From: OpenBMC Patches <patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH phosphor-host-ipmid v2] Reduce prints to journald from ipmi
 but keep ability to trace
Date: Wed, 28 Oct 2015 18:25:00 -0500
Message-Id: <1446074701-29034-1-git-send-email-patches@stwcx.xyz>
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
X-List-Received-Date: Wed, 28 Oct 2015 23:25:07 -0000

https://github.com/openbmc/phosphor-host-ipmid/pull/20

Chris Austen (1):
  Reduce prints to journald from ipmi but keep ability to trace

 ipmid.C | 91 ++++++++++++++++++++++++++++++++++++++---------------------------
 ipmid.H |  2 --
 2 files changed, 53 insertions(+), 40 deletions(-)

-- 
2.6.0
