Return-Path: <openbmc+bounces-2577-openbmc=archiver.kernel.org@lists.ozlabs.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C9D4C79F82
	for <openbmc@archiver.kernel.org>; Tue,  8 Sep 2026 23:43:30 +0000 (UTC)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4hfgVf55PDz2yFW;
	Wed, 09 Sep 2026 09:43:22 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2607:f8b0:4864:20::1035" arc.chain=google.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1788882596;
	cv=pass; b=Z5rvb8i3MxZXRJdqtisIKDxqWMe4jIanLTLD2pItnGToLOQf4zph/V0i3W+uXnNmIPtXzfry/ENhqd5m3bfwivAgVIsHyq/Y7bbAkv3JK14qBkTDSq9IpMlCpyd64xz8LFic6E46ZycR0tDCnjDiMzXzzOGmynEe7u/6rf6NrXKbwanVFDd3Km3kHcdw3FG+3ZxVIVnp2Kl6jvyHwk7ZC2rp6EASNcz7oeW9mNebSPvukbZMfl1ciY4fGF4fdhHZRBcy+vZxjgAkqfIe9lafcJ9il7A2q9/ou/CfCyAPBXJidzG4DQ3JswQkpUdnGWAxr91gePG/mnOvCQn5/vAspw==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1788882596; c=relaxed/relaxed;
	bh=/r7n3mEMkSlk92J1gdVduYiOAVY2mbIRTPwpjmGGrw8=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Content-Type; b=ZFytQ4SAFpywL2IvK9omt5CCUrl42bebyftAUGdhg9t7tbo0syyVEKGHo52wTXuuYblNo2SnQz9OGWXOVuYreZ/S/+H1Y6RMJtw5tYxZxYtBMEieTnpKLxgoGK6jUOZFMYBkkKxALJCXSqJPr/YKZgtCSAt58Pb5H+uKWnTWkfpYrUWaygQZIBKcpIB5v4TlUghikDd7MIawLqvQFxNn2NJ1E3eOh8O4Bc3FyBWwBxiGhBszkN8KIZDlb6yMJNqgrl+H8KpYIilRklazqN0CGV8BlJNI6J98oDz1WA0klcOy59h6wgTD6jX01pcy4qvMly5i8/zTVc3Fmbi2WHohaA==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=design.tech; dkim=pass (1024-bit key; unprotected) header.d=design.tech header.i=@design.tech header.a=rsa-sha256 header.s=google header.b=aaO2GiVq; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::1035; helo=mail-pj1-x1035.google.com; envelope-from=pavel-fedin@openinsight.tech; receiver=lists.ozlabs.org) smtp.mailfrom=openinsight.tech
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=design.tech
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=design.tech header.i=@design.tech header.a=rsa-sha256 header.s=google header.b=aaO2GiVq;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=openinsight.tech (client-ip=2607:f8b0:4864:20::1035; helo=mail-pj1-x1035.google.com; envelope-from=pavel-fedin@openinsight.tech; receiver=lists.ozlabs.org)
Received: from mail-pj1-x1035.google.com (mail-pj1-x1035.google.com [IPv6:2607:f8b0:4864:20::1035])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4hfT0M3dx6z2y1F
	for <openbmc@lists.ozlabs.org>; Wed, 09 Sep 2026 01:49:54 +1000 (AEST)
Received: by mail-pj1-x1035.google.com with SMTP id 98e67ed59e1d1-38e041ea211so3868178a91.0
        for <openbmc@lists.ozlabs.org>; Tue, 08 Sep 2026 08:49:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788882590; cv=none;
        d=google.com; s=arc-20260327;
        b=OBMt0xCKzjOiWPVk2WiAAwQOFypSkgu3oeNY+/I25PFJxzpVayN37aacGzf6XBRygS
         pOpbiIqRi6If7BL0oBsl61PCW0H6/T9sv+ZpjcjjSlE0YYfg70gu0fpWprPgBMO0Rr5n
         9Sc2zHp/1BTzX8es6k2Ixsx37pH7/MpSjhm+EbaLsJhnqKAaKiX1lpiv+1Rw1xFLx48H
         fYha6yKfCEYMidNlsUqxmgyzo+Ntc7gp0sIq5ystSJBZxJ9gPtJxYescQA7QMNb9eeAw
         huXcd+VPwG2PdlpC+/9gX306qPrbhvkexli4E73KjkHOU0pcPWbqxQQDABvFh4JJ/BkN
         86Ig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=/r7n3mEMkSlk92J1gdVduYiOAVY2mbIRTPwpjmGGrw8=;
        fh=rLb3uvO1QFpP6DLO/WN78kv3JKmiS9J3UGhSz5V3Sdo=;
        b=e8spJPByU9oW6fJaXitb5iF5QsgtultnMgWAEBq9px/uSQPp8f9PUeg+LWtGFvTfja
         tjwJT52SxnG2XPhPYIHOBq+I4mQWNoQnhE9ccHS8eEovQIZebELNiPsf1NpCtQdfFKiY
         by0oJt/oZMyeXRIRdJkUufBMgarmR6rTZuLbBA8be4FEl/gRifJ8RcaCA6BO06dCdfcA
         h2SQSVO8IxqZ0aRHqUr9M4K1voTmXgH7BO1h7s48sXNekr74FJCs2A3YReQcQl0whS/S
         HEVsjLrbTLPNs1a/iwVQLXDwmE6GsOIP/k2+7a7DqA2gwWUXLa4uey6WAmudGa/oxYZ6
         2miA==;
        darn=lists.ozlabs.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=design.tech; s=google; t=1788882590; x=1789487390; darn=lists.ozlabs.org;
        h=content-type:to:subject:message-id:date:from:mime-version:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=/r7n3mEMkSlk92J1gdVduYiOAVY2mbIRTPwpjmGGrw8=;
        b=aaO2GiVqq3+lWezJhS+ncr9VTVSqIeQrSdnA3wdOdmUZSy4bU+JoFVxLoZRME3Fq+e
         GH0lhORWsC0Nu36HJmIIxPueCJDETtPZoz/Ayh9VFvRWcg19nIRSapJCOd54M4deAXy+
         Hzg7tvtByxbDz7NYtu31cU5iqZx0ELtRFvmCs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788882590; x=1789487390;
        h=content-type:to:subject:message-id:date:from:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/r7n3mEMkSlk92J1gdVduYiOAVY2mbIRTPwpjmGGrw8=;
        b=RcrO8aRr+j0gxvzjqSEc+y6KuFmNJVSceL7OGGfr62Ogfd70Ab3hm4y6GXpVKDtszB
         0vukRb/0+DBruMLK8HX+bedy/GtES1wAqDMnfzS3UNVvTiaxFnslT3BJ35dLPPYQI2mU
         xY41VunG7/zUpRNH2LzEKC+8773wBGDJqmzWx8uZpB9p+YFsBV0Oh85siETxLi5mqYKP
         nnGz7WEc7ZIpo6AEVtAFejd5uVWIjHTh0S+hkv7Jsi58ju2FrqunfsQui2GwBVJVLgIG
         J9OdmIoWtd7gTutEiAABh3H2I7xiqAJ6cCS+wFNaCLeerHKg9htM8G5Nsg7+S/RvrRMO
         8aew==
X-Gm-Message-State: AFuF++meOz6EzhoAS4xLEkzPhLyUlXO9JJhynD1j8dBa1e6pfTZoLSIA
	eJhrKcjgWKPSjrKDKOvKWpeqapKuF0y9Lp6guWZfNdPkb6n8ZzuynuTnsFyR4hBbSJ6B25P8BR8
	ujPut31te3Ohy1CugkRRB48Q6jGOpTWtQ2Fhn5+Mx/bmMPftVhq0kr2CPoQ==
X-Gm-Gg: AYBFou3kKGk5UMcXejvGPa9bBeJRMsTxIDzFZZWnvfNauP6m5BECS0inDvDocZUJpe0
	mVfLqg2Sl5FYNxi1d4cq7jZGZU8mDNTjVVl4wWeseKRM4sja38vkG7BwzjJKcfKltYm2OYXh/jg
	pAri97SqfQpD6VonBPyQ5cLunBtqTmmsRQWWMIY4ClPm3IY6vt+SzPvI1xT1ktef/A+krLOlzBQ
	UxAiVV1NimLBIOKVNdvzOjTnBX1zbhsz9Hjc2PtgrX2N7rSej/glGFcBnCR47wVgQfAWbnZ2CC7
	7FkPaagUFvQjdC5tSrseFuVQSH9PLUHgNrc/Bu+YYh1RC6j1sLIwU8OwvAYLyycA9NVlpvbkBeE
	U
X-Received: by 2002:a17:90b:2e4b:b0:398:a145:5d3d with SMTP id
 98e67ed59e1d1-39b26151b89mr45796982a91.6.1788882590472; Tue, 08 Sep 2026
 08:49:50 -0700 (PDT)
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
From: Paul Fedsen <paul-fedsen@design.tech>
Date: Tue, 8 Sep 2026 18:49:39 +0300
X-Gm-Features: AcwNN1WITjy8tPV-qiUiieKOTJ_NyvZJu32613Iw6UN85OyDvI4oNU0zgS1GGUk
Message-ID: <CAPzB2v5-R-+xQQYwJwjj-g8heEmxU_RLzjKsc6eGqFVNf+cB-w@mail.gmail.com>
Subject: phosphor-bmc-code-mgmt development
To: openbmc@lists.ozlabs.org, Kyle Hsieh <Kyle.Hsieh@quantatw.com>
Content-Type: multipart/alternative; boundary="00000000000059ad58065afaaf71"

--00000000000059ad58065afaaf71
Content-Type: text/plain; charset="UTF-8"

Hello!
We are trying to upstream a patchset
https://gerrit.openbmc.org/c/openbmc/phosphor-bmc-code-mgmt/+/93843 , and
you recently merged commit 484f77929f9de9bb0eec98288cac784929900168 "
https://gerrit.openbmc.org/c/openbmc/phosphor-bmc-code-mgmt/+/93843". It
looks like we're trying to do the same thing, but chose architecturally
different implementations. I'd like to discuss this so that we remake our
patchset consistently.
So, our vision was that SPI EEPROMs are conceptually the same as I2C
EEPROMs; they even have matching addressing schemes: bus # and address
(which translates to CS index for SPI). EEPROMDevice services already had
all the core logic, so we separated generic SPIDevice code from SPIBios
service, put it in common/ and reused it.
In the meantime seems that you decided the opposite: SPIBios service gets
renamed to SPIFlash and handles all sorts of SPI EEPROMs, while
EEPROMDevice effectively becomes EEPROMI2CDevice and specializes in
handling I2C EEPROMs.
How (and whether) are you planning to address the fact that I2C and SPI are
still very much the same things, even on the kernel API level ? Does it
even make sense to keep two separate services ?
We'd like to discuss these things with you in order to get moving in a
proper direction. Do you maybe have more pending patches for us to consider
?

--00000000000059ad58065afaaf71
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hello!</div><div>We are trying to upstream a patchset=
=C2=A0<a href=3D"https://gerrit.openbmc.org/c/openbmc/phosphor-bmc-code-mgm=
t/+/93843">https://gerrit.openbmc.org/c/openbmc/phosphor-bmc-code-mgmt/+/93=
843</a> , and you recently merged commit=C2=A0<span style=3D"font-family:mo=
nospace"><span style=3D"color:rgb(178,104,24);background-color:rgb(255,255,=
255)">484f77929f9de9bb0eec98288cac784929900168 &quot;</span></span><a href=
=3D"https://gerrit.openbmc.org/c/openbmc/phosphor-bmc-code-mgmt/+/93843">ht=
tps://gerrit.openbmc.org/c/openbmc/phosphor-bmc-code-mgmt/+/93843</a>&quot;=
. It looks like we&#39;re trying to do the same thing, but chose architectu=
rally different implementations. I&#39;d like=C2=A0to discuss this so that =
we remake our patchset consistently.</div><div>So, our vision was that SPI =
EEPROMs are conceptually=C2=A0the same as I2C EEPROMs; they even have match=
ing addressing schemes: bus # and address (which translates to CS index for=
 SPI). EEPROMDevice services already had all the core logic, so we separate=
d generic SPIDevice code from SPIBios service, put it in common/ and reused=
=C2=A0it.</div><div>In the meantime seems that you decided the opposite: SP=
IBios service gets renamed to SPIFlash and handles all sorts of SPI EEPROMs=
, while EEPROMDevice effectively becomes EEPROMI2CDevice and specializes in=
 handling I2C EEPROMs.</div><div>How (and whether) are you planning to addr=
ess the fact that I2C and SPI are still very much the same things, even on =
the kernel API level ? Does it even make sense to keep two separate service=
s ?</div><div>We&#39;d like to discuss these things with you in order to ge=
t moving in a proper direction. Do you maybe have more pending patches for =
us to consider ?</div></div>

--00000000000059ad58065afaaf71--

