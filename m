Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 9B3721A0B51
 for <openbmc@lists.ozlabs.org>; Fri, 26 Feb 2016 17:10:32 +1100 (AEDT)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1456467028980843.4150511546559;
 Thu, 25 Feb 2016 22:10:28 -0800 (PST)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Cc: Cyril Bur <cyrilbur@gmail.com>
Subject: [PATCH linux v2] net/ncsi: Fix possible deadlock caught with lockdep
Date: Fri, 26 Feb 2016 00:10:27 -0600
Message-Id: <1456467027-547-2-git-send-email-openbmc-patches@stwcx.xyz>
X-Mailer: git-send-email 2.7.1
In-Reply-To: <1456467027-547-1-git-send-email-openbmc-patches@stwcx.xyz>
References: <1456467027-547-1-git-send-email-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Fri, 26 Feb 2016 06:10:33 -0000

From: Cyril Bur <cyrilbur@gmail.com>

Bringing the interfaces down with ifdown -a directly after boot causes a
lockdep warning. It appears that a network interrupt would result in an
attempt to acquire that lock again.

The solution is to soft disable interrupts.

=================================
[ INFO: inconsistent lock state ]
4.3.6 #1 Not tainted
---------------------------------
inconsistent {IN-SOFTIRQ-W} -> {SOFTIRQ-ON-W} usage.
ip/934 [HC0[0]:SC0[0]:HE1:SE1] takes:
 (&(&ndp->ndp_package_lock)->rlock){+.?...}, at: [<c03b0c9c>]
ncsi_stop_dev+0x14/0x50
{IN-SOFTIRQ-W} state was registered at:
  [<c03bbdf8>] _raw_spin_lock+0x28/0x38
  [<c03b08b0>] ncsi_add_package+0x64/0xf0
  [<c03af978>] ncsi_rsp_handler_sp+0x80/0xe0
  [<c03afb4c>] ncsi_rcv_rsp+0xd4/0x104
  [<c0308204>] __netif_receive_skb_core+0x6c4/0x808
  [<c0309d8c>] netif_receive_skb_internal+0xb4/0x138
  [<c030a664>] napi_gro_receive+0x48/0x9c
  [<c026d784>] ftgmac100_poll+0x360/0x59c
  [<c030ad48>] net_rx_action+0xe8/0x2a0
  [<c001a524>] __do_softirq+0x108/0x26c
  [<c001a728>] do_softirq+0x48/0x70
  [<c001a818>] __local_bh_enable_ip+0xc8/0x104
  [<c030d120>] __dev_queue_xmit+0x654/0x6c4
  [<c03ae648>] ncsi_xmit_cmd+0x1d4/0x208
  [<c03b01e0>] ncsi_dev_start+0xd0/0x3c0
  [<c03b0c44>] ncsi_dev_work+0x1b8/0x1fc
  [<c002c7a4>] process_one_work+0x228/0x3cc
  [<c002d5e0>] worker_thread+0x2a4/0x3d8
  [<c0031ba0>] kthread+0xc4/0xd8
  [<c000a3ac>] ret_from_fork+0x14/0x28
irq event stamp: 2009
hardirqs last  enabled at (2009): [<c001a834>]
__local_bh_enable_ip+0xe4/0x104
hardirqs last disabled at (2007): [<c001a7b4>]
__local_bh_enable_ip+0x64/0x104
softirqs last  enabled at (2008): [<c0326a44>]
dev_deactivate_many+0x270/0x2ac
softirqs last disabled at (2006): [<c0326a28>]
dev_deactivate_many+0x254/0x2ac

other info that might help us debug this:
 Possible unsafe locking scenario:

       CPU0
       ----
  lock(&(&ndp->ndp_package_lock)->rlock);
  <Interrupt>
    lock(&(&ndp->ndp_package_lock)->rlock);

 *** DEADLOCK ***

1 lock held by ip/934:
 #0:  (rtnl_mutex){+.+.+.}, at: [<c036d0c8>] devinet_ioctl+0x15c/0x6c8

stack backtrace:
CPU: 0 PID: 934 Comm: ip Not tainted 4.3.6 #1
Hardware name: ASpeed SoC
[<c000fa2c>] (unwind_backtrace) from [<c000d5fc>] (show_stack+0x10/0x14)
[<c000d5fc>] (show_stack) from [<c0072a88>]
(print_usage_bug.part.11+0x220/0x288)
[<c0072a88>] (print_usage_bug.part.11) from [<c0040394>]
(mark_lock+0x400/0x678)
[<c0040394>] (mark_lock) from [<c004293c>] (__lock_acquire+0xa0c/0x1a9c)
[<c004293c>] (__lock_acquire) from [<c0043dc4>] (lock_acquire+0x9c/0xbc)
[<c0043dc4>] (lock_acquire) from [<c03bbdf8>] (_raw_spin_lock+0x28/0x38)
[<c03bbdf8>] (_raw_spin_lock) from [<c03b0c9c>] (ncsi_stop_dev+0x14/0x50)
[<c03b0c9c>] (ncsi_stop_dev) from [<c026cfa0>] (ftgmac100_stop+0x1c/0x28)
[<c026cfa0>] (ftgmac100_stop) from [<c0306cb0>]
(__dev_close_many+0xa0/0xc8)
[<c0306cb0>] (__dev_close_many) from [<c0306dc8>] (__dev_close+0x20/0x34)
[<c0306dc8>] (__dev_close) from [<c030da50>]
(__dev_change_flags+0x8c/0x138)
[<c030da50>] (__dev_change_flags) from [<c030db14>]
(dev_change_flags+0x18/0x48)
[<c030db14>] (dev_change_flags) from [<c036d298>]
(devinet_ioctl+0x32c/0x6c8)
[<c036d298>] (devinet_ioctl) from [<c02f42b0>] (sock_ioctl+0x26c/0x2d0)
[<c02f42b0>] (sock_ioctl) from [<c00b5804>] (do_vfs_ioctl+0x588/0x67c)
[<c00b5804>] (do_vfs_ioctl) from [<c00b592c>] (SyS_ioctl+0x34/0x5c)
[<c00b592c>] (SyS_ioctl) from [<c000a320>] (ret_fast_syscall+0x0/0x1c)

Signed-off-by: Cyril Bur <cyrilbur@gmail.com>
---
 net/ncsi/ncsi-manage.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/net/ncsi/ncsi-manage.c b/net/ncsi/ncsi-manage.c
index 24ff6c2..ef1de7f 100644
--- a/net/ncsi/ncsi-manage.c
+++ b/net/ncsi/ncsi-manage.c
@@ -907,10 +907,10 @@ void ncsi_stop_dev(struct ncsi_dev *nd)
 	struct ncsi_dev_priv *ndp = TO_NCSI_DEV_PRIV(nd);
 	struct ncsi_package *tmp, *np;
 
-	spin_lock(&ndp->ndp_package_lock);
+	spin_lock_bh(&ndp->ndp_package_lock);
 	list_for_each_entry_safe(np, tmp, &ndp->ndp_packages, np_node)
 		ncsi_release_package(np);
-	spin_unlock(&ndp->ndp_package_lock);
+	spin_unlock_bh(&ndp->ndp_package_lock);
 }
 EXPORT_SYMBOL_GPL(ncsi_stop_dev);
 
-- 
2.7.1
