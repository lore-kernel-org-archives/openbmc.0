Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FF2F1A0243
 for <openbmc@lists.ozlabs.org>; Fri,  5 Feb 2016 21:20:44 +1100 (AEDT)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 145466764064514.820188981635738;
 Fri, 5 Feb 2016 02:20:40 -0800 (PST)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH skeleton v2 0/2] Makefile changes to fix LED build failures in
 bitbake
Date: Fri,  5 Feb 2016 04:20:37 -0600
Message-Id: <1454667639-12905-1-git-send-email-openbmc-patches@stwcx.xyz>
X-Mailer: git-send-email 2.6.4
X-Zoho-Virus-Status: 1
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
X-List-Received-Date: Fri, 05 Feb 2016 10:20:45 -0000

https://github.com/openbmc/skeleton/pull/39

vishwa (2):
  Makefile changes to fix LED build failures in bitbake
  Makefile changes to fix LED build failures in bitbake

 Makefile                     |  6 ++++--
 objects/led_controller_new.c | 37 +++++++++++++++----------------------
 2 files changed, 19 insertions(+), 24 deletions(-)

-- 
2.6.4
