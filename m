Return-Path: <joel.stan@gmail.com>
Received: from mail-pg0-x242.google.com (mail-pg0-x242.google.com
 [IPv6:2607:f8b0:400e:c05::242])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3vDyrj3sFQzDq6X
 for <openbmc@lists.ozlabs.org>; Fri,  3 Feb 2017 11:47:48 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="sfYAsKd/"; 
 dkim-atps=neutral
Received: by mail-pg0-x242.google.com with SMTP id 204so394048pge.2
 for <openbmc@lists.ozlabs.org>; Thu, 02 Feb 2017 16:47:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id;
 bh=bqsqiZcx4+tVihbuBxdn/qwxcuIxXUQaAHLu9ybrVBg=;
 b=sfYAsKd/vMEFw+xYzlfj/z3sjCpEghsjlLeCNHA9v7ByhBHJwuiwayL30HpjnWOhAg
 ViN6/tsUgNfxhtj5xmVg/7I1tvBc9AiFbJ6cL3UFqFB14rhTpF+5XO79ouSTxPEjj8Hj
 wUIxLJTOvfbulAjqSPJEHkRwUh1hgUIRm5y09tH/f/7uoyxXL4ekw2+j/MjvmzILsCcn
 2LDLondi7JXql1uO28Nm2VP1yMsfAwCu2RfEvQ677LI6uNcf51GI5Kxgt06UCzRtiDk0
 mDDqpHNFRE/9lgvTujV+s1weDBn2PxalyTyCCgDzDwLHwRe6jUqT6wC8Xln2r7oSNPOg
 c4Yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id;
 bh=bqsqiZcx4+tVihbuBxdn/qwxcuIxXUQaAHLu9ybrVBg=;
 b=ZDWjjkGqdIbDvp4ovRIIMGm2qTFtV2MMsHRk0ejHDJkrc2J5mYK+6v5bg2tVmEDlC7
 pr27u/uoOTenTrP8ztmEopW1w4XEYZMCBcDQFk0JaLDFG3xm3GN2w3vruw9OEipBX8Xg
 kRVePDOmGhqpyKWmwrSrdhStWFrw1YURQKjbEXo4b2B0q/vyr8SGrv3J3hT8FJjxCNM9
 TsDAy1zcDhWB5Wgma0fALJdJ0ZaAoFNyhHPTE0fPn7+8KPyh5Q/sOWNdKFEoMQVb0Mo4
 +laFLVSXud579ia0PIk+3PvIHPx8wmaverSh5VU+l8ypd7kpsCUuktvXNTHUnpZa7tQ7
 xEfg==
X-Gm-Message-State: AIkVDXJW1/wGgNacjqG1mGFzJPpIAPaD5dbUME7g4MgdzYOLYueD/70c3wihbFXo83nGpA==
X-Received: by 10.99.149.27 with SMTP id p27mr14269721pgd.21.1486082866869;
 Thu, 02 Feb 2017 16:47:46 -0800 (PST)
Received: from aurora.jms.id.au (103-232-208-197.nat.sa.cust.uniti.network.
 [103.232.208.197])
 by smtp.gmail.com with ESMTPSA id l12sm61481848pfj.37.2017.02.02.16.47.43
 (version=TLS1 cipher=AES128-SHA bits=128/128);
 Thu, 02 Feb 2017 16:47:45 -0800 (PST)
Sender: "joel.stan@gmail.com" <joel.stan@gmail.com>
Received: by aurora.jms.id.au (sSMTP sendmail emulation);
 Fri, 03 Feb 2017 11:17:38 +1030
From: Joel Stanley <joel@jms.id.au>
To: eajames@linux.vnet.ibm.com,
	cbostic@linux.vnet.ibm.com
Cc: openbmc@lists.ozlabs.org
Subject: [PATCH linux dev-4.7] drivers: fsi: Fix compilation warnings
Date: Fri,  3 Feb 2017 11:17:37 +1030
Message-Id: <20170203004737.18653-1-joel@jms.id.au>
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
X-List-Received-Date: Fri, 03 Feb 2017 00:47:50 -0000

The i2c driver didn't compile cleanly. Silence the warnings.

Signed-off-by: Joel Stanley <joel@jms.id.au>
---
 drivers/fsi/i2c/iic-fsi.c | 16 +++++++---------
 1 file changed, 7 insertions(+), 9 deletions(-)

diff --git a/drivers/fsi/i2c/iic-fsi.c b/drivers/fsi/i2c/iic-fsi.c
index 3a9b25d03b72..2c0aec9b3152 100644
--- a/drivers/fsi/i2c/iic-fsi.c
+++ b/drivers/fsi/i2c/iic-fsi.c
@@ -100,7 +100,7 @@ int readb_wrap(iic_eng_t* eng, unsigned int addr, unsigned char *val,
 	if(rc)
 	{
 		IFLDe(3, "eng[%08x]: fsi_readb_ffdc(%p)=%d\n", eng->id,
-				addr, rc);
+				(void *)addr, rc);
 	}
 	return rc;
 };
@@ -114,7 +114,7 @@ int readh_wrap(iic_eng_t* eng, unsigned int addr, unsigned short *val,
 	if(rc)
 	{
 		IFLDe(3, "eng[%08x]: fsi_readh_ffdc(%p)=%d\n", eng->id,
-				addr, rc);
+				(void *)addr, rc);
 	}
 	return rc;
 };
@@ -128,7 +128,7 @@ int readw_wrap(iic_eng_t* eng, unsigned int addr, unsigned long *val,
 	if(rc)
 	{
 		IFLDe(3, "eng[%08x]: fsi_readw_ffdc(%p)=%d\n", eng->id,
-				addr, rc);
+				(void *)addr, rc);
 	}
 	return rc;
 };
@@ -142,7 +142,7 @@ int writeb_wrap(iic_eng_t* eng, unsigned int addr, unsigned char val,
 	if(rc)
 	{
 		IFLDe(3, "eng[%08x]: fsi_writeb_ffdc(%p)=%d\n", eng->id,
-				addr, rc);
+				(void *)addr, rc);
 	}
 	return rc;
 };
@@ -156,7 +156,7 @@ int writeh_wrap(iic_eng_t* eng, unsigned int addr, unsigned short val,
 	if(rc)
 	{
 		IFLDe(3, "eng[%08x]: fsi_writeh_ffdc(%p)=%d\n", eng->id,
-				addr, rc);
+				(void *)addr, rc);
 	}
 	return rc;
 };
@@ -170,7 +170,7 @@ int writew_wrap(iic_eng_t* eng, unsigned int addr, unsigned long val,
 	if(rc)
 	{
 		IFLDe(3, "eng[%08x]: fsi_writew_ffdc(%p)=%d\n", eng->id,
-				addr, rc);
+				(void *)addr, rc);
 	}
 	return rc;
 };
@@ -197,7 +197,7 @@ static const struct fsi_device_id i2c_ids[] = {
 	{ 0 }
 };
 
-static const struct fsi_driver i2c_drv = {
+static struct fsi_driver i2c_drv = {
 	.id_table = i2c_ids,
 	.drv = {
 		.name = "iic_fsi_dd",
@@ -220,7 +220,6 @@ int iic_add_ports(iic_eng_t* eng, uint64_t ports)
 	int minor = 0;
 	char name[64];
 	int rc = 0;
-	struct fsi_device *fdev = to_fsi_dev(eng->dev);
 
 	IENTER();
 
@@ -485,7 +484,6 @@ void iic_fsi_shutdown(struct device *dev)
 {
 	int rc = 0;
 	iic_eng_t* eng = (iic_eng_t*)dev_get_drvdata(dev);
-	struct fsi_device* fsidev = to_fsi_dev(dev);
 
 	IENTER();
 	if(!eng || !eng->ops)
-- 
2.11.0
