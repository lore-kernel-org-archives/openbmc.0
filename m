Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3CCDF1A00AF
 for <openbmc@lists.ozlabs.org>; Tue, 19 Jan 2016 15:40:44 +1100 (AEDT)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1453178437602831.5593828144818;
 Mon, 18 Jan 2016 20:40:37 -0800 (PST)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Cc: Nan Li <bjlinan@cn.ibm.com>
Subject: [PATCH skeleton] skeleton: Add BMC coldReset() method to
 org.openbmc.control.Bmc dbus interface
Date: Mon, 18 Jan 2016 22:40:35 -0600
Message-Id: <1453178436-26125-1-git-send-email-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Tue, 19 Jan 2016 04:40:46 -0000

The host sends IPMI 'cold reset' command to reset BMC. Ipmid
calls the org.openbmc.control.Bmc::coldReset() to do reset.
coldReset() just invokes "reboot --force", which in effect
same as a 'cold' reset.

Signed-off-by: Nan Li <bjlinan@cn.ibm.com>

https://github.com/openbmc/skeleton/pull/29

William (1):
  skeleton: Add BMC coldReset() method to org.openbmc.control.Bmc dbus
    interface

 interfaces/openbmc_intf.c | 56 +++++++++++++++++++++++------------------------
 interfaces/openbmc_intf.h | 10 ++++-----
 objects/control_bmc_obj.c | 37 ++++++++++++++++++++++++++-----
 xml/openbmc_intf.xml      |  2 +-
 4 files changed, 66 insertions(+), 39 deletions(-)

-- 
2.6.4
