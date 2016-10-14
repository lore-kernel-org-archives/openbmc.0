Return-Path: <christopher.lee.bostic@gmail.com>
Received: from mail-pf0-x242.google.com (mail-pf0-x242.google.com
 [IPv6:2607:f8b0:400e:c00::242])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3swhjm4Y5BzDt4r
 for <openbmc@lists.ozlabs.org>; Sat, 15 Oct 2016 09:15:08 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b=avdqDunB; 
 dkim-atps=neutral
Received: by mail-pf0-x242.google.com with SMTP id s8so7955516pfj.2
 for <openbmc@lists.ozlabs.org>; Fri, 14 Oct 2016 15:15:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=3tvG81/bgbb+URctobPK+VzmVLfvVqo8FzbuX/pQCV4=;
 b=avdqDunBDAH8v/IJk4vJOUqMEb9Z0FzwxFerr1h+2DTwWHrjzGN96D8aq9q+iXIEty
 c3uXqeKDWGu+0x381tpHF9pKyMFfqZtnI65+CfqZ1hhWPmRRe+rmEwBabJUHJ467+lDB
 qoo3KdqgD8CQfedhVZdVyf8ADTRi6S7rePEbkzNRG1IGWYqZWf1+AMR1zIuTFUCs8xqP
 p2790C/dY5LNuDn6wuVmNhzUFrrZmyYxF9yMtsuvzSazA60RzhzruslKdnG4/zavcEX/
 E7oPhsxzbHxxDN7nI60ntcXWQ4RYVugpKhoXFiyugiqV0+WTBcsGSyc/5usgrUWnqgAY
 Hs/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=3tvG81/bgbb+URctobPK+VzmVLfvVqo8FzbuX/pQCV4=;
 b=cvUQqpVIEnC8JHDSB+4mnnFDDlolt3toqgvEnKhYKkXbswI1wmTpcVtrVyH9nOKVlX
 4e3OZFJjQxVniO/9EYgqaf6Mdvb8MZugHi9Sf3hr4tErF9mrL/sbWtsUHG0y8gh6ruFj
 AJ3qfxBvUlZHaAqy4LHjR99AhFC771OSkNDTbn7aWWSfSjS+dd9R4KdV/4jukn53T4B4
 5E5CEigpHcwbqFD5igeEoRcc2nlF5TBvKA3egQDulQ3y2bkC8h4AsLj6TU7A70G70z2d
 QpFfSPRNuSHAxtlvm/HdUn0GzTC45MjRAi/WV+T95pJhT25pVxtKJXEVhv1i8Eyt6uS7
 Wpcw==
X-Gm-Message-State: AA6/9RnBfxeK/4DVn556fhh/wnlhb4wvs9L6k0hOYxdB8NvYmuCK6uHmVJQdlFPDLjy16w==
X-Received: by 10.99.128.198 with SMTP id j189mr17943353pgd.118.1476483306508; 
 Fri, 14 Oct 2016 15:15:06 -0700 (PDT)
Received: from Christophers-MacBook-Pro.local.com
 (45-20-192-79.lightspeed.austtx.sbcglobal.net. [45.20.192.79])
 by smtp.gmail.com with ESMTPSA id p7sm29848874paa.3.2016.10.14.15.15.05
 (version=TLS1 cipher=AES128-SHA bits=128/128);
 Fri, 14 Oct 2016 15:15:06 -0700 (PDT)
From: christopher.lee.bostic@gmail.com
To: openbmc@lists.ozlabs.org
Cc: joel@jms.id.au, zahrens@us.ibm.com, xxpetri@de.ibm.com,
 Chris Bostic <cbostic@us.ibm.com>
Subject: [PATCH linux v4 15/20] drivers/fsi: Fix some text formatting
Date: Fri, 14 Oct 2016 17:14:37 -0500
Message-Id: <1476483282-85971-16-git-send-email-christopher.lee.bostic@gmail.com>
X-Mailer: git-send-email 2.7.4 (Apple Git-66)
In-Reply-To: <1476483282-85971-1-git-send-email-christopher.lee.bostic@gmail.com>
References: <1476483282-85971-1-git-send-email-christopher.lee.bostic@gmail.com>
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
X-List-Received-Date: Fri, 14 Oct 2016 22:15:09 -0000

From: Chris Bostic <cbostic@us.ibm.com>

Cleaned up a few formatting warnings like blank lines at EOF
and block comment style.

Signed-off-by: Chris Bostic <cbostic@us.ibm.com>
---
 drivers/fsi/fsi-core.c        | 8 ++++++--
 drivers/fsi/fsi-master-fake.c | 1 -
 drivers/fsi/fsi-master-gpio.c | 1 -
 3 files changed, 6 insertions(+), 4 deletions(-)

diff --git a/drivers/fsi/fsi-core.c b/drivers/fsi/fsi-core.c
index 07f5034..5cbe78d 100644
--- a/drivers/fsi/fsi-core.c
+++ b/drivers/fsi/fsi-core.c
@@ -87,6 +87,7 @@ int fsi_device_peek(struct fsi_device *dev, void *val)
 static void fsi_device_release(struct device *_device)
 {
 	struct fsi_device *device = to_fsi_dev(_device);
+
 	kfree(device);
 }
 
@@ -187,8 +188,10 @@ static int fsi_slave_scan(struct fsi_slave *slave)
 		type = (conf & FSI_SLAVE_CONF_TYPE_MASK)
 			>> FSI_SLAVE_CONF_TYPE_SHIFT;
 
-		/* Unused address areas are marked by a zero type value; this
-		 * skips the defined address areas */
+		/*
+		 * Unused address areas are marked by a zero type value; this
+		 * skips the defined address areas
+		 */
 		if (type != 0) {
 
 			/* create device */
@@ -231,6 +234,7 @@ static int fsi_slave_scan(struct fsi_slave *slave)
 static void fsi_slave_release(struct device *dev)
 {
 	struct fsi_slave *slave = to_fsi_slave(dev);
+
 	kfree(slave);
 }
 
diff --git a/drivers/fsi/fsi-master-fake.c b/drivers/fsi/fsi-master-fake.c
index 50aac0b..ec1ed5e 100644
--- a/drivers/fsi/fsi-master-fake.c
+++ b/drivers/fsi/fsi-master-fake.c
@@ -93,4 +93,3 @@ static int __init fsi_master_fake_init(void)
 }
 
 module_init(fsi_master_fake_init);
-
diff --git a/drivers/fsi/fsi-master-gpio.c b/drivers/fsi/fsi-master-gpio.c
index 3855829..5c3d5cd 100644
--- a/drivers/fsi/fsi-master-gpio.c
+++ b/drivers/fsi/fsi-master-gpio.c
@@ -89,4 +89,3 @@ static struct platform_driver fsi_master_gpio_driver = {
 };
 
 module_platform_driver(fsi_master_gpio_driver);
-
-- 
1.8.2.2
