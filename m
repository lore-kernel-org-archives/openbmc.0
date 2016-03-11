Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 7A6DA1A004C
 for <openbmc@lists.ozlabs.org>; Sat, 12 Mar 2016 01:20:50 +1100 (AEDT)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1457706045265397.7369701142683;
 Fri, 11 Mar 2016 06:20:45 -0800 (PST)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Cc: Norman James <nkskjames@gmail.com>
Subject: [PATCH u-boot] MAC needs to be stopped after starting
Date: Fri, 11 Mar 2016 08:20:43 -0600
Message-Id: <1457706044-21613-1-git-send-email-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Fri, 11 Mar 2016 14:20:52 -0000

We found that u-boot network was corrupting kernel memory.
This is because aspeednic_init is called at startup,
but if the u-boot network is not used, the network driver
is not cleaned up.  This fix is a temporary hack and just calls
the halt function after the init. This driver needs to be
reworked to not start network initially and use set_hwaddr hook
to setup MAC address.  

Signed-off-by: Norman James <nkskjames@gmail.com>

<!-- Reviewable:start -->
---
This change is [<img src="https://reviewable.io/review_button.svg" height="35" align="absmiddle" alt="Review on Reviewable"/>](https://reviewable.io/reviews/openbmc/u-boot/3)
<!-- Reviewable:end -->


https://github.com/openbmc/u-boot/pull/3

Norman James (1):
  MAC needs to be stopped after starting

 drivers/net/aspeednic.c | 2 ++
 1 file changed, 2 insertions(+)

-- 
2.7.1
