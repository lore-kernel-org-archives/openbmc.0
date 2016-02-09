Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 638211A0193
 for <openbmc@lists.ozlabs.org>; Wed, 10 Feb 2016 00:00:37 +1100 (AEDT)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1455022833683263.2337173276612;
 Tue, 9 Feb 2016 05:00:33 -0800 (PST)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH phosphor-networkd 0/2] Flush and restart on set lan
Date: Tue,  9 Feb 2016 07:00:30 -0600
Message-Id: <1455022832-4842-1-git-send-email-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Tue, 09 Feb 2016 13:00:37 -0000

"ip addr flush" alone does not suffice while modifying/changing the IP address with a new one. Restarting the systemd-networkd additionally will result in applying the new IP address.

https://github.com/openbmc/phosphor-networkd/pull/7

Hariharasubramanian R (2):
  org.openbmc.NetworkManager : Bug fixes, SetHwAddress & EnableDHCP
  Flush IP addresses && restart systemd-networkd service after settting
    IP address.

 netman.py | 1 +
 1 file changed, 1 insertion(+)

-- 
2.6.4
