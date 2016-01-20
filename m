Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 168E91A1854
 for <openbmc@lists.ozlabs.org>; Thu, 21 Jan 2016 00:20:33 +1100 (AEDT)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1453296028804630.1791259802029;
 Wed, 20 Jan 2016 05:20:28 -0800 (PST)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH phosphor-host-ipmid] Using systemd dbus API to set get LAN
 parameters.
Date: Wed, 20 Jan 2016 07:20:27 -0600
Message-Id: <1453296028-21095-1-git-send-email-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Wed, 20 Jan 2016 13:20:34 -0000

Using the systemd/networkd dbus APIs to replace the existing system() commands to:

1) Set IP address
2) Get IP address
3) Get MAC address


https://github.com/openbmc/phosphor-host-ipmid/pull/59

Hariharasubramanian R (1):
  Using systemd dbus API to set get LAN parameters.

 transporthandler.C | 233 +++++++++++++++++++++++++++++++++++++++++++----------
 1 file changed, 191 insertions(+), 42 deletions(-)

-- 
2.6.4
