Return-Path: <patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 6A5E41A0312
 for <openbmc@lists.ozlabs.org>; Fri, 23 Oct 2015 05:00:25 +1100 (AEDT)
Received: from localhost (32.97.110.55 [32.97.110.55]) by mx.zohomail.com
 with SMTPS id 1445536822535897.477096337625;
 Thu, 22 Oct 2015 11:00:22 -0700 (PDT)
From: OpenBMC Patches <patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH skeleton] Support for stop watchdog
Date: Thu, 22 Oct 2015 13:00:20 -0500
Message-Id: <1445536821-14903-1-git-send-email-patches@stwcx.xyz>
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
X-List-Received-Date: Thu, 22 Oct 2015 18:00:25 -0000

Add interface to stop the currently running watchdog if any.

https://github.com/openbmc/skeleton/pull/6

Adriana Kobylak (1):
  Support for stop watchdog

 bin/ipmi_example.py         |  4 ++++
 objects/host_watchdog_obj.c | 25 +++++++++++++++++++++++--
 2 files changed, 27 insertions(+), 2 deletions(-)

-- 
2.6.0
