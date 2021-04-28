Return-Path: <SRS0=YSNb=JZ=lists.ozlabs.org=openbmc-bounces+openbmc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,HTML_MESSAGE,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C609DC433B4
	for <openbmc@archiver.kernel.org>; Wed, 28 Apr 2021 07:49:10 +0000 (UTC)
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CD05161405
	for <openbmc@archiver.kernel.org>; Wed, 28 Apr 2021 07:49:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CD05161405
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FVW3m1CTJz2yq9
	for <openbmc@archiver.kernel.org>; Wed, 28 Apr 2021 17:49:08 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=MsdEHBLh;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::434;
 helo=mail-pf1-x434.google.com; envelope-from=parishrutb@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=MsdEHBLh; dkim-atps=neutral
Received: from mail-pf1-x434.google.com (mail-pf1-x434.google.com
 [IPv6:2607:f8b0:4864:20::434])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FVW3L5fdXz2xYp
 for <openbmc@lists.ozlabs.org>; Wed, 28 Apr 2021 17:48:44 +1000 (AEST)
Received: by mail-pf1-x434.google.com with SMTP id e15so6377734pfv.10
 for <openbmc@lists.ozlabs.org>; Wed, 28 Apr 2021 00:48:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=R++/7VHGLhREaVmpcSH7ofgFx2AbtxhUb9lDpT470Mg=;
 b=MsdEHBLhYZjwiO8p7eYMTdqwIZi01WjuSezMzSoO722b5AxTvNjlrJi3RxkYNzUg2j
 QJ3OEOuZlO7vMUsKx26OpdcVgtp0X73sfKmZAnhwznLROawVsa3UFuwVyNHRjOBHTriF
 3fKBfLgwOMCeVm9OXGsMmwjSezKLAUC0xkPQkh93RMw10xuTMgaPWdzytHTAaVISxck2
 4DyobAb90rIhhMn7f7lgvxMuRlsAiEURkyhTSjcEcDV1rrNfBfmeg2vUVKKBa4Q62qCq
 GIHO8R/8LD7H9SEcLH6+l4Ou73npYM9754VKTHfUKZNvauNRmR4tm+MrWCu+sigC5CDq
 a6pA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=R++/7VHGLhREaVmpcSH7ofgFx2AbtxhUb9lDpT470Mg=;
 b=B6KRxz4jwdBjdHkNBSFZpCnx1o1O0xWcvrNxG0tR1P1uNViyskEXEQMCVzymEGkxT1
 R/vFLs9nQ720S4ApHm8iprsU80JzG8exhs3sBfWQe3XTh+mXKzY8NHMP35v9LD4xmOJK
 xQnnBgWgnZyhMEJlEw1gi02lY2sAORdwGZNTpYhVDppsyA53/9ZFzB9qLSgGZtPFdeL7
 ZDYee6l8Qr2i6g9o5Mqj6bctodpwyNT1ipUz8MMXp0dT+Pu2uDSbe1OtJ0E90v46kYS9
 bMwdX/nppaL7bvkZpa8mv7s6r3KPmV27H/k6iRV7OpBl52RAv+0VM5g+tEGCvzyCmC1V
 Mg0w==
X-Gm-Message-State: AOAM533tXLfhU5PBQPiF79XdRyEAeauEG+KIVp99mNVhNML9z9t6agiX
 lZqOT9AveriHunTXnwyEHkLZldwg8vHPIpI7oIR/wROxC5Y=
X-Google-Smtp-Source: ABdhPJy1BMxIytMa0RgtRz9RulSu6N7UJgxTY1NSCrZ4xP6yI7OEXOGKeYMm8NoMCMlEx1mlPuGYHCFezP6f8CfIn3k=
X-Received: by 2002:a63:575b:: with SMTP id h27mr26382401pgm.180.1619596120510; 
 Wed, 28 Apr 2021 00:48:40 -0700 (PDT)
MIME-Version: 1.0
From: Parishrut Bhatia <parishrutb@gmail.com>
Date: Wed, 28 Apr 2021 13:18:29 +0530
Message-ID: <CA+FKyEWij7a8=zLY_3c5FPPDmsucaePSebzSFZ1oo3ZHF8MKcw@mail.gmail.com>
Subject: Requesting feedback on in-progress GUI designs (Event logs,
 Hidden logs)
To: openbmc@lists.ozlabs.org
Content-Type: multipart/alternative; boundary="00000000000071543a05c1039b94"
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
Errors-To: openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org
Sender: "openbmc"
 <openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org>

--00000000000071543a05c1039b94
Content-Type: text/plain; charset="UTF-8"

Hello,

Requesting feedback on the current iteration of new Firmware Update screens
in the WebUI:
https://github.com/openbmc/webui-vue/issues/58

Thanks in advance
*Parishrut Bhatia*
User Experience Designer | IBM iX, Bangalore

--00000000000071543a05c1039b94
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hello,</div><div><br></div><div>Requesting feedback o=
n the current iteration of new Firmware Update screens in the WebUI:</div><=
div><a href=3D"https://github.com/openbmc/webui-vue/issues/58">https://gith=
ub.com/openbmc/webui-vue/issues/58</a></div><div><br></div><div dir=3D"ltr"=
>Thanks in advance<br></div><font color=3D"#888888"></font><div><div dir=3D=
"ltr" class=3D"gmail_signature" data-smartmail=3D"gmail_signature"><div dir=
=3D"ltr"><div><div dir=3D"ltr"><div><div dir=3D"ltr"><div><div dir=3D"ltr">=
<div dir=3D"ltr"><div dir=3D"ltr"><span style=3D"background-color:rgb(255,2=
55,255)"><font style=3D"font-size:12.72px" face=3D"tahoma, sans-serif"><b>P=
arishrut Bhatia</b></font></span><div style=3D"font-size:12.72px"><span sty=
le=3D"color:rgb(102,102,102)"><span style=3D"background-color:rgb(255,255,2=
55)"><span style=3D"font-family:tahoma,sans-serif;font-size:small">User Exp=
erience Designer | IBM iX, Bangalore</span></span></span></div><br><div sty=
le=3D"font-size:12.72px"><br><br></div></div></div></div></div></div></div>=
</div></div></div></div></div></div>

--00000000000071543a05c1039b94--
