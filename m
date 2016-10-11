Return-Path: <christopher.lee.bostic@gmail.com>
Received: from mail-oi0-x242.google.com (mail-oi0-x242.google.com
 [IPv6:2607:f8b0:4003:c06::242])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3str4z41PyzDsrf
 for <openbmc@lists.ozlabs.org>; Wed, 12 Oct 2016 08:40:19 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b=p6VybEvB; 
 dkim-atps=neutral
Received: by mail-oi0-x242.google.com with SMTP id e12so2264247oib.3
 for <openbmc@lists.ozlabs.org>; Tue, 11 Oct 2016 14:40:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=42OvQihmRSPWTiN4RyOrsz/BOXFX8iDJ7350OLTLKv4=;
 b=p6VybEvBuvf/6jbceDdtH6AoW0mJ6qOsEjh7om4rHBcd+4PzndEfNOmBGsYJnMzG4L
 bAS7ssYyahqSuskkhyFo61sc6755E0Ga/rWcdx91J1KyXumoEluFs2Wn4LP+VCwbEtRV
 vPHXoAZZxlPY7wUlg3p5VXRug+WM5QiaLIaK+dbmhW8JDwC3SG7s6UFZZZtlIqRnruYh
 /O1OOAL6kKdHRWru9fBGJw6mIbU1IhC0nqUum06lK3YfJRX0uxpYbNOOJSRzTwnWE+QS
 jg1iCkEvrKEkyvY/QU/X13hujyIrKAihcuWf8FuATigfUXBl6PmMp7FcCKrF2fHCaLXa
 CvNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=42OvQihmRSPWTiN4RyOrsz/BOXFX8iDJ7350OLTLKv4=;
 b=nAHXOmdnHs1sxxl+h37d0gyHYtes9GaBIy3vpu6uahEFryqOTMJtSP84cRSDwo8AaF
 K/rC6rU+7Dn7tiGrMe0ZsE6yb27eildrYk8VJVEkrm46Z16yW8e+WK40PK5nndVsQDNt
 QF6Pl8MCaZk8mRcLgIDFpi2+77vjPkdv3rEoRjbe/tUfUkGpEaN7wGBXyNh90tJ3GPoq
 0+KfJanj3LwDlLKZyZc1zYb230lwWFezb4tgUrNUBv4LuIEPNXdqjgpBi5oJbOU2KXY9
 Nh8RuC/X+tFoPVi1DcPMIlkkwiQIZjq3pjqIXx4ybRSHlAbeLzz9Aovd6t96Nc5LDm2O
 6IDQ==
X-Gm-Message-State: AA6/9Rnj+A1Dbsy8N2nLKqE9BGL+e59I0zY2gQg/E8GnuGh8/idA4ALR7VVtkuZdFXfGQQ==
X-Received: by 10.157.14.108 with SMTP id n41mr3413446otd.136.1476222017861;
 Tue, 11 Oct 2016 14:40:17 -0700 (PDT)
Received: from Christophers-MacBook-Pro.local.com
 (45-20-192-79.lightspeed.austtx.sbcglobal.net. [45.20.192.79])
 by smtp.gmail.com with ESMTPSA id h91sm1811153oth.40.2016.10.11.14.40.17
 (version=TLS1 cipher=AES128-SHA bits=128/128);
 Tue, 11 Oct 2016 14:40:17 -0700 (PDT)
From: christopher.lee.bostic@gmail.com
To: openbmc@lists.ozlabs.org
Cc: joel@jms.id.au, zahrens@us.ibm.com, xxpetri@de.ibm.com,
 Chris Bostic <cbostic@us.ibm.com>
Subject: [PATCH linux v3 14/18] drivers/fsi: Fix some text formatting
Date: Tue, 11 Oct 2016 16:39:59 -0500
Message-Id: <1476222003-99697-15-git-send-email-christopher.lee.bostic@gmail.com>
X-Mailer: git-send-email 2.7.4 (Apple Git-66)
In-Reply-To: <1476222003-99697-1-git-send-email-christopher.lee.bostic@gmail.com>
References: <1476222003-99697-1-git-send-email-christopher.lee.bostic@gmail.com>
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
X-List-Received-Date: Tue, 11 Oct 2016 21:40:20 -0000

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
index 10bf817..a3a860a 100644
--- a/drivers/fsi/fsi-core.c
+++ b/drivers/fsi/fsi-core.c
@@ -87,6 +87,7 @@ int fsi_device_peek(struct fsi_device *dev, void *val)
 static void fsi_device_release(struct device *_device)
 {
 	struct fsi_device *device = to_fsi_dev(_device);
+
 	kfree(device);
 }
 
@@ -185,8 +186,10 @@ static int fsi_slave_scan(struct fsi_slave *slave)
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
@@ -229,6 +232,7 @@ static int fsi_slave_scan(struct fsi_slave *slave)
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
