Return-Path: <eajames@linux.vnet.ibm.com>
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3vKgsF0RL6zDqBn
 for <openbmc@lists.ozlabs.org>; Sat, 11 Feb 2017 03:49:36 +1100 (AEDT)
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.20/8.16.0.20) with SMTP id
 v1AGmgWV005196
 for <openbmc@lists.ozlabs.org>; Fri, 10 Feb 2017 11:49:34 -0500
Received: from e38.co.us.ibm.com (e38.co.us.ibm.com [32.97.110.159])
 by mx0b-001b2d01.pphosted.com with ESMTP id 28hcptxd5c-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Fri, 10 Feb 2017 11:49:33 -0500
Received: from localhost
 by e38.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <eajames@linux.vnet.ibm.com>;
 Fri, 10 Feb 2017 09:49:32 -0700
Received: from d03dlp03.boulder.ibm.com (9.17.202.179)
 by e38.co.us.ibm.com (192.168.1.138) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Fri, 10 Feb 2017 09:49:28 -0700
Received: from b01cxnp22034.gho.pok.ibm.com (b01cxnp22034.gho.pok.ibm.com
 [9.57.198.24])
 by d03dlp03.boulder.ibm.com (Postfix) with ESMTP id 5A00F19D801C;
 Fri, 10 Feb 2017 09:48:41 -0700 (MST)
Received: from b01ledav004.gho.pok.ibm.com (b01ledav004.gho.pok.ibm.com
 [9.57.199.109])
 by b01cxnp22034.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 v1AGnRuX42795032; Fri, 10 Feb 2017 16:49:27 GMT
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 3BC3F11205F;
 Fri, 10 Feb 2017 11:49:27 -0500 (EST)
Received: from oc3016140333.ibm.com (unknown [9.41.179.225])
 by b01ledav004.gho.pok.ibm.com (Postfix) with ESMTP id C635111204B;
 Fri, 10 Feb 2017 11:49:26 -0500 (EST)
From: Eddie James <eajames@linux.vnet.ibm.com>
To: openbmc@lists.ozlabs.org
Cc: joel@jms.id.au, cbostic@linux.vnet.ibm.com,
 "Edward A. James" <eajames@us.ibm.com>
Subject: [PATCH linux dev-4.7 v2 1/2] drivers: fsi: i2c fix probing
Date: Fri, 10 Feb 2017 10:49:21 -0600
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1486745362-7790-1-git-send-email-eajames@linux.vnet.ibm.com>
References: <1486745362-7790-1-git-send-email-eajames@linux.vnet.ibm.com>
X-TM-AS-GCONF: 00
X-Content-Scanned: Fidelis XPS MAILER
x-cbid: 17021016-0028-0000-0000-00000702AFE7
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00006591; HX=3.00000240; KW=3.00000007;
 PH=3.00000004; SC=3.00000203; SDB=6.00819979; UDB=6.00400871; IPR=6.00597433; 
 BA=6.00005130; NDR=6.00000001; ZLA=6.00000005; ZF=6.00000009; ZB=6.00000000;
 ZP=6.00000000; ZH=6.00000000; ZU=6.00000002; MB=3.00014245; XFM=3.00000011;
 UTC=2017-02-10 16:49:30
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 17021016-0029-0000-0000-0000337707FD
Message-Id: <1486745362-7790-2-git-send-email-eajames@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2017-02-10_07:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=3
 malwarescore=0 phishscore=0 adultscore=0 bulkscore=0 classifier=spam
 adjust=0 reason=mlx scancount=1 engine=8.0.1-1612050000
 definitions=main-1702100166
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
X-List-Received-Date: Fri, 10 Feb 2017 16:49:37 -0000

From: "Edward A. James" <eajames@us.ibm.com>

resolve the problems when probing up the i2c driver a second time.

Signed-off-by: Edward A. James <eajames@us.ibm.com>
---
 drivers/fsi/i2c/iic-fsi.c  | 125 +++------------------------------------------
 drivers/fsi/i2c/iic-mstr.c |  42 +++------------
 2 files changed, 14 insertions(+), 153 deletions(-)

diff --git a/drivers/fsi/i2c/iic-fsi.c b/drivers/fsi/i2c/iic-fsi.c
index 2c0aec9..6d5b045 100644
--- a/drivers/fsi/i2c/iic-fsi.c
+++ b/drivers/fsi/i2c/iic-fsi.c
@@ -36,60 +36,12 @@
 struct class* iic_fsi_class = 0;
 dev_t iic_devnum_start = 0;
 
-static const char iic_fsi_version[] = "3.0";
+static const char iic_fsi_version[] = "3.1";
 
 int iic_fsi_probe(struct device *dev);
 int iic_fsi_remove(struct device *dev);
-void iic_fsi_shutdown(struct device *dev);
 int iic_fsi_suspend(struct device *dev);
 int iic_fsi_resume(struct device *dev);
-static void iic_eng_release(struct kobject* kobj);
-
-/* callback function for when the reference count for an engine reaches 0 */
-static void iic_eng_release(struct kobject* kobj)
-{
-	iic_eng_t* eng = container_of(kobj, iic_eng_t, kobj);
-	struct device* dev = eng->dev;
-	unsigned long flags;
-
-	IENTER();
-
-	/*remove all busses associated with the engine */
-	spin_lock_irqsave(&eng->lock, flags);
-	while(eng->busses){
-		iic_bus_t* temp = eng->busses;
-		eng->busses = temp->next;
-		iic_delete_bus(iic_fsi_class, temp);
-	}
-
-	eng->enabled = 0x0ULL;
-	spin_unlock_irqrestore(&eng->lock, flags);
-
-
-	/* providing an arch specific cleanup routine is optional.
-	 * if not specified, use the default.
-	 */
-	if (iic_eng_ops_is_vaild(eng->ops)) {
-		if(eng->ops->cleanup_eng)
-		{
-			eng->ops->cleanup_eng(eng);
-		}
-		else
-		{
-			IDBGd(0, "free engine\n");
-			kfree(eng);
-		}
-	}
-
-	dev_set_drvdata(dev, 0);
-	kobject_put(&dev->kobj);
-
-	IEXIT(0);
-}
-
-static struct kobj_type iic_eng_ktype = {
-	.release = iic_eng_release,
-};
 
 int readb_wrap(iic_eng_t* eng, unsigned int addr, unsigned char *val, 
 	       iic_ffdc_t** ffdc)
@@ -223,7 +175,7 @@ int iic_add_ports(iic_eng_t* eng, uint64_t ports)
 
 	IENTER();
 
-	IFLDi(3, "Adding ports[0x%08x%08x] to eng[0x%08x]",
+	IFLDi(3, "Adding ports[0x%08x%08x] to eng[0x%08x]\n",
 	      (uint32_t)(ports >> 32),
 	      (uint32_t)ports,
 	      eng->id);
@@ -305,8 +257,6 @@ int iic_del_ports(iic_eng_t* eng, uint64_t ports)
 
 	/* walk unordered SLL and delete bus if it is in the ports bit mask */
 	spin_lock_irqsave(&eng->lock, flags);
-	if(test_bit(IIC_ENG_REMOVED, &eng->flags))
-		goto exit;
 	p_abusp = &eng->busses;
 	abusp = *p_abusp;
 	while(abusp)
@@ -316,7 +266,6 @@ int iic_del_ports(iic_eng_t* eng, uint64_t ports)
 			/* found a match, remove it */
 			*p_abusp = abusp->next;
 			eng->enabled &= ~(0x1ULL << abusp->port);
-			device_destroy(iic_fsi_class, abusp->devnum);
 			iic_delete_bus(iic_fsi_class, abusp);
 		}
 		else
@@ -327,12 +276,12 @@ int iic_del_ports(iic_eng_t* eng, uint64_t ports)
 		abusp = *p_abusp;
 	}
 
-exit:
 	spin_unlock_irqrestore(&eng->lock, flags);
 	IEXIT(0);
 	return 0;
 }
 
+#define IIC_FSI_PORTS	0xFFFULL
 /*
  * Called when an FSI IIC engine is plugged in.  
  * Causes creation of the /dev entry.
@@ -361,12 +310,11 @@ int iic_fsi_probe(struct device *dev)
 	iic_init_eng(eng);
 	set_bit(IIC_ENG_BLOCK, &eng->flags); //block until resumed
 	eng->id = 0x00F5112C;
-	IFLDi(1, "PROBE    eng[%08x]", eng->id);
+	IFLDi(1, "PROBE    eng[%08x]\n", eng->id);
 	eng->ra = &fsi_reg_access;
 	IFLDd(1, "vaddr=%#08lx\n", eng->base);
 	eng->dev = dev;
 	// The new kernel now requires 2 arguments
-	kobject_init(&eng->kobj, &iic_eng_ktype); //ref count = 1
 	eng->ops = iic_get_eng_ops(FSI_ENGID_I2C);
 	if(!eng->ops)
 	{
@@ -382,7 +330,7 @@ int iic_fsi_probe(struct device *dev)
 
 	IFLDd(1, "irq  = %d\n", eng->irq);
 
-	new_ports = 0xFFFULL;
+	new_ports = IIC_FSI_PORTS;
 	set_bit(IIC_ENG_P8_Z8_CENTAUR, &eng->flags);
 
 
@@ -394,21 +342,13 @@ int iic_fsi_probe(struct device *dev)
 	dev_set_drvdata(dev, eng);
 	eng->private_data = 0; //unused
 
-
-	/* set the callback function for when the eng ref count reaches 0 */
-	kobject_get(&eng->dev->kobj);
-
 	iic_fsi_resume(dev);
 
 error:
 	if(rc)
 	{
 		IFLDi(1, "IIC: iic_fsi_probe failed: %d\n", rc);
-		while(eng && eng->busses){
-			iic_bus_t* temp = eng->busses;
-			eng->busses = temp->next;
-			iic_delete_bus(iic_fsi_class, temp);
-		}
+		iic_del_ports(eng, new_ports);
 		if(eng)
 		{
 			kfree(eng);
@@ -430,9 +370,7 @@ error:
 int iic_fsi_remove(struct device* dev)
 {
 	int rc = 0;
-	iic_bus_t* bus;
 	iic_eng_t* eng = (iic_eng_t*)dev_get_drvdata(dev);
-	unsigned long flags;
 
 	IENTER();
        
@@ -453,62 +391,15 @@ int iic_fsi_remove(struct device* dev)
 	IFLDi(1, "REMOVE   eng[%08x]\n", eng->id);
 
 	/* Clean up device files immediately, don't wait for ref count */
-	spin_lock_irqsave(&eng->lock, flags);
-	bus = eng->busses;
-	while(bus)
-	{
-		/* causes hot unplug event */
-		device_destroy(iic_fsi_class, bus->devnum);
-		bus = bus->next;
-	}
-	spin_unlock_irqrestore(&eng->lock, flags);
-
+	iic_del_ports(eng, IIC_FSI_PORTS);
 	/* cleans up engine and bus structures if ref count is zero */
-	kobject_put(&eng->kobj);
+	kfree(eng);
 	
 error:
 	IEXIT(0);
 	return 0;
 }
 
-/* This function is called when a link is removed or the driver is unloaded.
- * It's job is to quiesce and disable the hardware if possible and unregister 
- * interrupts. It always precedes the remove function.
- *
- * The device may be in the resumed or suspended state when this function is
- * called.
- *
- * This function is no longer called for mcp5
- */
-void iic_fsi_shutdown(struct device *dev)
-{
-	int rc = 0;
-	iic_eng_t* eng = (iic_eng_t*)dev_get_drvdata(dev);
-
-	IENTER();
-	if(!eng || !eng->ops)
-	{
-		rc = -1;
-		goto error;
-	}
-	IFLDi(1, "SHUTDOWN eng[%08x]\n", eng->id);
-
-	/* set ENG_REMOVED flag so that aborted operations have status
-	 * set to ENOLINK (lost fsi link) instead of ENODEV (no lbus).
-	 */
-	set_bit(IIC_ENG_REMOVED, &eng->flags);
-
-	iic_fsi_suspend(dev);
-	
-error:
-	if(rc)
-	{
-		IFLDe(1, "iic_fsi_shutdown failed: %d\n", rc);
-	}
-	IEXIT(0);
-	return;
-}
-
 /* This function is called when we loose ownership or are preparing to give
  * up ownership of the local bus.  If we still own lbus, then we try to
  * gracefully halt any pending transfer.  No hot unplug events are caused by
diff --git a/drivers/fsi/i2c/iic-mstr.c b/drivers/fsi/i2c/iic-mstr.c
index 0d97671..5501b22 100644
--- a/drivers/fsi/i2c/iic-mstr.c
+++ b/drivers/fsi/i2c/iic-mstr.c
@@ -83,27 +83,7 @@ iic_opts_t iic_dflt_opts =
 	}
 };
 
-static const char iic_mstr_version[] = "3.0";
-
-/* save off the default cdev type pointer so we can call the default cdev
- * release function in our own bus release function
- */
-static struct kobj_type* cdev_dflt_type = 0;
-struct kobj_type iic_bus_type;
-
-/* funtion called when cdev object (embedded in bus object) ref count
- * reaches zero.  (prevents cdev memory from being freed to early)
- */
-void iic_bus_release(struct kobject* kobj)
-{
-	struct cdev *p = container_of(kobj, struct cdev, kobj);
-	iic_bus_t* bus = container_of(p, iic_bus_t, cdev);
-
-	IFLDi(1, "deleting bus[%08lx]\n", bus->bus_id);
-	if(cdev_dflt_type && cdev_dflt_type->release)
-		cdev_dflt_type->release(kobj);
-	kfree(bus);
-}
+static const char iic_mstr_version[] = "3.1";
 
 int iic_open(struct inode* inode, struct file* filp);
 int iic_release(struct inode* inode, struct file* filp);
@@ -167,7 +147,6 @@ int iic_common_open(iic_client_t ** o_client, iic_bus_t * bus, int engine_num)
 	client->tgid = current->tgid;
 	sema_init(&client->sem, 1);
 	init_waitqueue_head(&client->wait);
-	kobject_get(&bus->eng->kobj);
 	*o_client = client;
 
 exit:
@@ -262,7 +241,6 @@ int iic_common_release(iic_client_t * client)
 
         client->bus = 0;
         kfree(client);
-        kobject_put(&bus->eng->kobj);
 
         IEXIT(rc);
         return rc;
@@ -1170,6 +1148,7 @@ EXPORT_SYMBOL(iic_sideways_read);
 ssize_t iic_read(struct file *filp, char __user *buf, size_t count,
 		 loff_t *offset)
 {
+	int rc_copy;
 	ssize_t rc = count;
 	char *kbuf;
 	iic_client_t *client = (iic_client_t*)filp->private_data;
@@ -1203,7 +1182,7 @@ ssize_t iic_read(struct file *filp, char __user *buf, size_t count,
 	if (rc < 0)
 		goto free;
 
-	rc = copy_to_user(buf, kbuf, count);
+	rc_copy = copy_to_user(buf, kbuf, count);
 
 free:
 	kfree(kbuf);
@@ -2148,23 +2127,11 @@ iic_bus_t*  iic_create_bus(struct class* classp, iic_eng_t* eng,
 	bus->devnum = devnum;
 	bus->i2c_hz = 400000;
 	cdev_init(&bus->cdev, &iic_fops); // ref count = 1
-	/* since cdev is embedded in our bus structure, override the cdev
-	 * cleanup function with our own so that the bus object doesn't get
-	 * freed until the cdev ref count goes to zero.
-	 */
-	if(!cdev_dflt_type)
-	{
-		cdev_dflt_type = bus->cdev.kobj.ktype;
-		memcpy(&iic_bus_type, cdev_dflt_type, sizeof(iic_bus_type));
-		iic_bus_type.release = iic_bus_release;
-	}
-	bus->cdev.kobj.ktype = &iic_bus_type;
 	kobject_set_name(&bus->cdev.kobj, name);
 	rc = cdev_add(&bus->cdev, devnum, 1);
 	if(rc)
 	{
 		IFLDe(1, "cdev_add failed for bus %08lx\n", bus->bus_id);
-		kobject_put(&bus->cdev.kobj);
 		goto exit_cdev_add;
 	}
 
@@ -2186,6 +2153,7 @@ iic_bus_t*  iic_create_bus(struct class* classp, iic_eng_t* eng,
 exit_class_add:
 	cdev_del(&bus->cdev);
 exit_cdev_add:
+	kfree(bus);
 	bus = 0;
 exit:
 	IEXIT((int)bus);
@@ -2202,7 +2170,9 @@ void iic_delete_bus(struct class* classp, iic_bus_t* bus)
 		goto exit;
 	}
 	IFLDi(1, "cleanup bus[%08lx]\n", bus->bus_id);
+	device_destroy(classp, bus->devnum);
 	cdev_del(&bus->cdev);
+	kfree(bus);
 exit:
 	IEXIT(0);
 	return;
-- 
1.8.3.1
