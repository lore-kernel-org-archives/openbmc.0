Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3rDZyl17fbzDqHF
 for <openbmc@lists.ozlabs.org>; Tue, 24 May 2016 22:50:53 +1000 (AEST)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1464094244856911.344188239682;
 Tue, 24 May 2016 05:50:44 -0700 (PDT)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH phosphor-networkd v3] Enabling updates to /etc/resolve.conf
 either manually or using DHCP supplied DNS IP
Date: Tue, 24 May 2016 07:50:42 -0500
Message-Id: <20160524125043.23637-1-openbmc-patches@stwcx.xyz>
X-Mailer: git-send-email 2.8.3
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.22
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Tue, 24 May 2016 12:50:55 -0000

Provide dbus APIs to provide nameserver IPs and update them in /etc/resolv.conf
Also, register watch for /run/systemd/netif/state for DHCP and take the DNS entries and update /etc/resolv.conf

<!-- Reviewable:start -->
---
This change is [<img src="https://reviewable.io/review_button.svg" height="35" align="absmiddle" alt="Reviewable"/>](https://reviewable.io/reviews/openbmc/phosphor-networkd/13)
<!-- Reviewable:end -->


https://github.com/openbmc/phosphor-networkd/pull/13

vishwa (1):
  Enabling updates to /etc/resolve.conf either manually or using DHCP
    supplied DNS IP

 Makefile           |  29 ++++
 netman.py          |  36 +++++
 netman_watch_dns.c | 391 +++++++++++++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 456 insertions(+)
 create mode 100644 Makefile
 create mode 100644 netman_watch_dns.c

-- 
2.8.3
