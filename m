Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id DF5221A0E9C
 for <openbmc@lists.ozlabs.org>; Fri, 22 Jan 2016 14:50:30 +1100 (AEDT)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1453434627824413.50962470514764;
 Thu, 21 Jan 2016 19:50:27 -0800 (PST)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH linux 0/2] [RFC] ncsi: Fix not releasing lock in ncsi_rcv_rsp()
Date: Thu, 21 Jan 2016 21:50:25 -0600
Message-Id: <1453434627-22282-1-git-send-email-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Fri, 22 Jan 2016 03:50:31 -0000

I've found a locking problem which I believe might address issue #8. With this patch applied I also cannot reproduce #17.

I'm not sure this is the correct fix:
ncsi_free_req() takes ndp_req_lock again so this is 1 possible solution. Unfortunately I don't know the code enough to be sure it is safe to drop the lock before calling ncsi_free_req(), it is possible that dropping the lock could allow someone else to jump in and use the same nr possibly resulting in a double free.

Furthermore, after investigating other LOCKDEP issues I wrote that this patch:

```
commit e19be46436cc50cf6842d38fb5c44bca92ebb26f
Author: Cyril Bur <cyrilbur@gmail.com>
Date:   Thu Jan 21 11:30:26 2016 +1100

    i2c: aspeed spin_lock_init() on cmd_lock

diff --git a/drivers/i2c/busses/i2c-aspeed.c b/drivers/i2c/busses/i2c-aspeed.c
index 3b858d3..e4bf88a3 100644
--- a/drivers/i2c/busses/i2c-aspeed.c
+++ b/drivers/i2c/busses/i2c-aspeed.c
@@ -721,6 +721,7 @@ static int ast_i2c_probe_bus(struct platform_device *pdev)
        }
 
        /* Initialize the I2C adapter */
+       spin_lock_init(&bus->cmd_lock);
        bus->adap.nr = bus_num;
        bus->adap.owner = THIS_MODULE;
        bus->adap.retries = 0;
```

Breaks networking! I also found this extraordinarily hard to believe as well but it's absolutely the case. Please help understand why!

https://github.com/openbmc/linux/pull/42

Cyril Bur (2):
  ncsi: Fix not releasing lock in ncsi_rcv_rsp()
  i2c: aspeed spin_lock_init() on cmd_lock

 drivers/i2c/busses/i2c-aspeed.c | 1 +
 net/ncsi/ncsi-rsp.c             | 2 +-
 2 files changed, 2 insertions(+), 1 deletion(-)

-- 
2.6.4
