Return-Path: <openbmc+bounces-1866-openbmc=archiver.kernel.org@lists.ozlabs.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67548FF8864
	for <openbmc@archiver.kernel.org>; Wed, 29 Apr 2026 07:13:56 +0000 (UTC)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4g57np1Kyfz2yjp;
	Wed, 29 Apr 2026 17:13:50 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::22a"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1777446829;
	cv=none; b=PMB40RSMj5anxHeuX+poDu+Y/rgsr6k/80CwNNndzzSrX3iXGXbui1NGzcTlo3AK9JGafgKbJ663lS3WS1741DEeUk3gvPg3A0u1LORbSqVer0C9YXDjXGjfZ5BL9KxLjX+RIyA3e1UNcVIOPgywmEJ6QOEtuz1dXYrind2qRuKriWfRKhjioPJ4R+2pdo8UGReavfgHk/UdgVjMm8dRf/1sbnnZ2RJF7zudgrzQNEL6gZj0KkH42gukmP3VIWhad2Pr2WjxyVl2SnPoW2wO4HcrKQs/6szWs/Y7WAu0B+raQ3Un2Cf0zyLHUnXGyuMom0jqP3W/k46EFE8fyDWasw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1777446829; c=relaxed/relaxed;
	bh=PIG5Mu1RbZ1I8TRvQLqvXz1aBmGgV6FLaM/NrcCvPZw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=oUTIzBxk0l9QFlEfWey6wvIxWUchHmrgAAIUlgKMTPbCifIPEG/Pghy+fTpTiJgCx95Cbz5ScfsN0UxOjTq16jJnL9Peuw3eVouy71a2aFijc+T+61dDj72x6+6awPvSSVvV/zKCpEqaNIC2W93UCeIb0JnPiKK/IaoFC/4rb49HXwcOSKBBmnw2PiLS9lvhYOE7MPXhfnlem6rMMjPPbfYOwxhoCeYWuFQfZcW3jsgdcgXjd8rlSlU/wckurdbuA6+IM/e1yVhM3BQOreb3GZp1lwYyLM8igajJQNP/ZNEJd4ph9cHQ3hLlIw/OM6Yy7KaW0PVSlc64W2lnv2OTeg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Sd9/rR83; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::22a; helo=mail-lj1-x22a.google.com; envelope-from=aladyshev22@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Sd9/rR83;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::22a; helo=mail-lj1-x22a.google.com; envelope-from=aladyshev22@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com [IPv6:2a00:1450:4864:20::22a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4g57nm4QsJz2ySf
	for <openbmc@lists.ozlabs.org>; Wed, 29 Apr 2026 17:13:47 +1000 (AEST)
Received: by mail-lj1-x22a.google.com with SMTP id 38308e7fff4ca-38e7d983f79so94758611fa.0
        for <openbmc@lists.ozlabs.org>; Wed, 29 Apr 2026 00:13:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777446824; x=1778051624; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PIG5Mu1RbZ1I8TRvQLqvXz1aBmGgV6FLaM/NrcCvPZw=;
        b=Sd9/rR83/mttZBy2Bo0+wNkd+oFE52afH1FKdx5R1qHPGbQgbQK0aQCEHbi5ao77kd
         M4Ddn8joLxaFZ17PZCj8pj1ZeR+gl8R7qq1PY2SKIeLkEWlRLrOQe2wHujTsvBjM5qag
         WIcexpxD5jtgbuoi+IpnsxaIVD3NsDcD738UpaU8bcyWgdfEEA5Jav6CCI8uCpQ/YpBu
         qt2fiPbpGrAP0tAow7r7zZRTnIGT8Hk6TIlq7Dclbg2OzQdHOWzXOSMZy6jaQKm1IqTw
         7KnlxHhsaChpxWczl4vPQ1oZHni6xIp27XjTHuIsHUFQ43m36Ye+NOgAlRkCQ7Ul7hJN
         WDpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777446824; x=1778051624;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=PIG5Mu1RbZ1I8TRvQLqvXz1aBmGgV6FLaM/NrcCvPZw=;
        b=DDR+06HdoWGexB8znhcqv4dyfLrKwDvla1DpBz5/j+yZsYYn9PXXNz9V00E4mHesqY
         g07o+Arr+FGZBSqd9RsU/Ozewu5Q7qXyJ3RVQ3sF8haVrXZdJfogBaRm5rIBUd4CChV7
         unSGRINhaZ/+o50g+wMzLNuOcJPgflHJuj/yZwjXKAzAfM/aA8rKDABlWvCY6lWBaoj7
         LOI1uJeqc6d2TjhJNnAFmg6NSG40YJti7X7ixXYPtboO6zqMeWBrxuMIqUmw62QhciWL
         q/nWuTXOQ9hF/mQx0JqfFYitogaMM3pL3nMTEGj2YR0JpD40pqS9n/KaLpMJpnZ1kKxb
         RMmw==
X-Gm-Message-State: AOJu0YxEMpC6c7lG2uejowThm2nyDrNB34EIDpM+F/buGBELpqIrPid7
	hD786tX06wVO1a6DDW7xs/GIXdR+9Lp3ucu5qrECJWnAgZsJ5RQPvpZoEdXWvIhi
X-Gm-Gg: AeBDievSmLPwujnMmVJD/UTnRVI/NGNlqgscTKE7fPNOTXk8Uc8OVm5RRQ0abk43bvM
	BpLqrMQmYtFHrGK+0nkcKvvIIP8oWkvotqPIZsa5pn6t4Yv2IG2oRi0hNacQFzlUib42+2QHwlk
	uq44N4hTfcTShKNmvcXKtDiK5WiTA1mWtObTAgQrE8ctqeALk4RKgPV+QLyb/x1wU7kN1KCafUf
	TKnmK087Nl77uSAgExY+aPRAnlSclLrs+M6KMOS5JdGwJ2sSD6IHF35sw9ueUF3UNCQQl0Nifb7
	ojQ2REw7dFnTPhh+6jZoZ9wNhoD/5Wg/svAqJbcuj5XWfR8uYhuig4jMdEDsJNK8jwq9Rs/qi5g
	VXIoF0q3kY3X+OrULTbai+clmTW8tpQz+FVK1ZvJd+bqcn8wG95VNt59ZoBkoyNv8VO0/qJr1n1
	/cOedyp4bixdjzu7XdCAoQyoVHrSSVZ/Pu
X-Received: by 2002:a05:6512:31cd:b0:59e:1880:2ef7 with SMTP id 2adb3069b0e04-5a749cf37e8mr1108503e87.11.1777446823292;
        Wed, 29 Apr 2026 00:13:43 -0700 (PDT)
Received: from PC10411.67 ([82.97.198.254])
        by smtp.googlemail.com with ESMTPSA id 2adb3069b0e04-5a74a6f355fsm312099e87.24.2026.04.29.00.13.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Apr 2026 00:13:42 -0700 (PDT)
From: Konstantin Aladyshev <aladyshev22@gmail.com>
To: openbmc@lists.ozlabs.org,
	joel@jms.id.au,
	andrew@codeconstruct.com.au
Cc: Konstantin Aladyshev <aladyshev22@gmail.com>
Subject: [PATCH linux dev-6.18 v2] eeprom: ee1004: Fix build error
Date: Wed, 29 Apr 2026 10:13:32 +0300
Message-ID: <20260429071333.29142-1-aladyshev22@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260429070650.28931-1-aladyshev22@gmail.com>
References: <20260429070650.28931-1-aladyshev22@gmail.com>
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

Currently driver compilation fails because of the undeclared
'ee1004_groups' variable.
This variable was deleted in the commit
79d0df36b541 ("eeprom: ee1004: Add nvmem support")
but by mistake was used in the commit
1b9ab93850ac ("eeprom: ee1004: Add OF matching support").
Remove 'ee1004_groups' usage from the driver to fix the compilation.

Fixes: 1b9ab93850ac ("eeprom: ee1004: Add OF matching support")

Signed-off-by: Konstantin Aladyshev <aladyshev22@gmail.com>
---
 drivers/misc/eeprom/ee1004.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/misc/eeprom/ee1004.c b/drivers/misc/eeprom/ee1004.c
index 639615749e2f..e1a571b77de9 100644
--- a/drivers/misc/eeprom/ee1004.c
+++ b/drivers/misc/eeprom/ee1004.c
@@ -347,7 +347,6 @@ static int ee1004_probe(struct i2c_client *client)
 static struct i2c_driver ee1004_driver = {
 	.driver = {
 		.name = "ee1004",
-		.dev_groups = ee1004_groups,
 		.of_match_table = ee1004_of_match,
 	},
 	.probe = ee1004_probe,
-- 
2.43.0


