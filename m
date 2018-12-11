Return-Path: <medadyoung@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::641; helo=mail-pl1-x641.google.com;
 envelope-from=medadyoung@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="u55Is/qA"; 
 dkim-atps=neutral
Received: from mail-pl1-x641.google.com (mail-pl1-x641.google.com
 [IPv6:2607:f8b0:4864:20::641])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 43DV8p0yvjzDqxc
 for <openbmc@lists.ozlabs.org>; Tue, 11 Dec 2018 17:17:10 +1100 (AEDT)
Received: by mail-pl1-x641.google.com with SMTP id y1so6434973plp.9
 for <openbmc@lists.ozlabs.org>; Mon, 10 Dec 2018 22:17:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=TlYVShGWQfqCikX7zIfo6dSj8lcXrBBDWQwIm/PzWAQ=;
 b=u55Is/qA0pSseLvGvzYgxvg44ykhaYLA1P4+SfTntUm/1jRq5p7qJiQ82p0EdWsWni
 cdvBxrnGCavkp5pqneI/M2ZusPoIRlDM5rLfqYNyRTCAXLOadKxh/huIBzcXV+RJRkqu
 WaRrwWxdL53tDisAlhgvyZC3eJvj4tR1M0xxQaJAlJ8N0mxjKisR6jiVAkywiRAAAXyh
 x63D8vDM1Ydvsgb86/tzzVtyLBnFYitf18eB7h2HHynwSTbA/65xpbvo0IyF1fQ63nv8
 dpMDV3QxZTn0idAZcy07VA0/DG2cTvC3ZrQpNIGSavewgqms8TirjIKom8g+K/0xwIZs
 p/rA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=TlYVShGWQfqCikX7zIfo6dSj8lcXrBBDWQwIm/PzWAQ=;
 b=mbucBsFJMo8vVkzK5eBN22j9en7M6blTOaS0s2UYjExtGtxYUf0j7+DgYz15Y5TKpw
 atgkEHhdaK8mUSjdsPBbyhiD62/H1dd+hzwzwYC9hZb6z99WaM1zuO9B7oM4xpKWVep0
 xEap0bN+hddAyOC9rn+vzTZQBF+hixogs83QYkPR+aBdCwylqe5i75CtvWFpGBT24nLz
 6CVk4wxILG06tTI0luGp8czFJqWh1uKukxv6L3T2c/Mcn8YjiTMfRqkX8Jebo0CAH0Ai
 wnMEMKlUhuZS1UcpgmDYkX4m1wzO2i6Ma4Y0PSyELKKtfM0wgGyh0+yzXa4P2w84NIQJ
 OXGw==
X-Gm-Message-State: AA+aEWZCiVRRixIZqhthcya6OrgfoJ+lJptElarpRKPA8tXg+6t+Lg6l
 KkP0HJ+mCsz/McJdhQ7YVPI=
X-Google-Smtp-Source: AFSGD/WtGwEGzXbzvfgEkVr2zxQ5RWgAx4+tVSYC1KALczRjt5jgzWAy5EcN525T7eCRDfgAiwvC+w==
X-Received: by 2002:a17:902:722:: with SMTP id
 31mr14992831pli.271.1544509029167; 
 Mon, 10 Dec 2018 22:17:09 -0800 (PST)
Received: from localhost.localdomain (27-52-137-213.adsl.fetnet.net.
 [27.52.137.213])
 by smtp.gmail.com with ESMTPSA id e16sm16246045pfn.46.2018.12.10.22.17.07
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Mon, 10 Dec 2018 22:17:08 -0800 (PST)
From: medadyoung@gmail.com
To: jbacik@fb.com,
	axboe@kernel.dk
Cc: linux-block@vger.kernel.org, nbd@other.debian.org,
 linux-kernel@vger.kernel.org, openbmc@lists.ozlabs.org,
 Medad <medadyoung@gmail.com>
Subject: [PATCH] nbd:clear NBD_BOUND flag when NBD connection is closed
Date: Tue, 11 Dec 2018 14:17:03 +0800
Message-Id: <1544509023-18923-1-git-send-email-medadyoung@gmail.com>
X-Mailer: git-send-email 2.7.4
X-Mailman-Approved-At: Wed, 12 Dec 2018 11:53:32 +1100
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Tue, 11 Dec 2018 06:17:15 -0000

From: Medad <medadyoung@gmail.com>

    If we do NOT clear NBD_BOUND flag when NBD connection is closed,
    then the original NBD device could not be used again.

Signed-off-by: Medad <medadyoung@gmail.com>
---
 drivers/block/nbd.c | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/drivers/block/nbd.c b/drivers/block/nbd.c
index 64278f4..5c88490 100644
--- a/drivers/block/nbd.c
+++ b/drivers/block/nbd.c
@@ -277,10 +277,14 @@ static void sock_shutdown(struct nbd_device *nbd)
 	struct nbd_config *config = nbd->config;
 	int i;
 
-	if (config->num_connections == 0)
+	if (config->num_connections == 0) {
+		clear_bit(NBD_BOUND, &config->runtime_flags);
 		return;
-	if (test_and_set_bit(NBD_DISCONNECTED, &config->runtime_flags))
+	}
+	if (test_and_set_bit(NBD_DISCONNECTED, &config->runtime_flags)) {
+		clear_bit(NBD_BOUND, &config->runtime_flags);
 		return;
+	}
 
 	for (i = 0; i < config->num_connections; i++) {
 		struct nbd_sock *nsock = config->socks[i];
@@ -944,7 +948,7 @@ static int nbd_reconnect_socket(struct nbd_device *nbd, unsigned long arg)
 		sockfd_put(old);
 
 		clear_bit(NBD_DISCONNECTED, &config->runtime_flags);
-
+		clear_bit(NBD_BOUND, &config->runtime_flags);
 		/* We take the tx_mutex in an error path in the recv_work, so we
 		 * need to queue_work outside of the tx_mutex.
 		 */
@@ -1020,6 +1024,7 @@ static int nbd_disconnect(struct nbd_device *nbd)
 	dev_info(disk_to_dev(nbd->disk), "NBD_DISCONNECT\n");
 	set_bit(NBD_DISCONNECT_REQUESTED, &config->runtime_flags);
 	send_disconnects(nbd);
+	clear_bit(NBD_BOUND, &config->runtime_flags);
 	return 0;
 }
 
-- 
2.7.4
