Return-Path: <openbmc+bounces-1417-openbmc=archiver.kernel.org@lists.ozlabs.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 735B3FD0058
	for <openbmc@archiver.kernel.org>; Sun,  1 Mar 2026 16:54:15 +0000 (UTC)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fP7Sb4f51z30MZ;
	Mon, 02 Mar 2026 03:54:07 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=80.12.242.15
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1772384047;
	cv=none; b=bKJuxrbRsBRLqmNYgOXJolSDrxP1zW6+ZAgMgG8aa/7+9G1keM7LPYAdGEl1CGiYcggaQkdJOn1YAvXFTHCKv7FE9Kv5+WZLUR4uCgEJqQdC+0WhHeDkMezCqa6i0uknT/DY5knFvyINESlmMpa6CudeIrtHk7a9Q/gs6UPWCqYg9XiBItnnS5QuYZaEZQ6o6afSVZMroCAuGf+zHF11TK441toIr1+71Isikcc8mY849Soc21nBdSTWpGQmu5RJzgKDZgY8ruheNpO7+IMOhhTmikx7IhBNYmksrCWm8Je2WhHxMwQ3zbqFI4ZK47cZ0gvUqvOMsYNZ87ObwaRUhA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1772384047; c=relaxed/relaxed;
	bh=ZDU6YEmeKfV0DZTfQRWPUrC0979+SE4F08nNSXKB+Rw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ZGDMyEBHEh2CVyoDnmJDXATqqmtnZJ0e1XjJiP/wTVLOYAyLElno9jhwrIutFcWDUxkv3kfZ1V5MrjwJW7k2b1K5u3LHd/vmyfAl3pdMMORzhLk+zmcZy2A5kCyDt7xe7lvnnAInreJtMTwGO3XV4m1uoquSlnGiasWlZyFWQ2AoonNkKxxds2sVjSubDh1kopjsxI11F7mJw7tsxWqogmVprpIYXFH1dKPh9ABTiF1V8mS3GszjiraNeB2gZTSoVZw4ArBcaw51AzKoc5rtV+zoEUKkVo1IBQSon1T85KjKj3eqVZJivqqjHOwM10RbdNj0ZgWG6dP2Qsmrnxp4gQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr; dkim=pass (2048-bit key; unprotected) header.d=wanadoo.fr header.i=@wanadoo.fr header.a=rsa-sha256 header.s=t20230301 header.b=cBXl3qaJ; dkim-atps=neutral; spf=pass (client-ip=80.12.242.15; helo=smtp.smtpout.orange.fr; envelope-from=christophe.jaillet@wanadoo.fr; receiver=lists.ozlabs.org) smtp.mailfrom=wanadoo.fr
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=wanadoo.fr header.i=@wanadoo.fr header.a=rsa-sha256 header.s=t20230301 header.b=cBXl3qaJ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=wanadoo.fr (client-ip=80.12.242.15; helo=smtp.smtpout.orange.fr; envelope-from=christophe.jaillet@wanadoo.fr; receiver=lists.ozlabs.org)
X-Greylist: delayed 1906 seconds by postgrey-1.37 at boromir; Mon, 02 Mar 2026 03:54:05 AEDT
Received: from smtp.smtpout.orange.fr (smtp-15.smtpout.orange.fr [80.12.242.15])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fP7SY286sz2xqm
	for <openbmc@lists.ozlabs.org>; Mon, 02 Mar 2026 03:54:04 +1100 (AEDT)
Received: from fedora.home ([IPv6:2a01:cb10:785:b00:8347:f260:7456:7662])
	by smtp.orange.fr with ESMTPSA
	id wjXVvgvwZrKIuwjXVvxE5w; Sun, 01 Mar 2026 17:21:06 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
	s=t20230301; t=1772382066;
	bh=ZDU6YEmeKfV0DZTfQRWPUrC0979+SE4F08nNSXKB+Rw=;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=cBXl3qaJB63B45EjFaVLtaEMsSamPxFhByNIgYPTgYFgmSON8X/UUgQNg64hh/H4j
	 IgNLkQj8avGmaSvnjhYtEAHOiCfWoq7pQQF3Q1HWXI5zdupSU42eeZBfCDufBD7yri
	 wVYaDVGx1owXInYbbJVk3Hu5ZhwOVnnRowAqGuTewtkBTtJqvkgDJLFmF+SmBCMYqo
	 8c6W2IETu6BFBEj2s65kc94Aw+hQ5Vv12/6xptjN9vsOFdA/qThREfY7/EXZTzl0xF
	 kYJcUJongu+PD9SyKiWJrixnC1kWZHG7E8umBOUkGkkOmUw5N4s6+0V+5iqid8NvbV
	 NDba2IlekOFnQ==
X-ME-Helo: fedora.home
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Sun, 01 Mar 2026 17:21:06 +0100
X-ME-IP: 2a01:cb10:785:b00:8347:f260:7456:7662
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To: Eddie James <eajames@linux.ibm.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	Wolfram Sang <wsa@kernel.org>,
	"Oliver O'Halloran" <oohall@gmail.com>
Cc: linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
	linux-i2c@vger.kernel.org,
	openbmc@lists.ozlabs.org
Subject: [PATCH] i2c: fsi: Fix a potential leak in fsi_i2c_probe()
Date: Sun,  1 Mar 2026 17:21:01 +0100
Message-ID: <fd805c39f8de51edf303856103d782138a1633c8.1772382022.git.christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.53.0
X-Mailing-List: openbmc@lists.ozlabs.org
List-Id: <openbmc.lists.ozlabs.org>
List-Help: <mailto:openbmc+help@lists.ozlabs.org>
List-Owner: <mailto:openbmc+owner@lists.ozlabs.org>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Subscribe: <mailto:openbmc+subscribe@lists.ozlabs.org>,
  <mailto:openbmc+subscribe-digest@lists.ozlabs.org>,
  <mailto:openbmc+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:openbmc+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In the commit in Fixes:, when the code has been updated to use an explicit
for loop, instead of for_each_available_child_of_node(), the assumption
that a reference to a device_node structure would be released at each
iteration has been broken.

Now, an explicit of_node_put() is needed to release the reference.

Fixes: 095561f476ab ("i2c: fsi: Create busses for all ports")
Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
 drivers/i2c/busses/i2c-fsi.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/i2c/busses/i2c-fsi.c b/drivers/i2c/busses/i2c-fsi.c
index 82c87e04ac6f..b2dc5ae1d0e4 100644
--- a/drivers/i2c/busses/i2c-fsi.c
+++ b/drivers/i2c/busses/i2c-fsi.c
@@ -729,6 +729,7 @@ static int fsi_i2c_probe(struct fsi_device *fsi_dev)
 		rc = i2c_add_adapter(&port->adapter);
 		if (rc < 0) {
 			dev_err(dev, "Failed to register adapter: %d\n", rc);
+			of_node_put(np);
 			kfree(port);
 			continue;
 		}
-- 
2.53.0


