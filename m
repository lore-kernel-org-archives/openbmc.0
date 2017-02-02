Return-Path: <eajames@linux.vnet.ibm.com>
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3vDx2l13GwzDqBX
 for <openbmc@lists.ozlabs.org>; Fri,  3 Feb 2017 10:26:22 +1100 (AEDT)
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.20/8.16.0.20) with SMTP id
 v12NIc5a078796
 for <openbmc@lists.ozlabs.org>; Thu, 2 Feb 2017 18:26:20 -0500
Received: from e35.co.us.ibm.com (e35.co.us.ibm.com [32.97.110.153])
 by mx0b-001b2d01.pphosted.com with ESMTP id 28c8w1uxqs-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Thu, 02 Feb 2017 18:26:20 -0500
Received: from localhost
 by e35.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <eajames@linux.vnet.ibm.com>;
 Thu, 2 Feb 2017 16:26:19 -0700
Received: from d03dlp03.boulder.ibm.com (9.17.202.179)
 by e35.co.us.ibm.com (192.168.1.135) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Thu, 2 Feb 2017 16:26:17 -0700
Received: from b03cxnp08028.gho.boulder.ibm.com
 (b03cxnp08028.gho.boulder.ibm.com [9.17.130.20])
 by d03dlp03.boulder.ibm.com (Postfix) with ESMTP id 54DB319D801C;
 Thu,  2 Feb 2017 16:25:31 -0700 (MST)
Received: from b03ledav004.gho.boulder.ibm.com
 (b03ledav004.gho.boulder.ibm.com [9.17.130.235])
 by b03cxnp08028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 v12NQDmU9634130; Thu, 2 Feb 2017 16:26:17 -0700
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id DD1D878051;
 Thu,  2 Feb 2017 16:26:16 -0700 (MST)
Received: from oc3016140333.ibm.com (unknown [9.41.179.225])
 by b03ledav004.gho.boulder.ibm.com (Postfix) with ESMTP id 6292A7804D;
 Thu,  2 Feb 2017 16:26:16 -0700 (MST)
From: eajames@linux.vnet.ibm.com
To: openbmc@lists.ozlabs.org
Cc: joel@jms.id.au, alistair@popple.id.au, benh@kernel.crashing.org,
 "Edward A. James" <eajames@us.ibm.com>
Subject: [PATCH linux v1 7/8] drivers: fsi: i2c: add driver file operations
 and bus locking
Date: Thu,  2 Feb 2017 17:26:00 -0600
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1486077964-11346-1-git-send-email-eajames@linux.vnet.ibm.com>
References: <1486077964-11346-1-git-send-email-eajames@linux.vnet.ibm.com>
X-TM-AS-GCONF: 00
X-Content-Scanned: Fidelis XPS MAILER
x-cbid: 17020223-0012-0000-0000-0000138A6460
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00006545; HX=3.00000240; KW=3.00000007;
 PH=3.00000004; SC=3.00000201; SDB=6.00816379; UDB=6.00398660; IPR=6.00593813; 
 BA=6.00005112; NDR=6.00000001; ZLA=6.00000005; ZF=6.00000009; ZB=6.00000000;
 ZP=6.00000000; ZH=6.00000000; ZU=6.00000002; MB=3.00014159; XFM=3.00000011;
 UTC=2017-02-02 23:26:19
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 17020223-0013-0000-0000-00004B154563
Message-Id: <1486077964-11346-5-git-send-email-eajames@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2017-02-02_15:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=3
 malwarescore=0 phishscore=0 adultscore=0 bulkscore=0 classifier=spam
 adjust=0 reason=mlx scancount=1 engine=8.0.1-1612050000
 definitions=main-1702020219
X-Mailman-Approved-At: Fri, 03 Feb 2017 11:12:45 +1100
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Thu, 02 Feb 2017 23:26:24 -0000

From: "Edward A. James" <eajames@us.ibm.com>

Signed-off-by: Edward A. James <eajames@us.ibm.com>
---
 drivers/fsi/i2c/Makefile    |    2 +-
 drivers/fsi/i2c/iic-lock.c  |  439 +++++++++++
 drivers/fsi/i2c/iic-mstr.c  | 1834 +++++++++++++++++++++++++++++++++++++++++++
 include/uapi/linux/Kbuild   |    1 +
 include/uapi/linux/i2cfsi.h |  136 ++++
 5 files changed, 2411 insertions(+), 1 deletion(-)
 create mode 100644 drivers/fsi/i2c/iic-lock.c
 create mode 100644 include/uapi/linux/i2cfsi.h

diff --git a/drivers/fsi/i2c/Makefile b/drivers/fsi/i2c/Makefile
index b1f28a1..4d04026 100644
--- a/drivers/fsi/i2c/Makefile
+++ b/drivers/fsi/i2c/Makefile
@@ -1 +1 @@
-obj-$(CONFIG_FSI_I2C) += iic-fsi.o iic-mstr.o
+obj-$(CONFIG_FSI_I2C) += iic-fsi.o iic-mstr.o iic-lock.o
diff --git a/drivers/fsi/i2c/iic-lock.c b/drivers/fsi/i2c/iic-lock.c
new file mode 100644
index 0000000..ea5a42f8
--- /dev/null
+++ b/drivers/fsi/i2c/iic-lock.c
@@ -0,0 +1,439 @@
+/*
+ *   Copyright (c) International Business Machines Corp., 2006, 2010
+ *
+ *   This program is free software;  you can redistribute it and/or modify
+ *   it under the terms of the GNU General Public License as published by
+ *   the Free Software Foundation; either version 2 of the License, or
+ *   (at your option) any later version.
+ *
+ *   This program is distributed in the hope that it will be useful,
+ *   but WITHOUT ANY WARRANTY;  without even the implied warranty of
+ *   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See
+ *   the GNU General Public License for more details.
+ *
+ *   You should have received a copy of the GNU General Public License
+ *   along with this program;  if not, write to the Free Software
+ *   Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA 02111-1307 USA
+ */
+
+#include <linux/sched.h>
+#include <linux/slab.h>
+
+#include "iic-int.h"
+
+#define IIC_NO_MATCH 0
+#define IIC_PARTIAL_MATCH 1
+#define IIC_EXACT_MATCH 2
+#define IIC_ADDR_MAX_BITS 10
+
+
+void iic_lck_mgr_init(iic_lck_mgr_t* mgr)
+{
+	IENTER();
+	INIT_LIST_HEAD(&mgr->locked);
+	INIT_LIST_HEAD(&mgr->reqs);
+	IEXIT(0);
+}
+EXPORT_SYMBOL(iic_lck_mgr_init);
+
+int iic_get_match_type(short a_addr, short a_mask, short b_addr, short b_mask)
+{
+	int rc = IIC_PARTIAL_MATCH;
+	short mask = a_mask | b_mask;
+
+	IENTER();
+
+	/* no match if the fixed bits aren't the same */
+	if((a_addr & ~mask) != (b_addr & ~mask))
+	{
+		rc = IIC_NO_MATCH;
+	}
+
+	/* exact match if the fixed bits and mask bits are the same */
+	else if(a_mask == b_mask)
+	{
+		rc = IIC_EXACT_MATCH;
+	}
+
+	/* everything else is partial */
+
+	IEXIT(rc);
+	return rc;
+}
+
+
+/* to must be in jiffies! */ 
+int iic_wait_lock(iic_lck_mgr_t *lm, short addr, short mask, 
+		  iic_client_t *client, unsigned long to)
+{
+	iic_lck_t *handle = 0;
+	int rc = 0;
+	unsigned long flags;
+
+	IENTER();
+
+	spin_lock_irqsave(&client->bus->eng->lock, flags);
+
+	/* try the lock and enqueue our request if locked by someone else */
+	rc = iic_req_lock(lm, addr, mask, client, &handle);
+
+	spin_unlock_irqrestore(&client->bus->eng->lock, flags);
+
+	if(rc == IIC_REQ_QUEUED)
+	{
+		/* wait for timeout, signal, or lock to be granted */
+		rc = wait_event_interruptible_timeout(
+				client->wait,
+				handle->count > 0,
+				to);
+		if(rc > 0)
+		{
+			rc = 0;
+		}
+		else
+		{
+			if(!rc)
+			{
+				rc = -ETIME;
+				IFLDe(4, "lock req timed out: client[%p] bus[%08lx] lock[%04x:%04x]\n", 
+				      client, client->bus->bus_id,
+				      handle->addr, handle->mask);
+			}
+			else if(rc == -ERESTARTSYS)
+			{
+				rc = -EINTR;
+				IFLDe(4, "lock req interrupted: client[%p] bus[%08lx] lock[%04x:%04x]\n", 
+				      client, client->bus->bus_id,
+				      handle->addr, handle->mask);
+			}
+
+			/* interrupted or timed out.  delete request and
+			 * return to caller.
+			 */
+			spin_lock_irqsave(&client->bus->eng->lock, flags);
+			iic_unlock(lm, handle);
+			spin_unlock_irqrestore(&client->bus->eng->lock, flags);
+		}
+	}
+	IEXIT(rc);
+	return rc;
+}
+
+int iic_sideways_lock_bus(iic_client_t * client, unsigned short addr,
+			  unsigned short mask, unsigned long timeout)
+{
+	int rc = 0;
+	iic_eng_t * eng = client->bus->eng;
+
+	rc = iic_wait_lock(&eng->lck_mgr, addr, mask >> 1, client,
+			   msecs_to_jiffies(timeout));
+
+	return rc;
+}
+EXPORT_SYMBOL(iic_sideways_lock_bus);
+
+int iic_sideways_unlock_bus(iic_client_t * client, unsigned short addr,
+			    unsigned short mask)
+{
+	int rc = 0;
+	iic_lck_t * klck;
+	iic_eng_t * eng = client->bus->eng;
+
+	spin_lock_irq(&eng->lock);
+	klck = iic_find_handle(&eng->lck_mgr, client, addr, mask >> 1);
+
+	if(klck)
+	{
+		rc = iic_unlock(&eng->lck_mgr, klck);
+		if(!rc)
+			iic_start_next_xfr(eng);
+	}
+	spin_unlock_irq(&eng->lock);
+
+	return rc;
+}
+EXPORT_SYMBOL(iic_sideways_unlock_bus);
+
+/* Engine must be locked before using this function!
+ *
+ * This function only requests a lock.  It doesn't block waiting for the
+ * lock to be granted.  Instead, a handle is returned and the caller can
+ * query this handle to determine if the lock was granted.  If the lock
+ * count is not zero, the lock has been granted.
+ *
+ * returns IIC_REQ_QUEUED on success, negative value on failure.
+ *
+ * Locks from the same client can overlap each other, so a client could
+ * lock all addresses on a bus and still request a subset of locks within
+ * that range.
+ * 
+ * Here's the algorithm in a nutshell:
+ *
+ * Iterate through lock list
+ *     -If exact match and same client, stop iterating and increment the
+ * 	lock count of the existing lock.
+ *     -If partial or exact match but different client, stop iterating and
+ *     	queue a new request on the request queue without granting the lock.
+ *     -If partial and same client, keep iterating.
+ *     -If we reach the end and none of the above apply,
+ *       create a new lock and increment the count.
+ */
+int iic_req_lock(iic_lck_mgr_t *lm, short addr, unsigned short mask,
+		 iic_client_t *client, iic_lck_t **handle)
+{
+	iic_lck_t *iterator, *found;
+	int mtype = IIC_NO_MATCH;
+	int rc = IIC_REQ_QUEUED;
+	iic_lck_t *new_req = 0;
+
+	IENTER();
+	found = 0;
+	addr =  (client->bus->port << IIC_ADDR_MAX_BITS) | (addr >> 1);
+
+	IFLDs(4, "REQLOCK  client[%p] bus[%08lx] lock[%04x:%04x]\n",
+			client, client->bus->bus_id, addr, mask);
+
+	/* Look for a partial or exact address match in the lock list */
+	list_for_each_entry(iterator, &lm->locked, list)
+	{
+		mtype = iic_get_match_type(iterator->addr, iterator->mask,
+				           addr, mask);
+		if(mtype != IIC_NO_MATCH)
+		{
+			found = iterator;
+			if((found->client == client) && 
+					(mtype == IIC_EXACT_MATCH))
+			{
+				found->count++;
+				IDBGd(4, "bus[%08lx] lock[%04x:%04x] count=%ld\n",
+					client->bus->bus_id, addr, mask, 
+					found->count);
+				*handle = found;
+				goto exit;
+			}
+			break;
+		}
+	}
+
+	/* Exact matches with same client id have already exited.  Deal
+	 * with the rest as follows:
+	 * 	exact/partial matches w/diff client -> new lock requested
+	 * 	no matches or partial w/same client -> new lock granted
+	 */
+	new_req = (iic_lck_t*)kmalloc(sizeof(iic_lck_t), GFP_KERNEL);
+	if(!new_req)
+	{
+		rc = -ENOMEM;
+		goto exit;
+	}
+	new_req->client = client;
+	new_req->addr = addr;
+	new_req->mask = mask;
+	new_req->cur_xfr = 0;
+	*handle = new_req;
+
+	/* queue the request if someone else owns the lock */
+	if((mtype != IIC_NO_MATCH) && (found->client != client)){
+		IFLDi(5, "BLOCKED  client[%p] bus[%08lx] lock[%04x:%04x] blocked by client[%p]\n", 
+		      client, client->bus->bus_id, addr, mask, found->client);
+		new_req->count = 0;
+		list_add_tail(&new_req->list, &lm->reqs);
+	}
+	/* if nobody owns the lock, then grant it to the requestor */
+	else
+	{
+		IDBGd(4, "bus[%08lx] lock[%04x:%04x] count=%d\n", 
+			client->bus->bus_id, addr, mask, 1);
+		new_req->count = 1;
+		list_add_tail(&new_req->list, &lm->locked);
+	}
+
+exit:
+	IEXIT(rc);
+	return rc;
+}
+
+/* Engine must be locked before calling this function!
+ *
+ * If the lock pointed to by lck has been granted, the lock count is decremented
+ * and if it reaches zero, the lock is freed up, and the next in line (if any)
+ * is granted the lock.  If lck points to a queued up lock request, the
+ * request is removed from the request queue and freed up.
+ *
+ * Here's the algorithm for finding the "next in line":
+ *
+ * Iterate through the request list
+ * 	-if exact or partial match of unlocked range found, search the 
+ * 	 lock list for partial matches to the requested lock that have
+ * 	 different clients.
+ * 		-If not found, grant the lock request.
+ * 		-If found, don't grant the lock, continue iterating the
+ * 		 request list for other potential candidates.
+ */
+int iic_unlock(iic_lck_mgr_t *lm, iic_lck_t *lck)
+{
+	iic_lck_t *req, *temp, *locked, *candidate;
+	int mtype = IIC_NO_MATCH;
+
+	IENTER();
+
+	IFLDs(5, "UNLOCK   client[%p] bus[%08lx] lock[%04x:%04x] count=%ld\n", 
+		lck->client, lck->client->bus->bus_id, lck->addr, lck->mask, 
+		lck->count);
+	switch(lck->count)
+	{
+	/* lock count will decrement to 0, lock is to be unlocked and 
+	 * next in line gets the lock
+	 */
+	case 1: 
+		/*remove the lock from the locked list*/
+		list_del(&lck->list);
+
+		/* Look for a partial or exact address match in the 
+		 * request queue as a candidate for being granted
+		 * the lock.
+		 */
+		candidate = 0;
+		list_for_each_entry_safe(req, temp, &lm->reqs, list)
+		{
+			mtype = iic_get_match_type(req->addr, req->mask,
+						   lck->addr, lck->mask);
+			if(mtype == IIC_NO_MATCH)
+			{
+				continue;
+			}
+
+			/* found someone waiting for this lock!
+			 * Check if the requestors lock range
+			 * is free
+			 */
+			candidate = req;
+			list_for_each_entry(locked, &lm->locked, list)
+			{
+				mtype = iic_get_match_type(
+						req->addr, 
+						req->mask, 
+						locked->addr, 
+						locked->mask);
+				if(mtype != IIC_NO_MATCH &&
+				   req->client != locked->client)
+				{
+					candidate = 0;
+					break;
+				}
+			}
+			if(candidate)
+			{
+				/* if the candidate survived the test,
+				 * grant the lock and discontinue search.
+				 * Also, wakeup the client waiting for
+				 * this lock to be granted.
+				 */
+				candidate->count++;
+				list_del(&candidate->list);
+				list_add_tail(&candidate->list, &lm->locked);
+				wake_up_interruptible(&candidate->client->wait);
+				IFLDi(4, "UNBLOCK  client[%p] bus[%08lx] lock[%04x:%04x]\n",
+				     candidate->client, 
+				     candidate->client->bus->bus_id,
+				     candidate->addr, candidate->mask);
+			}
+		}
+		kfree(lck);
+		break;
+
+	/* lock is unlocked (above case) or was waiting on the request q */
+	case 0: 
+		/* Remove the old lock from the locked or request
+		 * q and free it.
+		 */
+		list_del(&lck->list);
+		kfree(lck);
+		break;
+
+	default: /* lock count is >= 2 */
+		lck->count--;
+	}
+	IEXIT(0);
+	return 0;
+}
+
+/* Find all locks and lock requests associated with the client_id and remove
+ * them all regardless of lock count.  All associated transfers should have
+ * already been aborted before calling this function.
+ */
+int iic_unlock_all(iic_lck_mgr_t *lm, iic_client_t *client)
+{
+	iic_lck_t* iterator, *temp;
+
+	IENTER();
+
+	if(!lm || !client)
+	{
+		return 0;
+	}
+	/* first, search the request q */
+	list_for_each_entry_safe(iterator, temp, &lm->reqs, list)
+	{
+		if(iterator->client == client)
+		{
+			iic_unlock(lm, iterator);
+		}
+	}
+
+	/* then, search the lock q */
+	list_for_each_entry_safe(iterator, temp, &lm->locked, list)
+	{
+		if(iterator->client == client)
+		{
+			/* This removes all explicit locks and leaves a single
+			 * implicit lock in case there is an active transfer
+			 * associated with the lock.
+			 */
+			iterator->count = 1;
+			/* if cur_xfr is set, it means that the xfr has
+			 * been started and not completed.  It is bad to
+			 * forcefully unlock a lock associated with a
+			 * xfr that hasn't completed because the implicit
+			 * unlock will fail.
+			 */
+			if(!iterator->cur_xfr) 
+				iic_unlock(lm, iterator); //unlock now
+		}
+	}
+	IEXIT(0);
+	return 0;
+}
+
+/* Find the lock handle for a given client and address range */
+iic_lck_t* iic_find_handle(iic_lck_mgr_t *lm, iic_client_t *client, 
+		                short addr, short mask)
+{
+	iic_lck_t *iterator, *found;
+	IENTER();
+	addr =  (client->bus->port << IIC_ADDR_MAX_BITS) | (addr >> 1);
+        found = 0;
+	list_for_each_entry(iterator, &lm->locked, list)
+	{
+		if((iterator->client == client) &&
+				(iic_get_match_type(addr, mask, iterator->addr,
+					iterator->mask) == IIC_EXACT_MATCH))
+		{
+			found = iterator;
+			goto exit;
+		}
+	}
+	list_for_each_entry(iterator, &lm->reqs, list)
+	{
+		if((iterator->client == client) &&
+				(iic_get_match_type(addr, mask, iterator->addr,
+					iterator->mask) == IIC_EXACT_MATCH))
+		{
+			found = iterator;
+			break;
+		}
+	}
+exit:
+	IEXIT((int)found);
+	return found;
+}
diff --git a/drivers/fsi/i2c/iic-mstr.c b/drivers/fsi/i2c/iic-mstr.c
index de05e5d..d7f029c 100644
--- a/drivers/fsi/i2c/iic-mstr.c
+++ b/drivers/fsi/i2c/iic-mstr.c
@@ -32,7 +32,9 @@
 #include <asm/page.h>
 #include <linux/pagemap.h>
 #include <linux/aio.h>
+#include <linux/i2cfsi.h>
 #include "iic-int.h"
+#include "iic-fsi.h"
 #include <linux/fsi.h>
 #include <linux/time.h>
 #include <asm/io.h>
@@ -149,15 +151,1847 @@ static iic_bus_t * iic_get_bus(unsigned long port, unsigned long type)
 	return (found == 1)? iterator->bus: NULL;
 }
 
+
+int iic_common_open(iic_client_t ** o_client, iic_bus_t * bus, int engine_num)
+{
+	int ret = 0;
+	iic_client_t * client;
+	IENTER();
+
+
+	BUG_ON(in_atomic());
+
+	/*
+	 * Create a client with the default attributes and associate it
+	 * with the file descriptor.
+	 */
+	client = (iic_client_t*)kzalloc(sizeof(*client), GFP_KERNEL);
+	if(!client)
+	{
+		ret = -ENOMEM;
+		goto exit;
+	}
+	memcpy(&client->opts, &iic_dflt_opts, sizeof(iic_dflt_opts));
+
+	if(!bus)
+	{
+		ret = -ENOMEM;
+		kfree(client);
+		goto exit;
+	}
+	else
+	{
+		client->flags |= IIC_CLIENT_SOURCE_USER;
+	}
+
+	client->bus = bus;
+	client->tgid = current->tgid;
+	sema_init(&client->sem, 1);
+	init_waitqueue_head(&client->wait);
+	kobject_get(&bus->eng->kobj);
+	*o_client = client;
+
+exit:
+	IEXIT(0);
+	return ret;
+}
+
+int iic_sideways_open(iic_client_t ** o_client,
+		      iic_bus_t * bus,
+		      int engine_num)
+{
+	return iic_common_open(o_client, bus, engine_num);
+}
+EXPORT_SYMBOL(iic_sideways_open);
+
+int iic_open(struct inode* inode, struct file* filp)
+{
+	int ret = 0;
+	iic_client_t* client;
+	iic_bus_t* bus = container_of(inode->i_cdev,
+				      iic_bus_t,
+				      cdev);
+	IENTER();
+	if(!bus)
+	{
+		ret = -ENODEV;
+		goto exit;
+	}
+
+	ret = iic_common_open(&client, bus, 0);
+	filp->private_data = client;
+	IFLDs(2, "OPEN     client[%p] bus[%08lx]\n", client, bus->bus_id);
+
+exit:
+	IEXIT(ret);
+	return ret;
+}
+
 /* Abort all pending xfrs for a client, or if client is 0, abort all
  * pending xfrs for the engine.  
  */
 int iic_abort_all(iic_eng_t* eng, iic_client_t* client, int status)
 {
+	unsigned long flags;
+	iic_xfr_t *iterator, *temp;
+
+	IENTER();
+	/* abort currently running xfr */
+	spin_lock_irqsave(&eng->lock, flags);
+	if(eng->cur_xfr && (!client || ( eng->cur_xfr->client == client)))
+	{
+		iic_xfr_t* cur_xfr = eng->cur_xfr;
+		cur_xfr->status = status;
+		iic_abort_xfr(cur_xfr);
+
+		iic_xfr_complete(cur_xfr);
+	}
+
+	/* abort queued xfrs */
+	list_for_each_entry_safe(iterator, temp, &eng->xfrq, q_entry)
+	{
+		if(!client || (iterator->client == client))
+		{
+			iterator->status = status;
+			iic_abort_xfr(iterator);
+			iic_xfr_complete(iterator);
+		}
+	}
+	spin_unlock_irqrestore(&eng->lock, flags);
+	IEXIT(0);
 	return 0;
 }
 EXPORT_SYMBOL(iic_abort_all);
 
+int iic_common_release(iic_client_t * client)
+{
+        int rc = 0;
+        iic_bus_t * bus = client->bus;
+
+        IENTER();
+
+	BUG_ON(in_atomic());
+
+        /* abort all pending transfers for this client */
+        iic_abort_all(bus->eng, client, -EPIPE);
+
+        /* unlock any address locks associated with this client */
+        spin_lock_irq(&bus->eng->lock);
+        iic_unlock_all(&bus->eng->lck_mgr, client);
+        iic_start_next_xfr(bus->eng);
+        spin_unlock_irq(&bus->eng->lock);
+
+        client->bus = 0;
+        kfree(client);
+        kobject_put(&bus->eng->kobj);
+
+        IEXIT(rc);
+        return rc;
+}
+
+int iic_sideways_release(iic_client_t * client)
+{
+	return iic_common_release(client);
+}
+EXPORT_SYMBOL(iic_sideways_release);
+
+int iic_release(struct inode* inode, struct file* filp)
+{
+	iic_client_t* client = (iic_client_t*)filp->private_data;
+	iic_bus_t* bus = container_of(inode->i_cdev,
+				      iic_bus_t,
+				      cdev);
+	IENTER();
+
+	IFLDs(2, "CLOSE    client[%p] bus[%08lx]\n", client, bus->bus_id);
+
+	iic_common_release(client);
+
+	/* Delete the client object associated with the file descriptor */
+	filp->private_data = 0;
+
+	IEXIT(0);
+	return 0;
+}
+EXPORT_SYMBOL(iic_release);
+
+
+void iic_cleanup_xfr(iic_xfr_t* xfr, dd_ffdc_t ** o_ffdc)
+{
+	int i;
+	IENTER();
+
+	del_timer(&xfr->delay);
+	del_timer(&xfr->timeout);
+	kfree(xfr);
+	IEXIT(0);
+}
+
+#ifndef MSEC_PER_SEC
+#define MSEC_PER_SEC 1000
+#endif
+int iic_create_xfr(iic_client_t* client, struct kiocb* iocb, 
+		   void* buf, size_t len, unsigned long flags,
+		   iic_xfr_t** new_xfr, dd_ffdc_t ** o_ffdc)
+{
+	int rc = 0;
+	iic_xfr_t *xfr;
+	iic_xfr_opts_t *t_opts;
+	iic_eng_t *eng = client->bus->eng;
+	int i;
+	unsigned short j = 0, count = 0, size = 0;
+
+	IENTER();
+
+	xfr = (iic_xfr_t*) kmalloc(sizeof(iic_xfr_t), GFP_KERNEL);
+	if(!xfr)
+	{
+		*new_xfr = 0;
+		rc = -ENOMEM;
+		IFLDe(0, "kmalloc xfr failed\n");
+		goto exit;
+	}
+
+	memset(xfr, 0, sizeof(iic_xfr_t));
+
+	/* Copy all client attributes neccesary for doing the transfer
+	 * into the xfr struct.
+	 */
+	memcpy(&xfr->opts, &client->opts, sizeof(iic_opts_t));
+	xfr->client = client;
+	xfr->iocb = iocb;
+	xfr->flags = flags;
+	xfr->buf = (char*)buf;
+	xfr->size = len;
+	xfr->pid = current->pid;
+
+	/* modify the xfr opts for ease of use in the device driver */
+	t_opts = &xfr->opts.xfr_opts;
+	t_opts->inc_addr = (t_opts->inc_addr >> 1) << (t_opts->dev_width * 8);
+
+	/* device driver code will only look at the rdelay and rsplit fields.
+	 * wdelay and wsplit values will be copied to rdelay and rsplit if
+	 * this is a write transfer.
+	 */
+	if(test_bit(IIC_XFR_RD, &xfr->flags))
+	{
+		if(t_opts->rsplit)
+		{
+			if (t_opts->rsplit > 0x8000)
+			{
+				t_opts->rsplit = 0x7FFF;
+			}
+			else {
+				t_opts->rsplit = t_opts->rsplit - 1;
+			}
+		}
+		else {
+			t_opts->rsplit = 0x7FFF;
+		}
+	}
+	else
+	{
+		unsigned long data_sz = xfr->size;
+		unsigned long start;
+		char* data = (char*)&xfr->offset_ffdc;
+
+		if(t_opts->wsplit)
+		{
+			t_opts->rsplit = t_opts->wsplit - 1;
+			t_opts->rdelay = t_opts->wdelay;
+		}
+
+		/* store off the first 4 bytes of write transfers now
+		 * for ffdc.
+		 */
+		if(data_sz > sizeof(long))
+			data_sz = sizeof(long);
+		start = sizeof(long) - data_sz;
+	}
+
+	/* prevent split numbers that just have one bit set (0x800,
+	 * 0x20, etc) to avoid problems with split calculation
+	 * in engine
+	 */
+	count = 0;
+	size = sizeof(t_opts->rsplit) * 8;
+	for (j = 0; j < size && count <= 1; j++) {
+		if (t_opts->rsplit & (1 << j))
+			count++;
+	}
+
+	if (count == 1 && t_opts->rsplit > 2)
+		t_opts->rsplit = t_opts->rsplit - 1;
+
+	if(test_bit(IIC_ENG_BLOCK, &eng->flags))
+	{
+		IFLDe(1, "eng[%08x] blocked\n", eng->id);
+		rc = -ENODEV;
+		if(test_bit(IIC_ENG_REMOVED, &eng->flags))
+			rc = -ENOLINK;
+		xfr->status = rc;
+		goto error;
+	}
+
+	rc = 0;
+
+	*new_xfr = xfr;
+	goto exit;
+		
+error:
+	kfree(xfr);
+	*new_xfr = 0;
+
+exit:
+	IEXIT(rc);
+	return rc;
+}
+
+/* called within a timer context to continue a delayed transfer */
+void iic_continue_xfr(unsigned long data)
+{
+	iic_xfr_t *xfr = (iic_xfr_t*)data;
+	IENTER();
+	IFLDd(1, "CONTINUE xfr[%p]\n", xfr);
+	clear_bit(IIC_XFR_DELAYED, &xfr->flags);
+
+	iic_start_next_xfr(xfr->client->bus->eng);
+	IEXIT(0);
+}
+
+/* Called by the engine when a transfer should only be continued after
+ * a period of time has expired.
+ * This is needed for implementing write delays.
+ * Note: delay is in milliseconds!
+ */
+void iic_delay_xfr(iic_xfr_t* xfr, unsigned long delay)
+{
+	iic_eng_t *eng = xfr->client->bus->eng;
+	IENTER();
+	IFLDd(2, "DELAY    xfr[%p] time[%ld]\n", xfr, delay);
+	eng->cur_xfr = 0;
+
+	/* Get the next xfr started (if any) */
+	iic_start_next_xfr(eng);
+
+	/* Make sure the delayed bit is set */
+	set_bit(IIC_XFR_DELAYED, &xfr->flags);
+
+	/* Place this xfr back at the beginning of the queue */
+	list_add(&xfr->q_entry, &eng->xfrq);
+	
+	/* Start a timer that will allow the transfer to start back up
+	 * when it pops.
+	 */
+	xfr->delay.data = (unsigned long)xfr;
+	xfr->delay.function = iic_continue_xfr;
+	mod_timer(&xfr->delay, jiffies + msecs_to_jiffies( delay ) );
+	IEXIT(0);
+
+}
+EXPORT_SYMBOL(iic_delay_xfr);
+
+void iic_finish_complete(unsigned long data)
+{
+	iic_xfr_t *xfr = (iic_xfr_t*)data;
+	IENTER();
+	clear_bit(IIC_XFR_DELAYED, &xfr->flags);
+	iic_xfr_complete(xfr);
+	IEXIT(0);
+}
+
+#define NUM_RETRIES 15
+#define RETRY_DELAY 5
+#define BACKOFF_DELAY 500
+
+/* Retry timeout fails for relatively long timeout periods */
+static unsigned long allow_retry(iic_xfr_t* xfr)
+{
+	/* No retry allowed - use original timeout period */
+	return (xfr->opts.xfr_opts.timeout);
+}
+
+unsigned long error_match(int status, unsigned long policy, iic_xfr_t* xfr)
+{
+	unsigned long error_bit = 0;
+	unsigned long rc = 0;
+	IENTER();
+	switch(status)
+	{
+		case -ENXIO:
+			/* Allow one retry for addr NACK */
+			rc = 1;
+			error_bit = IIC_VAL_ADDR_NOACK;
+			break;
+		case -ENODATA:
+			error_bit = IIC_VAL_DATA_NOACK;
+			break;
+		case -ETIME:
+			/* Allow one retry for long timeout periods */
+			if (allow_retry(xfr) != xfr->opts.xfr_opts.timeout)
+				rc = 1;
+			error_bit = IIC_VAL_TIMEOUT;
+			break;
+		case -EALREADY:
+			error_bit = IIC_VAL_LOST_ARB;
+
+			/* More retries hardcoded for bus multimaster failure
+			   This behavior can be overridden by user config
+			   set delay to 5 ms */
+			if (!(error_bit & policy)) {
+				/* the return code should actually be the
+				   number of retries. See comparison in
+				   rec_retry */
+				rc = NUM_RETRIES;
+				xfr->opts.recovery.redo_delay = RETRY_DELAY;
+				goto exit;
+			}
+			break;
+		case -EIO:
+			/* Allow retries for bus errors */
+			rc = 3;
+			error_bit = IIC_VAL_BUS_ERR;
+			break;
+		default:
+			break;
+	}
+	if(error_bit & policy)
+		rc = policy & ~IIC_VAL_ALL_ERRS;
+exit:
+	IEXIT((int)rc);
+	return rc;
+}
+
+/* 1 means 1 retry, 0 means no retries. */
+unsigned short rec_retry(iic_xfr_t* xfr)
+{
+	unsigned short rc;
+	IENTER();
+	rc = error_match(xfr->status, xfr->opts.recovery.redo_pol, xfr);
+	if(rc <= xfr->retry_count)
+		rc = 0;
+	IEXIT(rc);
+	return 0;
+}
+
+/* Returns the delay needed prior to retry.  If a read or write delay
+ * was specified and is larger than the retry delay or the error
+ * isn't a policy match, then the read/write delay will be returned.
+ */
+unsigned long rec_delay(iic_xfr_t* xfr)
+{
+	unsigned long rc;
+	IENTER();
+	rc = xfr->opts.recovery.redo_delay ;
+	if(rc < xfr->opts.xfr_opts.rdelay)
+		rc = xfr->opts.xfr_opts.rdelay;
+	IEXIT((int)rc);
+	return rc;
+}
+
+/* Keep IIC_XFR_RD, IIC_XFR_ASYNC, and IIC_XFR_FAST when retrying xfr. */
+#define IIC_XFR_RESET_MASK 0x00000007
+
+/* Called by the engine specific code to notify us that the transfer ended.
+ * If the transfer requires a delay before starting a new transfer,
+ * (i.e., the IIC_XFR_DELAYED bit is set), then unlocking the address,
+ * notifying caller of completion, and cleanup of transfer will be delayed
+ * using a kernel timer.
+ */ 
+void iic_xfr_complete(iic_xfr_t* xfr)
+{
+	unsigned short delay;
+	int rc = 0;
+	iic_eng_t *eng = 0;
+	iic_xfr_opts_t *opts;
+
+	IENTER();
+
+	if(!xfr)
+	{
+		IFLDe(0, "iic_xfr_complete called on null xfr!\n");
+		goto exit;
+	}
+
+	opts = &xfr->opts.xfr_opts;
+
+	if(test_bit(IIC_XFR_ENDED, &xfr->flags) ||
+	   test_bit(IIC_XFR_RETRY_IN_PROGRESS, &xfr->flags))
+	{
+		IFLDd(2, "iic_xfr_complete xfr[%p] flags[%08lx] no-op\n", 
+				xfr, xfr->flags);
+		goto exit;
+	}
+	
+	eng = xfr->client->bus->eng;
+
+	if(xfr->status == -ETIME && eng->ops->finish_rescue_timeout) {
+		xfr->status =
+			((rc = eng->ops->finish_rescue_timeout(eng, xfr)) >=
+			(long int)xfr->size)
+			? 0
+			: -ETIME;
+		if(xfr->status == 0 && xfr->bytes_xfrd < xfr->size)
+			xfr->client->flags |= IIC_CLIENT_EOD;
+		IFLDd(1, "xfr->status[%d]\n", xfr->status);
+	}
+
+	/* Check if we need to retry this transfer if it failed.
+	 * Only the first failure's FFDC and status will be kept.
+	 * If the transfer succeeds on a retry, the FFDC will be freed
+	 * and no error will be reported.
+	 */
+	if(rec_retry(xfr))
+	{
+			
+		IFLDi(7, "RETRY    client[%p], bus[%d.%d:%d.%d.%d.%d]\n", 
+		      xfr->client, IIC_GET_PLINK(eng->id), IIC_GET_PCFAM(eng->id),
+		      IIC_GET_LINK(eng->id), IIC_GET_CFAM(eng->id), 
+		      IIC_GET_ENG(eng->id), xfr->client->bus->port);
+		IFLDi(3, "  xfr[%p] count[%d] status[%d]\n", 
+		      xfr, xfr->retry_count + 1, xfr->status);
+
+		/* increment retry count */
+		xfr->retry_count++;
+
+		/* reset timeout timer */
+		if(xfr->opts.xfr_opts.timeout)
+		{
+			mod_timer(&xfr->timeout, jiffies + 
+				   msecs_to_jiffies( allow_retry(xfr) ) );
+		}
+
+		/* if xfr timed out before starting, just leave it
+		 * on the queue and give it another chance to run.
+		 */
+		if(!test_bit(IIC_XFR_STARTED, &xfr->flags))
+		{
+			goto exit;
+		}
+
+		/* reset xfr to start at the beginning
+		 * Note: can't do DMA on a retry because
+		 * dma_setup can't be called from a
+		 * interrupt handler.
+		 */ 
+		delay = rec_delay(xfr);
+
+		/* Multi-master - Backoff an extended period after every four retries */
+		if ((xfr->status == -EALREADY) && ((xfr->retry_count % 4) == 0))
+		{
+			delay += BACKOFF_DELAY;
+
+			/* adjust timeout timer to include backoff */
+			if(xfr->opts.xfr_opts.timeout)
+			{
+				mod_timer(&xfr->timeout, jiffies + 
+					   msecs_to_jiffies( xfr->opts.xfr_opts.timeout +
+								 BACKOFF_DELAY ) );
+			}
+		}
+
+		xfr->status = 0;
+		xfr->flags &= IIC_XFR_RESET_MASK;
+
+		/* notify others that a retry is in progress, so don't
+		 * call iic_xfr_complete until retry is attempted.
+		 * This flag is cleared when an error occurs or the xfr
+		 * completes successfully or is cancelled.  (Problem
+		 * noticed in timeout function when dma xfrs were retried.)
+		 */
+		set_bit(IIC_XFR_RETRY_IN_PROGRESS, &xfr->flags);
+		
+		/* Always call iic_delay_xfr so that failed transfers
+		 * are given time to be cleaned up before we try
+		 * a new transfer.  If the delay is 0, the transfer
+		 * is placed back on the queue and started as soon as
+		 * cleanup of the previous attempt completes
+		 */
+		iic_delay_xfr(xfr, delay);
+		goto exit;
+	}
+
+
+#ifdef DELAYED_COMPLETION
+	if(!test_bit(IIC_XFR_DELAYED, &xfr->flags))
+	{
+#endif
+		/* if this xfr currently owned the address lock, release it */
+		if(xfr->addr_lck->cur_xfr == xfr)
+		{
+			xfr->addr_lck->cur_xfr = 0;
+		}
+
+		/* unlock this xfr's address lock or dequeue lock request */
+		IDBGd(1, "xfr[%p] releasing lock\n", xfr);
+		iic_unlock(&xfr->client->bus->eng->lck_mgr, xfr->addr_lck);
+#ifdef DELAYED_COMPLETION
+	}
+#endif
+
+	/* If a transfer isn't already running, check if one is ready and
+	 * start it.
+	 */
+	if(eng->cur_xfr == xfr)
+	{
+		eng->cur_xfr = 0;
+	}
+	iic_start_next_xfr(eng);
+
+	/* Once iic_xfr_complete is called, the timeout and delay timers are
+	 * no longer needed.
+	 */
+	del_timer(&xfr->timeout);
+
+#ifdef DELAYED_COMPLETION
+	/* For transfers that require a delay, take care of unlocking
+	 * the address, completion notification, and cleanup later.
+	 */
+	if(test_bit(IIC_XFR_DELAYED, &xfr->flags))
+	{
+		xfr->delay.data = (unsigned long)xfr;
+		xfr->delay.function = iic_finish_complete;
+		mod_timer(&xfr->delay, jiffies + msecs_to_jiffies( xfr->opts.xfr_opts.rdelay ) );
+		IFLDd(2, "DELAYCOMP xfr[%p] time[%d]\n", xfr,
+						xfr->opts.xfr_opts.rdelay);
+		goto exit;
+	}
+#endif
+	del_timer(&xfr->delay);
+
+	set_bit(IIC_XFR_ENDED, &xfr->flags);
+
+	IFLDi(7, "COMPLETE client[%p] bus[%d.%d:%d.%d.%d.%d]\n", 
+	      xfr->client, IIC_GET_PLINK(eng->id), IIC_GET_PCFAM(eng->id),
+	      IIC_GET_LINK(eng->id), IIC_GET_CFAM(eng->id), IIC_GET_ENG(eng->id),
+	      xfr->client->bus->port);
+	IFLDi(2, "  xfr[%p] status[%d]\n", xfr, xfr->status);
+
+	/**
+	 * defer queueing of ffdc to the calling thread
+	 * or to iic_cleanup_xfr for async transfers.
+	 */
+
+	/* for async transfers, just call aio_complete and then cleanup
+	 * the xfr object.
+	 */
+	if(test_bit(IIC_XFR_ASYNC, &xfr->flags))
+	{
+		xfr->status = (xfr->status)? xfr->status: xfr->bytes_xfrd;
+		IFLDd(1, "aio_complete xfr[%p]\n", xfr);
+//		aio_complete(xfr->iocb, xfr->status, 0);
+		iic_cleanup_xfr(xfr, NULL);
+	}
+	
+	/* for sync transfers, just wake up the calling thread.  The
+	 * calling thread will handle any necessary cleanup.
+	 */
+	else
+	{
+		IFLDd(1, "wake xfr[%p] client\n", xfr);
+		wake_up_interruptible(&xfr->client->wait);
+	}
+exit:
+	IEXIT(0);
+	return;
+}
+EXPORT_SYMBOL(iic_xfr_complete);
+
+/* This function is either called within an interrupt context or when
+ * interrupts are disabled.  This function is called as recovery from
+ * various types of failures.  FFDC should already be filled in before
+ * calling this function.  Failures caused by the abort are ignored.
+ */
+void iic_abort_xfr(iic_xfr_t* xfr)
+{
+	int rc = 0;
+	iic_eng_t *eng = xfr->client->bus->eng;
+	IENTER();
+	IFLDi(1, "ABORTREQ xfr[%p]\n", xfr);
+
+	if(test_bit(IIC_XFR_ABORT, &xfr->flags))
+	{
+		IDBGd(0, "abort already started!\n");
+		goto exit;
+	}
+
+	/* If this was a retry, the retry completed.  clear flag so that
+	 * iic_xfr_complete can do its work.
+	 */	
+	clear_bit(IIC_XFR_RETRY_IN_PROGRESS, &xfr->flags);
+	
+	set_bit(IIC_XFR_ABORT, &xfr->flags);
+	/* If the xfr is still waiting to run, remove it from the queue */
+	if(eng->cur_xfr != xfr)
+	{
+		list_del(&xfr->q_entry);
+	}
+	/* Otherwise, the xfr is running.  Lock the engine, Signal the hw 
+	 * to halt the transfer.
+	 */
+	else
+	{
+		/* lock the engine so we don't try to start a new transfer
+		 * until the current transfer is aborted
+		 */
+		set_bit(IIC_ENG_ABORT, &eng->flags);
+
+		/* once the IIC_ENG_ABORT flag is set, the interrupt
+		 * handler will no longer access the xfr data structure
+		 * and it's safe to set the IIC_XFR_ENG_COMPLETE flag.
+		 */
+		set_bit(IIC_XFR_ENG_COMPLETED, &xfr->flags);
+
+		/* don't access hw if failed due to a parent bus access error */
+		if(!test_bit(IIC_NO_ACCESS, &eng->flags))
+		{
+			/* start the abort procedure */
+			rc = eng->ops->start_abort(eng, 0/*ignore ffdc*/);
+		}
+
+		/* Finish off the abort inside a work queue context.  When
+		 * the abort is completed, the engine will get unlocked and
+		 * iic_start_next_xfr will get called.
+		 */
+		schedule_work(&eng->work);
+
+	}
+exit:
+	IEXIT(0);
+	return;
+}
+EXPORT_SYMBOL(iic_abort_xfr);
+
+/* Work queue function that finishes an abort operation */
+void iic_finish_abort(struct work_struct * work)
+{
+	unsigned long flags;
+	iic_eng_t* eng = container_of(work, iic_eng_t, work);
+	IENTER();
+	/* don't access hw if we lost engine access */
+	if(!test_bit(IIC_NO_ACCESS, &eng->flags))
+	{
+		eng->ops->finish_abort(eng, 0);
+	}
+	spin_lock_irqsave(&eng->lock, flags);
+	clear_bit(IIC_ENG_ABORT, &eng->flags);
+	iic_start_next_xfr(eng);
+	spin_unlock_irqrestore(&eng->lock, flags);
+	IFLDd(0, "ABORTREQ (completed)\n");
+	IEXIT(0);
+}
+
+	
+/* Timer function that handles the case where a transfer or abort takes
+ * too long to complete.
+ */
+void iic_timeout(unsigned long data)
+{
+	iic_xfr_t *xfr = (iic_xfr_t*)data;
+	iic_eng_t *eng  = xfr->client->bus->eng;
+	unsigned long flags;
+
+	spin_lock_irqsave(&eng->lock, flags);
+	IENTER();
+	IFLDi(1, "TIMEOUT  xfr[%p]\n", xfr);
+	if(test_bit(IIC_XFR_ENDED, &xfr->flags))
+		goto exit;
+
+	if(eng->ops->start_rescue_timeout) {
+		int rc;
+		xfr->status =
+			((rc = eng->ops->start_rescue_timeout(eng, xfr)) >=
+			(long int)xfr->size)
+			? xfr->status
+			: -ETIME;
+		if(xfr->status == 0 && xfr->bytes_xfrd < xfr->size)
+			xfr->client->flags |= IIC_CLIENT_EOD;
+	} else
+		xfr->status = -ETIME;
+
+	IFLDd(1, "xfr->status[%d]\n", xfr->status);
+
+	/* makes sure xfr_complete gets called in dma callback function */
+	set_bit(IIC_XFR_ENG_COMPLETED, &xfr->flags);
+
+	/* for DMA, this will cause dma_notify to get called which
+	 * calls our callback function, which calls
+	 * abort_xfr / xfr_complete.
+	 */
+	iic_abort_xfr(xfr);
+
+	/* Don't force users to wait for the abort to complete */
+	iic_xfr_complete(xfr);
+exit:
+	spin_unlock_irqrestore(&eng->lock, flags);
+	IEXIT(0);
+}
+
+int iic_xfr_ready(iic_xfr_t* xfr)
+{
+	int rc = 0;  //xfr not ready
+	iic_lck_t *lck = xfr->addr_lck;
+	IENTER();
+
+	/* If this xfr owns the lock and isn't write delayed, and isn't
+	 * blacklisted, the transfer is ready to run.
+	 */
+	if(!test_bit(IIC_XFR_DELAYED, &xfr->flags) &&
+			(lck->count > 0) &&
+			((lck->cur_xfr == 0) || (lck->cur_xfr == xfr)))
+	{
+		IDBGf(1, "xfr[%p] good to go\n", xfr);
+		lck->cur_xfr = xfr;
+		rc = 1;
+	}
+
+	IEXIT(rc);
+	return rc;
+}
+
+int iic_start_next_xfr(iic_eng_t* eng)
+{
+	int rc = 0;
+	iic_xfr_t *iterator, *xfr;
+	IENTER();
+	xfr = 0;
+
+	/* if a xfr is already running, or there is an abort or reset then
+	 * do nothing.
+	 */
+	if(eng->cur_xfr || 
+	   test_bit(IIC_ENG_ABORT, &eng->flags) ||
+	   test_bit(IIC_ENG_RESET, &eng->flags) ||
+	   test_bit(IIC_ENG_BLOCK, &eng->flags))
+	{
+		/* Notify thread waiting to do reset that the engine might
+		 * be idle now.
+		 */
+		if(test_bit(IIC_ENG_RESET, &eng->flags))
+		{
+			wake_up_interruptible(&eng->waitq);
+		}
+		goto exit;
+	}
+
+	IDBGl(0, "Looking for next xfr\n");
+	/* scan the queue from the beginning for a transfer that's ready */
+	/* if the process that submitted the xfr is black-listed, it will
+	 * be skipped
+	 */
+	list_for_each_entry(iterator, &eng->xfrq, q_entry)
+	{
+		if(iic_xfr_ready(iterator))
+		{
+			xfr = iterator;
+			break;
+		}
+	}
+
+	/* If a xfr is ready to go,  start it */
+	if(xfr)
+	{
+		/* set the delay bit here if necessary so that if the transfer
+		 * is aborted other transfers to the same address will be
+		 * delayed appropriately in iic_xfr_complete.
+		 */
+		if(xfr->opts.xfr_opts.rdelay)
+		{
+			set_bit(IIC_XFR_DELAYED, &xfr->flags);
+		}
+		eng->cur_xfr = xfr;
+		list_del(&xfr->q_entry);
+		if(!test_bit(IIC_XFR_STARTED, &xfr->flags))
+			IFLDs(3, "START    client[%p] bus[%08lx] xfr[%p]\n",
+				xfr->client, xfr->client->bus->bus_id, xfr);
+		clear_bit(IIC_NO_ACCESS, &eng->flags);
+		set_bit(IIC_XFR_STARTED, &xfr->flags);
+		rc = eng->ops->start(xfr); 
+		if(rc)
+		{
+			/* If this was a retry, the retry completed.  
+			 * clear flag so that
+			 * iic_xfr_complete can do its work.
+			 */	
+			clear_bit(IIC_XFR_RETRY_IN_PROGRESS, &xfr->flags);
+
+			IFLDe(2, "xfr[%p] start failed: %d\n", xfr, rc);
+			iic_abort_xfr(xfr); 
+			set_bit(IIC_XFR_ENG_COMPLETED, &xfr->flags);
+
+			iic_xfr_complete(xfr);
+		}
+	}
+
+exit:
+	IEXIT(rc);
+	return rc;
+}
+
+/* Adds a xfr to the end of the queue */
+int iic_enq_xfr(iic_xfr_t *xfr)
+{
+	int rc;
+	unsigned long flags;
+	iic_eng_t *eng = xfr->client->bus->eng;
+	iic_xfr_opts_t *opts = &xfr->opts.xfr_opts;
+	IENTER();
+	spin_lock_irqsave(&eng->lock, flags);
+
+	/* Submit a lock request for this xfr (non-blocking) */
+	rc = iic_req_lock(&eng->lck_mgr,
+			  opts->dev_addr,
+			  (opts->inc_addr >> (opts->dev_width * 8)),
+			  xfr->client,
+			  &xfr->addr_lck);
+	if(rc < 0)
+	{
+		goto exit;
+	}
+
+	/* enqueue this xfr */
+	IFLDi(7, "SUBMIT   client[%p] bus[%d.%d:%d.%d.%d.%d]\n",
+	      xfr->client, IIC_GET_PLINK(eng->id), IIC_GET_PCFAM(eng->id), 
+	      IIC_GET_LINK(eng->id), IIC_GET_CFAM(eng->id), IIC_GET_ENG(eng->id), 
+	      xfr->client->bus->port); 
+	IFLDi(5, "  xfr[%p] addr[%04x:%04x] sz[%08lx] timeout[%ld]\n", 
+	      xfr, opts->dev_addr + ((test_bit(IIC_XFR_RD, &xfr->flags))? 1:0), 
+	      opts->rsplit, xfr->size, opts->timeout);
+	list_add_tail(&xfr->q_entry, &eng->xfrq);
+	set_bit(IIC_XFR_QUEUED, &xfr->flags);
+
+	/* start a kernel timer that will abort the transfer 
+	 * if it takes too long.
+	 */
+	init_timer(&xfr->timeout);
+	xfr->timeout.data = (unsigned long)xfr;
+	xfr->timeout.function = iic_timeout;
+	if(opts->timeout)
+	{
+		xfr->timeout.expires = jiffies +
+				msecs_to_jiffies( allow_retry(xfr) );
+		add_timer(&xfr->timeout);
+	}
+	init_timer(&xfr->delay);
+
+	/* If no transfers are currently active, scan the queue for the
+	 * next transfer and start it
+	 */
+	iic_start_next_xfr(eng); 
+
+	rc = -EIOCBQUEUED;
+exit:
+	spin_unlock_irqrestore(&eng->lock, flags);
+	IEXIT(rc);
+
+	return rc;
+}
+
+int iic_wait_xfr(iic_xfr_t *xfr)
+{
+	int rc = 0;
+	unsigned long flags;
+
+	IENTER();
+	IFLDd(2, "WAIT     xfr[%p] time[%ld]\n", 
+			xfr, xfr->opts.xfr_opts.timeout);
+	rc = wait_event_interruptible(xfr->client->wait, 
+			test_bit(IIC_XFR_ENDED, &xfr->flags));
+	if(rc < 0)
+	{
+		/* EINTR is always retried at the adal level.  ADAL users
+		 * will never see the EINTR errno and won't know to collect
+		 * FFDC for it, so don't generate FFDC for EINTR but do
+		 * trace it.
+		 */
+		spin_lock_irqsave(&xfr->client->bus->eng->lock, flags);
+		if(!xfr->status)
+			xfr->status = -EINTR;
+		IFLDe(2, "aborting xfr[%p] due to signal. pid[%d]\n",
+			xfr, xfr->pid);
+		iic_abort_xfr(xfr);
+
+		/* Don't force users to wait for the abort to complete */
+		iic_xfr_complete(xfr);
+		spin_unlock_irqrestore(&xfr->client->bus->eng->lock, flags);
+	}
+	IEXIT(rc);
+	return rc;
+}
+
+/*
+ * Shared read method between user space applications and sideways kernel
+ * calls.
+ */
+ssize_t iic_common_read(iic_client_t * client, void * buf, size_t count,
+                        loff_t *offset, dd_ffdc_t ** o_ffdc)
+{
+	ssize_t rc = count;
+	iic_xfr_t *xfr;
+
+	IENTER();
+
+	BUG_ON(in_atomic());
+
+	if(!count)
+	{
+		rc = -EINVAL;
+		goto no_up;
+	}
+
+	if(down_interruptible(&client->sem))
+	{
+		rc = -EINTR;
+		goto no_up;
+	}
+
+	rc = iic_create_xfr(client, 0, buf, count, (1 << IIC_XFR_RD), &xfr,
+			o_ffdc);
+	if(rc)
+	{
+		goto exit;
+	}
+
+	/* enqueue or start the xfr */
+	rc = iic_enq_xfr(xfr);
+	if(rc != -EIOCBQUEUED)
+	{
+		goto error;
+	}
+
+	/* wait for xfr to complete */
+	iic_wait_xfr(xfr);
+
+	/* set rc appropriately */
+	if(xfr->status)
+	{
+		rc = xfr->status;
+	}
+	else
+	{
+		rc = xfr->bytes_xfrd;
+		client->opts.xfr_opts.offset += rc;
+	}
+
+	/* Data is already in the user buffer at this point.
+	 * Cleanup the transfer and return status to the user.
+	 */
+
+error:
+	iic_cleanup_xfr(xfr, o_ffdc);
+exit:
+	up(&client->sem);
+no_up:
+	IEXIT(rc);
+	return rc;
+}
+
+ssize_t iic_sideways_read(iic_client_t * client, void * buf, size_t count,
+                         loff_t *offset, dd_ffdc_t ** o_ffdc)
+{
+	client->opts.xfr_opts.offset = *offset;
+	return iic_common_read(client, buf, count, offset, o_ffdc);
+}
+EXPORT_SYMBOL(iic_sideways_read);
+
+ssize_t iic_read(struct file *filp, char __user *buf, size_t count,
+		 loff_t *offset)
+{
+	ssize_t rc = count;
+	char *kbuf;
+	iic_client_t *client = (iic_client_t*)filp->private_data;
+
+	IENTER();
+
+	if (client->flags & IIC_CLIENT_EOD) {
+		client->flags &= ~(IIC_CLIENT_EOD);
+		return 0;
+	}
+
+	if(filp->f_flags & O_NONBLOCK)
+	{
+		rc = -EAGAIN;
+		goto exit;
+	}
+
+	if(!access_ok(VERIFY_READ, buf, count))
+	{
+		rc = -EFAULT;
+		goto exit;
+	}
+
+	kbuf = kzalloc(count, GFP_KERNEL);
+	if (!kbuf) {
+		rc = -ENOMEM;
+		goto exit;
+	}
+
+	rc = iic_common_read(client, kbuf, count, offset, NULL);
+
+	copy_to_user(buf, kbuf, count);
+
+	kfree(kbuf);
+
+exit:
+	IEXIT(rc);
+	return rc;
+}
+
+/*
+ * Shared write method between user space and kernel 'sideways' calls.
+ */
+ssize_t iic_common_write(iic_client_t * client, void * buf, size_t count,
+                         loff_t * offset, dd_ffdc_t ** o_ffdc)
+{
+	ssize_t rc = count;
+	iic_xfr_t *xfr;
+
+	IENTER();
+
+	BUG_ON(in_atomic());
+
+	if(!count)
+	{
+		rc = -EINVAL;
+		goto no_up;
+	}
+
+	if(down_interruptible(&client->sem))
+	{
+		rc = -EINTR;
+		goto no_up;
+	}
+
+	rc = iic_create_xfr(client, 0, buf, count, 0, &xfr, o_ffdc);
+	if(rc)
+	{
+		goto exit;
+	}
+
+	/* enqueue or start the xfr */
+	rc = iic_enq_xfr(xfr);
+	if(rc != -EIOCBQUEUED)
+	{
+		goto error;
+	}
+
+	/* wait for xfr to complete */
+	iic_wait_xfr(xfr);
+
+	/* set rc appropriately */
+	if(xfr->status)
+	{
+		rc = xfr->status;
+	}
+	else
+	{
+		rc = xfr->bytes_xfrd;
+		client->opts.xfr_opts.offset += rc;
+	}
+
+error:
+	iic_cleanup_xfr(xfr, o_ffdc);
+exit:
+	up(&client->sem);
+no_up:
+	IEXIT(rc);
+	return rc;
+}
+
+ssize_t iic_sideways_write(iic_client_t * client, void * buf, size_t count,
+                          loff_t * offset, dd_ffdc_t ** o_ffdc)
+{
+	client->opts.xfr_opts.offset = *offset;
+	return iic_common_write(client, buf, count, offset, o_ffdc);
+}
+EXPORT_SYMBOL(iic_sideways_write);
+
+ssize_t iic_write(struct file *filp, const char __user *buf, size_t count,
+	       	  loff_t *offset)
+{
+	ssize_t rc = count;
+	char *kbuf;
+	iic_client_t *client = (iic_client_t*)filp->private_data;
+
+	IENTER();
+
+	if (client->flags & IIC_CLIENT_EOD) {
+		client->flags &= ~(IIC_CLIENT_EOD);
+		return 0;
+	}
+
+	/* don't support posted writes at this time */
+	if(filp->f_flags & O_NONBLOCK)
+	{
+		rc = -EAGAIN;
+		goto exit;
+	}
+
+	if(!access_ok(VERIFY_WRITE, buf, count))
+	{
+		rc = -EFAULT;
+		goto exit;
+	}
+
+	kbuf = kzalloc(count, GFP_KERNEL);
+	if (!kbuf) {
+		rc = -ENOMEM;
+		goto exit;
+	}
+
+	copy_from_user(kbuf, buf, count);
+
+	rc = iic_common_write(client, kbuf, count, offset, NULL);
+
+	kfree(kbuf);
+
+exit:
+	IEXIT(rc);
+	return rc;
+}
+
+/* timout is in milliseconds! */
+int iic_reset(iic_bus_t* bus, int timeout, iic_ffdc_t** ffdc)
+{
+	int rc;
+	IENTER();
+	//IFLDi(1, "bus[%08lx]: reset requested\n", bus->bus_id);
+	/* block new transfers from starting on the engine */
+	set_bit(IIC_ENG_RESET, &bus->eng->flags);
+
+	/* wait for any pending operations on the engine to complete */
+	/* Note - timeout must be in jiffies for wait_for_idle! */
+	rc = bus->eng->ops->wait_for_idle(bus->eng, msecs_to_jiffies( timeout ), ffdc);
+	if(!rc)
+	{
+		/* do the reset */
+		rc = bus->eng->ops->reset_bus(bus, ffdc);
+		if(!rc)
+		{
+			set_current_state(TASK_UNINTERRUPTIBLE);
+
+			/* schedule_timeout requires its parameter in jiffies. */
+			rc = schedule_timeout(IIC_RESET_DELAY);
+		}
+	}
+	if(rc < 0)
+	{
+		IFLDe(2, "bus[%08lx] reset failed: %d\n", bus->bus_id, rc);
+	}
+	else
+	{
+		IFLDi(2, "bus[%08lx]: reset complete. stucked[%d]",
+		      bus->bus_id, (rc == 1)? 1: 0);
+	}
+
+	/* restart processing of new transfers */
+	spin_lock_irq(&bus->eng->lock);
+	clear_bit(IIC_ENG_RESET, &bus->eng->flags);
+	iic_start_next_xfr(bus->eng);
+	spin_unlock_irq(&bus->eng->lock);
+
+	IEXIT(rc);
+	return rc;
+
+}
+EXPORT_SYMBOL(iic_reset);
+
+/* We need to make sure no transfers are in progress before reading the state
+ * of a bus in case we need to switch to a different bus.
+ * Note: timeout is in milliseconds!
+ */
+int iic_get_bus_state(iic_bus_t* bus, unsigned long* state, int timeout, 
+		iic_ffdc_t** ffdc)
+{
+	int rc;
+	
+	IENTER();
+	/* block new transfers from starting on the engine */
+	set_bit(IIC_ENG_RESET, &bus->eng->flags);
+	
+	/* wait for any pending operations on the engine to complete
+	 * Note:  timeout must be in jiffies
+	 */
+	rc = bus->eng->ops->wait_for_idle(bus->eng, msecs_to_jiffies( timeout ), ffdc);
+	if(!rc)
+	{
+	        /* check bus state */
+	        rc = bus->eng->ops->get_bus_state(bus, state, ffdc);
+		IDBGs(3, "get_bus_state[%08lx]: state=%08lx, rc=%d\n",
+				bus->bus_id, *state, rc);
+	}
+	
+	/* restart processing of new transfers */
+	spin_lock_irq(&bus->eng->lock);
+	clear_bit(IIC_ENG_RESET, &bus->eng->flags);
+	iic_start_next_xfr(bus->eng);
+	spin_unlock_irq(&bus->eng->lock);
+	        
+	IEXIT(rc);
+	return rc;
+}
+
+#define IIC_W(a) _IOC(_IOC_WRITE, 0, a, 0)
+#define IIC_R(a) _IOC(_IOC_READ, 0, a, 0)
+
+/*
+During an I2C transfer there is often the need to first send a command 
+and then read back an answer right away. This has to be done without the 
+risk of another (multimaster) device interrupting this atomic operation. 
+The I2C protocol defines a so-called repeated start condition. After 
+having sent the address byte (address and read/write bit) the master may 
+send any number of bytes followed by a stop condition. Instead of sending 
+the stop condition it is also allowed to send another start condition 
+again followed by an address (and of course including a read/write bit) 
+and more data. This is defined recursively allowing any number of start 
+conditions to be sent. The purpose of this is to allow combined 
+write/read operations to one or more devices without releasing the bus 
+and thus with the guarantee that the operation is not interrupted.
+
+Before reading data from the slave, you must tell it which of its
+internal address (offset) you want to read.
+So a read of the slave actually starts off by writing to it.
+This is the same as when you want to write to it: You send the
+start sequence, the I2C address of the slave with the R/W bit
+and the internal register number (i.e offset) you want to write to.
+Now you send another start sequence (sometimes called a restart)
+and the I2C address again - this time
+with the read bit set. You then read as many data bytes as you
+wish and terminate the transaction with a stop sequence.
+*/
+
+int iic_repeated_xfer(iic_client_t *client, struct i2c_msg msgs[], int num)
+{
+	struct i2c_msg *pmsg;
+	iic_xfr_t *xfr;
+	iic_opts_t* opts;
+	iic_xfr_opts_t* xfr_opts;
+	u8 __user **data_ptrs;
+	u8 *current_msg_buf_ptr;
+	int rc = 0;
+	int i;
+	unsigned long options;
+
+	opts = &client->opts;
+	xfr_opts = &opts->xfr_opts;
+	//unsigned long new_port = xfr->client->bus->port;
+
+	data_ptrs = kmalloc(num * sizeof(u8 __user *), GFP_KERNEL);
+        if (data_ptrs == NULL) {
+                rc = -ENOMEM;
+		goto exit;
+        }
+
+	// Get the offset from the configuration which is the default.
+	// The default will be overridden by the message.
+	for (i = 0; i < num; i++) {
+		pmsg = &msgs[i];
+		if (!pmsg->len) /* If length is zero */
+                     continue;  /* on to the next request. */
+		data_ptrs[i] = (u8 __user *)msgs[i].buf;
+		current_msg_buf_ptr = kmalloc(pmsg->len, GFP_KERNEL); 
+		if (current_msg_buf_ptr == NULL) 
+		{
+			rc = -ENOMEM;
+			goto error;
+		}
+		// Bring over the user space buffer in order to
+		// retrieve the offset.
+		// We need to set up the offset before calling
+		// iic_create_xfr. 
+		// We still pass the user buffer to the iic_create_xfr because
+		// the function will do its own conversion.
+	  	if(copy_from_user(current_msg_buf_ptr,
+                         data_ptrs[i],
+                         msgs[i].len)) 
+		{
+                        rc = -EFAULT;
+			kfree(current_msg_buf_ptr);
+			goto error;
+                }
+
+		options = 0;
+		if (i != num -1)
+		{
+			set_bit(IIC_REPEATED_START, &options);
+			xfr_opts->flags |= options;
+		}
+		else
+		{
+			clear_bit(IIC_REPEATED_START, &options);
+			xfr_opts->flags &= options;
+		}
+
+		// Need to set the slave address here
+		xfr_opts->dev_addr =  pmsg->addr;
+		// The offset is passed down by the adal_iic_config using 
+		// the ADAL_IIC_CFG_OFFSET parameter.
+		// Refer to the ioctl case IIC_W(IIC_IOC_OFFSET):
+		// xfr_opts->offset = val;
+		// The user should configure the dev_width for their specific
+		// slave device before calling the ioctl.
+		// If the dev_width = 0, then we set the option to default 2. 
+		if (xfr_opts->dev_width == 0)
+		{
+			xfr_opts->dev_width = 2;
+		}
+		
+
+		// This is the read command
+		if (pmsg->flags & I2C_M_RD) 
+		{
+			//set_bit(IIC_XFR_RD, &options);
+			rc = iic_create_xfr(client, 0, (void*)pmsg->buf,
+					   pmsg->len, (1 << IIC_XFR_RD), &xfr,
+					   NULL);
+		}
+		else
+		{
+			if (num > 1)
+			{
+				// Multiple messages recieved
+				// The first msg contains the offset for 
+				// the repeated start.
+				// Otherwise it's just a regular write.
+				if ( (i == 0) && (msgs[1].flags & I2C_M_RD) )
+				{
+					   xfr_opts->offset = *current_msg_buf_ptr;
+					// Set the offset and don't do the write
+					continue;
+				}
+			} 
+
+			// This is a regular write
+
+			rc = iic_create_xfr(client, 0, (void*)pmsg->buf,
+					    pmsg->len, 0, &xfr, NULL);
+		}
+		if(rc)
+		{
+			goto exit;
+		}
+		/* enqueue or start the xfr */
+		rc = iic_enq_xfr(xfr);
+		if(rc != -EIOCBQUEUED)
+		{
+			goto error;
+		}
+
+		/* wait for xfr to complete */
+		iic_wait_xfr(xfr);
+		/* set rc appropriately */
+		rc = xfr->status;
+		kfree(current_msg_buf_ptr);
+	}
+	/* Data is already in the user buffer at this point.
+	 * Cleanup the transfer and return status to the user.
+	 */
+	
+error:
+	iic_cleanup_xfr(xfr, NULL);
+exit:
+	kfree(data_ptrs);
+	return rc;
+}
+long iic_ioctl(struct file *file, unsigned int cmd,
+              unsigned long arg)
+{
+	iic_ffdc_t* ffdc = 0;
+	int ret = 0;
+	unsigned long val = 0;
+	iic_client_t* client;
+	iic_eng_t* eng;
+	iic_opts_t* opts;
+	iic_xfr_opts_t* xfr_opts;
+	iic_rec_pol_t* recovery;
+	int ioc_nr = _IOC_NR(cmd);
+	struct i2c_msg *iic_msg_ptr;
+	struct i2c_rdwr_ioctl_data iic_msg_arg;
+
+	IENTER();
+
+	client = (iic_client_t*)file->private_data;
+	eng = client->bus->eng;
+	
+	/* Allow address unlock to occur even if blacklisted or blocked */
+	if(ioc_nr == IIC_IOC_ULCK_ADDR)
+		goto skip_check;
+	if(test_bit(IIC_ENG_BLOCK, &eng->flags))
+	{
+		IFLDe(1, "IOCTL    eng[%08x] blocked\n", eng->id);
+		ret = -ENODEV;
+		if(test_bit(IIC_ENG_REMOVED, &eng->flags))
+			ret = -ENOLINK;
+		goto exit;
+	}
+
+skip_check:
+	opts = &client->opts;
+	xfr_opts = &opts->xfr_opts;
+	recovery = &opts->recovery;
+
+	if(down_interruptible(&client->sem))
+	{
+		IEXIT(-EINTR);
+		return -EINTR;
+	}
+
+	if((_IOC_TYPE(cmd) != IIC_IOC_MAGIC) ||
+	   (_IOC_NR(cmd) > IIC_IOC_MAXNR))
+	{
+		ret = -ENOTTY;
+		goto exit;
+	}
+
+	/* strip the magic and size info from the command that we don't care
+	 * about.
+	 */
+	cmd = _IOC(_IOC_DIR(cmd), 0, _IOC_NR(cmd), 0);
+
+	/* Check if no data needs to be transfered for this ioctl */
+	if(_IOC_DIR(cmd) == _IOC_NONE)
+	{
+		switch(_IOC_NR(cmd))
+		{
+			case IIC_IOC_RESET_FULL:
+				/* reset xfr opts to default values */
+				memcpy(opts, &iic_dflt_opts, sizeof(*opts));
+
+			case IIC_IOC_RESET_LIGHT:
+				/* only allow 1 user requested reset per engine
+				 * at a time.
+				 */
+				IFLDi(2, "RESET    client[%p] bus[%08lx]\n",
+						client, client->bus->bus_id);
+				if(down_interruptible(&eng->sem))
+				{
+					ret = -EINTR;
+					break;
+				}
+				ret = iic_reset(client->bus, xfr_opts->timeout, &ffdc);
+				up(&eng->sem);
+
+				break;
+			case IIC_IOC_REPEATED_IO:
+				// The buffer pointer is stored in arg.
+				// Try to get the pointer out from the arg and
+				// send the request out one by one using the
+				// existing I/O method. 
+				// Do not write "STOP" until the last I/O request
+				// is done.
+	            		ret = copy_from_user(&iic_msg_arg,
+               		   		(struct i2c_rdwr_ioctl_data __user *)arg, sizeof(iic_msg_arg));
+	            		if (ret)
+				{
+					ret = -EFAULT;
+					break;
+				}
+				/* Put an arbitrary limit on the number of messages that can
+                 		* be sent at once */
+                		if (iic_msg_arg.nmsgs > I2C_RDRW_IOCTL_MAX_MSGS)
+				{
+					ret = -EFAULT;
+					break;
+				}
+				iic_msg_ptr = (struct i2c_msg *)
+                        	kmalloc(iic_msg_arg.nmsgs * sizeof(struct i2c_msg),
+                        		GFP_KERNEL);
+				if (iic_msg_ptr == NULL)
+				{
+					ret = -ENOMEM;
+					break;
+				}
+
+		        	if (copy_from_user(iic_msg_ptr, iic_msg_arg.msgs,
+                                   iic_msg_arg.nmsgs * sizeof(struct i2c_msg))) 				{
+                            		kfree(iic_msg_ptr);
+                            		ret =  -EFAULT;
+					break;
+                		}
+
+				// We don't want to convert the data pointer here
+				// because the set_iic_xfr will do the conversion 
+
+				ret = iic_repeated_xfer(client, iic_msg_ptr, 
+					iic_msg_arg.nmsgs);
+				if (ret < 0)
+				{
+					ret = -EFAULT;
+                			kfree(iic_msg_ptr);
+					break;
+				}
+				else
+					ret = 0;
+                		kfree(iic_msg_ptr);
+
+			break;
+			default:
+				ret = -EINVAL;
+		}
+		goto exit;
+	}
+
+	/* handle 4 byte args here */
+	if(ioc_nr <= IIC_IOC_4_BYTES)
+	{
+		if((_IOC_DIR(cmd) == _IOC_WRITE) &&
+	   	   (ret = get_user(val, (unsigned long*)arg)))
+		{
+			goto exit;
+		}
+		switch(cmd)
+		{
+			case IIC_W(IIC_IOC_SPEED):
+				if((val < 1) || (val > 55))
+				{
+					ret = -EINVAL;
+					break;
+				}
+				ret = eng->ops->set_speed(client->bus, 
+							  val);
+				break;
+			case IIC_R(IIC_IOC_SPEED):
+				val = eng->ops->get_speed(client->bus);
+				break;
+			case IIC_W(IIC_IOC_DEV_ADDR):
+				xfr_opts->dev_addr = val;
+				xfr_opts->offset = 0;
+				break;
+			case IIC_R(IIC_IOC_DEV_ADDR):
+				val = xfr_opts->dev_addr;
+				break;
+			case IIC_W(IIC_IOC_DEV_WIDTH):
+				xfr_opts->dev_width = val;
+				xfr_opts->offset = 0;
+				break;
+			case IIC_R(IIC_IOC_DEV_WIDTH):
+				val = xfr_opts->dev_width;
+				break;
+			case IIC_W(IIC_IOC_OFFSET):
+				xfr_opts->offset = val;
+				break;
+			case IIC_R(IIC_IOC_OFFSET):
+				val = xfr_opts->offset;
+				break;
+			case IIC_W(IIC_IOC_INC_ADDR):
+				xfr_opts->inc_addr = val;
+				break;
+			case IIC_R(IIC_IOC_INC_ADDR):
+				val = xfr_opts->inc_addr;
+				break;
+			case IIC_W(IIC_IOC_TIMEOUT):
+				xfr_opts->timeout = val;
+				break;
+			case IIC_R(IIC_IOC_TIMEOUT):
+				val = xfr_opts->timeout;
+				break;
+			case IIC_W(IIC_IOC_RDELAY):
+				xfr_opts->rdelay = val;
+				break;
+			case IIC_R(IIC_IOC_RDELAY):
+				val = xfr_opts->rdelay;
+				break;
+			case IIC_W(IIC_IOC_WDELAY):
+				xfr_opts->wdelay = val;
+				break;
+			case IIC_R(IIC_IOC_WDELAY):
+				val = xfr_opts->wdelay;
+				break;
+			case IIC_W(IIC_IOC_RSPLIT):
+				xfr_opts->rsplit = val;
+				break;
+			case IIC_R(IIC_IOC_RSPLIT):
+				val = xfr_opts->rsplit;
+				break;
+			case IIC_W(IIC_IOC_WSPLIT):
+				xfr_opts->wsplit = val;
+				break;
+			case IIC_R(IIC_IOC_WSPLIT):
+				val = xfr_opts->wsplit;
+				break;
+			case IIC_W(IIC_IOC_REDO_POL):
+				recovery->redo_pol = val;
+				break;
+			case IIC_R(IIC_IOC_REDO_POL):
+				val = recovery->redo_pol;
+				break;
+			case IIC_W(IIC_IOC_REDO_DELAY):
+				recovery->redo_delay = val;
+				break;
+			case IIC_R(IIC_IOC_REDO_DELAY):
+				val = recovery->redo_delay;
+				break;
+			case IIC_R(IIC_IOC_BUS_STATE):
+				if(down_interruptible(&eng->sem))
+				{
+					ret = -EINTR;
+					break;
+				}
+				ret = iic_get_bus_state(client->bus, &val,
+							xfr_opts->timeout, 
+							&ffdc);
+				up(&eng->sem);
+				break;
+			case IIC_W(IIC_IOC_FLAGS):
+				if(val & ~(IIC_FORCE_DMA | IIC_NO_DMA | 
+							IIC_SPECIAL_RD))
+				{
+					ret = -EINVAL;
+					break;
+				}
+				xfr_opts->flags = val;
+				break;
+			case IIC_R(IIC_IOC_FLAGS):
+				val = xfr_opts->flags;
+				break;
+			default:
+				ret = -EINVAL;
+		}
+		if((_IOC_DIR(cmd) == _IOC_READ) && !ret)
+		{
+			ret = put_user(val, (unsigned long*)arg);
+		}
+		goto exit;
+	}
+
+	/* handle objects larger than 4 bytes here */
+	switch(cmd)
+	{
+		iic_lock_t ulck;
+		iic_lck_t *klck;
+
+		case IIC_W(IIC_IOC_LCK_ADDR):
+		case IIC_W(IIC_IOC_LCK_ENG):
+			if((ret = copy_from_user(&ulck, (void*)arg, 
+							sizeof(ulck))))
+			{
+				ret = -EFAULT;
+				break;
+			}
+
+			ret = iic_wait_lock(&eng->lck_mgr, ulck.addr,
+					    (cmd == IIC_W(IIC_IOC_LCK_ENG))
+					    ? ulck.mask
+					    : ulck.mask >> 1,
+					    client,
+					    msecs_to_jiffies( ulck.timeout));
+			break;
+		case IIC_W(IIC_IOC_ULCK_ADDR):
+		case IIC_W(IIC_IOC_ULCK_ENG):
+			if((ret = copy_from_user(&ulck, (void*)arg, 
+							sizeof(ulck))))
+			{
+				ret = -EFAULT;
+				break;
+			}
+			spin_lock_irq(&eng->lock);
+			klck = iic_find_handle(&eng->lck_mgr, client,
+					       ulck.addr,
+					       (cmd == IIC_W(IIC_IOC_ULCK_ENG))
+					       ? ulck.mask
+					       : ulck.mask >> 1);
+			if(klck)
+			{
+				ret = iic_unlock(&eng->lck_mgr, klck);
+				if(!ret)
+					iic_start_next_xfr(eng);
+			}
+			spin_unlock_irq(&eng->lock);
+			break;
+		case IIC_W(IIC_IOC_ALL):
+			if((ret = copy_from_user(opts, (void*)arg, 
+							sizeof(*opts))))
+			{
+				ret = -EFAULT;
+			}
+			break;
+		case IIC_R(IIC_IOC_ALL):
+			if((ret = copy_to_user((void*)arg, opts, 
+							sizeof(*opts))))
+			{
+				ret = -EFAULT;
+			}
+			break;
+		case IIC_W(IIC_IOC_DISPLAY_REGS):
+			eng->ops->display_regs(eng, 0);
+			break;
+		default:
+			ret = -EINVAL;
+			goto exit;
+	}
+
+exit:
+	up(&client->sem);
+	IFLDd(5, "IOCTL    client[%p] bus[%08lx] cmd[%08x] ptr[%08lx] val[%08lx]\n",
+			client, client->bus->bus_id, cmd, arg, val);
+	IEXIT(ret);
+	return ret;
+}
+
+loff_t iic_llseek(struct file *filp, loff_t off, int whence)
+{
+	iic_client_t* client;
+	iic_xfr_opts_t* xfr_opts;
+	loff_t new_pos;
+
+	IENTER();
+	client = (iic_client_t*)filp->private_data;
+	xfr_opts = &client->opts.xfr_opts;
+
+	if(down_interruptible(&client->sem))
+	{
+		new_pos = -EINTR;
+		goto exit;
+	}
+	switch(whence)
+	{
+		case 0: /* SEEK_SET */
+			new_pos = off;
+			break;
+		case 1: /* SEEK_CUR */
+			new_pos = xfr_opts->offset + off;
+			break;
+		case 2: /* SEEK_END, not supported */
+		default:
+			new_pos = -EINVAL;
+	}
+
+	if(new_pos >= 0)
+	{
+		xfr_opts->offset = new_pos;
+	}
+	up(&client->sem);
+exit:
+	IFLDd(2, "client[%p] seek: new_pos=%08lx\n", client, 
+		(unsigned long)new_pos);
+	IEXIT((int)new_pos);
+	return new_pos;
+}
+
+static int iic_mmap(struct file* filp, struct vm_area_struct* vma)
+{
+	int rc = 0;
+	iic_client_t *client = (iic_client_t*)filp->private_data;
+	iic_eng_t* eng = client->bus->eng;
+	// iopa doesn't exist in MCP6 kernel 
+	unsigned long phys_base_addr = virt_to_phys((unsigned long *)eng->base);
+	IENTER();
+	printk("mmap\n");
+
+	vma->vm_flags |= VM_DONTEXPAND | VM_DONTDUMP | VM_IO;
+	printk(">>remap_page_range(%08lX, 0, %08lX, %08lX, )\n",
+			vma->vm_start, phys_base_addr, vma->vm_end - vma->vm_start);
+	rc = remap_pfn_range(vma, vma->vm_start, phys_base_addr,
+			vma->vm_end - vma->vm_start,
+			vma->vm_page_prot);
+	printk("<<remap_page_range = %d\n", rc);
+	if(rc){
+		return -EINVAL;
+	}
+	IEXIT(0);
+	return 0;
+}
+
 int iic_register_eng_ops(iic_eng_ops_t* new_ops, unsigned long type)
 {
 	iic_eng_type_t* new_type = (iic_eng_type_t*)
diff --git a/include/uapi/linux/Kbuild b/include/uapi/linux/Kbuild
index 9493842..aa4eb10 100644
--- a/include/uapi/linux/Kbuild
+++ b/include/uapi/linux/Kbuild
@@ -155,6 +155,7 @@ header-y += hyperv.h
 header-y += hysdn_if.h
 header-y += i2c-dev.h
 header-y += i2c.h
+header-y += i2cfsi.h
 header-y += i2o-dev.h
 header-y += i8k.h
 header-y += icmp.h
diff --git a/include/uapi/linux/i2cfsi.h b/include/uapi/linux/i2cfsi.h
new file mode 100644
index 0000000..78cab53
--- /dev/null
+++ b/include/uapi/linux/i2cfsi.h
@@ -0,0 +1,136 @@
+/*
+ *   Copyright (c) International Business Machines Corp., 2006, 2009
+ *
+ *   This program is free software;  you can redistribute it and/or modify
+ *   it under the terms of the GNU General Public License as published by
+ *   the Free Software Foundation; either version 2 of the License, or
+ *   (at your option) any later version.
+ *
+ *   This program is distributed in the hope that it will be useful,
+ *   but WITHOUT ANY WARRANTY;  without even the implied warranty of
+ *   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See
+ *   the GNU General Public License for more details.
+ *
+ *   You should have received a copy of the GNU General Public License
+ *   along with this program;  if not, write to the Free Software
+ *   Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA 02111-1307 USA
+ */
+
+#ifndef _UAPI_I2CFSI_H
+#define _UAPI_I2CFSI_H
+
+#define  I2C_RDRW_IOCTL_MAX_MSGS        42
+
+typedef struct iic_rec_pol
+{
+	unsigned long redo_pol;
+#define IIC_VAL_ADDR_NOACK	0x00010000
+#define IIC_VAL_DATA_NOACK	0x00020000
+#define IIC_VAL_TIMEOUT		0x00040000
+#define IIC_VAL_LOST_ARB	0x00080000
+#define IIC_VAL_BUS_ERR		0x00100000
+#define IIC_VAL_ALL_ERRS	0xffff0000
+	unsigned long rsvd;
+	unsigned long redo_delay;
+} iic_rec_pol_t;
+
+#define IIC_VAL_100KHZ  100
+#define IIC_VAL_400KHZ	400
+typedef struct iic_xfr_opts
+{
+	unsigned short rsvd;
+	unsigned short dev_addr;	// address of end device
+	unsigned short dev_width;	// number of bytes for offset (1-4)
+	unsigned long inc_addr;		// mask of address bits to increment
+					// for devices that span multiple
+					// addresses.
+	unsigned long timeout;		// operation timeout (msec)
+	unsigned short wdelay;		// delay between write xfrs (msec)
+	unsigned short rdelay;		// delay between read xfrs (msec)
+	unsigned short wsplit;		// splits writes into smaller chunks
+	unsigned short rsplit;		// splits reads into smaller chunks
+	unsigned long offset;		// offset from beginning of device
+	unsigned long flags;		// flags defined below
+} iic_xfr_opts_t;
+
+enum 
+{
+	IIC_FORCE_DMA = 0x01,		// use dma regardless of xfr size
+	IIC_NO_DMA = 0x02,		// disallow dma
+	IIC_SPECIAL_RD = 0x04,		// workaround for PLL/CRC chips
+	IIC_REPEATED_START = 0x08,      // repeated start
+};
+
+typedef struct iic_opts
+{
+	iic_xfr_opts_t xfr_opts;
+	iic_rec_pol_t recovery;
+} iic_opts_t;
+
+typedef struct iic_lock
+{
+	unsigned short mask;
+	unsigned short addr;
+	unsigned long timeout;
+} iic_lock_t;
+
+typedef struct iicslv_opts
+{
+	unsigned long addr;
+	unsigned long timeout;
+} iicslv_opts_t;
+
+#define IICSLV_ZBUF_MAX_SZ	256
+
+/* external master access mode of local slave shared buffer */
+enum 
+{
+	IICSLV_BUF_MODE_EXT_R = 1,      
+	IICSLV_BUF_MODE_EXT_RW = 2,  
+};
+
+/* Master IOCTL Ordinal Numbers */
+#define IIC_IOC_MAGIC 		0x07
+enum
+{
+	/* 0 bytes */
+	IIC_IOC_RESET_LIGHT,
+	IIC_IOC_RESET_FULL,
+
+	IIC_IOC_0_BYTES = IIC_IOC_RESET_FULL,
+
+	/* 4 bytes */
+	IIC_IOC_SPEED,
+	IIC_IOC_DEV_ADDR,
+	IIC_IOC_DEV_WIDTH,
+	IIC_IOC_OFFSET,
+	IIC_IOC_INC_ADDR,
+	IIC_IOC_TIMEOUT,
+	IIC_IOC_RDELAY,
+	IIC_IOC_WDELAY,
+	IIC_IOC_RSPLIT,
+	IIC_IOC_WSPLIT,
+	IIC_IOC_REDO_POL,
+	IIC_IOC_SPD_POL,
+	IIC_IOC_REDO_DELAY,
+	IIC_IOC_BUS_STATE,
+#define IIC_VAL_BOTH_LO 0x00
+#define IIC_VAL_SDA_LO  0x01
+#define IIC_VAL_SCL_LO  0x02
+#define IIC_VAL_BOTH_HI 0x03
+	IIC_IOC_FLAGS,
+
+	IIC_IOC_4_BYTES = IIC_IOC_FLAGS,
+
+	/* Objects */
+	IIC_IOC_LCK_ADDR,
+	IIC_IOC_ULCK_ADDR,
+	IIC_IOC_LCK_ENG,
+	IIC_IOC_ULCK_ENG,
+	IIC_IOC_ALL,
+	IIC_IOC_DISPLAY_REGS,
+	IIC_IOC_REPEATED_IO,
+	IIC_IOC_MAXNR = IIC_IOC_REPEATED_IO,
+};
+
+#endif
-- 
1.8.3.1
