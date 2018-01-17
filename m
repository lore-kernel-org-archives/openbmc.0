Return-Path: <mine260309@gmail.com>
Authentication-Results: ozlabs.org; spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:400e:c05::243; helo=mail-pg0-x243.google.com;
 envelope-from=mine260309@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="szaKMxl9"; 
 dkim-atps=neutral
Received: from mail-pg0-x243.google.com (mail-pg0-x243.google.com
 [IPv6:2607:f8b0:400e:c05::243])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3zLtlN2r07zF0gs
 for <openbmc@lists.ozlabs.org>; Wed, 17 Jan 2018 15:04:48 +1100 (AEDT)
Received: by mail-pg0-x243.google.com with SMTP id k68so2970528pga.3
 for <openbmc@lists.ozlabs.org>; Tue, 16 Jan 2018 20:04:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:subject:date:message-id:in-reply-to:references;
 bh=xtnBtOwyykHn8umyYgzMYT1crUWYazHRqs8u1rem924=;
 b=szaKMxl9Y4zaEJt4ZfBnBrtWa3VYHqBtEHMI7hVrxlYx7t9RL2RG5pZRbgAl2cHt9S
 lvValub3ERwajAojm7/Z31kpbLaTLpObUl7lWqg0ITqAtH61GQGp+BwOHjZIW/lpaUTJ
 kHI4B4GDKUrY0KgH9fe5PZAYMm01SkhC29u9RbTewn1tGl+zYEFF3rAc9xAI0V7FhLmc
 LUdneaoFcfay7No2D1Edeb3XKFDY1yTKCfjClNQ8qjB8wIiRyrXjqogKRUAIhx/XpBb7
 kWIeQvDN+8e0SPwbbHzo4HINicUdlE4erbWph3ooH2kofdz/fg1fdzM/puy++zJ8+fnz
 ALtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references;
 bh=xtnBtOwyykHn8umyYgzMYT1crUWYazHRqs8u1rem924=;
 b=H0v2ug0vLBKvYJNBd5tfcAnqgFMhN7KKnaaufenlotLA1oloUcfE4LiIL/k8+Wpgnv
 WLEtHYdtps8aLtmvLmaz38XC/8K6zKVv6+3MqYzUJigEHxPOFme2CitjHWuYNYAiRrBo
 hlKq+RfO6S7HJ16Y0wDk6auMOjQLwlLnmA2lyfQNz7ITu0pVw9FjtdT5epJC5rE9czEi
 WvVQZRrKynkK7oDh/+BveJhFz2KnsgufQaMNv2bQBAKaXN+OkmaGit8siMfPCzs9FW37
 GlmlckChbZ6NiWt/Aa202gAkLV8Am82AhJkJvN0jA1bthTGDcJWnOFOQtrW8HtBXJKFR
 3QPg==
X-Gm-Message-State: AKwxytdkyMFEft0oukauEyOQwL8YpMU81feFX7CBRCHXf8gApAjYljPj
 vLIOdXehd8XgrwlMpKOL9FkXyRsG
X-Google-Smtp-Source: ACJfBougTZ5mJsYmhMRBf2NcB0Q1TspRpc4pauJ3H+3huS1h/hPpQfQUzaYC/6RK1+4foxzSjAwv9w==
X-Received: by 10.99.113.75 with SMTP id b11mr23044990pgn.271.1516161886085;
 Tue, 16 Jan 2018 20:04:46 -0800 (PST)
Received: from localhost ([159.203.222.251])
 by smtp.gmail.com with ESMTPSA id q65sm6236410pfj.137.2018.01.16.20.04.44
 for <openbmc@lists.ozlabs.org>
 (version=TLS1_2 cipher=AES128-SHA bits=128/128);
 Tue, 16 Jan 2018 20:04:44 -0800 (PST)
From: Lei YU <mine260309@gmail.com>
To: openbmc@lists.ozlabs.org
Subject: [PATCH linux dev-4.10 2/3] hwmon: (w83773g) Add documentation
Date: Wed, 17 Jan 2018 12:04:01 +0800
Message-Id: <1516161842-16203-2-git-send-email-mine260309@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1516161842-16203-1-git-send-email-mine260309@gmail.com>
References: <1516161842-16203-1-git-send-email-mine260309@gmail.com>
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
X-List-Received-Date: Wed, 17 Jan 2018 04:04:48 -0000

Add documentation for the w83773g driver.

Signed-off-by: Lei YU <mine260309@gmail.com>
Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 Documentation/hwmon/w83773g | 33 +++++++++++++++++++++++++++++++++
 1 file changed, 33 insertions(+)
 create mode 100644 Documentation/hwmon/w83773g

diff --git a/Documentation/hwmon/w83773g b/Documentation/hwmon/w83773g
new file mode 100644
index 0000000..4cc6c0b
--- /dev/null
+++ b/Documentation/hwmon/w83773g
@@ -0,0 +1,33 @@
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
+The chip also features offsets for the two remote sensors which get added to
+the input readings. The chip does all the scaling by itself and the driver
+therefore reports true temperatures that don't need any user-space adjustments.
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
+temp[2-3]_offset
+update_interval
-- 
1.9.1
