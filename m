Return-Path: <cyril.bur@au1.ibm.com>
Received: from e23smtp04.au.ibm.com (e23smtp04.au.ibm.com [202.81.31.146])
 (using TLSv1 with cipher CAMELLIA256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 12D751A0F1E
 for <openbmc@lists.ozlabs.org>; Tue,  8 Dec 2015 16:39:21 +1100 (AEDT)
Received: from localhost
 by e23smtp04.au.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <cyril.bur@au1.ibm.com>;
 Tue, 8 Dec 2015 15:39:19 +1000
Received: from d23dlp02.au.ibm.com (202.81.31.213)
 by e23smtp04.au.ibm.com (202.81.31.210) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 Tue, 8 Dec 2015 15:39:18 +1000
X-IBM-Helo: d23dlp02.au.ibm.com
X-IBM-MailFrom: cyril.bur@au1.ibm.com
X-IBM-RcptTo: openbmc@lists.ozlabs.org
Received: from d23relay06.au.ibm.com (d23relay06.au.ibm.com [9.185.63.219])
 by d23dlp02.au.ibm.com (Postfix) with ESMTP id 2DD312BB0051
 for <openbmc@lists.ozlabs.org>; Tue,  8 Dec 2015 16:39:18 +1100 (EST)
Received: from d23av03.au.ibm.com (d23av03.au.ibm.com [9.190.234.97])
 by d23relay06.au.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 tB85d2ol13762772
 for <openbmc@lists.ozlabs.org>; Tue, 8 Dec 2015 16:39:10 +1100
Received: from d23av03.au.ibm.com (localhost [127.0.0.1])
 by d23av03.au.ibm.com (8.14.4/8.14.4/NCO v10.0 AVout) with ESMTP id
 tB85cjXK004191
 for <openbmc@lists.ozlabs.org>; Tue, 8 Dec 2015 16:38:45 +1100
Received: from ozlabs.au.ibm.com (ozlabs.au.ibm.com [9.192.253.14])
 by d23av03.au.ibm.com (8.14.4/8.14.4/NCO v10.0 AVin) with ESMTP id
 tB85cj9J003298
 for <openbmc@lists.ozlabs.org>; Tue, 8 Dec 2015 16:38:45 +1100
Received: from camb691.ozlabs.ibm.com (haven.au.ibm.com [9.192.254.114])
 (using TLSv1.2 with cipher AES128-SHA256 (128/128 bits))
 (No client certificate requested)
 by ozlabs.au.ibm.com (Postfix) with ESMTPSA id F391EA00F6
 for <openbmc@lists.ozlabs.org>; Tue,  8 Dec 2015 16:38:20 +1100 (AEDT)
From: Cyril Bur <cyril.bur@au1.ibm.com>
To: openbmc@lists.ozlabs.org
Subject: [PATCH 0/2] Fixes to drivers/net/aspeednic
Date: Tue,  8 Dec 2015 16:38:03 +1100
Message-Id: <1449553085-14727-1-git-send-email-cyril.bur@au1.ibm.com>
X-Mailer: git-send-email 2.6.3
X-TM-AS-MML: disable
X-Content-Scanned: Fidelis XPS MAILER
x-cbid: 15120805-0013-0000-0000-00000254C778
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
X-List-Received-Date: Tue, 08 Dec 2015 05:39:22 -0000

The BMC has been failing to reliably TFTPboot large files, it turns out
that busy networks could get the NIC into a state where it stops DMAing its
received packets. Patch 2/2 addresses this problem. Patch 1/2 fixes an RX
buffer size problem found along the way.

Code exists on github: https://github.com/cyrilbur-ibm/u-boot/tree/net_fix

Cyril Bur (2):
  drivers/net/aspeednic: Fix RX buffer size
  drivers/net/aspeednic: Fix unreliable networking

 drivers/net/aspeednic.c | 17 +++++++++++++++--
 1 file changed, 15 insertions(+), 2 deletions(-)

-- 
2.6.3
