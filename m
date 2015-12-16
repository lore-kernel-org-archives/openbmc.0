Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id C84E81A0B4F
 for <openbmc@lists.ozlabs.org>; Thu, 17 Dec 2015 10:20:38 +1100 (AEDT)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1450308035665845.0117848228714;
 Wed, 16 Dec 2015 15:20:35 -0800 (PST)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH u-boot 0/2] Fix unreliable networking
Date: Wed, 16 Dec 2015 17:20:32 -0600
Message-Id: <1450308034-19042-1-git-send-email-openbmc-patches@stwcx.xyz>
X-Mailer: git-send-email 2.6.3
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
X-List-Received-Date: Wed, 16 Dec 2015 23:20:39 -0000

The BMC has been failing to reliably TFTPboot large files, it turns out that busy networks could get the NIC into a state where it stops DMAing its received packets.
Patch 2/2 addresses this problem.
Patch 1/2 fixes an RX buffer size problem found along the way.

https://github.com/openbmc/u-boot/pull/1

Cyril Bur (2):
  drivers/net/aspeednic: Fix RX buffer size
  drivers/net/aspeednic: Fix unreliable networking

 drivers/net/aspeednic.c | 17 +++++++++++++++--
 1 file changed, 15 insertions(+), 2 deletions(-)

-- 
2.6.3
