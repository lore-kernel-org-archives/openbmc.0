Return-Path: <eajames@linux.vnet.ibm.com>
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3vDx2h3jJtzDqBX
 for <openbmc@lists.ozlabs.org>; Fri,  3 Feb 2017 10:26:20 +1100 (AEDT)
Received: from pps.filterd (m0098394.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.20/8.16.0.20) with SMTP id
 v12NIcLD023360
 for <openbmc@lists.ozlabs.org>; Thu, 2 Feb 2017 18:26:18 -0500
Received: from e33.co.us.ibm.com (e33.co.us.ibm.com [32.97.110.151])
 by mx0a-001b2d01.pphosted.com with ESMTP id 28cat8f490-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Thu, 02 Feb 2017 18:26:18 -0500
Received: from localhost
 by e33.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <eajames@linux.vnet.ibm.com>;
 Thu, 2 Feb 2017 16:26:17 -0700
Received: from d03dlp03.boulder.ibm.com (9.17.202.179)
 by e33.co.us.ibm.com (192.168.1.133) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Thu, 2 Feb 2017 16:26:15 -0700
Received: from b03cxnp07029.gho.boulder.ibm.com
 (b03cxnp07029.gho.boulder.ibm.com [9.17.130.16])
 by d03dlp03.boulder.ibm.com (Postfix) with ESMTP id D7D3C19D8040;
 Thu,  2 Feb 2017 16:25:28 -0700 (MST)
Received: from b03ledav004.gho.boulder.ibm.com
 (b03ledav004.gho.boulder.ibm.com [9.17.130.235])
 by b03cxnp07029.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 v12NQEUB16515554; Thu, 2 Feb 2017 16:26:14 -0700
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 6BBFE7804D;
 Thu,  2 Feb 2017 16:26:14 -0700 (MST)
Received: from oc3016140333.ibm.com (unknown [9.41.179.225])
 by b03ledav004.gho.boulder.ibm.com (Postfix) with ESMTP id 0687278051;
 Thu,  2 Feb 2017 16:26:13 -0700 (MST)
From: eajames@linux.vnet.ibm.com
To: openbmc@lists.ozlabs.org
Cc: joel@jms.id.au, alistair@popple.id.au, benh@kernel.crashing.org,
 "Edward A. James" <eajames@us.ibm.com>
Subject: [PATCH linux v1 6/8] drivers: fsi: i2c: probe fsi device for i2c
 client
Date: Thu,  2 Feb 2017 17:25:59 -0600
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1486077964-11346-1-git-send-email-eajames@linux.vnet.ibm.com>
References: <1486077964-11346-1-git-send-email-eajames@linux.vnet.ibm.com>
X-TM-AS-GCONF: 00
X-Content-Scanned: Fidelis XPS MAILER
x-cbid: 17020223-0008-0000-0000-0000071CA3DA
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00006545; HX=3.00000240; KW=3.00000007;
 PH=3.00000004; SC=3.00000201; SDB=6.00816378; UDB=6.00398660; IPR=6.00593813; 
 BA=6.00005112; NDR=6.00000001; ZLA=6.00000005; ZF=6.00000009; ZB=6.00000000;
 ZP=6.00000000; ZH=6.00000000; ZU=6.00000002; MB=3.00014159; XFM=3.00000011;
 UTC=2017-02-02 23:26:16
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 17020223-0009-0000-0000-00003F9243C4
Message-Id: <1486077964-11346-4-git-send-email-eajames@linux.vnet.ibm.com>
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
X-List-Received-Date: Thu, 02 Feb 2017 23:26:20 -0000

From: "Edward A. James" <eajames@us.ibm.com>

Signed-off-by: Edward A. James <eajames@us.ibm.com>
---
 drivers/fsi/i2c/Makefile   |   2 +-
 drivers/fsi/i2c/iic-fsi.c  | 464 ++++++++++++++++++++++++++++++++++++++++++++-
 drivers/fsi/i2c/iic-mstr.c | 429 +++++++++++++++++++++++++++++++++++++++++
 3 files changed, 893 insertions(+), 2 deletions(-)
 create mode 100644 drivers/fsi/i2c/iic-mstr.c

diff --git a/drivers/fsi/i2c/Makefile b/drivers/fsi/i2c/Makefile
index f9f9048..b1f28a1 100644
--- a/drivers/fsi/i2c/Makefile
+++ b/drivers/fsi/i2c/Makefile
@@ -1 +1 @@
-obj-$(CONFIG_FSI_I2C) += iic-fsi.o
+obj-$(CONFIG_FSI_I2C) += iic-fsi.o iic-mstr.o
diff --git a/drivers/fsi/i2c/iic-fsi.c b/drivers/fsi/i2c/iic-fsi.c
index 53be538..3a9b25d 100644
--- a/drivers/fsi/i2c/iic-fsi.c
+++ b/drivers/fsi/i2c/iic-fsi.c
@@ -40,6 +40,56 @@ static const char iic_fsi_version[] = "3.0";
 
 int iic_fsi_probe(struct device *dev);
 int iic_fsi_remove(struct device *dev);
+void iic_fsi_shutdown(struct device *dev);
+int iic_fsi_suspend(struct device *dev);
+int iic_fsi_resume(struct device *dev);
+static void iic_eng_release(struct kobject* kobj);
+
+/* callback function for when the reference count for an engine reaches 0 */
+static void iic_eng_release(struct kobject* kobj)
+{
+	iic_eng_t* eng = container_of(kobj, iic_eng_t, kobj);
+	struct device* dev = eng->dev;
+	unsigned long flags;
+
+	IENTER();
+
+	/*remove all busses associated with the engine */
+	spin_lock_irqsave(&eng->lock, flags);
+	while(eng->busses){
+		iic_bus_t* temp = eng->busses;
+		eng->busses = temp->next;
+		iic_delete_bus(iic_fsi_class, temp);
+	}
+
+	eng->enabled = 0x0ULL;
+	spin_unlock_irqrestore(&eng->lock, flags);
+
+
+	/* providing an arch specific cleanup routine is optional.
+	 * if not specified, use the default.
+	 */
+	if (iic_eng_ops_is_vaild(eng->ops)) {
+		if(eng->ops->cleanup_eng)
+		{
+			eng->ops->cleanup_eng(eng);
+		}
+		else
+		{
+			IDBGd(0, "free engine\n");
+			kfree(eng);
+		}
+	}
+
+	dev_set_drvdata(dev, 0);
+	kobject_put(&dev->kobj);
+
+	IEXIT(0);
+}
+
+static struct kobj_type iic_eng_ktype = {
+	.release = iic_eng_release,
+};
 
 int readb_wrap(iic_eng_t* eng, unsigned int addr, unsigned char *val, 
 	       iic_ffdc_t** ffdc)
@@ -157,6 +207,133 @@ static const struct fsi_driver i2c_drv = {
 	}
 };
 
+/* Adds ports to the eng->buses SLL.  Access to the SLL must be protected since
+ * iic_fsi_remove or iic_eng_release could be called asynchronously and they
+ * also traverse/modify the SLL.
+ */
+int iic_add_ports(iic_eng_t* eng, uint64_t ports)
+{
+	uint64_t ports_left;
+	int bus_num = 0;
+	unsigned long flags;
+	iic_bus_t* new_bus = 0;
+	int minor = 0;
+	char name[64];
+	int rc = 0;
+	struct fsi_device *fdev = to_fsi_dev(eng->dev);
+
+	IENTER();
+
+	IFLDi(3, "Adding ports[0x%08x%08x] to eng[0x%08x]",
+	      (uint32_t)(ports >> 32),
+	      (uint32_t)ports,
+	      eng->id);
+
+	/* walk the mask adding master ports as needed */
+	for(ports_left = ports; ports_left; ports_left = ports >> ++bus_num)
+	{
+		if(!(ports_left & 0x1))
+			continue;
+
+
+		if( minor < 0 ) {
+			IFLDe(1, "bb_get_minor %d", minor);
+			rc = minor;
+			goto exit;
+		}
+
+		sprintf(name, "i2cfsi%02d", bus_num);
+
+		/* results in hotplug event for each master bus */
+		new_bus = iic_create_bus(iic_fsi_class, eng,
+						MKDEV(MAJOR(iic_devnum_start), minor),
+						name, bus_num, minor);
+		if(!new_bus)
+		{
+			IFLDe(1, "iic_create_bus failed on eng %d", eng->id);
+			rc = -ENODEV;
+			goto exit;
+		}
+
+		/* atomically insert the new bus into the SLL unless
+		 * iic_fsi_remove has been started. 
+		 */
+		spin_lock_irqsave(&eng->lock, flags);
+		if(test_bit(IIC_ENG_REMOVED, &eng->flags))
+		{
+			/* if iic_fsi_remove has been started then
+			 * don't add this bus to the SLL and delete it.
+			 * Previously added buses will be removed by
+			 * iic_eng_release
+			 */
+			rc = -ENODEV;
+			iic_delete_bus(iic_fsi_class, new_bus);
+			spin_unlock_irqrestore(&eng->lock, flags);
+			goto exit;
+		}
+		else
+		{
+			new_bus->next = eng->busses;
+			eng->busses = new_bus;
+			eng->enabled |= 0x1ULL << bus_num;
+		}
+		spin_unlock_irqrestore(&eng->lock, flags);
+
+		minor++;
+	}
+
+exit:
+	IEXIT(rc);
+	return rc;
+}
+
+/* Removes ports from the eng->buses SLL.  Access to the SLL must be protected
+ * since iic_fsi_remove or iic_eng_release could be called at same time as this
+ * and they also traverse/modify the SLL.
+ */
+int iic_del_ports(iic_eng_t* eng, uint64_t ports)
+{
+	unsigned long flags;
+	iic_bus_t* abusp;
+	iic_bus_t** p_abusp;
+
+	IENTER();
+
+	IFLDi(3, "removing ports[0x%08x%08x] from eng[0x%08x]",
+	      (uint32_t)(ports >> 32),
+	      (uint32_t)ports,
+	      eng->id);
+
+	/* walk unordered SLL and delete bus if it is in the ports bit mask */
+	spin_lock_irqsave(&eng->lock, flags);
+	if(test_bit(IIC_ENG_REMOVED, &eng->flags))
+		goto exit;
+	p_abusp = &eng->busses;
+	abusp = *p_abusp;
+	while(abusp)
+	{
+		if(ports & (0x1ULL << abusp->port))
+		{
+			/* found a match, remove it */
+			*p_abusp = abusp->next;
+			eng->enabled &= ~(0x1ULL << abusp->port);
+			device_destroy(iic_fsi_class, abusp->devnum);
+			iic_delete_bus(iic_fsi_class, abusp);
+		}
+		else
+		{
+			/* not a match, skip to next one */
+			p_abusp = &abusp->next;
+		}
+		abusp = *p_abusp;
+	}
+
+exit:
+	spin_unlock_irqrestore(&eng->lock, flags);
+	IEXIT(0);
+	return 0;
+}
+
 /*
  * Called when an FSI IIC engine is plugged in.  
  * Causes creation of the /dev entry.
@@ -165,7 +342,86 @@ static const struct fsi_driver i2c_drv = {
  */
 int iic_fsi_probe(struct device *dev)
 {
-	return 0;
+	uint64_t new_ports = 0;
+	int rc = 0;
+	struct fsi_device *dp = to_fsi_dev(dev);
+	iic_eng_t* eng = 0;
+
+	IENTER();
+
+	eng = (iic_eng_t*)kmalloc(sizeof(iic_eng_t), GFP_KERNEL);
+
+	if(!eng)
+	{
+		IFLDe(0, "Couldn't malloc engine\n");
+		rc = -ENOMEM;
+		goto error;
+	}
+
+	memset(eng, 0, sizeof(*eng));
+	iic_init_eng(eng);
+	set_bit(IIC_ENG_BLOCK, &eng->flags); //block until resumed
+	eng->id = 0x00F5112C;
+	IFLDi(1, "PROBE    eng[%08x]", eng->id);
+	eng->ra = &fsi_reg_access;
+	IFLDd(1, "vaddr=%#08lx\n", eng->base);
+	eng->dev = dev;
+	// The new kernel now requires 2 arguments
+	kobject_init(&eng->kobj, &iic_eng_ktype); //ref count = 1
+	eng->ops = iic_get_eng_ops(FSI_ENGID_I2C);
+	if(!eng->ops)
+	{
+		IFLDi(1, "support for engine type 0x%08x not loaded.\n",
+				FSI_ENGID_I2C);
+		rc = -ENODEV;
+		goto error;
+	}
+	
+	/* Register interrupt handler with the kernel */	
+	IDBGd(0, "requesting irq\n");
+	dp->irq_handler = eng->ops->int_handler;
+
+	IFLDd(1, "irq  = %d\n", eng->irq);
+
+	new_ports = 0xFFFULL;
+	set_bit(IIC_ENG_P8_Z8_CENTAUR, &eng->flags);
+
+
+	/* Add master and slave ports to the engine */
+	rc = iic_add_ports(eng, new_ports);
+	if(rc)
+		goto error;
+
+	dev_set_drvdata(dev, eng);
+	eng->private_data = 0; //unused
+
+
+	/* set the callback function for when the eng ref count reaches 0 */
+	kobject_get(&eng->dev->kobj);
+
+	iic_fsi_resume(dev);
+
+error:
+	if(rc)
+	{
+		IFLDi(1, "IIC: iic_fsi_probe failed: %d\n", rc);
+		while(eng && eng->busses){
+			iic_bus_t* temp = eng->busses;
+			eng->busses = temp->next;
+			iic_delete_bus(iic_fsi_class, temp);
+		}
+		if(eng)
+		{
+			kfree(eng);
+		}
+	}
+	else
+	{
+		IFLDd(1, "engine 0x%08X probed.\n", eng->id);
+	}
+
+	IEXIT(rc);
+	return rc;
 }
 
 /* This function is called when a link is removed or the driver is unloaded.
@@ -174,9 +430,215 @@ int iic_fsi_probe(struct device *dev)
  */
 int iic_fsi_remove(struct device* dev)
 {
+	int rc = 0;
+	iic_bus_t* bus;
+	iic_eng_t* eng = (iic_eng_t*)dev_get_drvdata(dev);
+	unsigned long flags;
+
+	IENTER();
+       
+	if(!eng)
+	{
+		IFLDe(1, "iic_fsi_remove called with bad dev: %p\n", dev);
+		rc = -1;
+		goto error;
+	}
+
+	/* set ENG_REMOVED flag so that aborted operations have status
+	 * set to ENOLINK (lost fsi link) instead of ENODEV (no lbus).
+	 */
+	set_bit(IIC_ENG_REMOVED, &eng->flags);
+
+	iic_fsi_suspend(dev); //ignore rc
+
+	IFLDi(1, "REMOVE   eng[%08x]\n", eng->id);
+
+	/* Clean up device files immediately, don't wait for ref count */
+	spin_lock_irqsave(&eng->lock, flags);
+	bus = eng->busses;
+	while(bus)
+	{
+		/* causes hot unplug event */
+		device_destroy(iic_fsi_class, bus->devnum);
+		bus = bus->next;
+	}
+	spin_unlock_irqrestore(&eng->lock, flags);
+
+	/* cleans up engine and bus structures if ref count is zero */
+	kobject_put(&eng->kobj);
+	
+error:
+	IEXIT(0);
 	return 0;
 }
 
+/* This function is called when a link is removed or the driver is unloaded.
+ * It's job is to quiesce and disable the hardware if possible and unregister 
+ * interrupts. It always precedes the remove function.
+ *
+ * The device may be in the resumed or suspended state when this function is
+ * called.
+ *
+ * This function is no longer called for mcp5
+ */
+void iic_fsi_shutdown(struct device *dev)
+{
+	int rc = 0;
+	iic_eng_t* eng = (iic_eng_t*)dev_get_drvdata(dev);
+	struct fsi_device* fsidev = to_fsi_dev(dev);
+
+	IENTER();
+	if(!eng || !eng->ops)
+	{
+		rc = -1;
+		goto error;
+	}
+	IFLDi(1, "SHUTDOWN eng[%08x]\n", eng->id);
+
+	/* set ENG_REMOVED flag so that aborted operations have status
+	 * set to ENOLINK (lost fsi link) instead of ENODEV (no lbus).
+	 */
+	set_bit(IIC_ENG_REMOVED, &eng->flags);
+
+	iic_fsi_suspend(dev);
+	
+error:
+	if(rc)
+	{
+		IFLDe(1, "iic_fsi_shutdown failed: %d\n", rc);
+	}
+	IEXIT(0);
+	return;
+}
+
+/* This function is called when we loose ownership or are preparing to give
+ * up ownership of the local bus.  If we still own lbus, then we try to
+ * gracefully halt any pending transfer.  No hot unplug events are caused by
+ * this function.
+ *
+ * This function also is called from iic_fsi_remove.
+ *
+ * Note: In the case where we lose local bus and then loose the link or
+ * get rmmod'd, this function could be called twice without a resume
+ * in the middle!
+ */
+int iic_fsi_suspend(struct device *dev)
+{
+	int rc = 0;
+	iic_eng_t* eng = (iic_eng_t*)dev_get_drvdata(dev);
+	unsigned long xfr_status;
+
+	IENTER();
+	if(!eng)
+	{
+		rc = -1;
+		goto error;
+	}
+
+	IFLDi(2, "SUSPEND  eng[%08x]\n", eng->id);
+
+	/* Prohibit new engine operations until resumed*/
+	set_bit(IIC_ENG_BLOCK, &eng->flags);
+
+
+	/* Terminate pending operations (set status to ENODEV)
+	 * If we have access to the engine, halt any transfers 
+	 * and Disable engine interrupts.
+	 */
+
+	/* lost lbus -> ENODEV, hot unplug -> ENOLINK */
+	xfr_status = test_bit(IIC_ENG_REMOVED, &eng->flags)? -ENOLINK: -ENODEV;
+	iic_abort_all(eng, 0, xfr_status);
+
+	/* disable slave transfers */
+	if (iic_eng_ops_is_vaild(eng->ops)) {
+		if(eng->ops->slv_off) {
+			eng->ops->slv_off(eng, 0);
+		}
+	}
+
+	/* prohibit hw access using this engine object */
+	set_bit(IIC_NO_ACCESS, &eng->flags);
+	
+	/* disable interrupt handler if not already done */
+	if(test_and_clear_bit(IIC_ENG_RESUMED, &eng->flags))
+	{
+		fsi_disable_irq(to_fsi_dev(dev)); 
+	}
+
+error:	
+	IEXIT(rc);
+	return rc;
+}
+
+/* This function is called when we are given (back) ownership of the local
+ * bus.
+ */
+int iic_fsi_resume(struct device *dev)
+{
+	iic_ffdc_t* ffdc = 0;
+	int rc = 0;
+	iic_eng_t* eng = 0;
+	struct fsi_device *dp = to_fsi_dev(dev);
+
+	IENTER();	
+	// The device structure has changed for the new kernel.
+	// The member driver_data has been deprecated.
+	eng = (iic_eng_t*)dev_get_drvdata(dev);
+
+	if(!eng || !iic_eng_ops_is_vaild(eng->ops))
+	{
+		rc = -EIO;
+		goto error;
+	}
+
+	IFLDi(1, "RESUME   eng[%08x]\n", eng->id);
+
+	eng->bus_speed = 20833333;
+	IFLDd(1, "eng->bus_speed=%ld\n", eng->bus_speed);
+
+	/* Reset the engine */
+	rc = eng->ops->reset_eng(eng, &ffdc);
+	if(rc)
+	{
+		goto error;
+	}
+
+	/* Give the engine time to determine the state of the bus before
+	 * allowing transfers to begin after resetting the engine.
+	 */
+	udelay(200);
+
+	/* Initialize the engine */
+	rc = eng->ops->init(eng, &ffdc);
+	if(rc)
+	{
+		goto error;
+	}
+
+	/* Enable interrupt handler in the kernel */	
+	IDBGd(0, "enabling irq\n");
+	rc = fsi_enable_irq(dp);
+	if(rc)
+	{
+		IFLDe(1, "fsi_enable_irq failed rc=%d\n", rc);
+		goto error;
+	}
+
+	set_bit(IIC_ENG_RESUMED, &eng->flags);
+
+	/* allow operations to be submitted */
+	clear_bit(IIC_ENG_BLOCK, &eng->flags);
+	goto exit;
+
+error:
+	IFLDe(1, "iic_fsi_resume failed, rc=%d\n", rc);
+exit:
+	IEXIT(rc);
+	return rc;
+}
+
+
 /*
  * Initialize this module.  Creates a class for fsi connected iic devices and
  * allocates device numbers for them.
diff --git a/drivers/fsi/i2c/iic-mstr.c b/drivers/fsi/i2c/iic-mstr.c
new file mode 100644
index 0000000..de05e5d
--- /dev/null
+++ b/drivers/fsi/i2c/iic-mstr.c
@@ -0,0 +1,429 @@
+/*
+ *   Copyright (c) International Business Machines Corp., 2006, 2009, 2010
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
+#include <linux/init.h>
+#include <linux/module.h>
+#include <linux/kernel.h>
+#include <linux/mm.h>
+#include <linux/sysfs.h>
+#include <linux/cdev.h>
+#include <linux/device.h>
+#include <asm/uaccess.h>
+#include <linux/delay.h>
+#include <linux/param.h>
+#include <linux/sched.h>
+#include <linux/list.h>
+#include <linux/slab.h>
+#include <asm/page.h>
+#include <linux/pagemap.h>
+#include <linux/aio.h>
+#include "iic-int.h"
+#include <linux/fsi.h>
+#include <linux/time.h>
+#include <asm/io.h>
+#include <linux/moduleparam.h>
+#include <linux/interrupt.h>
+
+typedef struct
+{
+	unsigned long type;
+	iic_eng_ops_t *ops;
+	struct list_head list;
+} iic_eng_type_t;
+
+typedef struct
+{
+	unsigned long type;
+	iic_bus_t * bus;
+	struct list_head list;
+} iic_bus_type_t;
+
+/* This is a DLL of engine ops for the engines that are supported */
+LIST_HEAD(iic_eng_type_list);
+
+/* DLL for bus ops for the busses that are supported */
+LIST_HEAD(iic_bus_type_list);
+
+iic_opts_t iic_dflt_opts =
+{
+	.xfr_opts =
+	{
+		.dev_addr = 0,		/* 8 bits with LSB ignored */
+		.dev_width = 0,		/* offset width in bytes */
+		.offset = 0,		/* offset in bytes */
+		.inc_addr = 0,		/* address increment mask */
+		.timeout = 5000,	/* transfer timeout in milliseconds */
+		.wdelay = 0,		/* write delay in milliseconds */
+		.rdelay = 0,		/* read delay in milliseconds */ 
+		.wsplit = 0,		/* write split chunk size (bytes) */
+		.rsplit = 0,		/* read split chunk size (bytes) */
+		.flags = 0,
+	},
+	.recovery =
+	{
+		.redo_pol = 0,
+		.redo_delay = 0,
+	}
+};
+
+static const char iic_mstr_version[] = "3.0";
+
+/* save off the default cdev type pointer so we can call the default cdev
+ * release function in our own bus release function
+ */
+static struct kobj_type* cdev_dflt_type = 0;
+struct kobj_type iic_bus_type;
+
+/* funtion called when cdev object (embedded in bus object) ref count
+ * reaches zero.  (prevents cdev memory from being freed to early)
+ */
+void iic_bus_release(struct kobject* kobj)
+{
+	struct cdev *p = container_of(kobj, struct cdev, kobj);
+	iic_bus_t* bus = container_of(p, iic_bus_t, cdev);
+
+	IFLDi(1, "deleting bus[%08lx]\n", bus->bus_id);
+	if(cdev_dflt_type && cdev_dflt_type->release)
+		cdev_dflt_type->release(kobj);
+	kfree(bus);
+}
+
+int iic_open(struct inode* inode, struct file* filp);
+int iic_release(struct inode* inode, struct file* filp);
+ssize_t iic_read(struct file *file, char __user *buf, size_t count,
+		 loff_t *offset);
+ssize_t iic_write(struct file *file, const char __user *buf, size_t count,
+	       	  loff_t *offset);
+ssize_t iic_aio_read(struct kiocb *iocb, const struct iovec *buf, unsigned long count, loff_t pos);
+ssize_t iic_aio_write(struct kiocb *iocb, const struct iovec *buf, unsigned long count, loff_t pos);
+long iic_ioctl(struct file *file, unsigned int cmd,
+              unsigned long arg);
+static int iic_mmap(struct file* file, struct vm_area_struct* vma);
+int iic_xfr(iic_client_t* client, char* buf, size_t count, loff_t* offset, 
+		char read_flag);
+loff_t iic_llseek(struct file *filp, loff_t off, int whence);
+
+struct file_operations iic_fops = {
+	.owner = THIS_MODULE,
+	.open = iic_open,
+	.release = iic_release,
+	.read = iic_read,
+	.write = iic_write,
+	.unlocked_ioctl = iic_ioctl,
+	.llseek = iic_llseek,
+	.mmap = iic_mmap,
+};
+
+static iic_bus_t * iic_get_bus(unsigned long port, unsigned long type)
+{
+	iic_bus_type_t* iterator;
+	int found = 0;
+
+	IENTER();
+
+	list_for_each_entry(iterator, &iic_bus_type_list, list)
+	{
+		if((iterator->type == type) && (iterator->bus->port == port))
+		{
+			found = 1;
+			break;
+		}
+	}
+
+	IEXIT(0);
+	return (found == 1)? iterator->bus: NULL;
+}
+
+/* Abort all pending xfrs for a client, or if client is 0, abort all
+ * pending xfrs for the engine.  
+ */
+int iic_abort_all(iic_eng_t* eng, iic_client_t* client, int status)
+{
+	return 0;
+}
+EXPORT_SYMBOL(iic_abort_all);
+
+int iic_register_eng_ops(iic_eng_ops_t* new_ops, unsigned long type)
+{
+	iic_eng_type_t* new_type = (iic_eng_type_t*)
+		kmalloc(sizeof(iic_eng_type_t), GFP_KERNEL);
+	IENTER();
+	if(!new_type)
+	{
+		return -ENOMEM;
+	}
+	
+	new_type->type = type;
+	new_type->ops = new_ops;
+
+	/* Add this eng type object to beginning of engine type list*/
+	list_add(&new_type->list, &iic_eng_type_list);
+	IDBGd(1, "eng type %08lx registered\n", type);
+	IEXIT(0);
+	return 0;
+}
+EXPORT_SYMBOL(iic_register_eng_ops);
+
+int iic_unregister_eng_ops(unsigned long type)
+{
+	iic_eng_type_t *iterator, *found;
+	IENTER();
+	found = 0;
+
+	list_for_each_entry(iterator, &iic_eng_type_list, list)
+	{
+		if(iterator->type == type)
+		{
+			found = iterator;
+			break;
+		}
+	}
+	if(found)
+	{
+		list_del(&found->list);
+		kfree(found);
+		IDBGd(1, "engine type %08lx unregistered\n", type);
+	}
+	IEXIT(0);
+	return 0;
+}
+EXPORT_SYMBOL(iic_unregister_eng_ops);
+
+void iic_register_bus(iic_bus_t * new_bus, unsigned long type)
+{
+        iic_bus_type_t* new_type = (iic_bus_type_t*)
+                kmalloc(sizeof(iic_bus_type_t), GFP_KERNEL);
+
+        IENTER();
+
+        new_type->type = type;
+        new_type->bus = new_bus;
+        list_add(&new_type->list, &iic_bus_type_list);
+
+        IEXIT(0);
+}
+EXPORT_SYMBOL(iic_register_bus);
+
+void iic_unregister_bus(iic_bus_t *bus, unsigned long type)
+{
+        iic_bus_type_t *iterator, *temp;
+
+        IENTER();
+
+        list_for_each_entry_safe(iterator, temp, &iic_bus_type_list, list)
+        {
+                if((iterator->type == type) && (iterator->bus == bus))
+                {
+                        list_del(&iterator->list);
+                        kfree(iterator);
+                }
+        }
+        IEXIT(0);
+}
+EXPORT_SYMBOL(iic_unregister_bus);
+
+void iic_init_eng(iic_eng_t* eng)
+{
+	IENTER();
+	spin_lock_init(&eng->lock);
+	sema_init(&eng->sem, 1);
+	INIT_LIST_HEAD(&eng->xfrq);
+	eng->cur_xfr = 0;
+	iic_lck_mgr_init(&eng->lck_mgr);
+	init_waitqueue_head(&eng->waitq);
+	INIT_WORK(&eng->work, iic_finish_abort);
+	atomic_set(&eng->xfr_num, 0);
+	IEXIT(0);
+}
+EXPORT_SYMBOL(iic_init_eng);
+
+int iic_eng_ops_is_vaild(struct iic_eng_ops *ops)
+{
+	int found = 0;
+	iic_eng_type_t *iterator;
+
+	list_for_each_entry(iterator, &iic_eng_type_list, list)
+	{
+		if(iterator->ops == ops)
+		{
+			found = 1;
+			break;
+		}
+	}
+
+	return found;
+}
+EXPORT_SYMBOL(iic_eng_ops_is_vaild);
+
+struct iic_eng_ops* iic_get_eng_ops(unsigned long type)
+{
+	iic_eng_type_t *iterator;
+	iic_eng_ops_t *found = 0;
+	IENTER();
+
+	/* return the eng ops for the given type of engine */
+	list_for_each_entry(iterator, &iic_eng_type_list, list)
+	{
+		if(iterator->type == type)
+		{
+			found = iterator->ops;
+			break;
+		}
+	}
+	IEXIT((int)found);
+	return found;
+}
+EXPORT_SYMBOL(iic_get_eng_ops);
+
+/* called when an ffdc q for a bus is unlocked */
+void iic_ffdc_q_unlocked(int scope, void* data)
+{
+	iic_eng_t* eng = (iic_eng_t*)data;
+	unsigned long flags;
+	if(eng)
+	{
+		spin_lock_irqsave(&eng->lock, flags);
+		iic_start_next_xfr(eng);
+		spin_unlock_irqrestore(&eng->lock, flags);
+	}
+}
+
+/* Register this bus's minor number with the kernel and add
+ * it to the iic class in sysfs so that a hotplug event is
+ * sent to udev.  The sysfs name needs to be unique because
+ * all entries are placed in the same directory.  udev
+ * will take care of creating the correct /dev name.
+ */
+#define IIC_BUS_MAX_FFDC 4
+iic_bus_t*  iic_create_bus(struct class* classp, iic_eng_t* eng,
+			   dev_t devnum, char* name, unsigned char port,
+			   unsigned long bus_id)
+{
+	int rc = 0;
+	iic_bus_t* bus = 0;
+
+	IENTER();
+
+	if(!eng)
+	{
+		goto exit;
+	}
+	bus = (iic_bus_t*)kmalloc(sizeof(iic_bus_t), GFP_KERNEL);
+	if(!bus)
+	{
+		goto exit;
+	}
+	memset(bus, 0, sizeof(iic_bus_t));
+	bus->port = port;
+	bus->bus_id = bus_id;
+	bus->eng = eng;
+	bus->devnum = devnum;
+	bus->i2c_hz = 400000;
+	cdev_init(&bus->cdev, &iic_fops); // ref count = 1
+	/* since cdev is embedded in our bus structure, override the cdev
+	 * cleanup function with our own so that the bus object doesn't get
+	 * freed until the cdev ref count goes to zero.
+	 */
+	if(!cdev_dflt_type)
+	{
+		cdev_dflt_type = bus->cdev.kobj.ktype;
+		memcpy(&iic_bus_type, cdev_dflt_type, sizeof(iic_bus_type));
+		iic_bus_type.release = iic_bus_release;
+	}
+	bus->cdev.kobj.ktype = &iic_bus_type;
+	kobject_set_name(&bus->cdev.kobj, name);
+	rc = cdev_add(&bus->cdev, devnum, 1);
+	if(rc)
+	{
+		IFLDe(1, "cdev_add failed for bus %08lx\n", bus->bus_id);
+		kobject_put(&bus->cdev.kobj);
+		goto exit_cdev_add;
+	}
+
+	bus->class_dev = device_create(classp, NULL,
+			devnum,
+			bus->eng->dev,
+			(const char *)"%s",
+			name);
+	if(!bus->class_dev)
+	{
+		IFLDe(1, "device create failed, %08lx\n", bus->bus_id);
+		goto exit_class_add;
+	}
+
+	IFLDi(1, "bus[%08lx] created\n", bus->bus_id);
+	goto exit;
+
+exit_q_create:
+	device_destroy(classp, bus->devnum);
+exit_class_add:
+	cdev_del(&bus->cdev);
+exit_cdev_add:
+	bus = 0;
+exit:
+	IEXIT((int)bus);
+	return bus;
+}
+EXPORT_SYMBOL(iic_create_bus);
+
+void iic_delete_bus(struct class* classp, iic_bus_t* bus)
+{
+	IENTER();
+
+	if(!bus)
+	{
+		goto exit;
+	}
+	IFLDi(1, "cleanup bus[%08lx]\n", bus->bus_id);
+	cdev_del(&bus->cdev);
+exit:
+	IEXIT(0);
+	return;
+}
+EXPORT_SYMBOL(iic_delete_bus);
+
+static int __init iic_init(void)
+{
+	int rc = 0;
+
+	IENTER();
+	printk("IIC: base support loaded  ver. %s\n", iic_mstr_version);
+	IEXIT(rc);
+	return rc;
+}
+
+static void __exit iic_exit(void)
+{
+	IENTER();
+	printk("IIC: base support unloaded.\n");
+	IEXIT(0);
+}
+
+static int iic_set_trc_sz(const char* val, struct kernel_param *kp)
+{
+	int rc = param_set_int(val, kp);
+	if(rc)
+		return rc;
+	return 0;
+}
+
+module_init(iic_init);
+module_exit(iic_exit);
+MODULE_AUTHOR("Eddie James <eajames@us.ibm.com>");
+MODULE_DESCRIPTION("Base IIC Driver");
+MODULE_LICENSE("GPL");
-- 
1.8.3.1
