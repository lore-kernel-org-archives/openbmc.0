Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 0CCB81A1854
 for <openbmc@lists.ozlabs.org>; Thu, 21 Jan 2016 02:10:27 +1100 (AEDT)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1453302623067497.41340461190043;
 Wed, 20 Jan 2016 07:10:23 -0800 (PST)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH openbmc] Dbus API for systemd/networkd for network
 configuration.
Date: Wed, 20 Jan 2016 09:10:21 -0600
Message-Id: <1453302622-24191-1-git-send-email-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Wed, 20 Jan 2016 15:10:28 -0000

Added interfaces
  org.freedesktop.network1.Network &
  org.freedesktop.network1.Link 
on bus connection org.freedesktop.network1.

networkd-link-bus.c:            SD_BUS_METHOD("GetAddress", "s", "s", method_get_address, SD_BUS_VTABLE_UNPRIVILEGED),
networkd-network-bus.c:         SD_BUS_METHOD("AddAddress", "sssyyys", "x", method_add_address, SD_BUS_VTABLE_UNPRIVILEGED),
networkd-network-bus.c:         SD_BUS_METHOD("DelAddress", "sssyyys", "x", method_del_address, SD_BUS_VTABLE_UNPRIVILEGED),
networkd-network-bus.c:         SD_BUS_METHOD("GetAddress", "s", "a(iyyus)s", method_get_address, SD_BUS_VTABLE_UNPRIVILEGED),


https://github.com/openbmc/openbmc/pull/139

Hariharasubramanian R (1):
  Dbus API for systemd/networkd for network configuration.

 .../0100-systemd_networkd_dbus_setaddress.patch    | 845 +++++++++++++++++++++
 .../meta/recipes-core/systemd/systemd_225.bb       |   1 +
 2 files changed, 846 insertions(+)
 create mode 100644 yocto-poky/meta/recipes-core/systemd/systemd/0100-systemd_networkd_dbus_setaddress.patch

-- 
2.6.4
