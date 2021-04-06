Return-Path: <SRS0=WtrD=JD=lists.ozlabs.org=openbmc-bounces+openbmc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.8 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLACK,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5F56CC433B4
	for <openbmc@archiver.kernel.org>; Tue,  6 Apr 2021 12:14:17 +0000 (UTC)
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0563D613C2
	for <openbmc@archiver.kernel.org>; Tue,  6 Apr 2021 12:14:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0563D613C2
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmx.net
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FF5zq5CHYz3bxM
	for <openbmc@archiver.kernel.org>; Tue,  6 Apr 2021 22:14:15 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; secure) header.d=gmx.net header.i=@gmx.net header.a=rsa-sha256 header.s=badeba3b8450 header.b=bKBYLMBD;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=gmx.net
 (client-ip=212.227.17.21; helo=mout.gmx.net;
 envelope-from=j.neuschaefer@gmx.net; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=gmx.net header.i=@gmx.net header.a=rsa-sha256
 header.s=badeba3b8450 header.b=bKBYLMBD; 
 dkim-atps=neutral
Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FF5xV0LbFz3bpw
 for <openbmc@lists.ozlabs.org>; Tue,  6 Apr 2021 22:12:13 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1617711120;
 bh=PGxh9D7zcvvJfUqYSQVc04GxFHyRLS1XqsJU+VlT6BU=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
 b=bKBYLMBDeSCxAcVIW5xE2Jue2hoG9IDD1piz3qC8oXu+gpG/LlmYEG/USqJH1+Ruy
 0cnoa4SC222UNAOlXewZANqwkKg4omW4QxtNXrxVhY/oYTMmQknC+nBT/u/K8ON8GT
 SkOhuQrDradd8FA28Tj0hA/ZyljMP1ZIJQYQV3RE=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from longitude ([37.201.215.134]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MNbox-1lF6OK3aG3-00P4HB; Tue, 06
 Apr 2021 14:11:59 +0200
From: =?UTF-8?q?Jonathan=20Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>
To: openbmc@lists.ozlabs.org
Subject: [PATCH v2 10/10] MAINTAINERS: Add entry for Nuvoton WPCM450
Date: Tue,  6 Apr 2021 14:09:21 +0200
Message-Id: <20210406120921.2484986-11-j.neuschaefer@gmx.net>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210406120921.2484986-1-j.neuschaefer@gmx.net>
References: <20210406120921.2484986-1-j.neuschaefer@gmx.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:Z2EhOb9FQX5ezyiU0ShDDMZpCUtQItPMmkySsL3c4jvAh0iqe1i
 VRxIGpT+4knpL0z6HdEIqplXq5YVeI37Bdd5v32NJj/g4rsyIcQpumSoatW3iycfCmfoMt2
 S33LW+m8ELPFpycVzmS5gRrnl2cRVAhfWBUUsnOHuNv0nJy/YpAcM/rHkdTzlv5xZJqYmr+
 d+FXrAzfNRnRVt7RX7vdw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:v2DQm/L9XBw=:MYUuXxFKuLsUJKbs5nuwnO
 ozET949FjArxYHoyZOx3v0V48yhi1G3AnnpVcycuIfaItz1ZuqLhSZu2i2IwOAgWgpPLpqCnP
 OJf+22P1GfiiBCz6/ANtmG3gfd7xpvUIkYC+AushY8UCMIrtCGd1JK/b/eKpl4xPvWRDTniTd
 pqDbMb7G/Ksf5sN6id7BTuhwO3v9VSVWxosHr6tAOQCEQ9ITn98UUD1y0INIjjZf7qV2rERum
 7/8G2Q/Cyccpk/2mis5LOIwG/K6eK3oKONZNA/obyV/oi9dGh0JBQqr26C32TupIoaMTdYFQC
 nTy47+jzifSKGI62t9r2bbIftyjJgCcweF5FFlkiYsMLQLy2WfmEu31xlert+Tof6Jx1oyC/w
 vVyBjCR3mNe2JAeUNny0/a1tLODxkJonw9piVjdgfBIocxMVX+fzBNWjGJQbjfsFahsgKV6pC
 0yPjLbuhFnlJBfnetKWoCowZnrHBO9fsFECfFWNQod9OZqwe2qzIAagsAGL9R6VEBl26UBjfT
 fblRlvqwEhPNRmjrRLSAJ575NyZvg0wreccCfP9BVlxZ4yKxFFcEYujqLkl7Yy2zK/2kZeWVL
 PokvXkgkoMf8S7u9003114caGRPY0fO+x2qObzYQYvTVRA+MEsUX14zpmmFBCVXFbydHA3CdK
 xbg6C7h386DrBwTpvse4N4Z4CSd0VTrFEI/ukevAjt2XczE7504uR83M4ym0zJ6cU/FOaVi1z
 L1Tk6RcDfcazkfEaT/OaVME68HP42S5ZoOBzom6YlyOpj6HXf1FFEaoKHRYLOE++SixFZh956
 fWnMk6KGfGTMiDHgOEXjOOBVXTkBj70KHXkYMlvQwG17dE4ePOY+jcx7ZWYVEsZDNbnzAEw7z
 VALr1xI+2UuHyZzzgmt0OCCa6YNEWKjr2jwmEi3q1QZP/FIrG8UfATEhoT9+3h3uwITm1zqH+
 reC1UH8SJyufzAQ7VewHPLTKqSH/DKCqaq9fJcxBpUi08+jJLRo4JqUJruU2GZ77Zm60TtSSI
 FHlFsKeS9hzelOOqk5Sk6AZfL0sdXRzGeJiuhAw9Tg7kwdu3fO/cPFM6nZwgG2h6VSrN85GfH
 5JWNUwoGl9hAHZE+brc2tYAWWkoon3XpieOb5ZiD3QDBrBxCeXf21tKzSucn48B/2VkLxPgWk
 WEh2yYB1GmgWvbJXTFWWebrLXIrpRzXlO55a4/RqA7S9rF7F5NGQiN31ZYkLfWLZq5G1gr/TS
 f1AzD5stV750d0N7e
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
Cc: devicetree@vger.kernel.org, Tomer Maimon <tmaimon77@gmail.com>,
 =?UTF-8?q?Jonathan=20Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Errors-To: openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org
Sender: "openbmc"
 <openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org>

I am adding myself as the maintainer of WPCM450-related code.

Signed-off-by: Jonathan Neusch=C3=A4fer <j.neuschaefer@gmx.net>
=2D--

v2:
- Instead of expanding the NPCM entry, I'm adding a new one only for
  WPCM450.
=2D--
 MAINTAINERS | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index d92f85ca831d3..661770e8e6fc1 100644
=2D-- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2194,6 +2194,15 @@ F:	drivers/*/*npcm*
 F:	drivers/*/*/*npcm*
 F:	include/dt-bindings/clock/nuvoton,npcm7xx-clock.h

+ARM/NUVOTON WPCM450 ARCHITECTURE
+M:	Jonathan Neusch=C3=A4fer <j.neuschaefer@gmx.net>
+L:	openbmc@lists.ozlabs.org (moderated for non-subscribers)
+S:	Maintained
+F:	Documentation/devicetree/bindings/*/*wpcm*
+F:	arch/arm/boot/dts/nuvoton-wpcm450*
+F:	arch/arm/mach-npcm/wpcm450.c
+F:	drivers/*/*wpcm*
+
 ARM/OPENMOKO NEO FREERUNNER (GTA02) MACHINE SUPPORT
 L:	openmoko-kernel@lists.openmoko.org (subscribers-only)
 S:	Orphan
=2D-
2.30.2

