Return-Path: <cyril.bur@au1.ibm.com>
Received: from e23smtp08.au.ibm.com (e23smtp08.au.ibm.com [202.81.31.141])
 (using TLSv1 with cipher CAMELLIA256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 6CDDD1A0E80
 for <openbmc@lists.ozlabs.org>; Tue,  8 Dec 2015 11:03:36 +1100 (AEDT)
Received: from localhost
 by e23smtp08.au.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <cyril.bur@au1.ibm.com>;
 Tue, 8 Dec 2015 10:03:34 +1000
Received: from d23dlp02.au.ibm.com (202.81.31.213)
 by e23smtp08.au.ibm.com (202.81.31.205) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 Tue, 8 Dec 2015 10:03:31 +1000
X-IBM-Helo: d23dlp02.au.ibm.com
X-IBM-MailFrom: cyril.bur@au1.ibm.com
X-IBM-RcptTo: openbmc@lists.ozlabs.org
Received: from d23relay08.au.ibm.com (d23relay08.au.ibm.com [9.185.71.33])
 by d23dlp02.au.ibm.com (Postfix) with ESMTP id 68BF42BB0052
 for <openbmc@lists.ozlabs.org>; Tue,  8 Dec 2015 11:03:31 +1100 (EST)
Received: from d23av01.au.ibm.com (d23av01.au.ibm.com [9.190.234.96])
 by d23relay08.au.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 tB8035b824183026
 for <openbmc@lists.ozlabs.org>; Tue, 8 Dec 2015 11:03:13 +1100
Received: from d23av01.au.ibm.com (localhost [127.0.0.1])
 by d23av01.au.ibm.com (8.14.4/8.14.4/NCO v10.0 AVout) with ESMTP id
 tB802w7p022297
 for <openbmc@lists.ozlabs.org>; Tue, 8 Dec 2015 11:02:58 +1100
Received: from ozlabs.au.ibm.com (ozlabs.au.ibm.com [9.192.253.14])
 by d23av01.au.ibm.com (8.14.4/8.14.4/NCO v10.0 AVin) with ESMTP id
 tB802wBr021810
 for <openbmc@lists.ozlabs.org>; Tue, 8 Dec 2015 11:02:58 +1100
Received: from camb691.ozlabs.ibm.com (haven.au.ibm.com [9.192.254.114])
 (using TLSv1.2 with cipher AES128-SHA256 (128/128 bits))
 (No client certificate requested)
 by ozlabs.au.ibm.com (Postfix) with ESMTPSA id 40CF0A00F6
 for <openbmc@lists.ozlabs.org>; Tue,  8 Dec 2015 11:02:34 +1100 (AEDT)
From: Cyril Bur <cyril.bur@au1.ibm.com>
To: openbmc@lists.ozlabs.org
Subject: [PATCH 0/2] WIP: Fix unreliable networking
Date: Tue,  8 Dec 2015 11:02:10 +1100
Message-Id: <1449532932-5350-1-git-send-email-cyril.bur@au1.ibm.com>
X-Mailer: git-send-email 2.6.3
X-TM-AS-MML: disable
X-Content-Scanned: Fidelis XPS MAILER
x-cbid: 15120800-0029-0000-0000-000002933F57
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
X-List-Received-Date: Tue, 08 Dec 2015 00:03:36 -0000

This is a work in progress patch to fix the unreliable networking. Busy
networks can make the networking stop at a hardware level and stop
receiving packets this is particularly a problem on long tftp transfers.

The fix leads to the follow up question of "how did this ever work" which I
have yet to answer. Hopefully I'll know why soon and post a real fix once I
really understand the problem.

This the mean time this patch can be used.

Cyril Bur (2):
  Fix: RX buffer size
  WIP: Fix unreliable networking

 drivers/net/aspeednic.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

-- 
2.6.3
