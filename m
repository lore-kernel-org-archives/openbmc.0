Return-Path: <openbmc+bounces-2001-openbmc=archiver.kernel.org@lists.ozlabs.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 858C3CD5BDE
	for <openbmc@archiver.kernel.org>; Wed, 27 May 2026 01:43:17 +0000 (UTC)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4gQC7L3gFkz2yTH;
	Wed, 27 May 2026 11:43:10 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2607:f8b0:4864:20::e43" arc.chain=google.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1779846190;
	cv=pass; b=QlAa/ymEqt37bJ2qlFrRqkg+qvrSjQo3XWS6LkpW0iA5We+HnqIiWTmyC1IDJFsTRREgMNaIjoL9Ciwmi/d9JfDnXMZ+E2GJ5P7I2RXNRzFCoo4fYa3JpkQ0eN/Fdc5OP6Q5bYs31rQRAYD0ooEzVHNKbpQtuZefwnh3jdo+uQvwVOVZ1Z9tb1lXn+U28ZcHnGRoakkwWm4kJped2LfbCfVCP4kf2o85KjuMeIEeg6rPKlOFeBURtB6XJJx6caWJl+cEaZQHUJ7hEpZ3rWhDy94JGCO3bT0wRMNm3Gvz0mJXUztPAZ2ngRauJnKB6c0jw/0mTU5v6lNeeUYcsxg3xg==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1779846190; c=relaxed/relaxed;
	bh=DyXC4WQPo3JzkcdH1L6kD3vLYJrLicl+1Pq7inUkdGM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kRqWu0gQLNRx2Zw5YowrOIQ2cEGtVo5/GQWqH9S+Wkvn+S12aoBT8rD+TkArIciYBhPTey9kvZjBd694FUGE3cW+ufL+T6xzWhBKJt+k6r4wugKSjDbQqq//G08JxU+zrXDmc9EvjKyiY1DK+6+KO/pQnyRLh5BsLJP1lEnDupOIqk+7HPFP5aq3lU5kw4PqdHXk4JJ2rvgJ6LUOgyvo4kyhwAOxmhDwqueh/VlZcKHujtQvZzMD6ZuuKnE0X9hMRVeOlr/csUURGtywA5PdB+n+0VQF43kZ4qJUBF2n8NztyUNKci/mTpjEjA0cIXvNU4wu0pZp8GeqqOPRBvoNTA==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=TfbA0KEl; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::e43; helo=mail-vs1-xe43.google.com; envelope-from=shbaismail@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=TfbA0KEl;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::e43; helo=mail-vs1-xe43.google.com; envelope-from=shbaismail@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-vs1-xe43.google.com (mail-vs1-xe43.google.com [IPv6:2607:f8b0:4864:20::e43])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4gQC7K016vz2xRw
	for <openbmc@lists.ozlabs.org>; Wed, 27 May 2026 11:43:08 +1000 (AEST)
Received: by mail-vs1-xe43.google.com with SMTP id ada2fe7eead31-63130466364so4183762137.2
        for <openbmc@lists.ozlabs.org>; Tue, 26 May 2026 18:43:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779846185; cv=none;
        d=google.com; s=arc-20240605;
        b=QG56LzgAgbK/x/Oj7hVKh2JDz5Kue9zktDjWaOh8iG1LlYd92yT+LtSUgXfrc/+l8r
         OErnVszjhvp8TuLePvonBfFhzd+10yD+OjJp0XlWm4uLj4XXGoTcJr2IRFBPRS11kWeC
         Ztyi7NEg6NaSTmH4gF7SWGBS52qGklpBDigH7Mvdd7nnRYQRn1lNeXDSzgxMpOKB27vD
         Yw3uSXzocYmQEvhe+fKIuy/PuHEgQNWljzhDEW09e+53KizYepTaEmoMmf+cfsadnrPU
         783pI+Ibqwge23ih3kACOQVmA2d0kvttyVStbjmFTJyeCS2L0w8d/fV1jDCO5hFTU3fj
         wm2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=DyXC4WQPo3JzkcdH1L6kD3vLYJrLicl+1Pq7inUkdGM=;
        fh=4LvzQQfbRnVTmQSPcWbFd8wVCxS0jXGAiiUv9Aowa6c=;
        b=j0lEy/4Bbj09iU9gJ5YXPJSqh7sKPIq8JuluGlcu670j5juwcbQYGhoQiqECJAsxfj
         ZK+1atfcV/o5aq370EDmvHFApkvya/J0KBg5baMbTBzxSVbRUBTYGqKUIB357AZMF2L5
         /RuJNVSe9s+xdmwwCw8Ub+SKv8uIqdjtBUIZ72j8EZDyFzPyhpKcF/y2FcXN1vpKCPrn
         5ACDdYNgd7CFQMhelwxkuKM9ik/S1iBMqxPyQKtng2HeR96W5Cy1Clm/xk3Iv6fYyFJD
         knygGzgsQ1dN7P+rQWxiNoQrKKuTQmFmmnZ4cvlVG43z3H6RqrNdJ47zHHtzpPzAKdTy
         ciPw==;
        darn=lists.ozlabs.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779846185; x=1780450985; darn=lists.ozlabs.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=DyXC4WQPo3JzkcdH1L6kD3vLYJrLicl+1Pq7inUkdGM=;
        b=TfbA0KElFkjmtavLVKhZpIZX2I59EB0vcxjfWEu+AwKYmzN2S/MwuGNPW6lyonXQnc
         WcmpLYxBHrUgGEA9NKcNrt1pdKhm+cXov6IqwlUWaxyntHteSNByyH2ANhnjYoO5aHH3
         UPNS74lKWKJccROndIriNB69ZaSsRIMtfpeFiCK44Cqju60ej64OlVY14vGZ5tCzvsDG
         E9Y+hn53dx4rJP5zw+We6z8DglNh1B4EudPaANrRw0YXtBpgHAPQOxxOZJsJVkBo0kuC
         YZE4Ix5BXCj7cOl4L4KFBiEtIT2uctbcl7AKBjWkwllLy376TZQj4e7ln7E4YBwgjxlw
         //5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779846185; x=1780450985;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DyXC4WQPo3JzkcdH1L6kD3vLYJrLicl+1Pq7inUkdGM=;
        b=tIpNjOjTfyGhy78rwanFOkh7Iw7tX1MCGzVL1sg0N9r/7EptUEn+ef+ZDYthqvbaqo
         WC7DqZNbdvyJTlLHf7QXGic7/Aru5CFT15rOHDml7SIUwx65715CkjuWPviu+G95miKX
         V2PeAtYBrPGsm2VPseyj8WyDxzgEokFibhIdFJfCAw4UAgOvuGhuk+IzSAHfPwO3ncfA
         455p+Pzm1TH4XNNGpwGWwhHkFY2ndAIwlG46Kag0Q3AsRyr3Kfw7JMrNRFUgYPD2yPLf
         Xu2E9Cx4+I8wI/89eUFDLn7OZdm+oA8uSek0TIRxqU+lBl8GbrZVO75/dt0Jv1thpGqS
         WMsg==
X-Forwarded-Encrypted: i=1; AFNElJ+T/r+FEKfocf1Q/ki/dsm1ZKs8dCUAukETUc9j32WBMmk2rsHFbOBcvvVjdQt1Q6ZY4VyIHsZR@lists.ozlabs.org
X-Gm-Message-State: AOJu0YzTHSmnkXHACXiWEQgD7ftjozykTZ7krCmZRP2YZhAoodjI1NFr
	/d2VmgaxXsNc5sBV0rGS1l3t2AEFpgnl1VFq+gBsLmRd+9W/z9wS3IQNl27udvewrmN+lWNV1h1
	AO9gAlq2jV/qGiXx8XgvEHO3krTNPX8U=
X-Gm-Gg: Acq92OF1RbTibf5VHxXWJJRHYFrx5fW1FgWjJBgzJF+KaIgLF/Rr9JQGuiqHmZDPgdJ
	NY1UIQvXQBZ1xIgwiQ+sUoq0EI5wLunpBIiThUHgHwT1gIm4NMBzjSsLYcahYAl/cuoiq8Sfs+j
	P3NS+7MZ4j+RVSx60yHYpwH3LkkN/Ns7Jho+/KUqO/FLZg66qRBMeRpNM8rTgFHRi247F/Mitmm
	sul4RWyI+cXinM6Lrsx5v4FukQROe6hnbBxT7c/+yTIYBrDrIl67/9Xy771nxwyecsUTyb/uvS8
	9k9l/U6frvD+WyYMK7jek+CCIlhBhhQhS78hVI+0evKjwTVLmcI=
X-Received: by 2002:a05:6102:5241:b0:62f:357a:3297 with SMTP id
 ada2fe7eead31-67c7405f50fmr11156555137.5.1779846184959; Tue, 26 May 2026
 18:43:04 -0700 (PDT)
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
References: <20260426-axiado-ax3000-cadence-i2c-support-v1-0-0cb9346a7fb5@axiado.com>
 <0c6e3442-1638-4c81-af9e-977ed913248b@axiado.com>
In-Reply-To: <0c6e3442-1638-4c81-af9e-977ed913248b@axiado.com>
From: sami Baismail <shbaismail@gmail.com>
Date: Wed, 27 May 2026 04:42:52 +0300
X-Gm-Features: AVHnY4IUGhcojJjiMs7nE8dq6ZC2il-1_0zPe4ngHpBtLS-U5UFgCCLN1liR0-g
Message-ID: <CAGCcG-=6vdJOunFu3+A8fHCqQQFBRO0mLtdXAnNDL8iq1PsBGA@mail.gmail.com>
Subject: Re: [PATCH 0/2] i2c: cadence: Add support for Axiado AX3000
To: Swark Yang <syang@axiado.com>
Cc: Michal Simek <michal.simek@amd.com>, Andi Shyti <andi.shyti@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	openbmc@lists.ozlabs.org
Content-Type: multipart/alternative; boundary="0000000000009c033d0652c2bb72"

--0000000000009c033d0652c2bb72
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Swark,

Thank you very much for the gentle reminder regarding the patch series.

*First, and most importantly,* could you please update my contact
information in the project management system or relevant mailing list to my
primary email address (shbaismail@gmail.com) and also add the compliance
group (glcn-compliance@googlegroups.com) to ensure all notifications are
received.

*Second,* I have reviewed the driver changes in Patch 2/2 (for Axiado
AX3000 support and enabling the SMBus Quick command), and I approve them
technically.

Acked-by: sami Baismail

*Finally,* could you please provide me with the complete login information
for the project management system. I need the direct access link, my
account credentials, and any details related to the administrative
privileges granted to me for this project.

Best regards,
sami Baismail



Sami.H.baismail

=D9=81=D9=8A =D8=A7=D9=84=D8=A3=D8=B1=D8=A8=D8=B9=D8=A7=D8=A1=D8=8C =D9=A2=
=D9=A7 =D9=85=D8=A7=D9=8A=D9=88 =D9=A2=D9=A0=D9=A2=D9=A6=D8=8C =D9=A0=D9=A3=
:=D9=A5=D9=A2 Swark Yang <syang@axiado.com> =D9=83=D8=AA=D8=A8:

> Hi,
>
> Gentle ping on this patch series.
>
> Patch 1/2 (dt-bindings) has already received an Acked-by from Conor.
> I wanted to kindly check if you have any comments or feedback regarding
> the driver changes in Patch 2/2.
>
> Please let me know if any further adjustments are needed.
>
> Best Regards,
> Swark
>
>
> Swark Yang =E6=96=BC 2026/4/27 =E4=B8=8A=E5=8D=88 11:57 =E5=AF=AB=E9=81=
=93:
> > CAUTION: This email originated from outside of the organization. Do not
> click links or open attachments unless you recognize the sender and know
> the content is safe.
> >
> >
> > This patch series adds support for the Cadence I2C controller
> > integrated into the Axiado AX3000 SoC and enables SMBus Quick
> > command functionality.
> >
> > The Axiado AX3000 utilizes the Cadence I2C IP core (version r1p14).
> > While it is largely compatible with the existing i2c-cadence
> > driver logic, the AX3000 hardware specifically supports SMBus Quick
> > commands. This feature is currently disabled by default in the
> > i2c-cadence driver (masked out from I2C_FUNC_SMBUS_EMUL).
> >
> > To enable this functionality, this series introduces a new
> > platform-specific quirk (CDNS_I2C_QUIRK_SMBUS_QUICK) and uses driver
> > match data for the "axiado,ax3000-i2c" compatible string. This allows
> > tools like 'i2cdetect' to properly scan the bus using quick write
> > commands.
> >
> > The DT binding update follows the recommended fallback structure,
> > referencing the 'cdns,i2c-r1p14' fallback to ensure compatibility with
> > older kernels while allowing the new quirk to be enabled on AX3000.
> >
> > Patch breakdown:
> >
> > Patch 1: dt-bindings: i2c: cadence: Add Axiado AX3000
> > Patch 2: i2c: cadence: Add support for Axiado AX3000
> >
> > These patches are expected to go via the I2C subsystem tree.
> >
> > Feedback is welcome.
> >
> > Signed-off-by: Swark Yang <syang@axiado.com>
> > ---
> > Swark Yang (2):
> >        dt-bindings: i2c: cadence: Add Axiado AX3000
> >        i2c: cadence: Add support for Axiado AX3000
> >
> >   Documentation/devicetree/bindings/i2c/cdns,i2c-r1p10.yaml | 10
> +++++++---
> >   drivers/i2c/busses/i2c-cadence.c                          | 10
> ++++++++++
> >   2 files changed, 17 insertions(+), 3 deletions(-)
> > ---
> > base-commit: 63804fed149a6750ffd28610c5c1c98cce6bd377
> > change-id: 20260111-axiado-ax3000-cadence-i2c-support-53ec117bb074
> >
> > Best regards,
> > --
> > Swark Yang <syang@axiado.com>
> >
>
>

--0000000000009c033d0652c2bb72
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">Hi Swark,<br><br>Thank you very much for the gentle remin=
der regarding the patch series.<br><br><b>First, and most importantly,</b>=
=C2=A0could you please update my contact information in the project managem=
ent system or relevant mailing list to my primary email address (<code><a h=
ref=3D"mailto:shbaismail@gmail.com">shbaismail@gmail.com</a></code>) and al=
so add the compliance group (<code><a href=3D"mailto:glcn-compliance@google=
groups.com">glcn-compliance@googlegroups.com</a></code>) to ensure all noti=
fications are received.<br><br><b>Second,</b>=C2=A0I have reviewed the driv=
er changes in Patch 2/2 (for Axiado AX3000 support and enabling the SMBus Q=
uick command), and I approve them technically.<br><br>Acked-by: sami Baisma=
il<br><br><b>Finally,</b>=C2=A0could you please provide me with the complet=
e login information for the project management system. I need the direct ac=
cess link, my account credentials, and any details related to the administr=
ative privileges granted to me for this project.<br><br>Best regards,<br>sa=
mi Baismail<br><br><br><br><div data-smartmail=3D"gmail_signature">Sami.H.b=
aismail</div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D=
"gmail_attr">=D9=81=D9=8A =D8=A7=D9=84=D8=A3=D8=B1=D8=A8=D8=B9=D8=A7=D8=A1=
=D8=8C =D9=A2=D9=A7 =D9=85=D8=A7=D9=8A=D9=88 =D9=A2=D9=A0=D9=A2=D9=A6=D8=8C=
 =D9=A0=D9=A3:=D9=A5=D9=A2 Swark Yang &lt;<a href=3D"mailto:syang@axiado.co=
m" rel=3D"noreferrer noreferrer" target=3D"_blank">syang@axiado.com</a>&gt;=
 =D9=83=D8=AA=D8=A8:<br></div><blockquote class=3D"gmail_quote" style=3D"ma=
rgin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:=
1ex">Hi,<br>
<br>
Gentle ping on this patch series.<br>
<br>
Patch 1/2 (dt-bindings) has already received an Acked-by from Conor.<br>
I wanted to kindly check if you have any comments or feedback regarding <br=
>
the driver changes in Patch 2/2.<br>
<br>
Please let me know if any further adjustments are needed.<br>
<br>
Best Regards,<br>
Swark<br>
<br>
<br>
Swark Yang =E6=96=BC 2026/4/27 =E4=B8=8A=E5=8D=88 11:57 =E5=AF=AB=E9=81=93:=
<br>
&gt; CAUTION: This email originated from outside of the organization. Do no=
t click links or open attachments unless you recognize the sender and know =
the content is safe.<br>
&gt;<br>
&gt;<br>
&gt; This patch series adds support for the Cadence I2C controller<br>
&gt; integrated into the Axiado AX3000 SoC and enables SMBus Quick<br>
&gt; command functionality.<br>
&gt;<br>
&gt; The Axiado AX3000 utilizes the Cadence I2C IP core (version r1p14).<br=
>
&gt; While it is largely compatible with the existing i2c-cadence<br>
&gt; driver logic, the AX3000 hardware specifically supports SMBus Quick<br=
>
&gt; commands. This feature is currently disabled by default in the<br>
&gt; i2c-cadence driver (masked out from I2C_FUNC_SMBUS_EMUL).<br>
&gt;<br>
&gt; To enable this functionality, this series introduces a new<br>
&gt; platform-specific quirk (CDNS_I2C_QUIRK_SMBUS_QUICK) and uses driver<b=
r>
&gt; match data for the &quot;axiado,ax3000-i2c&quot; compatible string. Th=
is allows<br>
&gt; tools like &#39;i2cdetect&#39; to properly scan the bus using quick wr=
ite<br>
&gt; commands.<br>
&gt;<br>
&gt; The DT binding update follows the recommended fallback structure,<br>
&gt; referencing the &#39;cdns,i2c-r1p14&#39; fallback to ensure compatibil=
ity with<br>
&gt; older kernels while allowing the new quirk to be enabled on AX3000.<br=
>
&gt;<br>
&gt; Patch breakdown:<br>
&gt;<br>
&gt; Patch 1: dt-bindings: i2c: cadence: Add Axiado AX3000<br>
&gt; Patch 2: i2c: cadence: Add support for Axiado AX3000<br>
&gt;<br>
&gt; These patches are expected to go via the I2C subsystem tree.<br>
&gt;<br>
&gt; Feedback is welcome.<br>
&gt;<br>
&gt; Signed-off-by: Swark Yang &lt;<a href=3D"mailto:syang@axiado.com" rel=
=3D"noreferrer noreferrer noreferrer" target=3D"_blank">syang@axiado.com</a=
>&gt;<br>
&gt; ---<br>
&gt; Swark Yang (2):<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 dt-bindings: i2c: cadence: Add Axiado AX300=
0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 i2c: cadence: Add support for Axiado AX3000=
<br>
&gt;<br>
&gt;=C2=A0 =C2=A0Documentation/devicetree/bindings/i2c/cdns,i2c-r1p10.yaml =
| 10 +++++++---<br>
&gt;=C2=A0 =C2=A0drivers/i2c/busses/i2c-cadence.c=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 10 +++=
+++++++<br>
&gt;=C2=A0 =C2=A02 files changed, 17 insertions(+), 3 deletions(-)<br>
&gt; ---<br>
&gt; base-commit: 63804fed149a6750ffd28610c5c1c98cce6bd377<br>
&gt; change-id: 20260111-axiado-ax3000-cadence-i2c-support-53ec117bb074<br>
&gt;<br>
&gt; Best regards,<br>
&gt; --<br>
&gt; Swark Yang &lt;<a href=3D"mailto:syang@axiado.com" rel=3D"noreferrer n=
oreferrer noreferrer" target=3D"_blank">syang@axiado.com</a>&gt;<br>
&gt;<br>
<br>
</blockquote></div>

--0000000000009c033d0652c2bb72--

