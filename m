Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3qZn7Q514XzDq71
 for <openbmc@lists.ozlabs.org>; Wed, 30 Mar 2016 23:31:13 +1100 (AEDT)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 145934105727223.41630528783753;
 Wed, 30 Mar 2016 05:30:57 -0700 (PDT)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH phosphor-networkd v2] Enabling updates to /etc/resolve.conf
 either manually or using DHCP supplied DNS IP
Date: Wed, 30 Mar 2016 07:30:54 -0500
Message-Id: <1459341055-2680-1-git-send-email-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Wed, 30 Mar 2016 12:31:15 -0000

Provide dbus APIs to provide nameserver IPs and update them in /etc/resolv.conf
Also, register watch for /run/systemd/netif/state for DHCP and take the DNS entries and update /etc/resolv.conf

<!-- Reviewable:start -->
---
This change is [<img src="https://reviewable.io/review_button.svg" height="35" align="absmiddle" alt="Reviewable"/>](https://reviewable.io/reviews/openbmc/phosphor-networkd/13)
<!-- Reviewable:end -->


https://github.com/openbmc/phosphor-networkd/pull/13

vishwa (1):
  Enabling updates to /etc/resolve.conf either manually or using DHCP
    supplied DNS     IP

 Makefile           |  29 +++++
 netman.py          |  26 +++++
 netman_watch_dns.c | 327 +++++++++++++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 382 insertions(+)
 create mode 100644 Makefile
 create mode 100644 netman_watch_dns.c

-- 
2.7.1
