Return-Path: <cyrilbur@gmail.com>
Received: from e23smtp06.au.ibm.com (e23smtp06.au.ibm.com [202.81.31.148])
 (using TLSv1 with cipher CAMELLIA256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 64ED81A03BD
 for <openbmc@lists.ozlabs.org>; Wed, 28 Oct 2015 16:19:43 +1100 (AEDT)
Received: from /spool/local
 by e23smtp06.au.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <cyrilbur@gmail.com>;
 Wed, 28 Oct 2015 15:19:41 +1000
Received: from d23dlp01.au.ibm.com (202.81.31.203)
 by e23smtp06.au.ibm.com (202.81.31.212) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 Wed, 28 Oct 2015 15:19:38 +1000
X-Helo: d23dlp01.au.ibm.com
X-MailFrom: cyrilbur@gmail.com
X-RcptTo: openbmc@lists.ozlabs.org
Received: from d23relay07.au.ibm.com (d23relay07.au.ibm.com [9.190.26.37])
 by d23dlp01.au.ibm.com (Postfix) with ESMTP id 565862CE8050
 for <openbmc@lists.ozlabs.org>; Wed, 28 Oct 2015 16:19:38 +1100 (EST)
Received: from d23av03.au.ibm.com (d23av03.au.ibm.com [9.190.234.97])
 by d23relay07.au.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 t9S5JVeF30212214
 for <openbmc@lists.ozlabs.org>; Wed, 28 Oct 2015 16:19:39 +1100
Received: from d23av03.au.ibm.com (localhost [127.0.0.1])
 by d23av03.au.ibm.com (8.14.4/8.14.4/NCO v10.0 AVout) with ESMTP id
 t9S5J57V027530
 for <openbmc@lists.ozlabs.org>; Wed, 28 Oct 2015 16:19:05 +1100
Received: from ozlabs.au.ibm.com (ozlabs.au.ibm.com [9.192.253.14])
 by d23av03.au.ibm.com (8.14.4/8.14.4/NCO v10.0 AVin) with ESMTP id
 t9S5J5TG026803
 for <openbmc@lists.ozlabs.org>; Wed, 28 Oct 2015 16:19:05 +1100
Received: from camb691.ozlabs.ibm.com (haven.au.ibm.com [9.192.254.114])
 (using TLSv1.2 with cipher AES128-SHA256 (128/128 bits))
 (No client certificate requested)
 by ozlabs.au.ibm.com (Postfix) with ESMTPSA id 896FFA0226
 for <openbmc@lists.ozlabs.org>; Wed, 28 Oct 2015 16:18:41 +1100 (AEDT)
From: Cyril Bur <cyrilbur@gmail.com>
To: openbmc@lists.ozlabs.org
Subject: [PATCH] misc/bt-host: Clear the ATN flag on open
Date: Wed, 28 Oct 2015 16:17:55 +1100
Message-Id: <1446009475-17672-1-git-send-email-cyrilbur@gmail.com>
X-Mailer: git-send-email 2.6.2
X-TM-AS-MML: disable
X-Content-Scanned: Fidelis XPS MAILER
x-cbid: 15102805-0021-0000-0000-00000210D471
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
X-List-Received-Date: Wed, 28 Oct 2015 05:19:43 -0000

Not doing so might cause a subsequent read to return a stale message.

Signed-off-by: Cyril Bur <cyrilbur@gmail.com>
---
 drivers/misc/bt-host.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/misc/bt-host.c b/drivers/misc/bt-host.c
index bf1e4ac..0ee93ce 100644
--- a/drivers/misc/bt-host.c
+++ b/drivers/misc/bt-host.c
@@ -120,6 +120,8 @@ static int bt_host_open(struct inode *inode, struct file *file)
 {
 	struct bt_host *bt_host = file_bt_host(file);
 
+	/* Avoid the first read reading possibly stale data */
+	clr_h2b_atn(bt_host);
 	clr_b_busy(bt_host);
 
 	return 0;
-- 
2.6.2
