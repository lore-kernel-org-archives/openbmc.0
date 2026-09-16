Return-Path: <openbmc+bounces-2595-openbmc=archiver.kernel.org@lists.ozlabs.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB715C982C7
	for <openbmc@archiver.kernel.org>; Wed, 16 Sep 2026 07:59:33 +0000 (UTC)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4hlB9p3xDxz2ySf;
	Wed, 16 Sep 2026 17:59:26 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2607:f8b0:4864:3b::17" arc.chain=google.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1789545566;
	cv=pass; b=lZULC3HnzsKLs5tJp8LADMqPpsrl0z0TzHA84zljKi/p5VqymXPQvYHDLq++MIBdJn6aXYQGfgMqFLQNoAVeKjpcpSyymkKjt4V67KqgROuLVVoLQEXUPChCKEZKSafoG0mFSIdZLkLNL5FB8TOO016NXIcghiRuYzIWxiEuWnQjfUfwyNkxw9fB6yrqYNJYui4IStphqe80cy8uRgeNXNTo0c4sE8rklrzFe4I+L0pobmlb/DhTxwJLlTDcExXqHT16unU4MKnAW3tis5u5+dNE6D6Qc0kuM+ix6EYwhTdWHf5mW2kIF1akBxlUYICNXxBijjtFgF4hDKA48jCoFg==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1789545566; c=relaxed/relaxed;
	bh=eM2eJgV5Hwmog/3RU1NSWqoxtZC0kal/pIoUWPJsLpY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=knqmaneIoSOwzmI2TRakXS5xa+uT9jmmD8XGigz0/ZQ4uWTkiDlzCHpTCPYew76UKp98YF9GCz0EFvyjqe49nz1gBt6IMIv4a231SElnwLYE8q4Q5wY+NszAWZq5He5nEwHtXOrpBHCxqrIuCF9wM0XZ0rzAjK45hCklf4a6TePOcSesJL5AW3Is7KnmoIpU7CMG0I048mSxv1Yq+o/bSPEykqPp5UgPvC7Nk7eQkFpwAGYsPy8vZBYZLf7JNE0rXG1lvplmtiAMwY2iRpMIbkct9tcz3wja/uPOqL72gama6xYyeJN1jO5w1X2rwqFeH4cGIsgO+Y7+S3/NjAs3SA==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=design.tech; dkim=pass (1024-bit key; unprotected) header.d=design.tech header.i=@design.tech header.a=rsa-sha256 header.s=google header.b=ICb/gN2B; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:3b::17; helo=mail-pz2-x17.google.com; envelope-from=pavel-fedin@openinsight.tech; receiver=lists.ozlabs.org) smtp.mailfrom=openinsight.tech
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=design.tech
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=design.tech header.i=@design.tech header.a=rsa-sha256 header.s=google header.b=ICb/gN2B;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=openinsight.tech (client-ip=2607:f8b0:4864:3b::17; helo=mail-pz2-x17.google.com; envelope-from=pavel-fedin@openinsight.tech; receiver=lists.ozlabs.org)
Received: from mail-pz2-x17.google.com (mail-pz2-x17.google.com [IPv6:2607:f8b0:4864:3b::17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4hlB9n067dz2xlY
	for <openbmc@lists.ozlabs.org>; Wed, 16 Sep 2026 17:59:23 +1000 (AEST)
Received: by mail-pz2-x17.google.com with SMTP id 41be03b00d2f7-cc1cea48edcso477747a12.2
        for <openbmc@lists.ozlabs.org>; Wed, 16 Sep 2026 00:59:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789545561; cv=none;
        d=google.com; s=arc-20260327;
        b=eRZ0eJIc+VBGrsi4fUU7IqfbhJV/4o/VSKgQRi22rbVInS0wagSllOZtpIgMhg+JGi
         muFXfToQxSZTth0Z6TAEYOc/cn07fQpWVqvHfoUuk3LZZy/m+BNjbYvNqan08+BbLeqJ
         D1+ywo74t4OAsKWoZDDvibixHciBs1iwKAIkJ2KI9y5YQdaheviQlDqAUGiSzP0VpTI+
         NJTC/CIAGb7kiZfZrTtjM8j0oIknHqwGwW3POzB+J5kS6mQTawVCT8CKZRmiwDCpvHlp
         L8NX9rIP4im8LTXefd1NPr/5sg1KYOQLkToGcQsdGk5JO3v04AHTIeXaH/r2BZC5WaIM
         L9WQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=eM2eJgV5Hwmog/3RU1NSWqoxtZC0kal/pIoUWPJsLpY=;
        fh=wAgTw8WHGel48BiZW20q3nwP0VyYg5E+nS6lV4nOOq8=;
        b=J7t93PfOKJ7Mz2ettkP2e97F4cuKaXlMcgEP3nzmgU/G3gRBSewnGI6Jia4PFouahv
         HGAnqtkNWQBMFppvFrodfSayBEw1a6AeLuY5c7sSHosCoOk8SqiV2dyvvPgdL0BIchlf
         Wz8OoEy+sq5gqImVTLu0LUdM0/wcJvhXYkDaWl2XMr0vRRMgZGRjhUBdZJydYKeNqkhB
         DygGxa+Ov/EXK6+WAhgo5bU5PDjBP8Oab1Nn+7hSTpuzvo/KD+onTZiqMa9v+FPPG1D4
         s74Wscmy9xKwcqtEzOMg2EjZnddTkYb7jCkUHof3kSZn0egK02mDTYwCvVy7f5zBFGTH
         sI5Q==;
        darn=lists.ozlabs.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=design.tech; s=google; t=1789545561; x=1790150361; darn=lists.ozlabs.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=eM2eJgV5Hwmog/3RU1NSWqoxtZC0kal/pIoUWPJsLpY=;
        b=ICb/gN2BTWnj5y6YRnM44J9vEbCjzEF+H0/Rs88xCcuxpN8N/jm8oIGP/NMuVWl4Kw
         iwS+IkKVgvTptXdelSy9mRWcFB9vTa5/tZHqc4PUk7rVMDJ66B8vect2ZnSD/KkHEllf
         7GmsKd0AbPn51tPTMSUaCuwxPtphBlElXK3yM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789545561; x=1790150361;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=eM2eJgV5Hwmog/3RU1NSWqoxtZC0kal/pIoUWPJsLpY=;
        b=meqoVpEn+B77PwzBBUK82LMeiNB81cJknjvlWJL5bmg9GfcFlOUXsOfnnx5jFjp1PM
         2pmh9x+WO9speyslXCrDZ4fl927Rc398It6FKI5of5zezFV/GboUdOU8RSL4zSC64YIt
         cQ9PpGwclDMFMYolnLrs9pTodpLdwlkKiAO+s0JRFbdrNPSMyH1SbnUIOj9LMCsX4rN1
         /vaFRxAR/a/usLo9zICW3mhs7YTsQRFRhialYwmLe+yG1IO1ZzwiZbBPbzN5GEQAKLRR
         qGMx5wM+m13VCdJU2f4/J79H0GQx1RVdUsTugQ7VeGtO2EdUf0CWTmfVMNKPCXgEGIW4
         3K1Q==
X-Gm-Message-State: AFuF++m/0aTflBbj5Gkf8zspy0zaFkq9qd74nK01Ut9hLni4GZXJns19
	6vLsOJKY2eTb2KBfSa6eG42P5nSZF4M+14ZnFnbGnMzRPkz+4Y/K0aHnF5kgaoUQutXOnZTzbq/
	cesE7hBi6uzijje0aVxCg/Qur7h4IY4eexj4fsXYeGg==
X-Gm-Gg: AYBFou22GaeelyDWxh3//Wr0DsOuBjN4FuSIGbYkgOVCx2Df7Qqd6NCFoZv3ZOp51XR
	XZqPXoh2s/qnMfPAQ3te8vWTvXnOqUOB0E6booMOJ/PmVA6SHPuU4uQ39FqLjFTc/z4LJo1Yh9Y
	xVGcBGFHG0e3dn3mgyUCaFaM2HKHGgoMictYGWxD1fQZ46Y7xNDbv2dZU1S2jIIqyjMo3JRRRjW
	Jv7QTSBswBy4CYyirHwu2YGwoPXX2UxowacEeCevq6B2tWEyrrQ9DJdHbRLEI03nT5ynTW2t+Dd
	nctROPPXwMA9kvzPHxiodM+6yoiZn1V9PJoGu08Qweio6KQGyje66mpY4b/3GuaMSJWhqKwa9kI
	9Avalzbw24g==
X-Received: by 2002:a05:6a20:7d9f:b0:3c3:a3f4:5485 with SMTP id
 adf61e73a8af0-3dd5f3c1af6mr4662831637.6.1789545561088; Wed, 16 Sep 2026
 00:59:21 -0700 (PDT)
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
 <CAPzB2v7FUUoAcksgwvRhQSOwZqUJYdpgP8rr--8HmJWroJvzjg@mail.gmail.com> <SEZPR04MB7902BF81ACEBD11B6B8449ECE2B92@SEZPR04MB7902.apcprd04.prod.outlook.com>
In-Reply-To: <SEZPR04MB7902BF81ACEBD11B6B8449ECE2B92@SEZPR04MB7902.apcprd04.prod.outlook.com>
From: Paul Fedsen <paul-fedsen@design.tech>
Date: Wed, 16 Sep 2026 10:59:09 +0300
X-Gm-Features: AcwNN1U8k2ClXXYJ5KvouwduYLHRigwhHZVJD9bhGfRmuP8jwtt12h1PdEEfkLc
Message-ID: <CAPzB2v7tHU0np65zdn84LjDzPQBHgkkXRwWi8b18_Y+Th82MsQ@mail.gmail.com>
Subject: Re: [External] Fwd: phosphor-bmc-code-mgmt development
To: =?UTF-8?B?S3lsZSBIc2llaCAo6Kyd5pS/5ZCJKQ==?= <Kyle.Hsieh@quantatw.com>
Cc: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Content-Type: multipart/alternative; boundary="0000000000007a7b8c065b950bb5"

--0000000000007a7b8c065b950bb5
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello Kyle!

> My change had a fairly narrow motivation: we need to update SPI devices
other than the host BIOS on our platform

The same here.

> It does not touch eeprom-device, and I have no plans to change it.

 Okay, let's put that aside then...
 You're welcome to review 93843 concept. I'll try to restructure it to
match the newly refactored code, let's see if i have time. Tomorrow evening
i am leaving for vacation, so things will mostly wait.

=D1=81=D1=80, 16 =D1=81=D0=B5=D0=BD=D1=82. 2026=E2=80=AF=D0=B3. =D0=B2 03:4=
3, Kyle Hsieh (=E8=AC=9D=E6=94=BF=E5=90=89) <Kyle.Hsieh@quantatw.com>:

> Hi,
>
> Thanks for reaching out. My change had a fairly narrow motivation: we nee=
d
> to update SPI devices other than the host BIOS on our platform, and the
> existing daemon had that logic hard-coded for BIOS. So 484f7792 just spli=
t
> the BIOS specifics out of the generic SPI part and made the daemon pick t=
he
> device type from the EM configuration. It does not touch eeprom-device, a=
nd
> I have no plans to change it.
>
> I don't have a strong opinion on whether SPI and I2C EEPROM handling
> should eventually converge =E2=80=94 my platform has no I2C EEPROM, so I =
can't test
> that path and would rather not refactor code I can't validate.
>
> Best regards,
> Kyle Hsieh
> ------------------------------
> *=E5=AF=84=E4=BB=B6=E8=80=85:* Paul Fedsen <paul-fedsen@design.tech>
> *=E5=AF=84=E4=BB=B6=E6=97=A5=E6=9C=9F:* 2026=E5=B9=B49=E6=9C=8815=E6=97=
=A5 =E4=B8=8B=E5=8D=88 05:09
> *=E6=94=B6=E4=BB=B6=E8=80=85:* openbmc@lists.ozlabs.org <openbmc@lists.oz=
labs.org>; Kyle Hsieh
> (=E8=AC=9D=E6=94=BF=E5=90=89) <Kyle.Hsieh@quantatw.com>
> *=E4=B8=BB=E6=97=A8:* [External] Fwd: phosphor-bmc-code-mgmt development
>
> You don't often get email from paul-fedsen@design.tech. Learn why this is
> important <https://aka.ms/LearnAboutSenderIdentification>
>  Hello!
>
>  We are trying to upstream a patchset
> https://gerrit.openbmc.org/c/openbmc/phosphor-bmc-code-mgmt/+/93843 , and
> you recently merged commit 484f77929f9de9bb0eec98288cac784929900168 "
> https://gerrit.openbmc.org/c/openbmc/phosphor-bmc-code-mgmt/+/93843". It
> looks like we're trying to do the same thing, but chose architecturally
> different implementations. I'd like to discuss this so that we remake our
> patchset consistently.
> So, our vision was that SPI EEPROMs are conceptually the same as I2C
> EEPROMs; they even have matching addressing schemes: bus # and address
> (which translates to CS index for SPI). EEPROMDevice services already had
> all the core logic, so we separated generic SPIDevice code from SPIBios
> service, put it in common/ and reused it.
> In the meantime seems that you decided the opposite: SPIBios service gets
> renamed to SPIFlash and handles all sorts of SPI EEPROMs, while
> EEPROMDevice effectively becomes EEPROMI2CDevice and specializes in
> handling I2C EEPROMs.
> How (and whether) are you planning to address the fact that I2C and SPI
> are still very much the same things, even on the kernel API level ? Does =
it
> even make sense to keep two separate services ?
> We'd like to discuss these things with you in order to get moving in a
> proper direction. Do you maybe have more pending patches for us to consid=
er
> ?
>

--0000000000007a7b8c065b950bb5
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hello Kyle!</div><div><br></div><div>&gt;=C2=A0My cha=
nge had a fairly narrow motivation: we need to update SPI devices other tha=
n the host BIOS on our platform</div><div><br></div><div>The same here.</di=
v><div><br></div><div>&gt;=C2=A0It does not touch eeprom-device, and I have=
 no plans to change it.</div><div><br></div><div>=C2=A0Okay, let&#39;s put =
that aside then...</div><div>=C2=A0You&#39;re welcome to review 93843 conce=
pt. I&#39;ll try to restructure it to match the newly refactored code, let&=
#39;s see if i have time. Tomorrow evening i am leaving for vacation, so th=
ings will mostly wait.</div></div><br><div class=3D"gmail_quote gmail_quote=
_container"><div dir=3D"ltr" class=3D"gmail_attr">=D1=81=D1=80, 16 =D1=81=
=D0=B5=D0=BD=D1=82. 2026=E2=80=AF=D0=B3. =D0=B2 03:43, Kyle Hsieh (=E8=AC=
=9D=E6=94=BF=E5=90=89) &lt;<a href=3D"mailto:Kyle.Hsieh@quantatw.com">Kyle.=
Hsieh@quantatw.com</a>&gt;:<br></div><blockquote class=3D"gmail_quote" styl=
e=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);paddin=
g-left:1ex"><div class=3D"msg-259974020311946652">




<div dir=3D"ltr">
<div style=3D"font-family:Aptos,Aptos_EmbeddedFont,Aptos_MSFontService,Cali=
bri,Helvetica,sans-serif;font-size:12pt;color:rgb(0,0,0)">
Hi,</div>
<div style=3D"font-family:Aptos,Aptos_EmbeddedFont,Aptos_MSFontService,Cali=
bri,Helvetica,sans-serif;font-size:12pt;color:rgb(0,0,0)">
<br>
</div>
<div style=3D"font-family:Aptos,Aptos_EmbeddedFont,Aptos_MSFontService,Cali=
bri,Helvetica,sans-serif;font-size:12pt;color:rgb(0,0,0)">
Thanks for reaching out. My change had a fairly narrow motivation: we need =
to update SPI devices other than the host BIOS on our platform, and the exi=
sting daemon had that logic hard-coded for BIOS. So 484f7792 just split the=
 BIOS specifics out of the generic
 SPI part and made the daemon pick the device type from the EM configuratio=
n. It does not touch eeprom-device, and I have no plans to change it.</div>
<div style=3D"font-family:Aptos,Aptos_EmbeddedFont,Aptos_MSFontService,Cali=
bri,Helvetica,sans-serif;font-size:12pt;color:rgb(0,0,0)">
<br>
</div>
<div style=3D"font-family:Aptos,Aptos_EmbeddedFont,Aptos_MSFontService,Cali=
bri,Helvetica,sans-serif;font-size:12pt;color:rgb(0,0,0)">
I don&#39;t have a strong opinion on whether SPI and I2C EEPROM handling sh=
ould eventually converge =E2=80=94 my platform has no I2C EEPROM, so I can&=
#39;t test that path and would rather not refactor code I can&#39;t validat=
e.=C2=A0</div>
<div style=3D"font-family:Aptos,Aptos_EmbeddedFont,Aptos_MSFontService,Cali=
bri,Helvetica,sans-serif;font-size:12pt;color:rgb(0,0,0)">
<br>
</div>
<div style=3D"font-family:Aptos,Aptos_EmbeddedFont,Aptos_MSFontService,Cali=
bri,Helvetica,sans-serif;font-size:12pt;color:rgb(0,0,0)">
Best regards,</div>
<div style=3D"font-family:Aptos,Aptos_EmbeddedFont,Aptos_MSFontService,Cali=
bri,Helvetica,sans-serif;font-size:12pt;color:rgb(0,0,0)">
Kyle Hsieh</div>
<div id=3D"m_676958585792109433appendonsend"></div>
<hr style=3D"display:inline-block;width:98%">
<div id=3D"m_676958585792109433divRplyFwdMsg" dir=3D"ltr"><font face=3D"Cal=
ibri, sans-serif" style=3D"font-size:11pt" color=3D"#000000"><b>=E5=AF=84=
=E4=BB=B6=E8=80=85:</b> Paul Fedsen &lt;paul-fedsen@design.tech&gt;<br>
<b>=E5=AF=84=E4=BB=B6=E6=97=A5=E6=9C=9F:</b> 2026=E5=B9=B49=E6=9C=8815=E6=
=97=A5 =E4=B8=8B=E5=8D=88 05:09<br>
<b>=E6=94=B6=E4=BB=B6=E8=80=85:</b> <a href=3D"mailto:openbmc@lists.ozlabs.=
org" target=3D"_blank">openbmc@lists.ozlabs.org</a> &lt;<a href=3D"mailto:o=
penbmc@lists.ozlabs.org" target=3D"_blank">openbmc@lists.ozlabs.org</a>&gt;=
; Kyle Hsieh (=E8=AC=9D=E6=94=BF=E5=90=89) &lt;<a href=3D"mailto:Kyle.Hsieh=
@quantatw.com" target=3D"_blank">Kyle.Hsieh@quantatw.com</a>&gt;<br>
<b>=E4=B8=BB=E6=97=A8:</b> [External] Fwd: phosphor-bmc-code-mgmt developme=
nt</font>
<div>=C2=A0</div>
</div>
<div>
<table border=3D"0" cellspacing=3D"0" cellpadding=3D"0" width=3D"100%" alig=
n=3D"left" style=3D"background:revert;color:revert;direction:revert;font-si=
ze:revert;height:revert;letter-spacing:revert;line-height:revert;margin:rev=
ert;opacity:revert;outline:revert;overflow:revert;padding:revert;text-align=
:revert;text-indent:revert;text-orientation:revert;text-overflow:revert;tex=
t-transform:revert;vertical-align:revert;white-space:revert;word-break:reve=
rt;word-spacing:revert;writing-mode:revert;zoom:revert;border:0px;display:t=
able;width:100%;table-layout:fixed;float:none;border-spacing:0px">
<tbody style=3D"background:revert;border:revert;color:revert;direction:reve=
rt;font-size:revert;height:revert;letter-spacing:revert;line-height:revert;=
margin:revert;opacity:revert;outline:revert;overflow:revert;padding:revert;=
table-layout:revert;text-align:revert;text-indent:revert;text-orientation:r=
evert;text-overflow:revert;text-transform:revert;vertical-align:revert;whit=
e-space:revert;width:revert;word-break:revert;word-spacing:revert;writing-m=
ode:revert;zoom:revert;display:block">
<tr style=3D"background:revert;border:revert;color:revert;direction:revert;=
display:revert;font-size:revert;height:revert;letter-spacing:revert;line-he=
ight:revert;margin:revert;opacity:revert;outline:revert;overflow:revert;pad=
ding:revert;table-layout:revert;text-align:revert;text-indent:revert;text-o=
rientation:revert;text-overflow:revert;text-transform:revert;vertical-align=
:revert;white-space:revert;width:revert;word-break:revert;word-spacing:reve=
rt;writing-mode:revert;zoom:revert">
<td valign=3D"middle" width=3D"1px" bgcolor=3D"#A6A6A6" cellpadding=3D"7px =
2px 7px 2px" style=3D"background-position:revert;background-repeat:revert;b=
ackground-image:revert;background-size:revert;background-origin:revert;back=
ground-clip:revert;border:revert;color:revert;direction:revert;display:reve=
rt;font-size:revert;height:revert;letter-spacing:revert;line-height:revert;=
margin:revert;opacity:revert;outline:revert;overflow:revert;table-layout:re=
vert;text-align:revert;text-indent:revert;text-orientation:revert;text-over=
flow:revert;text-transform:revert;vertical-align:revert;white-space:revert;=
word-break:revert;word-spacing:revert;writing-mode:revert;zoom:revert;paddi=
ng:7px 2px;background-color:rgb(166,166,166);width:0px">
</td>
<td valign=3D"middle" width=3D"100%" bgcolor=3D"#EAEAEA" cellpadding=3D"7px=
 5px 7px 15px" color=3D"#212121" style=3D"background-position:revert;backgr=
ound-repeat:revert;background-image:revert;background-size:revert;backgroun=
d-origin:revert;background-clip:revert;border:revert;direction:revert;displ=
ay:revert;height:revert;letter-spacing:revert;line-height:revert;margin:rev=
ert;opacity:revert;outline:revert;overflow:revert;table-layout:revert;text-=
indent:revert;text-orientation:revert;text-overflow:revert;text-transform:r=
evert;vertical-align:revert;white-space:revert;word-break:revert;word-spaci=
ng:revert;writing-mode:revert;zoom:revert;width:100%;background-color:rgb(2=
34,234,234);padding:7px 5px 7px 15px;font-family:wf_segoe-ui_normal,Segoe U=
I,Segoe WP,Tahoma,Arial,sans-serif;font-size:12px;font-weight:normal;color:=
rgb(33,33,33);text-align:left">
<div style=3D"background:revert;border:revert;color:revert;direction:revert=
;display:revert;font-size:revert;height:revert;letter-spacing:revert;line-h=
eight:revert;margin:revert;opacity:revert;outline:revert;overflow:revert;pa=
dding:revert;table-layout:revert;text-align:revert;text-indent:revert;text-=
orientation:revert;text-overflow:revert;text-transform:revert;vertical-alig=
n:revert;white-space:revert;width:revert;word-break:revert;word-spacing:rev=
ert;writing-mode:revert;zoom:revert">
You don&#39;t often get email from paul-fedsen@design.tech. <a href=3D"http=
s://aka.ms/LearnAboutSenderIdentification" style=3D"background:revert;color=
:revert;direction:revert;display:revert;font-size:revert;opacity:revert" ta=
rget=3D"_blank">
Learn why this is important</a> </div>
</td>
<td valign=3D"middle" align=3D"left" width=3D"75px" bgcolor=3D"#EAEAEA" cel=
lpadding=3D"7px 5px 7px 5px" color=3D"#212121" style=3D"background-position=
:revert;background-repeat:revert;background-image:revert;background-size:re=
vert;background-origin:revert;background-clip:revert;border:revert;directio=
n:revert;display:revert;height:revert;letter-spacing:revert;line-height:rev=
ert;margin:revert;opacity:revert;outline:revert;overflow:revert;table-layou=
t:revert;text-indent:revert;text-orientation:revert;text-overflow:revert;te=
xt-transform:revert;vertical-align:revert;white-space:revert;word-break:rev=
ert;word-spacing:revert;writing-mode:revert;zoom:revert;width:75px;backgrou=
nd-color:rgb(234,234,234);padding:7px 5px;font-family:wf_segoe-ui_normal,Se=
goe UI,Segoe WP,Tahoma,Arial,sans-serif;font-size:12px;font-weight:normal;c=
olor:rgb(33,33,33);text-align:left">
</td>
</tr>
</tbody>
</table>
<div>
<div dir=3D"ltr">
<div>
<div>=C2=A0Hello!</div>
<div dir=3D"ltr"><br>
</div>
<div dir=3D"ltr">=C2=A0We are trying to upstream a patchset=C2=A0<a href=3D=
"https://gerrit.openbmc.org/c/openbmc/phosphor-bmc-code-mgmt/+/93843" targe=
t=3D"_blank">https://gerrit.openbmc.org/c/openbmc/phosphor-bmc-code-mgmt/+/=
93843</a>
 , and you recently merged commit=C2=A0<span style=3D"font-family:monospace=
"><span style=3D"color:rgb(178,104,24);background-color:rgb(255,255,255)">4=
84f77929f9de9bb0eec98288cac784929900168 &quot;</span></span><a href=3D"http=
s://gerrit.openbmc.org/c/openbmc/phosphor-bmc-code-mgmt/+/93843" target=3D"=
_blank">https://gerrit.openbmc.org/c/openbmc/phosphor-bmc-code-mgmt/+/93843=
</a>&quot;.
 It looks like we&#39;re trying to do the same thing, but chose architectur=
ally different implementations. I&#39;d like=C2=A0to discuss this so that w=
e remake our patchset consistently.
<div>So, our vision was that SPI EEPROMs are conceptually=C2=A0the same as =
I2C EEPROMs; they even have matching addressing schemes: bus # and address =
(which translates to CS index for SPI). EEPROMDevice services already had a=
ll the core logic, so we separated generic
 SPIDevice code from SPIBios service, put it in common/ and reused=C2=A0it.=
</div>
<div>In the meantime seems that you decided the opposite: SPIBios service g=
ets renamed to SPIFlash and handles all sorts of SPI EEPROMs, while EEPROMD=
evice effectively becomes EEPROMI2CDevice and specializes in handling I2C E=
EPROMs.</div>
<div>How (and whether) are you planning to address the fact that I2C and SP=
I are still very much the same things, even on the kernel API level ? Does =
it even make sense to keep two separate services ?</div>
<div>We&#39;d like to discuss these things with you in order to get moving =
in a proper direction. Do you maybe have more pending patches for us to con=
sider ?</div>
</div>
</div>
</div>
</div>
</div>
</div>

</div></blockquote></div>

--0000000000007a7b8c065b950bb5--

