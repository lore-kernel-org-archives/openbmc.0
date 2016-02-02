Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id B55DC1A0202
 for <openbmc@lists.ozlabs.org>; Wed,  3 Feb 2016 05:10:37 +1100 (AEDT)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1454436633401631.3953187435261;
 Tue, 2 Feb 2016 10:10:33 -0800 (PST)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH phosphor-networkd] org.openbmc.NetworkManager : Bug fixes,
 SetHwAddress & EnableDHCP
Date: Tue,  2 Feb 2016 12:10:31 -0600
Message-Id: <1454436632-30694-1-git-send-email-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Tue, 02 Feb 2016 18:10:39 -0000

https://github.com/openbmc/phosphor-networkd/pull/5

Hariharasubramanian R (1):
  org.openbmc.NetworkManager : Bug fixes, SetHwAddress & EnableDHCP

 netman.py | 324 ++++++++++++++++++++++++++++++++++----------------------------
 1 file changed, 178 insertions(+), 146 deletions(-)

-- 
2.6.4
