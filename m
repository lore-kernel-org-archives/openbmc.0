Return-Path: <mine260309@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:400e:c05::242; helo=mail-pg0-x242.google.com;
 envelope-from=mine260309@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="RVYbNHpI"; 
 dkim-atps=neutral
Received: from mail-pg0-x242.google.com (mail-pg0-x242.google.com
 [IPv6:2607:f8b0:400e:c05::242])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 405Zrc6mZqzF0Q9
 for <openbmc@lists.ozlabs.org>; Wed, 21 Mar 2018 14:23:28 +1100 (AEDT)
Received: by mail-pg0-x242.google.com with SMTP id l4so1468488pgp.11
 for <openbmc@lists.ozlabs.org>; Tue, 20 Mar 2018 20:23:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=adh3ZKf2PlEoNSSzxTkm/UeuZvAfANQxEYyao7zSDcs=;
 b=RVYbNHpIhj5C+qxOE929xbSOSGx3MlI9sen4Tmlh6w7OcfL5YpuyUQNSEUHIysFAyL
 LZR1TedVwx1Pcpa1tlSyY7QC59Vlq7mhoIXAiNauXwDmMF6JVmo1I63X0a4m62tBrPUJ
 5Uev9+hXoSnPEWvfNMp/q/uxPD9GXXoKl7IOZu9ehkMM1BV7s5hYV0Zo//qnFE6bWfs5
 Z0BNtACMD6DOBpbEXnKTxP1Fgug0Ioj8Q09rUqBhu34fnBeOj0nouayWbauwzcz7AfHP
 J8dvZMiQOx6Ov6LrZbB0XwqjHgCpPyhBkV2S3vUtMYBVTHhUfgo1yrRwt6MgMX+uZDBs
 RtfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=adh3ZKf2PlEoNSSzxTkm/UeuZvAfANQxEYyao7zSDcs=;
 b=ZL05bT8kQSMVTnZkYEFODcLTNFWoPV/oQF3+XSLF1EIqJuTyvuqz8lsc19YE+wXUxg
 5vIIAgsslxBMunLm9xi9KPwtLoujf6rlKzOwDvj5ea2CIXrIGDECXnlEw3xFwPZimYVr
 zp9UKs84aUNi50KgIbr3hkk/Yz+lhXvJ1sxR1ZJOeKguPHjp/sjFmrdnANxNTiOU6/77
 EMFoA3SG+JZJCTGDuqj2kIq5JP/0qQv/NcAzUUIGTbDCaV3wxCLqThoQCYSsayLK5HD6
 ykRiOs66gat6JDEfWBqrZ+ulwaRnC/1hBQX9smTHsT0NoMh+3CPnh+3Segp/Vzkco1Hv
 hmCQ==
X-Gm-Message-State: AElRT7G8crx7cSzJwJBp/Pq+XuQyfYqPJi9NApFngov9h66uvtVvkCzF
 cfGaWTeBoQrQyXLEpZmDK5Ht6uoE
X-Google-Smtp-Source: AG47ELtx75JccET6sGV9HVyTqqGdAMA5F58yGB7DZcSxVL0ffXPo512aBKj4gUlWMtMMeZi12zTeuw==
X-Received: by 10.99.149.21 with SMTP id p21mr205773pgd.154.1521602606414;
 Tue, 20 Mar 2018 20:23:26 -0700 (PDT)
Received: from localhost (45.62.100.246.16clouds.com. [45.62.100.246])
 by smtp.gmail.com with ESMTPSA id f6sm4488477pgo.58.2018.03.20.20.23.23
 (version=TLS1_2 cipher=AES128-SHA bits=128/128);
 Tue, 20 Mar 2018 20:23:25 -0700 (PDT)
From: Lei YU <mine260309@gmail.com>
To: openbmc@lists.ozlabs.org
Subject: [PATCH linux dev-4.13] hwmon (occ): Fix an infinite for loop issue
Date: Wed, 21 Mar 2018 11:22:12 +0800
Message-Id: <1521602532-11306-1-git-send-email-mine260309@gmail.com>
X-Mailer: git-send-email 1.9.1
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.26
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Wed, 21 Mar 2018 03:23:29 -0000

The for loop without ++i cause either infinite loop or random memory
access issues, e.g. unable to handle kernel NULL or kernel oops in
snprintf.

Fix it by adding ++i in the for loop.

Signed-off-by: Lei YU <mine260309@gmail.com>
---
 drivers/hwmon/occ/common.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/hwmon/occ/common.c b/drivers/hwmon/occ/common.c
index d0b2a29..88c3291 100644
--- a/drivers/hwmon/occ/common.c
+++ b/drivers/hwmon/occ/common.c
@@ -916,7 +916,7 @@ static int occ_setup_sensor_attrs(struct occ *occ)
 		/* Special case for many-attribute power sensor. Split it into
 		 * a sensor number per power type, emulating several sensors.
 		 */
-		for (i = 0; i < sensors->power.num_sensors; ) {
+		for (i = 0; i < sensors->power.num_sensors; ++i) {
 			s = (i * 4) + 1;
 
 			snprintf(attr->name, sizeof(attr->name),
-- 
2.7.4
