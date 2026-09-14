Return-Path: <openbmc+bounces-2591-openbmc=archiver.kernel.org@lists.ozlabs.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33546C88E72
	for <openbmc@archiver.kernel.org>; Tue, 15 Sep 2026 00:01:47 +0000 (UTC)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4hkMcn3KKkz2yFj;
	Tue, 15 Sep 2026 10:01:29 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::1036"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1789375503;
	cv=none; b=DoudGeHmeaNWFEadOgCVIkRt8nTlmJFvJKK9WnrCtHMREbeEWniFdqrf7WuPbz67gqHsHPndZ5MK1BmazdM1+rvIOpRYWf6P2c75P9ld6QQIslcFGkb0NgC15RqYL1c4SzGXaKJrt6fZSpyCJ1TWQfYlDuvcP+Y3eTpneqECzJJ00WQ/K09/kdkBNZNSHYEf3avI2TkjPyKOUoh45vYmTvG6lH0hRZhx443sbWr5/10Kh8HISbQC2I2INI2HM/4kzygdm2KqpdNHFMI2Q92LHJNiCd9djtMg09gHVd492y1bTjzXVMD+7L/jHuYbdOUEe/Xy4uyrct/uSQScr+j5sg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1789375503; c=relaxed/relaxed;
	bh=OR7fP4bd0gC35uG1gm8oegHQErfRKha3ncQTYMaVg3c=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=XjYDoNKfE2yh5yI6NM/zMVRzMe9UNWCMphau5Wpn1orvAwzr9icqPb7sX4i40tNr/o9IrcyejrVkAjuqKDQUhXo8ud9LI/6JKlj4+QY5DQqeIEuyOsR+GRJhKahvTKSsk2bJTAjnD89i45K/WjrNAzqU5UwO01lNkoIT0HoG7MVvZ7f/pSXJ0PKIArGyD2AkOGaAAs1z4sxfGE6yjw2PKsMxrSwyZzzV2v4gihkfq20wd+jYyth9gAfBhH21OLpWf7lZm2iJJM2wRpfJGrn/B/E5ckq2T96KAgvIIY8x3HxkP/UdNgBT05S3Jd3Y6FtqcFKfOeZZfGExUJKEFCRTug==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=ofpdrGY1; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::1036; helo=mail-pj1-x1036.google.com; envelope-from=lgs201920130244@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=ofpdrGY1;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1036; helo=mail-pj1-x1036.google.com; envelope-from=lgs201920130244@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pj1-x1036.google.com (mail-pj1-x1036.google.com [IPv6:2607:f8b0:4864:20::1036])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4hjzHK451Wz2yWK
	for <openbmc@lists.ozlabs.org>; Mon, 14 Sep 2026 18:45:00 +1000 (AEST)
Received: by mail-pj1-x1036.google.com with SMTP id 98e67ed59e1d1-3856d6fbcb3so2846147a91.2
        for <openbmc@lists.ozlabs.org>; Mon, 14 Sep 2026 01:45:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789375497; x=1789980297; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=OR7fP4bd0gC35uG1gm8oegHQErfRKha3ncQTYMaVg3c=;
        b=ofpdrGY1xdm6cBVNOsCZmHlTEzXLc+ZqaU3cdRVAQ6PUc6+I1155Ynz+irmU7OEeiU
         J0MjcAkISjcduAIhvSQm1sN3iNyKEKmu24FiS400F959geyYuFvrFkDG3oDH6glDErpV
         kLAqSuAOJtzmK4KGKqsSYyLE7KZ7eGy/3sj2Hdj6TrQAxAu/dZGYaAcssTtDiAuvfVVk
         LIH9/AjZiT0Ffh2yduV7GPVyb8iCrNGhr+aErDBF2PjOoLQCVaw/0UibKaZjd1uI93uo
         keCzCjWH521tDMGMePZs4D8M6xP0Ac9fyRbxYOlO/eAfX/l7sBASZnNRAzguK9WxMd8m
         TQCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789375497; x=1789980297;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OR7fP4bd0gC35uG1gm8oegHQErfRKha3ncQTYMaVg3c=;
        b=HFP5a7GbaS1kguMiZGul9HTdePbhGwYSRTQr5J9XUJRB9FOSpE8hMhvlOQ8Vl6gGvn
         6M53qFU++AddsNmuCJWHh06/fILQb+PhnAgwoqbpL21XJd6rbwbtCxugsF42wq3vbzdg
         2LjEEcs5lL77Eg4GOrerNNcwSfkjb7lJUqseGWr7e8RqB5ew/T7428MIW0SQrH1Myf1M
         1L0tWugY3KSHsOg6Fqb5xIISampQgfAvoWncaJpZ+IrKe7rbQA1f9CeGD8cia6T9eQia
         74ryBWU7FKLi1b7thS5Kh2EVfY+i45yzbygfB0hW9MgDBssuwt2BWbtIlMSDbJ4y2IMQ
         meyA==
X-Forwarded-Encrypted: i=1; AKwUvBxSWV+WeGBTBpKdSrUmbSeGrUvCnUgqEG9pUR3x6PyfipkJjskKuoC+tGZjf+v478KONIZLuqqJ@lists.ozlabs.org
X-Gm-Message-State: AFuF++kSR15UXxJWUEHu8C+KmkivYXQNzEFdnWJd+o/VGmnTF+Kn4vFk
	/eUvgbwttuDXDG0fF8tiHl0J7z9lSMiHVSotor0Tq16BHEq0FdU1BAEp
X-Gm-Gg: AYBFou1U6HjNSrXKJp1Rfa3RZgSEKE1vOcctZLnSRFjLVelIoLrlWAYKMjBP6tdh1/Q
	7338r31lAnKDA53xof/OGdNIJsQQYOd1ysQTVMxUlsMYubyaF50dKru6SQIcDLipQYcn9ZODQn/
	/SAgOrPDHO4k0coNIiIx9nbcoNhsGB9ds855rKtxfHqB8foTawFeuL6cU1kDJUnKPkdpwkCZlt+
	rN+S42+8B7r8+cn6lWJwRu6z20otz3KgCspd+JEdcLrsejJq1GyS3D/OfxNw8lDV+mq7D18bZQT
	Ve1UrnrX/z5qbh/zGKFS038K3+xPJNzIlh5XnpTmsqueO/sq7bbSSB30QZzz5goJBGjM+rcHYEm
	bUXB6iXkgMBDHYteTPjwvflXdbbJzOwSPDpPjxomI7iyx2wB697I/10lf4iNOlErulGD+GblgoG
	8rNXwT/zKI09Rju1NXgk1mLZ3KX5VTiEKTo2IbyLJfysFc/iBNjtylfg==
X-Received: by 2002:a17:90a:d2cf:b0:398:bf7e:b267 with SMTP id 98e67ed59e1d1-39debf86d29mr3926198a91.2.1789375496577;
        Mon, 14 Sep 2026 01:44:56 -0700 (PDT)
Received: from lgs.. ([2001:250:5800:1002::de93])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39d99531b16sm21128646a91.14.2026.09.14.01.44.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 01:44:55 -0700 (PDT)
From: Guangshuo Li <lgs201920130244@gmail.com>
To: Eddie James <eajames@linux.ibm.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	Wolfram Sang <wsa@kernel.org>,
	"Oliver O'Halloran" <oohall@gmail.com>,
	linux-i2c@vger.kernel.org,
	openbmc@lists.ozlabs.org,
	linux-kernel@vger.kernel.org
Cc: Guangshuo Li <lgs201920130244@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH] i2c: fsi: fix device node reference leak on remove
Date: Mon, 14 Sep 2026 16:44:43 +0800
Message-ID: <20260914084443.1664635-1-lgs201920130244@gmail.com>
X-Mailer: git-send-email 2.43.0
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

fsi_i2c_find_port_of_node() returns a referenced device_node for each
port. When an adapter is registered successfully, the node is stored in
port->adapter.dev.of_node and the reference remains held for the
lifetime of the port.

fsi_i2c_remove() deletes the adapter and frees the port, but does not
drop this device_node reference. As a result, each registered port
leaks a device_node reference when the driver is removed.

Save the node pointer before calling i2c_del_adapter(), since
i2c_del_adapter() clears the adapter device structure, and release the
reference with of_node_put() afterwards.

This issue was found by manual code inspection.

Fixes: 095561f476ab ("i2c: fsi: Create busses for all ports")
Cc: stable@vger.kernel.org
Signed-off-by: Guangshuo Li <lgs201920130244@gmail.com>
---
 drivers/i2c/busses/i2c-fsi.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/i2c/busses/i2c-fsi.c b/drivers/i2c/busses/i2c-fsi.c
index b2dc5ae1d0e4..0c022e79ddbf 100644
--- a/drivers/i2c/busses/i2c-fsi.c
+++ b/drivers/i2c/busses/i2c-fsi.c
@@ -748,8 +748,11 @@ static void fsi_i2c_remove(struct fsi_device *fsi_dev)
 	struct fsi_i2c_port *port, *tmp;
 
 	list_for_each_entry_safe(port, tmp, &i2c->ports, list) {
+		struct device_node *np = port->adapter.dev.of_node;
+
 		list_del(&port->list);
 		i2c_del_adapter(&port->adapter);
+		of_node_put(np);
 		kfree(port);
 	}
 }
-- 
2.43.0


