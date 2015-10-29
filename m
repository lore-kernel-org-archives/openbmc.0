Return-Path: <patches@stwcx.xyz>
Received: from sender-p126.zohomail.com (sender-p126.zohomail.com
 [74.201.154.126])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 554B41A041D
 for <openbmc@lists.ozlabs.org>; Thu, 29 Oct 2015 11:12:34 +1100 (AEDT)
Received: from localhost (32.97.110.55 [32.97.110.55]) by mx.zohomail.com
 with SMTPS id 1446077550737510.1318712679148;
 Wed, 28 Oct 2015 17:12:30 -0700 (PDT)
From: OpenBMC Patches <patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH phosphor-host-ipmid v3] Reduce prints to journald from ipmi
 but keep ability to trace
Date: Wed, 28 Oct 2015 19:12:28 -0500
Message-Id: <1446077549-14268-1-git-send-email-patches@stwcx.xyz>
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
X-List-Received-Date: Thu, 29 Oct 2015 00:12:35 -0000

https://github.com/openbmc/phosphor-host-ipmid/pull/20

Chris Austen (1):
  Reduce prints to journald from ipmi but keep ability to trace    
    support for hex values with cli argument

 ipmid.C | 91 ++++++++++++++++++++++++++++++++++++++---------------------------
 ipmid.H |  2 --
 2 files changed, 53 insertions(+), 40 deletions(-)

-- 
2.6.0
