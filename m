Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4A65B1A0075
 for <openbmc@lists.ozlabs.org>; Sat, 16 Jan 2016 17:31:23 +1100 (AEDT)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1452925878965991.0572051978182;
 Fri, 15 Jan 2016 22:31:18 -0800 (PST)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH skeleton] skeleton: Add BMC cold_reset() method to
 org.openbmc.control.Bmc dbus interface
Date: Sat, 16 Jan 2016 00:31:17 -0600
Message-Id: <1452925878-19525-1-git-send-email-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Sat, 16 Jan 2016 06:31:25 -0000

The host sends IPMI 'cold reset' command to reset BMC. Ipmid
calls the org.openbmc.control.Bmc::cold_reset() to do reset.
cold_reset() just invoke "reboot --force", which in effect
same as a 'cold' reset.

https://github.com/openbmc/skeleton/pull/28

William (1):
  skeleton: Add BMC cold_reset() method to org.openbmc.control.Bmc dbus
    interface

 interfaces/openbmc_intf.c | 56 +++++++++++++++++++++++------------------------
 interfaces/openbmc_intf.h | 10 ++++-----
 objects/control_bmc_obj.c | 35 +++++++++++++++++++++++++----
 xml/openbmc_intf.xml      |  2 +-
 4 files changed, 65 insertions(+), 38 deletions(-)

-- 
2.6.4
