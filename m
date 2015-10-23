Return-Path: <patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 99FEF1A04DE
 for <openbmc@lists.ozlabs.org>; Sat, 24 Oct 2015 09:39:53 +1100 (AEDT)
Received: from localhost (32.97.110.55 [32.97.110.55]) by mx.zohomail.com
 with SMTPS id 1445639989178939.2537169134871;
 Fri, 23 Oct 2015 15:39:49 -0700 (PDT)
From: OpenBMC Patches <patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Cc: OpenBMC Patches <patches@stwcx.xyz>
Subject: [PATCH phosphor-host-ipmid v2] 1Add Get Device UUID
Date: Fri, 23 Oct 2015 17:25:13 -0500
Message-Id: <1445639114-8724-1-git-send-email-patches@stwcx.xyz>
X-Mailer: git-send-email 2.6.0
X-ZohoMail: Ss  SS_10 UW1 CHF_KNW_WHT_EXT  SGR4_1_19105_2
X-ZohoMail-Owner: <1445639114-8724-1-git-send-email-patches@stwcx.xyz>+zmo_0_<patches@stwcx.xyz>
X-ZohoMail-Sender: 32.97.110.55
X-Zoho-Virus-Status: 2
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
X-List-Received-Date: Fri, 23 Oct 2015 22:39:54 -0000

https://github.com/openbmc/phosphor-host-ipmid/pull/13

Adriana Kobylak (1):
  Add Get Device UUID

 apphandler.C | 90 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 apphandler.h |  1 +
 ipmid-api.h  |  7 +++--
 3 files changed, 95 insertions(+), 3 deletions(-)

-- 
2.6.0
