Return-Path: <mine260309@gmail.com>
Authentication-Results: ozlabs.org; spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:400e:c05::241; helo=mail-pg0-x241.google.com;
 envelope-from=mine260309@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="Y27U0Ynn"; 
 dkim-atps=neutral
Received: from mail-pg0-x241.google.com (mail-pg0-x241.google.com
 [IPv6:2607:f8b0:400e:c05::241])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3yS88K5BljzDqlM
 for <openbmc@lists.ozlabs.org>; Thu,  2 Nov 2017 13:25:53 +1100 (AEDT)
Received: by mail-pg0-x241.google.com with SMTP id s2so3738003pge.10
 for <openbmc@lists.ozlabs.org>; Wed, 01 Nov 2017 19:25:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=araWV95YPpiOxbz/EeMK6RjBn7fneA41eTTubTw6jnU=;
 b=Y27U0Ynnm/bRSBLChB1t7ruPhTseGpVlz2cn0oqhIdZj+lxwbbWJcsQL4paCnCeJ59
 n1N8LGqq44zsdr/TuMP7/112SjpIilg15NnLvDAODP951q9NWc3+gklRJUT/82mME8Tx
 2ibWRz7PCYoHPGD6cvY3vsSOxq9gzJknrD7YlPAF0Y9OYvDjypYddly1pfj8zh08+BF9
 hOcI1sJ0cEMmBvuCm+UpxCpZZQYzFlLee1R/9UCA8qI1qDLDIzoV1FyfcGUXBfXK9/wN
 a4YZ/Poxfh/KbH65gsREe8aB7+kF+/Bf8JDqi2RCUlefO8ekpPfEOLux55Usk5ro+b9n
 rwMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=araWV95YPpiOxbz/EeMK6RjBn7fneA41eTTubTw6jnU=;
 b=ObJPc3Web2fcRM7Gdyw9oCeLJcRZVwQlkwRME7YC7ltHh5+Mt/qXNOVE0H2GRDcKEv
 5srnOVIvgRNo4247Sp41U8EuWhI2FzPOFnWBV6kBA1fDGgqbaxU5vOj0zHItaSp2MIaf
 vZ04fw8TrzrOgOZMEotktApL9SG9CIt2KwnOvIWGOzu+2N4q35BOfyM5AaZ05gaeRlc/
 KREQntiNd7pHVCUWX0J18SQw1ceudUC9/NOk5mVsw42MaD8lAoM1ZV1o1qZdAwaE14kJ
 BAQJRClVdl1ofUdNR8k+iQLNcLnA7usG3fiSIfvXXcWgYL+uldvuu0ioDnb22nyhEHTG
 o3RA==
X-Gm-Message-State: AMCzsaWuf3ctjqXoXlBA2QGUzaiv6LQJSMxvdpo8Y8Gk1n2RFwGoXCUJ
 ivUuXJnQaeR/9652YVFv28dmuQJh
X-Google-Smtp-Source: ABhQp+QnjzGCwMSj3I3pYi7RSHwSk5nk6HQxyns2+qFgtYtZZfh90gh1DhpVdqVqXWkZ+p9DtUdZKg==
X-Received: by 10.101.80.70 with SMTP id k6mr1901147pgo.149.1509589551716;
 Wed, 01 Nov 2017 19:25:51 -0700 (PDT)
Received: from localhost ([159.203.222.251])
 by smtp.gmail.com with ESMTPSA id h77sm3058179pfj.38.2017.11.01.19.25.50
 (version=TLS1_2 cipher=AES128-SHA bits=128/128);
 Wed, 01 Nov 2017 19:25:51 -0700 (PDT)
From: Lei YU <mine260309@gmail.com>
To: openbmc@lists.ozlabs.org
Subject: [PATCH linux dev-4.10 2/3] hwmon: (w83773g) Add documentation
Date: Thu,  2 Nov 2017 10:25:18 +0800
Message-Id: <1509589519-26697-1-git-send-email-mine260309@gmail.com>
X-Mailer: git-send-email 1.9.1
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.24
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Thu, 02 Nov 2017 02:25:54 -0000

Add documentation for the w83773g driver.

Signed-off-by: Lei YU <mine260309@gmail.com>
---
 Documentation/hwmon/w83773g | 28 ++++++++++++++++++++++++++++
 1 file changed, 28 insertions(+)
 create mode 100644 Documentation/hwmon/w83773g

diff --git a/Documentation/hwmon/w83773g b/Documentation/hwmon/w83773g
new file mode 100644
index 0000000..da28731
--- /dev/null
+++ b/Documentation/hwmon/w83773g
@@ -0,0 +1,28 @@
+Kernel driver w83773g
+====================
+
+Supported chips:
+  * Nuvoton W83773G
+    Prefix: 'w83773g'
+    Addresses scanned: I2C 0x4c and 0x4d
+    Datasheet: https://www.nuvoton.com/resource-files/W83773G_SG_DatasheetV1_2.pdf
+
+Authors:
+	Lei YU <mine260309@gmail.com>
+
+Description
+-----------
+
+This driver implements support for Nuvoton W83773G temperature sensor
+chip. This chip implements one local and two remote sensors.
+Temperature is measured in degrees Celsius.
+The chip is wired over I2C/SMBus and specified over a temperature
+range of -40 to +125 degrees Celsius (for local sensor) and -40 to +127
+degrees Celsius (for remote sensors).
+Resolution for both the local and remote channels is 0.125 degree C.
+
+The chip supports only temperature measurement. The driver exports
+the temperature values via the following sysfs files:
+
+temp[1-3]_input
+temp[2-3]_fault
-- 
1.9.1
