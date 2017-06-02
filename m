Return-Path: <sschaeck@cisco.com>
X-Greylist: delayed 604 seconds by postgrey-1.36 at bilbo;
 Sat, 03 Jun 2017 05:53:36 AEST
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=cisco.com header.i=@cisco.com header.b="fa09Lfaq"; 
 dkim-atps=neutral
Received: from rcdn-iport-7.cisco.com (rcdn-iport-7.cisco.com [173.37.86.78])
 (using TLSv1.2 with cipher DHE-RSA-SEED-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3wfZdr2S6qzDqKX
 for <openbmc@lists.ozlabs.org>; Sat,  3 Jun 2017 05:53:36 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=cisco.com; i=@cisco.com; l=4119; q=dns/txt; s=iport;
 t=1496433216; x=1497642816;
 h=date:from:to:subject:message-id:mime-version;
 bh=Pa7jMVEt2zhOSbRanbioFLrcHeJvDHw2FdtKKfq6Lp0=;
 b=fa09LfaqMihbuoYXKWzPffZby5iFETRWB/+YxhhBgO13I4IB5t2hmi2U
 JUyllL5hKf+xHURZG5xlSTmrpF15RQ4ISLXTFPmijy0nz3SN7CLXc2lF4
 tjD8EXe749zvShFdSxAyc/6peRrw55eWSoNN+l9GLDduLcvOGO7G/LJ/i A=;
X-IronPort-AV: E=Sophos;i="5.39,286,1493683200"; d="scan'208";a="251112139"
Received: from rcdn-core-10.cisco.com ([173.37.93.146])
 by rcdn-iport-7.cisco.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 02 Jun 2017 19:43:29 +0000
Received: from sjc-ads-246.cisco.com (sjc-ads-246.cisco.com [171.71.190.178])
 by rcdn-core-10.cisco.com (8.14.5/8.14.5) with ESMTP id
 v52JhS6i000346
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
 Fri, 2 Jun 2017 19:43:29 GMT
Received: from sjc-ads-246.cisco.com (localhost.localdomain [127.0.0.1])
 by sjc-ads-246.cisco.com (8.13.8/8.13.8) with ESMTP id v52JhSNe025163;
 Fri, 2 Jun 2017 12:43:28 -0700
Received: (from sschaeck@localhost)
 by sjc-ads-246.cisco.com (8.13.8/8.13.8/Submit) id v52JhSqO025162;
 Fri, 2 Jun 2017 12:43:28 -0700
Date: Fri, 2 Jun 2017 12:43:28 -0700
From: Stefan Schaeckeler <sschaeck@cisco.com>
To: Joel Stanley <joel@jms.id.au>, Jean Delvare <jdelvare@suse.com>,
 Guenter Roeck <linux@roeck-us.net>, openbmc@lists.ozlabs.org
Subject: [PATCH] drivers: hwmon: aspeed fan driver: make fan/pwm names start
 with index 1
Message-ID: <20170602194328.GA24663@sjc-ads-246.cisco.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.4.2.2i
X-Mailman-Approved-At: Sun, 04 Jun 2017 20:05:34 +1000
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
X-List-Received-Date: Fri, 02 Jun 2017 19:53:37 -0000

Make fan and pwm names in sysfs start with index 1 in accordance to
Documentation/hwmon/sysfs-interface conventions.

Current implementation starts with index 0 making tools such as sensors(1)
skip the first fan.

Signed-off-by: Stefan Schaeckeler <sschaeck@cisco.com>
---
 drivers/hwmon/aspeed-pwm-tacho.c | 52 ++++++++++++++++++++--------------------
 1 file changed, 26 insertions(+), 26 deletions(-)

diff --git a/drivers/hwmon/aspeed-pwm-tacho.c b/drivers/hwmon/aspeed-pwm-tacho.c
index d9161cd..1dbd83e 100644
--- a/drivers/hwmon/aspeed-pwm-tacho.c
+++ b/drivers/hwmon/aspeed-pwm-tacho.c
@@ -591,24 +591,23 @@ static umode_t fan_dev_is_visible(struct kobject *kobj,
 	return a->mode;
 }
 
-static SENSOR_DEVICE_ATTR(pwm0, 0644,
-			show_pwm, set_pwm, 0);
 static SENSOR_DEVICE_ATTR(pwm1, 0644,
-			show_pwm, set_pwm, 1);
+			show_pwm, set_pwm, 0);
 static SENSOR_DEVICE_ATTR(pwm2, 0644,
-			show_pwm, set_pwm, 2);
+			show_pwm, set_pwm, 1);
 static SENSOR_DEVICE_ATTR(pwm3, 0644,
-			show_pwm, set_pwm, 3);
+			show_pwm, set_pwm, 2);
 static SENSOR_DEVICE_ATTR(pwm4, 0644,
-			show_pwm, set_pwm, 4);
+			show_pwm, set_pwm, 3);
 static SENSOR_DEVICE_ATTR(pwm5, 0644,
-			show_pwm, set_pwm, 5);
+			show_pwm, set_pwm, 4);
 static SENSOR_DEVICE_ATTR(pwm6, 0644,
-			show_pwm, set_pwm, 6);
+			show_pwm, set_pwm, 5);
 static SENSOR_DEVICE_ATTR(pwm7, 0644,
+			show_pwm, set_pwm, 6);
+static SENSOR_DEVICE_ATTR(pwm8, 0644,
 			show_pwm, set_pwm, 7);
 static struct attribute *pwm_dev_attrs[] = {
-	&sensor_dev_attr_pwm0.dev_attr.attr,
 	&sensor_dev_attr_pwm1.dev_attr.attr,
 	&sensor_dev_attr_pwm2.dev_attr.attr,
 	&sensor_dev_attr_pwm3.dev_attr.attr,
@@ -616,6 +615,7 @@ static struct attribute *pwm_dev_attrs[] = {
 	&sensor_dev_attr_pwm5.dev_attr.attr,
 	&sensor_dev_attr_pwm6.dev_attr.attr,
 	&sensor_dev_attr_pwm7.dev_attr.attr,
+	&sensor_dev_attr_pwm8.dev_attr.attr,
 	NULL,
 };
 
@@ -624,40 +624,39 @@ static const struct attribute_group pwm_dev_group = {
 	.is_visible = pwm_is_visible,
 };
 
-static SENSOR_DEVICE_ATTR(fan0_input, 0444,
-		show_rpm, NULL, 0);
 static SENSOR_DEVICE_ATTR(fan1_input, 0444,
-		show_rpm, NULL, 1);
+		show_rpm, NULL, 0);
 static SENSOR_DEVICE_ATTR(fan2_input, 0444,
-		show_rpm, NULL, 2);
+		show_rpm, NULL, 1);
 static SENSOR_DEVICE_ATTR(fan3_input, 0444,
-		show_rpm, NULL, 3);
+		show_rpm, NULL, 2);
 static SENSOR_DEVICE_ATTR(fan4_input, 0444,
-		show_rpm, NULL, 4);
+		show_rpm, NULL, 3);
 static SENSOR_DEVICE_ATTR(fan5_input, 0444,
-		show_rpm, NULL, 5);
+		show_rpm, NULL, 4);
 static SENSOR_DEVICE_ATTR(fan6_input, 0444,
-		show_rpm, NULL, 6);
+		show_rpm, NULL, 5);
 static SENSOR_DEVICE_ATTR(fan7_input, 0444,
-		show_rpm, NULL, 7);
+		show_rpm, NULL, 6);
 static SENSOR_DEVICE_ATTR(fan8_input, 0444,
-		show_rpm, NULL, 8);
+		show_rpm, NULL, 7);
 static SENSOR_DEVICE_ATTR(fan9_input, 0444,
-		show_rpm, NULL, 9);
+		show_rpm, NULL, 8);
 static SENSOR_DEVICE_ATTR(fan10_input, 0444,
-		show_rpm, NULL, 10);
+		show_rpm, NULL, 9);
 static SENSOR_DEVICE_ATTR(fan11_input, 0444,
-		show_rpm, NULL, 11);
+		show_rpm, NULL, 10);
 static SENSOR_DEVICE_ATTR(fan12_input, 0444,
-		show_rpm, NULL, 12);
+		show_rpm, NULL, 11);
 static SENSOR_DEVICE_ATTR(fan13_input, 0444,
-		show_rpm, NULL, 13);
+		show_rpm, NULL, 12);
 static SENSOR_DEVICE_ATTR(fan14_input, 0444,
-		show_rpm, NULL, 14);
+		show_rpm, NULL, 13);
 static SENSOR_DEVICE_ATTR(fan15_input, 0444,
+		show_rpm, NULL, 14);
+static SENSOR_DEVICE_ATTR(fan16_input, 0444,
 		show_rpm, NULL, 15);
 static struct attribute *fan_dev_attrs[] = {
-	&sensor_dev_attr_fan0_input.dev_attr.attr,
 	&sensor_dev_attr_fan1_input.dev_attr.attr,
 	&sensor_dev_attr_fan2_input.dev_attr.attr,
 	&sensor_dev_attr_fan3_input.dev_attr.attr,
@@ -673,6 +672,7 @@ static struct attribute *fan_dev_attrs[] = {
 	&sensor_dev_attr_fan13_input.dev_attr.attr,
 	&sensor_dev_attr_fan14_input.dev_attr.attr,
 	&sensor_dev_attr_fan15_input.dev_attr.attr,
+	&sensor_dev_attr_fan16_input.dev_attr.attr,
 	NULL
 };
 
-- 
2.9.3
