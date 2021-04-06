Return-Path: <SRS0=WtrD=JD=lists.ozlabs.org=openbmc-bounces+openbmc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 455CEC433ED
	for <openbmc@archiver.kernel.org>; Tue,  6 Apr 2021 12:14:39 +0000 (UTC)
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B143A6139E
	for <openbmc@archiver.kernel.org>; Tue,  6 Apr 2021 12:14:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B143A6139E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmx.net
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FF60F2Qdsz3bxk
	for <openbmc@archiver.kernel.org>; Tue,  6 Apr 2021 22:14:37 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; secure) header.d=gmx.net header.i=@gmx.net header.a=rsa-sha256 header.s=badeba3b8450 header.b=EU+mmHoE;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=gmx.net
 (client-ip=212.227.15.18; helo=mout.gmx.net;
 envelope-from=j.neuschaefer@gmx.net; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=gmx.net header.i=@gmx.net header.a=rsa-sha256
 header.s=badeba3b8450 header.b=EU+mmHoE; 
 dkim-atps=neutral
Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FF5xb298Nz3bsQ
 for <openbmc@lists.ozlabs.org>; Tue,  6 Apr 2021 22:12:19 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1617711105;
 bh=sbEdNJUiAhwtj5rGjgPfJDS3A/vpWsY/KcoBwkRzp80=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
 b=EU+mmHoEDmQVyPu64op+qtGXH6gp4t1h5GsZPYswQNAJ97zPz+pRr7UsjeMiNnuMd
 B/iPnRc/OJsKwUR1P/IA6W9eIKApj7DENS2iVYMHjMlezCbifnJpdL2zNFNamqIVUI
 sdm0a8cnSLfiC6TPBbrDoXxYat4igThPdbr47o0Q=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from longitude ([37.201.215.134]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MNKm0-1lEpHH0d34-00OqtQ; Tue, 06
 Apr 2021 14:11:45 +0200
From: =?UTF-8?q?Jonathan=20Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>
To: openbmc@lists.ozlabs.org
Subject: [PATCH v2 07/10] watchdog: npcm: Add support for WPCM450
Date: Tue,  6 Apr 2021 14:09:18 +0200
Message-Id: <20210406120921.2484986-8-j.neuschaefer@gmx.net>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210406120921.2484986-1-j.neuschaefer@gmx.net>
References: <20210406120921.2484986-1-j.neuschaefer@gmx.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:qZY8oJY7NkhnKY4leyppi18GLlbrzfWSOi/r8Wy4SNSnJlMIpV9
 Xg4Cp5YsA+0icEMrEY0AA4llHUKwEHoreTA1FzYBBf1D9NgwlksCMtVmI4XvCprgghVbVN5
 /46YMC+7AxYLxuxpLMBf+g6R6NtLLYcrtmI3S0vWiSYh1/1v4RM7vWTyKzu0GGVEK45XpFd
 895QgW8nCAHDSx8g8BiYg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:ELqMY9kWInQ=:2dNlMXKeM1D9B0uIjQaFpY
 +lijOwwkHDOXw88BUT0W4bhaUx1uP+iOvq5sfECwtvgGLp9hMQwiCJkgKYkE3RAvZUAMDw56Q
 3Ca6EXYpyMggshoU1M6KarhyrJJVrk2d89TVSQUpV9v8RrfAPwZPt5nlZRcJwAvPx06bEPxr2
 Wpn69jRiRKQRmp483t+3KkGDmUDbK55aoYsLVMVsDrOELMRpvpSXFF6k6aTYwenjqC4pS0LAr
 V/p0i5c17xYjKHyXvrl/6Kra7gjpLW0P4Qzp8rlT/pH26Su6z2y0T5i7Kp/E3gggu85eKjD0g
 Tp/V7XeH3hCMjNDI6Ei1gvQ/xozrPHnJcVWtudQAivlT7eJb6wTpTK0AmOx0qYNEFr7S72Npu
 YPIVzNWrk8Cqdx5qdLrdTBj/NHmupqhVe24cpBUVJsrZHQv1LWZGTtwuIPti/4iy6sIyxlBAq
 lmVXYOzdWr3x182PgcTa7crlaDawwL0eBt+3BV4zuqLiFq82NzsoiPk9WaeYWvZYu0j9xAJil
 cx4Eb/gUakhXgDsJlyO+dZabXNHPM3A60UF2w32aWSjvqdgwYnhnwy+9lS6AXR0KEK2snAK+G
 aSPohZYsnPBT/eOnBFUs+0GP1UeY7Mf5qpa0VutQ8FYH4wZCF+l7c36pJGbjPkXOqNhvXRv4r
 IB9W6YCovdKeB2w+577klVAM6C76vtjUQAjU/D27oL3qWJnEitLjNiob1gEtvGGRSg/axi2ql
 iT2NwhjDynijHZIJFfkG1t40RJgBFfw9onxI9lbJ/j2gA0WtSaVOP4EFVEwDZtTmYYvYUbM0U
 ANOWx8rjxQP56b72AmUBP+4N2E1QrL+9swpQSrlpcvnMsASPeTd6pfNEA08DRR0M/GmfEIw30
 YEnfwsTDm8L4Wmjiud2l/xt9yLV6TTdvU87EExSecBUJCDEtlKT9TTOM9RW1GiLHP3WdfA4dl
 7f75nUMVy7V9qMOZ/NfBSi2bRx9pjK2TiTG6npbKzuSwZ58oRJA8Vqwa9SvqmUoZY63Hw0J3v
 3A5FRO1gERSUUgKItfvwL6Duf5150MnA31zlLSzfijkNJB7hfWuwWjCvt6sRCWJOxMi/YKld1
 zQUPCd7mNdd7y2DagBiRve27VR0qG8E19gMzJGPxdHDOIxLyMFReuaT5z+6ZaQNG2qMLV8s2s
 T5fiHfjCWL+i90vwBBtA67GkHsiPu57+FVZj0TQcjwqXvDWOGKYAvU4gaPe5vAs4nomq97hLz
 bi26b5P+zzY9eNJPc
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
Cc: devicetree@vger.kernel.org, linux-watchdog@vger.kernel.org,
 Wim Van Sebroeck <wim@linux-watchdog.org>, Tomer Maimon <tmaimon77@gmail.com>,
 Avi Fishman <avifishman70@gmail.com>, Patrick Venture <venture@google.com>,
 Guenter Roeck <linux@roeck-us.net>,
 =?UTF-8?q?Jonathan=20Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>,
 linux-kernel@vger.kernel.org, Tali Perry <tali.perry1@gmail.com>,
 linux-arm-kernel@lists.infradead.org, Benjamin Fair <benjaminfair@google.com>
Errors-To: openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org
Sender: "openbmc"
 <openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org>

Add a compatible string for WPCM450, which has essentially the same
watchdog mechanism as NPCM750.

Signed-off-by: Jonathan Neusch=C3=A4fer <j.neuschaefer@gmx.net>
=2D--

v2:
- Added patch description
=2D--
 drivers/watchdog/npcm_wdt.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/watchdog/npcm_wdt.c b/drivers/watchdog/npcm_wdt.c
index 765577f11c8db..28a24caa2627c 100644
=2D-- a/drivers/watchdog/npcm_wdt.c
+++ b/drivers/watchdog/npcm_wdt.c
@@ -229,6 +229,7 @@ static int npcm_wdt_probe(struct platform_device *pdev=
)

 #ifdef CONFIG_OF
 static const struct of_device_id npcm_wdt_match[] =3D {
+	{.compatible =3D "nuvoton,wpcm450-wdt"},
 	{.compatible =3D "nuvoton,npcm750-wdt"},
 	{},
 };
=2D-
2.30.2

