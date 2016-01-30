Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 75C681A003C
 for <openbmc@lists.ozlabs.org>; Sat, 30 Jan 2016 18:40:44 +1100 (AEDT)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1454139638251900.1233585326178;
 Fri, 29 Jan 2016 23:40:38 -0800 (PST)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Cc: Nan Li <bjlinan@cn.ibm.com>
Subject: [PATCH skeleton v2] skeleton: Add BMC coldReset() method to
 org.openbmc.control.Bmc dbus interface
Date: Sat, 30 Jan 2016 01:40:36 -0600
Message-Id: <1454139637-1476-1-git-send-email-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Sat, 30 Jan 2016 07:40:45 -0000

The host sends IPMI 'cold reset' command to reset BMC. Ipmid
calls the org.openbmc.control.Bmc::coldReset() to do reset.
coldReset() just invokes "reboot --force", which in effect
same as a 'cold' reset.

Signed-off-by: Nan Li <bjlinan@cn.ibm.com>

https://github.com/openbmc/skeleton/pull/29

William (1):
  skeleton: Add BMC warmReset() method to org.openbmc.control.Bmc dbus
    interface

 bin/Barreleye.py          |  6 +++++
 bin/Palmetto.py           |  5 +++++
 interfaces/openbmc_intf.c | 56 +++++++++++++++++++++++------------------------
 interfaces/openbmc_intf.h | 10 ++++-----
 objects/control_bmc_obj.c | 39 ++++++++++++++++++++++++++++-----
 xml/openbmc_intf.xml      |  2 +-
 6 files changed, 78 insertions(+), 40 deletions(-)

-- 
2.6.4
