Return-Path: <openbmc+bounces-2592-openbmc=archiver.kernel.org@lists.ozlabs.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 339EBC88E73
	for <openbmc@archiver.kernel.org>; Tue, 15 Sep 2026 09:09:24 +0000 (UTC)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4hkbms32p3z2yhD;
	Tue, 15 Sep 2026 19:09:17 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2607:f8b0:4864:39::10" arc.chain=google.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1789463357;
	cv=pass; b=QMdTUceTcM0oOMGjL5wJSITYniK3ZzWsHt+bcT15MbSsBMLj5LjEGduae9FAxEsPUiwh7FkrJPShB+gYgXS2EOtKThHEGVbD8E3BZJracH12HVc1fMn/hHgYaulVkg3iEIUWhirmYJLtzRFVlWL61sFRnDpIO81TivWWMvU8wV1CX72fz5VbtSWE+0QJgtBje5UJy/RnSrz9Kgbhqim6OOJtG8xsjUGhJx/eox60H4+nLhPAQQ2xMYRikxPUxE5vKnnleKXfV8xkj6rcy6RiYWipHTzOagQ7KAYOrPIyuwVC5o24/LoHVTiB+Um0kj+ioLPvmBk/3rQFXGqS7sjl4A==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1789463357; c=relaxed/relaxed;
	bh=rpZ8QiAa2KUUpQUQesRNlTgxrq69OR/2dudrLw3gNp8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Content-Type; b=mkiq0zFCdcxj+tuOdxPnZl96SjWiXUluu8AcBx9JpdZ2hAyuxkHfuSY+Qdy1Ya1GtqZQJEvcyzhOHUTmAPYjckLNMOFT4vV6DcQOKVrououSNl3+L7YkAMZhjiu+jPTa0xGB7GU+BiCecWf4D1x6WPF8xLLn85O6EOwHV+mjsCSaRLofyqujUOyYHQ9RvfW7g7qsDY5S0pEMWKR/gjxwCi/f+iD2wHveK9bzfrN/+9w36yJIxzEEiuVNMuN5TtPlmIMY/pA/YCEVSWGPASb81l3M0mSKxVK12xyaXCJpqDf8OEZ5mYVwGCnwLrWvN6xhq+yvr5Zmbj8UGEd0lNMHwA==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=design.tech; dkim=pass (1024-bit key; unprotected) header.d=design.tech header.i=@design.tech header.a=rsa-sha256 header.s=google header.b=4I5fG5kB; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:39::10; helo=mail-pj2-x10.google.com; envelope-from=pavel-fedin@openinsight.tech; receiver=lists.ozlabs.org) smtp.mailfrom=openinsight.tech
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=design.tech
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=design.tech header.i=@design.tech header.a=rsa-sha256 header.s=google header.b=4I5fG5kB;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=openinsight.tech (client-ip=2607:f8b0:4864:39::10; helo=mail-pj2-x10.google.com; envelope-from=pavel-fedin@openinsight.tech; receiver=lists.ozlabs.org)
Received: from mail-pj2-x10.google.com (mail-pj2-x10.google.com [IPv6:2607:f8b0:4864:39::10])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4hkbmr0hmfz2yFW
	for <openbmc@lists.ozlabs.org>; Tue, 15 Sep 2026 19:09:15 +1000 (AEST)
Received: by mail-pj2-x10.google.com with SMTP id 98e67ed59e1d1-396ccda24afso2403192a91.3
        for <openbmc@lists.ozlabs.org>; Tue, 15 Sep 2026 02:09:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789463353; cv=none;
        d=google.com; s=arc-20260327;
        b=SI26ZQ0o9/fgcFJx7Dpz9WYSSDs6zjHqySXV0PQEbWXT+oLwAfodT0hDabz6Vj8KZ8
         CUBjFxjwud4r4aOUQdqjsfRH93sg2VkbY3AarAko2GGIlm7ZhZf3DhkrZhovzPibHOpI
         9+TiQFBbGB+Q6GwLy51ZUncypNQDW6BQXgie46+EjSvzZFPOy2Qc9epEeoxX2FksZVtq
         bKdKaXU8D996MHKhnQ97naf893wBnXrGJbF+GTzB5bG3nuW6b9o21/rFpiA3cde7p7Db
         gvgc2c1I40oKiQ5eqOwofftjjYf1Gi0V2+kASPcRRHh0WR7LtTciWv6wgVrp8KC3Rtxk
         /iJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=to:subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=rpZ8QiAa2KUUpQUQesRNlTgxrq69OR/2dudrLw3gNp8=;
        fh=rLb3uvO1QFpP6DLO/WN78kv3JKmiS9J3UGhSz5V3Sdo=;
        b=KpFQWmnqXUGDWFNIKMUFXR6nZFc+vBK5XI9UD3aVtDM5MYecQbdAH1pqoJizaNCwek
         LhUYcZ4f+4clAKckHtSlNppzar7Q6wW3nsnnMh8UjHflQpfp8C2pAGGlznsVVArmcCVb
         OU6rflAnIh4HQ9wt2zy/z56/RdhW8Bg0c7igmOFWI6Xf8Hu1Q94+HgWlYiUsh50Z0dg4
         KWiHKGxRod3jJ/QT4aBsI6dSI2KN7Sq43B2obLAB+JFr53oJ8F3KUi9S5C4VHNh9qHfo
         N/6hxzMuUBJfQvwv00KMryqD+vttVS+/pxLMCpubgerBHeZTyIi5XTqQVK2DSJIWG9vi
         0qsQ==;
        darn=lists.ozlabs.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=design.tech; s=google; t=1789463353; x=1790068153; darn=lists.ozlabs.org;
        h=content-type:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rpZ8QiAa2KUUpQUQesRNlTgxrq69OR/2dudrLw3gNp8=;
        b=4I5fG5kB/lkvlkGi4J9dk54vT7Y/eKAXgWtnTa/LQ9nKYuAIoViaWPQbdITD08hiyT
         jicGUKljMaodD+DXrws0MpG23hS+zG8CsxyZlBdyWQg7JRhYrkYtUUy3D7EZXkYEa0jK
         1QTxhsNcb5zrbkjZ/fyeTiqhCt7XOHXGAH2Xk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789463353; x=1790068153;
        h=content-type:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rpZ8QiAa2KUUpQUQesRNlTgxrq69OR/2dudrLw3gNp8=;
        b=kJKxvcR7FtP2hZznEkabj/GjJtIQ+FUoLz72LyOf6J0/pPhTbecDSk3e5X7nLqzTt+
         IQ7ddb0KprHIB914ltdmK7/fWXXuoybOGnhbPkn3virquulghzewFz8FEeBlnjpknF9+
         8XsA2FdHI1u0dGaE3Ei0gyeD5/qAsDw1WV5CvXE4JPUo2biOzNtvJYFlL6iZg7hnxECB
         AevvPwIko92retOgby+g/ZJvptrCbEmDxOOX7Jp74FxSfqZU7UKTgQOGIha1wT4yVsKs
         QDrsebo1AGmqrX2oHVbCfXPJk+Str/zIxHA2CD+bccmMqrXKc/94fs24/QJa+uzdJ+it
         BB1w==
X-Gm-Message-State: AFuF++meXOF3x9dsENyrymej7WOoaUDO2fKYITOzYuO1zckkcfXDAW8L
	jmF3Ru9S/giR9vuC8syzShOnZjqsIsClh5KyCVFjbWJ/14HUI4xIfa895okeVA2EXQ2JgQoJ2FU
	HqqDmd12kJ828sggz0dJyNMFhWIPePwlvS2+xgLdqHXZBjFPJnVVY
X-Gm-Gg: AYBFou0kVzsoaAHmTClnHg8rSP5KIpPnpX+/ARTUwRcrkAHDB0xOHKqpjL3cav1wXgz
	OPR+ZIGEz9ckDq2JOOoHtTxQIv+uaAqRpRQ4hue+prO2D5RezdU8W5gEQGeSXzPLNnppu39aYlM
	Hm4PfXWdHIZ1VNXABReIr3EWHnoH2bECBQqsdk505YUrbXj//+jOEKaZzr7vwAGpjJDdtFSDdpm
	Agy+zgPv5pUi33SYzUosQFlM1fBKVQ61X8UjK5veVnfUuGKSx/1n/O+S/z12aCX9ELnnnvnC96H
	qFgyDPpbHCNxztNBcfiSYfwhk4Z33Qvs2vwpLFdIRUIFLyAEJgT0I0uC+doXEYSWzrkd/HKBZmQ
	F80z0Z/5WoKY=
X-Received: by 2002:a17:90b:4d0d:b0:39d:efa9:cd25 with SMTP id
 98e67ed59e1d1-39defa9dd52mr10834987a91.2.1789463353282; Tue, 15 Sep 2026
 02:09:13 -0700 (PDT)
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
References: <CAPzB2v5-R-+xQQYwJwjj-g8heEmxU_RLzjKsc6eGqFVNf+cB-w@mail.gmail.com>
In-Reply-To: <CAPzB2v5-R-+xQQYwJwjj-g8heEmxU_RLzjKsc6eGqFVNf+cB-w@mail.gmail.com>
From: Paul Fedsen <paul-fedsen@design.tech>
Date: Tue, 15 Sep 2026 12:09:02 +0300
X-Gm-Features: AcwNN1Um8TWc3pH5wZHCfX5DX3zKmCbXt0thb65RdXtC9rmnrFWIO45smo18Ynw
Message-ID: <CAPzB2v7FUUoAcksgwvRhQSOwZqUJYdpgP8rr--8HmJWroJvzjg@mail.gmail.com>
Subject: Fwd: phosphor-bmc-code-mgmt development
To: openbmc@lists.ozlabs.org, Kyle Hsieh <Kyle.Hsieh@quantatw.com>
Content-Type: multipart/alternative; boundary="00000000000082e0cf065b81e76c"

--00000000000082e0cf065b81e76c
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

--00000000000082e0cf065b81e76c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_quote gmail_quote_container"><div clas=
s=3D"gmail_attr">=C2=A0Hello!</div><div dir=3D"ltr" class=3D"gmail_attr"><b=
r></div><div dir=3D"ltr" class=3D"gmail_attr">=C2=A0We are trying to upstre=
am a patchset=C2=A0<a href=3D"https://gerrit.openbmc.org/c/openbmc/phosphor=
-bmc-code-mgmt/+/93843" target=3D"_blank">https://gerrit.openbmc.org/c/open=
bmc/phosphor-bmc-code-mgmt/+/93843</a> , and you recently merged commit=C2=
=A0<span style=3D"font-family:monospace"><span style=3D"color:rgb(178,104,2=
4);background-color:rgb(255,255,255)">484f77929f9de9bb0eec98288cac784929900=
168 &quot;</span></span><a href=3D"https://gerrit.openbmc.org/c/openbmc/pho=
sphor-bmc-code-mgmt/+/93843" target=3D"_blank">https://gerrit.openbmc.org/c=
/openbmc/phosphor-bmc-code-mgmt/+/93843</a>&quot;. It looks like we&#39;re =
trying to do the same thing, but chose architecturally different implementa=
tions. I&#39;d like=C2=A0to discuss this so that we remake our patchset con=
sistently.<div>So, our vision was that SPI EEPROMs are conceptually=C2=A0th=
e same as I2C EEPROMs; they even have matching addressing schemes: bus # an=
d address (which translates to CS index for SPI). EEPROMDevice services alr=
eady had all the core logic, so we separated generic SPIDevice code from SP=
IBios service, put it in common/ and reused=C2=A0it.</div><div>In the meant=
ime seems that you decided the opposite: SPIBios service gets renamed to SP=
IFlash and handles all sorts of SPI EEPROMs, while EEPROMDevice effectively=
 becomes EEPROMI2CDevice and specializes in handling I2C EEPROMs.</div><div=
>How (and whether) are you planning to address the fact that I2C and SPI ar=
e still very much the same things, even on the kernel API level ? Does it e=
ven make sense to keep two separate services ?</div><div>We&#39;d like to d=
iscuss these things with you in order to get moving in a proper direction. =
Do you maybe have more pending patches for us to consider ?</div></div>
</div></div>

--00000000000082e0cf065b81e76c--

