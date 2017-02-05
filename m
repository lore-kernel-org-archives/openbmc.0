Return-Path: <joel.stan@gmail.com>
Received: from mail-pg0-x244.google.com (mail-pg0-x244.google.com
 [IPv6:2607:f8b0:400e:c05::244])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3vGnRF08DzzDqBW
 for <openbmc@lists.ozlabs.org>; Mon,  6 Feb 2017 10:50:33 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="l+7zU8AF"; 
 dkim-atps=neutral
Received: by mail-pg0-x244.google.com with SMTP id v184so7411553pgv.1
 for <openbmc@lists.ozlabs.org>; Sun, 05 Feb 2017 15:50:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id;
 bh=nRkyToCtH4lEAkjuq8EgxjbU3nufExsAKATdy5GOsi8=;
 b=l+7zU8AFo+ObkEKubGAEdIcbzLiahOgDrqNG/mstYAk25+q5QWpDxk1ffy1bs6pXa6
 +ma6cuZLdm6jlzD+X6gNsArMbzl7MdxDxMzQ7xQ6lOw3K6pXq3e3aC2cZY7b7o1ZygUo
 qTBr3tnKqLtW/zk/cHvPBpzkeHjdYgGCbhcQUkNK2vYQ1RS9i3aWU30ZFVB+d1EkZ6yX
 +U1quJhQHAOf3f7iZvLwQzG41yM4N5382kOepkNfkxhWGfUEc5RKd55acKK3bRPAk1FR
 JL4WDpAJK2H7XdSc94MRh/r4HLnNDwsXKpbnAP0sDTJwWKHBUMFvcjIJAKwc/0rcMPDa
 kO0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id;
 bh=nRkyToCtH4lEAkjuq8EgxjbU3nufExsAKATdy5GOsi8=;
 b=N+pIdpJ6H1dfLwLKEZluVrQjKuJougxfvC0tmzdvgAxl2HtiAYuoU+aG8je8RXf4xw
 1vwtOA2QOoUDBoTnvBrylZ9X+UgPfpXFgfEfeq/Vwh96MYErGxVUN58XMxoCrkVgMz9w
 zu0LgOFokd+sxCw0F77102R+qFtLtvt8rD8pFkIbcIJ2/JclxaUZdfv6sivnGzgumxd1
 BsiisdPIcis5UOcCo2+kcPqL862lrbHNKODuyYlI18FWsgDc/QfBkXRwA/MC92TWAzrO
 AFQIX4GCr/lRlZUfd3TBLzhpfQw4qN+0c5ra2Om6TbCfBj/nnwRkCtPWw4tCJl3MMZpR
 DTrg==
X-Gm-Message-State: AIkVDXLy7+xSB2PIEFeTjYvThAjt77wcNB0iaJCpl/4NGUaGYPOp6lc4KYUo/SJUxAm1+g==
X-Received: by 10.84.231.139 with SMTP id g11mr13504117plk.110.1486338630695; 
 Sun, 05 Feb 2017 15:50:30 -0800 (PST)
Received: from aurora.jms.id.au (103-232-208-192.nat.sa.cust.uniti.network.
 [103.232.208.192])
 by smtp.gmail.com with ESMTPSA id w76sm83406124pfd.74.2017.02.05.15.50.27
 (version=TLS1 cipher=AES128-SHA bits=128/128);
 Sun, 05 Feb 2017 15:50:29 -0800 (PST)
Sender: "joel.stan@gmail.com" <joel.stan@gmail.com>
Received: by aurora.jms.id.au (sSMTP sendmail emulation);
 Mon, 06 Feb 2017 10:20:23 +1030
From: Joel Stanley <joel@jms.id.au>
To: eajames@linux.vnet.ibm.com,
	cbostic@linux.vnet.ibm.com
Cc: openbmc@lists.ozlabs.org
Subject: [PATCH linux dev-4.7] fsi: i2c: Silence warnings
Date: Mon,  6 Feb 2017 10:20:19 +1030
Message-Id: <20170205235019.12497-1-joel@jms.id.au>
X-Mailer: git-send-email 2.11.0
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
X-List-Received-Date: Sun, 05 Feb 2017 23:50:33 -0000

These were missed the first time around.

Signed-off-by: Joel Stanley <joel@jms.id.au>
---
 drivers/fsi/i2c/iic-boe.c  |  4 +++-
 drivers/fsi/i2c/iic-mstr.c | 46 ++++++++--------------------------------------
 2 files changed, 11 insertions(+), 39 deletions(-)

diff --git a/drivers/fsi/i2c/iic-boe.c b/drivers/fsi/i2c/iic-boe.c
index 27dc8c1c048e..e7196c0115b1 100644
--- a/drivers/fsi/i2c/iic-boe.c
+++ b/drivers/fsi/i2c/iic-boe.c
@@ -124,6 +124,8 @@ static iic_eng_ops_t eng_ops = {
 int iic_boe_set_speed(iic_bus_t* bus, int i2c_hz)
 {
 	_clock_divider = i2c_hz;
+
+	return 0;
 }
 
 int iic_boe_get_speed(iic_bus_t* bus)
@@ -1220,7 +1222,7 @@ int iic_boe_rescue_timeout(iic_eng_t *eng, iic_xfr_t* xfr)
 
 
 	if((fifo_cnt = stat & IIC_BOE_FIFO_COUNT) > 0) {
-		IFLDi(1, "fifo_cnt[%d]\n", fifo_cnt);
+		IFLDi(1, "fifo_cnt[%lu]\n", fifo_cnt);
 
 		if(test_bit(IIC_XFR_RD, &xfr->flags))
 		{	/* read operation */
diff --git a/drivers/fsi/i2c/iic-mstr.c b/drivers/fsi/i2c/iic-mstr.c
index d7f029ceea0d..0d97671eaad2 100644
--- a/drivers/fsi/i2c/iic-mstr.c
+++ b/drivers/fsi/i2c/iic-mstr.c
@@ -131,27 +131,6 @@ struct file_operations iic_fops = {
 	.mmap = iic_mmap,
 };
 
-static iic_bus_t * iic_get_bus(unsigned long port, unsigned long type)
-{
-	iic_bus_type_t* iterator;
-	int found = 0;
-
-	IENTER();
-
-	list_for_each_entry(iterator, &iic_bus_type_list, list)
-	{
-		if((iterator->type == type) && (iterator->bus->port == port))
-		{
-			found = 1;
-			break;
-		}
-	}
-
-	IEXIT(0);
-	return (found == 1)? iterator->bus: NULL;
-}
-
-
 int iic_common_open(iic_client_t ** o_client, iic_bus_t * bus, int engine_num)
 {
 	int ret = 0;
@@ -298,9 +277,6 @@ EXPORT_SYMBOL(iic_sideways_release);
 int iic_release(struct inode* inode, struct file* filp)
 {
 	iic_client_t* client = (iic_client_t*)filp->private_data;
-	iic_bus_t* bus = container_of(inode->i_cdev,
-				      iic_bus_t,
-				      cdev);
 	IENTER();
 
 	IFLDs(2, "CLOSE    client[%p] bus[%08lx]\n", client, bus->bus_id);
@@ -318,7 +294,6 @@ EXPORT_SYMBOL(iic_release);
 
 void iic_cleanup_xfr(iic_xfr_t* xfr, dd_ffdc_t ** o_ffdc)
 {
-	int i;
 	IENTER();
 
 	del_timer(&xfr->delay);
@@ -338,7 +313,6 @@ int iic_create_xfr(iic_client_t* client, struct kiocb* iocb,
 	iic_xfr_t *xfr;
 	iic_xfr_opts_t *t_opts;
 	iic_eng_t *eng = client->bus->eng;
-	int i;
 	unsigned short j = 0, count = 0, size = 0;
 
 	IENTER();
@@ -393,7 +367,6 @@ int iic_create_xfr(iic_client_t* client, struct kiocb* iocb,
 	{
 		unsigned long data_sz = xfr->size;
 		unsigned long start;
-		char* data = (char*)&xfr->offset_ffdc;
 
 		if(t_opts->wsplit)
 		{
@@ -1227,9 +1200,12 @@ ssize_t iic_read(struct file *filp, char __user *buf, size_t count,
 	}
 
 	rc = iic_common_read(client, kbuf, count, offset, NULL);
+	if (rc < 0)
+		goto free;
 
-	copy_to_user(buf, kbuf, count);
+	rc = copy_to_user(buf, kbuf, count);
 
+free:
 	kfree(kbuf);
 
 exit:
@@ -1339,10 +1315,13 @@ ssize_t iic_write(struct file *filp, const char __user *buf, size_t count,
 		goto exit;
 	}
 
-	copy_from_user(kbuf, buf, count);
+	rc = copy_from_user(kbuf, buf, count);
+	if (rc)
+		goto free;
 
 	rc = iic_common_write(client, kbuf, count, offset, NULL);
 
+free:
 	kfree(kbuf);
 
 exit:
@@ -2203,7 +2182,6 @@ iic_bus_t*  iic_create_bus(struct class* classp, iic_eng_t* eng,
 	IFLDi(1, "bus[%08lx] created\n", bus->bus_id);
 	goto exit;
 
-exit_q_create:
 	device_destroy(classp, bus->devnum);
 exit_class_add:
 	cdev_del(&bus->cdev);
@@ -2248,14 +2226,6 @@ static void __exit iic_exit(void)
 	IEXIT(0);
 }
 
-static int iic_set_trc_sz(const char* val, struct kernel_param *kp)
-{
-	int rc = param_set_int(val, kp);
-	if(rc)
-		return rc;
-	return 0;
-}
-
 module_init(iic_init);
 module_exit(iic_exit);
 MODULE_AUTHOR("Eddie James <eajames@us.ibm.com>");
-- 
2.11.0
