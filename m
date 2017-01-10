Return-Path: <roblip@gmail.com>
Received: from mail-pf0-x242.google.com (mail-pf0-x242.google.com
 [IPv6:2607:f8b0:400e:c00::242])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3tyDPW0GbWzDqFh
 for <openbmc@lists.ozlabs.org>; Tue, 10 Jan 2017 12:06:39 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="Yl7zu8dZ"; 
 dkim-atps=neutral
Received: by mail-pf0-x242.google.com with SMTP id 127so26024626pfg.0
 for <openbmc@lists.ozlabs.org>; Mon, 09 Jan 2017 17:06:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=Vgq0DzBNfWfoFwO4k40Tyh6wKmoZpLNjZAfz7ronzEk=;
 b=Yl7zu8dZvO3obPjD20AfLyS1C1njTmw3bVAkLn/JJ0q5FHt5zAglW7dnkbADGS0PH9
 HZoDlOfWuZAFYRPSmHap3TJtfQCp5lg8yus3aeYM5S3PbvRLXU0HMprL7ayztMOBt2US
 5oyZ8wY3LezzEG0tblXPBTPwlFdTDOCby5KWBHoZaTNWWlNdXuubEmqQJR+R2Mfbq7U2
 IIX0swek10zF+ja0q3aUU6NRGWGtySZ5C0MG7g8Cv5xeQ1hbZwLSh20SDQg43YzpLaj+
 mN0+x4AClCr/AiJzLWd15wo4r9rUEKDsyq3a5B4DL+lCwz51WslwdLyR0gHbToVtUw/R
 tzZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=Vgq0DzBNfWfoFwO4k40Tyh6wKmoZpLNjZAfz7ronzEk=;
 b=Hu/jP1JSatYwZKyUlzOSIjmGmMZUWuDCtC+vEl5iNABxb9AKVRTkskKu3If9dGXS+e
 Hp0uUqNDqZNzKgUjFCcNfaFS5T7OxMlJD5KXJOrSk07KEBSzpAwRGKVsbMTW54Vny35i
 lqX3Acdkq/vailoqzav+T6Q/6AWszdAZyea60vKaAW/kYrqiYhjdjW5yJMDlkAf5bhZQ
 H0m3L9Lddb3L0hnHBhH5O9ZKErULDtR1FZsWfvZMRrN7G3IMLyLx8WKF4st1/1rge9Aw
 fC25ub3OpoIuC464NwGkb+stXR+nk0y8op1AVsKn0S0FhmMOQe99gA6vKomkjB3lYZAl
 JILA==
X-Gm-Message-State: AIkVDXIGgqU3Sip86DNblk0JvMFKxV4YwWMkRhKrlb+pmzFPIVtSaPCQGozLtbObELMdqw==
X-Received: by 10.98.14.82 with SMTP id w79mr629142pfi.153.1484010397446;
 Mon, 09 Jan 2017 17:06:37 -0800 (PST)
Received: from rlippert.svl.corp.google.com ([100.123.242.116])
 by smtp.gmail.com with ESMTPSA id q14sm277678pfa.40.2017.01.09.17.06.35
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Mon, 09 Jan 2017 17:06:35 -0800 (PST)
From: Robert Lippert <roblip@gmail.com>
X-Google-Original-From: Robert Lippert <rlippert@google.com>
To: openbmc@lists.ozlabs.org
Cc: clg@kaod.org,
	Robert Lippert <rlippert@google.com>
Subject: [PATCH linux 1/3] mtd: spi-nor: add SPI_NOR_DUAL_READ to mx66l51235l
Date: Mon,  9 Jan 2017 17:05:21 -0800
Message-Id: <20170110010524.116687-2-rlippert@google.com>
X-Mailer: git-send-email 2.11.0.390.gc69c2f50cf-goog
In-Reply-To: <20170110010524.116687-1-rlippert@google.com>
References: <20170110010524.116687-1-rlippert@google.com>
X-Mailman-Approved-At: Tue, 10 Jan 2017 12:21:32 +1100
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
X-List-Received-Date: Tue, 10 Jan 2017 01:06:39 -0000

Signed-off-by: Robert Lippert <rlippert@google.com>
---

 drivers/mtd/spi-nor/spi-nor.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
index a68073afe8a8..e508c25a47f7 100644
--- a/drivers/mtd/spi-nor/spi-nor.c
+++ b/drivers/mtd/spi-nor/spi-nor.c
@@ -857,7 +857,7 @@ static const struct flash_info spi_nor_ids[] = {
 	{ "mx25l12855e", INFO(0xc22618, 0, 64 * 1024, 256, 0) },
 	{ "mx25l25635e", INFO(0xc22019, 0, 64 * 1024, 512, 0) },
 	{ "mx25l25655e", INFO(0xc22619, 0, 64 * 1024, 512, 0) },
-	{ "mx66l51235l", INFO(0xc2201a, 0, 64 * 1024, 1024, SPI_NOR_QUAD_READ) },
+	{ "mx66l51235l", INFO(0xc2201a, 0, 64 * 1024, 1024, SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ) },
 	{ "mx66l1g45g",  INFO(0xc2201b, 0, 64 * 1024, 2048, SECT_4K | SPI_NOR_QUAD_READ) },
 	{ "mx66l1g55g",  INFO(0xc2261b, 0, 64 * 1024, 2048, SPI_NOR_QUAD_READ) },
 
-- 
2.11.0.390.gc69c2f50cf-goog
