Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 09A1B1A045E
 for <openbmc@lists.ozlabs.org>; Fri,  4 Mar 2016 02:40:46 +1100 (AEDT)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1457019639877642.3266322196936;
 Thu, 3 Mar 2016 07:40:39 -0800 (PST)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH phosphor-networkd] netman and userman throws exceptions and
 other bugfixes.
Date: Thu,  3 Mar 2016 09:40:37 -0600
Message-Id: <1457019638-25601-1-git-send-email-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Thu, 03 Mar 2016 15:40:47 -0000

https://github.com/openbmc/phosphor-networkd/pull/12

Hariharasubramanian R (1):
  netman and userman throws exceptions and other bugfixes.

 netman.py  | 168 ++++++++++++++++++++++++++++++++++++++++++-------------------
 userman.py |  44 +++++++++-------
 2 files changed, 141 insertions(+), 71 deletions(-)
 mode change 100755 => 100644 userman.py

-- 
2.7.1
