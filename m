Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 84E651A0392
 for <openbmc@lists.ozlabs.org>; Tue,  8 Mar 2016 05:30:57 +1100 (AEDT)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1457375452797214.35282998438686;
 Mon, 7 Mar 2016 10:30:52 -0800 (PST)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH phosphor-networkd v2] netman and userman throws exceptions and
 other bugfixes.
Date: Mon,  7 Mar 2016 12:30:50 -0600
Message-Id: <1457375451-32512-1-git-send-email-openbmc-patches@stwcx.xyz>
X-Mailer: git-send-email 2.7.1
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
X-List-Received-Date: Mon, 07 Mar 2016 18:30:59 -0000

https://github.com/openbmc/phosphor-networkd/pull/12

Hariharasubramanian R (1):
  netman and userman throws exceptions and other bugfixes.

 netman.py  | 168 ++++++++++++++++++++++++++++++++++++++++++-------------------
 userman.py |  44 +++++++++-------
 2 files changed, 141 insertions(+), 71 deletions(-)
 mode change 100755 => 100644 userman.py

-- 
2.7.1
