Return-Path: <patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3881C1A08ED
 for <openbmc@lists.ozlabs.org>; Fri, 23 Oct 2015 05:43:53 +1100 (AEDT)
Received: from localhost (32.97.110.55 [32.97.110.55]) by mx.zohomail.com
 with SMTPS id 1445539431305865.3622653953055;
 Thu, 22 Oct 2015 11:43:51 -0700 (PDT)
From: OpenBMC Patches <patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH phosphor-host-ipmid] Support to stop the watchdog
Date: Thu, 22 Oct 2015 13:43:48 -0500
Message-Id: <1445539429-24258-1-git-send-email-patches@stwcx.xyz>
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
X-List-Received-Date: Thu, 22 Oct 2015 18:43:54 -0000

Check the request flags for the set watchdog command to determine
if the watchdog needs to be stopped or restarted.

https://github.com/openbmc/phosphor-host-ipmid/pull/21

Adriana Kobylak (1):
  Support to stop the watchdog

 apphandler.C | 19 +++++++++++++++++--
 1 file changed, 17 insertions(+), 2 deletions(-)

-- 
2.6.0
