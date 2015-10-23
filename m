Return-Path: <patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 2225E1A09A7
 for <openbmc@lists.ozlabs.org>; Sat, 24 Oct 2015 09:39:57 +1100 (AEDT)
Received: from localhost (32.97.110.55 [32.97.110.55]) by mx.zohomail.com
 with SMTPS id 1445639994892559.5466358694653;
 Fri, 23 Oct 2015 15:39:54 -0700 (PDT)
From: OpenBMC Patches <patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Cc: OpenBMC Patches <patches@stwcx.xyz>
Subject: [PATCH phosphor-host-ipmid v3] Add get sel time cmd
Date: Fri, 23 Oct 2015 17:39:51 -0500
Message-Id: <1445639992-11906-1-git-send-email-patches@stwcx.xyz>
X-Mailer: git-send-email 2.6.0
X-ZohoMail: Ss  SS_10 UW1 CHF_KNW_WHT_EXT  SGR4_1_19105_3
X-ZohoMail-Owner: <1445639992-11906-1-git-send-email-patches@stwcx.xyz>+zmo_0_<patches@stwcx.xyz>
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
X-List-Received-Date: Fri, 23 Oct 2015 22:39:58 -0000

Add support for storage ipmi function Add Get SEL Time

https://github.com/openbmc/phosphor-host-ipmid/pull/12

Adriana Kobylak (1):
  Add get sel time cmd

 storagehandler.C | 75 ++++++++++++++++++++++++++++++++++++++------------------
 storagehandler.h |  5 ++--
 2 files changed, 54 insertions(+), 26 deletions(-)

-- 
2.6.0
