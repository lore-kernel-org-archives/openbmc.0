Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BB61606A336
	for <openbmc@archiver.kernel.org>; Mon, 23 Nov 2026 20:01:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=U0QeouhH
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4jYGzC3jCmz2y8m;
	Tue, 24 Nov 2026 07:01:11 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.234.252.31
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1795464071;
	cv=none; b=fsHfkQnvw2YVjcy+mumvRXhVYoSgCPb5/uglLrk5xA40gmND5cjpHxD+hk7BWpNxE/56puDvN8YcZ9bYjV/c6EmPVGbEsfq7HIgeDj2SzAeRqKu7G8KNC/gltN7jE1tbmnUkaywx/0ZWQrsGh7cm8qTrRPli8TL68oBkbKjL/RgVjRpdEYSMq3endo9aBuojxuNXN2u+QLNk8SW6RZTRAKhmWmZ/LYcikiKa/PSzddZdYninjdeMdld2516WQVMvFBQ4hVIWoXOzCLyeOApl9hFbIuh4XPCWhbjKAC4AlLTxvRLnFZ6wQI7+gOtLDh7rP9W+YhNH8PgUknHRukWaXw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1795464071; c=relaxed/relaxed;
	bh=VBddtnZ6NplTqsAQrt2rNvqi2go0i1Jy9vkkQ/D7OwQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=GyDlVddLTFf3fzJZpMNXCi9gp2hznJtu4n4C05WKV6fLwa4im4bhw2hK4AGyUCHh9f2wcMOSXyE1vuezOyOwXnLmb+vnUQqwrQjSxOonyhuKG72B8DpSsixvHjvSFrlZcbS8Bx42J0rxp8msLmGS6DzDhP+73Ma6WH6hL8OMcJtZVQZMFujmhDVBMsTBZJ+a+tcW4t1T6i+F32owwJhsVrfNRFi96v0itwoel049MTyW13r9TYd1bmXHtSV8Pt4HRAr86uMGnAALTTWhb8mBq+K/LoAnAELB2bxk9EZw2c4vHAhOf5k8l8aDQz2eIhHvbHQGCy2TVNOdzOYKCKwofA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=U0QeouhH; dkim-atps=neutral; spf=pass (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=lee@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=U0QeouhH;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=lee@kernel.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4jYGzB06Vnz2xdb
	for <openbmc@lists.ozlabs.org>; Tue, 24 Nov 2026 07:01:09 +1100 (AEDT)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id CC4B24403E;
	Mon, 23 Nov 2026 20:01:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 195DA1F000D0;
	Mon, 23 Nov 2026 20:01:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795464067;
	bh=VBddtnZ6NplTqsAQrt2rNvqi2go0i1Jy9vkkQ/D7OwQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=U0QeouhHPw6RwqtmUwFLMFeLJszFZAzpXoM0K1PKvgU2FytdyhDUmGfioCGmuZ7Jd
	 rP43eGqmPibJoPx8wBQnbJUziI2HqSo85sp2w6Hv5fgYjPaTaUyvFIgUYFr1Gu9FKU
	 lMsGeqlY79mU/9SYKQ99BLwiSNFbMSRgR6ULOceXqlIESEerF+IcnzpMUysm7ERWW2
	 9eObdajXWPL2kb+zuI5e30bZf6VKAf3v6QHakfncsCqWwgPw7ca4E4+y2YFJrcqHat
	 vYiUSwaFat6d2EJzV+sS7TCZRBnND4t1+YJ3vfDoYXdrjgNIqKN7GIoQf4ukzosxei
	 nOMxEeOPfWzRw==
From: Lee Jones <lee@kernel.org>
To: lee@kernel.org,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	Avi Fishman <avifishman70@gmail.com>,
	Tomer Maimon <tmaimon77@gmail.com>,
	Tali Perry <tali.perry1@gmail.com>,
	Patrick Venture <venture@google.com>,
	Nancy Yuen <yuenn@google.com>,
	Benjamin Fair <benjaminfair@google.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Eric Liu <liuer@nvidia.com>,
	Medad CChien <ctcchien@nuvoton.com>,
	Mia Lin <mimi05633@gmail.com>,
	openbmc@lists.ozlabs.org,
	linux-rtc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: stable@vger.kernel.org
Subject: [PATCH 06/10] rtc: nct3018y: fix clock provider use-after-free and leak on unbind
Date: Mon, 23 Nov 2026 19:59:17 +0000
Message-ID: <20261123200012.502284-7-lee@kernel.org>
X-Mailer: git-send-email 2.56.1.831.g720f3f5937-goog
In-Reply-To: <20261123200012.502284-1-lee@kernel.org>
References: <20261123200012.502284-1-lee@kernel.org>
X-Mailing-List: openbmc@lists.ozlabs.org
List-Id: <openbmc.lists.ozlabs.org>
List-Help: <mailto:openbmc+help@lists.ozlabs.org>
List-Owner: <mailto:openbmc+owner@lists.ozlabs.org>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Subscribe: <mailto:openbmc+subscribe@lists.ozlabs.org>,
  <mailto:openbmc+subscribe-digest@lists.ozlabs.org>,
  <mailto:openbmc+subscribe-nomail@lists.ozlabs.org>
Precedence: list
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

nct3018y_clkout_register_clk() registers the CLKOUT clock via
devm_clk_register() but adds the OF clock provider with unmanaged
of_clk_add_provider() and never removes it.  When the driver unbinds or
devm_rtc_register_device() fails, devres unregisters and frees struct
clk and nct3018y state while leaving a dangling pointer on the global
of_clk_providers list, leaking the provider entry and OF node reference
and causing a use-after-free on subsequent clock lookups.

Use devm_of_clk_add_hw_provider() so the OF clock provider is removed
automatically before the clock and driver state are released.

Fixes: 5adbaed16cc6 ("rtc: Add NCT3018Y real time clock driver")
Closes: https://sashiko.dev/#/bug/linux-9509654b-12c7-4bd1-b189-f52692af9457
Cc: stable@vger.kernel.org
Signed-off-by: Lee Jones <lee@kernel.org>
---
 drivers/rtc/rtc-nct3018y.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/rtc/rtc-nct3018y.c b/drivers/rtc/rtc-nct3018y.c
index c770450e48b4..8349ddd1a9d6 100644
--- a/drivers/rtc/rtc-nct3018y.c
+++ b/drivers/rtc/rtc-nct3018y.c
@@ -479,7 +479,8 @@ static struct clk *nct3018y_clkout_register_clk(struct nct3018y *nct3018y)
 	clk = devm_clk_register(&client->dev, &nct3018y->clkout_hw);
 
 	if (!IS_ERR(clk))
-		of_clk_add_provider(node, of_clk_src_simple_get, clk);
+		devm_of_clk_add_hw_provider(&client->dev, of_clk_hw_simple_get,
+					    &nct3018y->clkout_hw);
 
 	return clk;
 }
-- 
2.56.1.750.gf70dc682cf-goog


