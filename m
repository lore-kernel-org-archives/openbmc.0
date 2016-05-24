Return-Path: <joel@jms.id.au>
Received: from mail-pa0-x244.google.com (mail-pa0-x244.google.com
 [IPv6:2607:f8b0:400e:c03::244])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3rDJm86g3JzDqNQ
 for <openbmc@lists.ozlabs.org>; Tue, 24 May 2016 12:10:48 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=jms.id.au header.i=@jms.id.au header.b=lSe41ueL; 
 dkim-atps=neutral
Received: by mail-pa0-x244.google.com with SMTP id fg1so435974pad.3
 for <openbmc@lists.ozlabs.org>; Mon, 23 May 2016 19:10:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=from:to:cc:subject:date:message-id;
 bh=1wQWimGk3PJ3WDGT1ZWvpfst51ozE+nWlx1s6wuBi5g=;
 b=lSe41ueL9iBjLkDwu8JNiNRRthNQr02kwtODV72SDFNdC8ZhP5GmWGr2Kq0iE4cUvE
 iUzodtEln6PLC7SV4S0BAogPRh86pzODlQWFqrzRdZij+YVoef8OkX4pdgmR9lT5ftt+
 YeHKZ0xWsJ+V5kA/i+wY48UXGytF59U8Jq6+o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=1wQWimGk3PJ3WDGT1ZWvpfst51ozE+nWlx1s6wuBi5g=;
 b=EvOrEm2DTKvKCnoD7jYV4kn301PJyWvSz1tfVz/QOb/OR/ExVnbfwEv9kVJmOGUrYv
 FQ75TuISt7KtfFNqqJEVC+C/CGg0Qw+mm+RfUSj3aSOUeUUXx+LmQjYcvuzhD30TLI2S
 mTQvUXWobP/G6Ac9KU2B5l993NgTj8FxzU9StqnVjgP0YtX2fudAtPJqvd+22lI5cJDX
 kvsJ/g8a06K3qIT0TAUdpFuxWa8hAtl0dtrUsuUctfHi8EQP93r7cfbtS0pywKZFyDGe
 rX5pLApVOANJkbKDLmQ49iLZTxQ9f3jWW6lKi2wvSmmaFIovZJ+xlWmnwF+5ZMgz8cCG
 M86Q==
X-Gm-Message-State: ALyK8tLmO0UL2KJsAh1h3onLqNwgxg1zzJjlVkFnBuJmVW0XNpS/hgGQuOXVz2Bl3U0/dQ==
X-Received: by 10.66.65.169 with SMTP id y9mr2937423pas.102.1464055846756;
 Mon, 23 May 2016 19:10:46 -0700 (PDT)
Received: from icarus.au.ibm.com ([2403:480:11:8000:fc53:a38c:f05e:e521])
 by smtp.gmail.com with ESMTPSA id c2sm49605566pfc.40.2016.05.23.19.10.44
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Mon, 23 May 2016 19:10:46 -0700 (PDT)
From: Joel Stanley <joel@jms.id.au>
To: jk@ozlabs.org
Cc: openbmc@lists.ozlabs.org
Subject: [PATCH linux] gpio/aspeed: Forward port GPIO driver
Date: Tue, 24 May 2016 11:40:39 +0930
Message-Id: <1464055839-16479-1-git-send-email-joel@jms.id.au>
X-Mailer: git-send-email 2.8.1
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.22
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Tue, 24 May 2016 02:10:49 -0000

This updates the driver to build on 4.7:

  - 58383c78425e4ee1c077253cf297b641c861c02e renamed dev to parent

Signed-off-by: Joel Stanley <joel@jms.id.au>
---
Hey Jeremy,

I've made mistakes in the past so this is a sanity check of a trivial change.
Please ack if you think this look okay :)

Cheers,

Joel

 drivers/gpio/gpio-aspeed.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpio/gpio-aspeed.c b/drivers/gpio/gpio-aspeed.c
index 152b7d4484d1..aa4573f03cb6 100644
--- a/drivers/gpio/gpio-aspeed.c
+++ b/drivers/gpio/gpio-aspeed.c
@@ -389,7 +389,7 @@ static int __init aspeed_gpio_probe(struct platform_device *pdev)
 
 	gpio->chip.ngpio = ARRAY_SIZE(aspeed_gpio_banks) * 32;
 
-	gpio->chip.dev = &pdev->dev;
+	gpio->chip.parent = &pdev->dev;
 	gpio->chip.direction_input = aspeed_gpio_dir_in;
 	gpio->chip.direction_output = aspeed_gpio_dir_out;
 	gpio->chip.get = aspeed_gpio_get;
-- 
2.8.1
