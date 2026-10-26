Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A157606A31B
	for <openbmc@archiver.kernel.org>; Mon, 26 Oct 2026 11:06:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=i1lAwKgc
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4jCrRC1mg2z2yNj;
	Mon, 26 Oct 2026 22:06:31 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2607:f8b0:4864:20::112b" arc.chain=google.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1793012790;
	cv=pass; b=U9iA3CdQYKkWRIqJvcNRMMo1dUTD6o8mLwIjhi6foI+MV8nQAVE5ybsbp90bLqtFEYHkTHrke645ol29D+5tlzsVln/fghx/wlxNJIWHcr/jZ3kR1N1oBuPliBmHq8U1w4NXrVCEQO9l9tRVJEeNsJZjFv2Zg37cJ0NbtLMKRapJMZl5pxtE2hs7BO+vqQ58KMJdyAsDBJiNKAKsDaYRLpH9gvHihaenUcQQOzPZv2BuPQt508TGk1WAp1GDjKprVgK9zf7cfjm36AzLtyx+KYioN++0lzz+/R3kD8D6EDSzmE3oih9145106v3wnREBieQUTyZVUmde6D1WF5T0NA==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1793012790; c=relaxed/relaxed;
	bh=pPXikRGFnJQcIYGTwbO+d8f4V12ha0QEQB0RoGK+Qzo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=TXULndndMDmkS1u9woj/tnLlXLKkBFl9Frk1fypn1YtnsuzIrMM+6mtAxFxcur7AmfrgnIqcmGARxgeFoZxPqN5DtLFe2kxwNYzoVLB71iSnKQoYYzARImuwwbqH2SOaOVwl6SVGS4Qj+IE52XvoMdJXbXcfwfrNZzfvLc4etyuT7QP/IKKlgL6pVG+TSxKuVWaJisdMtd/oXWesC/I6Qnujob1nzBLL//fbOB4g2OXsBLp6JmMULpZcD/vamjhMcMQhXFnq/fc1ZaXryIQ4EpGn4XfXfWYz4wW+S7GGiL6JOhyFGXLwXw6aL1/R7xGFEOtTCYPOrRcvyoQZGu7GDw==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=i1lAwKgc; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::112b; helo=mail-yw1-x112b.google.com; envelope-from=prasanth.padarthi10@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=i1lAwKgc;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::112b; helo=mail-yw1-x112b.google.com; envelope-from=prasanth.padarthi10@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-yw1-x112b.google.com (mail-yw1-x112b.google.com [IPv6:2607:f8b0:4864:20::112b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4jCrR917w5z2yGT
	for <openbmc@lists.ozlabs.org>; Mon, 26 Oct 2026 22:06:27 +1100 (AEDT)
Received: by mail-yw1-x112b.google.com with SMTP id 00721157ae682-8565d77c277so21196757b3.0
        for <openbmc@lists.ozlabs.org>; Mon, 26 Oct 2026 04:06:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793012785; cv=none;
        d=google.com; s=arc-20260327;
        b=UmBwUFGy3i1SGFZSg0dTL1vctm4Is1/DLXAHxFS9O8x0BOoKxV0YjSS7Bgg7qm10cq
         q6IVgCH0r4JVGpi2+omFa5vGqdpMJfOTbz3h22lhyAaAg5WHBA4VHB5FZxYIiSsUYcDC
         uNGHCE2/UR8gTBKoiJz86CfIwXIRo0x59t2pEM6JugRrDLL6nlw+Ky3PAvTNr540wNoe
         ya4OFgrWlLofwHqyyQEC35d+Pg6t5TDYdoPxYE2MI4E43EZgRUOHRhJZkSXC1ne7DfW0
         LR5HSeVGlvO3H1XwMazun2+7Uc6pnRQo57sMOLGNIFq7y+gyHuRsyXy1QlDpFbS9DM49
         yP4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=pPXikRGFnJQcIYGTwbO+d8f4V12ha0QEQB0RoGK+Qzo=;
        fh=ktKymjyMta6nvClujlVOp0Su8w5X9kC985g9KMhrnY8=;
        b=bGSKewl5rNDzHkCFn+UurG7vlgi65k3J6k5i3N4I2Tero21PeKyGLfhlI/bLBrlAQF
         52f9E4jf7eWyhN1ArjKCfmFqkFHptp60OzfWjNiox6DLBkQPdZwTeyCznECrB8BMfl7J
         rNomR4nE5vfkvzizJZQWjVqXeF9uvUVv5JArMCawC2fMzPCZMDgu0oVHzDds4+HYUut5
         zfZBrqulTwm0az54YKxtYxkjliPr1ftDIdI7OaXyAY6c9TCYlOOuoAhtiJqWJmGCDGvU
         17WZBf4hmWk6H1sIya+htr/jvDPrxWeiJW3PXEolT6RiPTCPnFifcQjExm+wY4I58gZ5
         7Ksg==;
        darn=lists.ozlabs.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793012785; x=1793617585; darn=lists.ozlabs.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pPXikRGFnJQcIYGTwbO+d8f4V12ha0QEQB0RoGK+Qzo=;
        b=i1lAwKgcgGrh3QlSMlKVziNYsXlipTOBg1lXNaeYo11MnWkedXCQXipBhr3jm5AXFu
         ntFxg7aPnKeI/AxC8IyYmGmDCvA+qCxHVb39pur6B0RJC1XznxVfkweNOp+cWp+rh5yP
         6XHw5MOCu7gaja9lhk6oeJWJtLGi9xrUknweAJZoUifqsdiYEglr9csrcc+uG/j9g2/J
         AcA5L8ur44PGOyVn3h/9t7xo0/rdY1aBYJkg8BmN1yiZ3yY7UsCBox4bbeZcomleYymW
         Tvk1E5caH+dSOAP+crZ45IBi7IIlXDvx7tfxPSfpp1TY1NStxzqR/Y+Gba+bufq1RPTD
         EY7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793012785; x=1793617585;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=pPXikRGFnJQcIYGTwbO+d8f4V12ha0QEQB0RoGK+Qzo=;
        b=oN3seVUn52HOyre0aNonTS1px4065OufgY5E9BwHkWUZWCgR7tqkwq2RC0rkpavAKR
         q/sMGbjZ8JYxzv8Wmw1YORnYqLuWFC277ieCzOx7iRklzUYIoY7CHH2h8Q0Z5Nbm0zR5
         BgXwH9Mssg7euWLc1rFPpIVtKra/yo+Mlk/2I7CQRRaPu5yn2R0xBrJHxiiqXYmDcJCd
         z/6+viMbRwOrj5MO2ldlyk8Kk/5vunFo+RLeYRqp+h8gDL+sddu6WgesGd3nRu1v3Jwm
         l5yTa6P2Xl4yNHP/wq6nEvxfq9B2mp7+uYd96V9JO66mIcxWrXet/UckU2LO4+Qm4jTB
         Bqrw==
X-Gm-Message-State: AFq9FYLi2pnsthIAZVwM8i3hRIIT2f8Sx/FWLgVUgk65qHyQYixb9s8Y
	s+5mAF0tZKMdPIWxXZbT8ELAhwv3q1H5b7+odOrC6uDWI+2YYkyYW94HGhWs9s9xQxJQnCUki3G
	6zEO9WipGTEGeND0b2WTrU/G1if64dQw=
X-Gm-Gg: AYBFou1s3/xUjLCGjqVpK2M3b7LaX/2HuniAb/qbbygzsI3Cbp0v32e0OK+gMcXO8wS
	r4hGvYXKTcGdB9hHW4E00+Z6dd17veYzsiRX/54iJKKDabo0JRaucjgL5rkwE+QhOfVMRkwv4xR
	jjO1UR0wN8dZjrnCQVZyhc9ncKrgcEjtu31HC9lS2ZyBRAA6ONOqyjwPBV9l+nYpIkgnFXkbF3G
	x70NhjIUbwKJbJXw09ieQTGiv51QwMmDYhWyyBDHLDnq5aeXpNAWAZfJFSpWP9cvlJlxoQMG6Bv
	KTu9qBhXtcar2M/luF9rUxjY+O3TWMlw7eYBLZEAPCaaxLEG0LUu9745OGXkOM6oUyxRt74rGAf
	TaBBviGiXaaGfXp9FVQbYHbAeT+aKwMnuKDf0E0kDcoiXFiMjVf3RAAvyQEw=
X-Received: by 2002:a05:690c:7482:b0:8b1:8d69:1b0f with SMTP id
 00721157ae682-8b18d691da9mr11843167b3.1.1793012785319; Mon, 26 Oct 2026
 04:06:25 -0700 (PDT)
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
References: <CAD_a9macSzuBsmmoLu2Cu1doLADvcpASFi-6ADnOvmMdgDEfHA@mail.gmail.com>
In-Reply-To: <CAD_a9macSzuBsmmoLu2Cu1doLADvcpASFi-6ADnOvmMdgDEfHA@mail.gmail.com>
From: Prasanth <prasanth.padarthi10@gmail.com>
Date: Mon, 26 Oct 2026 16:36:12 +0530
X-Gm-Features: AclHuK_pCN5hqYStADz3quS5R2ODIBwL_9oHQ6_3O2wMX4SOFrV28JqDIucZFYc
Message-ID: <CAMFFDGgj+VtLx7fNS=g7q=kJbg9AEHEiCgMHEtjLPsVA7=fWgQ@mail.gmail.com>
Subject: Re: [OpenBMC] Guidance on Getting Started with OpenBMC and Choosing a
 Development Board
To: KAVYA M M <kavyamadarsh@gmail.com>
Cc: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>, 
	"linux-aspeed@lists.ozlabs.org" <linux-aspeed@lists.ozlabs.org>, 
	Andrew Jeffery <andrew@codeconstruct.com.au>, changhuang.liang@starfivetech.com, 
	Shuah Khan <skhan@linuxfoundation.org>, Jani Nikula <jani.nikula@intel.com>, 
	Vitaly Lubart <lubvital@gmail.com>, Hanjun Guo <guohanjun@huawei.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Alexander Usyskin <alexander.usyskin@intel.com>, 
	Jason Gunthorpe <jgg@ziepe.ca>, Breno Leitao <leitao@debian.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
	James Morse <james.morse@arm.com>, Paolo Abeni <pabeni@redhat.com>, 
	Stephen Hemminger <stephen@networkplumber.org>, Dave Penkler <dpenkler@gmail.com>, 
	Jakub Kicinski <kuba@kernel.org>, Jonathan Cameron <jic23@kernel.org>, Dan Williams <djbw@kernel.org>, 
	Mukesh Rathor <mrathor@linux.microsoft.com>, Vladimir Oltean <vladimir.oltean@nxp.com>, 
	Alexandra Winter <wintera@linux.ibm.com>, Julian Braha <julianbraha@gmail.com>, 
	Karthikeyan KS <karthiproffesional@gmail.com>, Pengpeng Hou <pengpeng@iscas.ac.cn>, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jonathan Corbet <corbet@lwn.net>, Joel Stanley <joel@jms.id.au>, 
	Chia-Wei Wang <chiawei_wang@aspeedtech.com>, Oskar Senft <osk@google.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Content-Type: multipart/alternative; boundary="0000000000002595b2065ebc526d"
X-Spam-Status: No, score=0.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,HTML_MESSAGE,MAILING_LIST_MULTI,
	SPF_HELO_PASS,SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--0000000000002595b2065ebc526d
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Kavya,

Thanks for sharing your platform details and starting a separate thread.

I am also Working On OpenBMC through ASRock Rack B650D4U enablement. My
work is still in progress, and I have not worked on the Gigabyte MZ32-AR0
or evaluated development boards within your budget, so I cannot recommend a
specific platform confidently.

For the vendor-restricted shell, I would suggest contacting Gigabyte
support about supported debugging access and recovery procedures.

My practical recovery experience is limited to the ASRock Rack B650D4U that
I am currently working on. I use a CH341A external SPI flash programmer for
BMC firmware recovery.

I have not worked on the Gigabyte MZ32-AR0, so I cannot confirm its
recovery procedure or programmer compatibility. Please verify the flash
device, required voltage, and board-specific recovery instructions before
attempting external programming.

Regards,
Prasanth

On Mon, 26 Oct, 2026, 4:07=E2=80=AFpm KAVYA M M, <kavyamadarsh@gmail.com> w=
rote:

> Hello OpenBMC Team,
>
> I am new to OpenBMC development and would appreciate your guidance on
> getting started with developing and validating an OpenBMC image for a
> server platform.
>
> *I have a few general questions:*
>
> 1. What hardware documentation is normally required to develop a reliable
> OpenBMC image for a new motherboard? Are the user manual and BMC referenc=
e
> schematic sufficient, or are the complete motherboard schematic and
> board-specific signal mappings essential?
> 2. If the original BMC firmware is available only as a binary and the
> motherboard schematic is unavailable, what is the recommended approach fo=
r
> identifying the hardware configuration and developing the initial image?
> 3. Which existing OpenBMC reference platforms are suitable for beginners
> who want to learn the Yocto/BitBake build system, device trees, machine
> configuration, sensor integration, and required services?
> 4. Which hardware platforms provide good support for testing sensor
> monitoring, fan PWM/tachometer control, Redfish, GPIO, host power control=
,
> and power sequencing?
> 5. Which functions can be tested in QEMU, and what hardware documentation
> and recovery facilities are necessary before proceeding with physical-boa=
rd
> testing?
>
> *Request for Guidance on Restricted BMC SSH Access*
>
> I would also like to understand how to access the underlying Linux shell
> on a BMC when SSH access is restricted by the vendor firmware.
>
> For example, some BMCs provide SSH access but expose only a restricted
> interface, such as SMASH-CLP, instead of a standard Linux shell. In such
> cases, what is the recommended and authorized method for accessing the
> underlying Linux environment for debugging, inspecting system
> configuration, and understanding the running services?
>
> Are there standard OpenBMC debugging methods or configuration options for
> enabling SSH shell access during development? If access is restricted by
> the vendor firmware, what documentation or permissions would be required =
to
> investigate this further?
> *My current hardware*
>
> I currently have access to a Gigabyte MZ32-AR0-00 motherboard with an
> ASPEED AST2500 BMC.
>
> I am considering using this board for my OpenBMC development. However, I
> do not have access to the complete motherboard schematic, and some
> board-specific hardware mappings are difficult to confirm from the
> available documentation and original vendor firmware.
>
> I would appreciate your advice on whether this is a suitable platform for
> learning and developing OpenBMC, or whether a different, better-documente=
d
> development platform would be a more practical starting point.
>
> *Request for development-board recommendations*
>
> My budget for purchasing a BMC development board is approximately
> =E2=82=B95,000=E2=80=93=E2=82=B910,000.
>
> Could you recommend a specific development board or server motherboard
> that is affordable, well documented, and preferably has an existing
> upstream OpenBMC machine configuration?
>
> Ideally, I would like a platform that supports learning and testing:
>
> - OpenBMC image building using Yocto/BitBake.
> - Hardware sensor monitoring and integration.
> - Fan PWM/tachometer control and cooling failsafe behavior.
> - Redfish and other BMC management interfaces.
> - GPIO, host power control, and power sequencing.
> - QEMU-based software testing followed by physical-board validation.
>
> My preference is for a platform with an existing reference implementation=
,
> accessible hardware documentation, and a reliable firmware recovery metho=
d.
> Used development boards or server motherboards would also be suitable if
> they are available within my budget.
>
> My goal is to choose the most practical platform, build and validate an
> initial OpenBMC image, and gradually learn the hardware integration proce=
ss
> before attempting to flash a physical BMC.
>
> I would be grateful for any recommendations on suitable hardware, existin=
g
> reference platforms, documentation, or practical guidance from developers
> experienced in OpenBMC platform development.
>
> Thank you for your time and support.
>
> Best regards,
> Kavya M M
>

--0000000000002595b2065ebc526d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">Hi Kavya,<div dir=3D"auto"><br></div><div dir=3D"auto">Th=
anks for sharing your platform details and starting a separate thread.</div=
><div dir=3D"auto"><br></div><div dir=3D"auto">I am also Working On OpenBMC=
 through ASRock Rack B650D4U enablement. My work is still in progress, and =
I have not worked on the Gigabyte MZ32-AR0 or evaluated development boards =
within your budget, so I cannot recommend a specific platform confidently.<=
/div><div dir=3D"auto"><br></div><div dir=3D"auto">For the vendor-restricte=
d shell, I would suggest contacting Gigabyte support about supported debugg=
ing access and recovery procedures.</div><p>My practical recovery experienc=
e is limited to the ASRock Rack B650D4U that I am currently working on. I u=
se a CH341A external SPI flash programmer for BMC firmware recovery.</p><p>=
I have not worked on the Gigabyte MZ32-AR0, so I cannot confirm its recover=
y procedure or programmer compatibility. Please verify the flash device, re=
quired voltage, and board-specific recovery instructions before attempting =
external programming.=C2=A0</p><div dir=3D"auto"><br></div><div dir=3D"auto=
">Regards,</div><div dir=3D"auto">Prasanth</div></div><br><div class=3D"gma=
il_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Mon, 26 Oct, 2026, 4:07=
=E2=80=AFpm KAVYA M M, &lt;<a href=3D"mailto:kavyamadarsh@gmail.com" target=
=3D"_blank" rel=3D"noreferrer">kavyamadarsh@gmail.com</a>&gt; wrote:<br></d=
iv><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left=
:1px #ccc solid;padding-left:1ex"><div dir=3D"ltr"><div dir=3D"ltr">Hello O=
penBMC Team,<br><br>I am new to OpenBMC development and would appreciate yo=
ur guidance on getting started with developing and validating an OpenBMC im=
age for a server platform.<br><br><b>I have a few general questions:</b><br=
><br>1. What hardware documentation is normally required to develop a relia=
ble OpenBMC image for a new motherboard? Are the user manual and BMC refere=
nce schematic sufficient, or are the complete motherboard schematic and boa=
rd-specific signal mappings essential?<br>2. If the original BMC firmware i=
s available only as a binary and the motherboard schematic is unavailable, =
what is the recommended approach for identifying the hardware configuration=
 and developing the initial image?<br>3. Which existing OpenBMC reference p=
latforms are suitable for beginners who want to learn the Yocto/BitBake bui=
ld system, device trees, machine configuration, sensor integration, and req=
uired services?<br>4. Which hardware platforms provide good support for tes=
ting sensor monitoring, fan PWM/tachometer control, Redfish, GPIO, host pow=
er control, and power sequencing?<br>5. Which functions can be tested in QE=
MU, and what hardware documentation and recovery facilities are necessary b=
efore proceeding with physical-board testing?<br><p><strong>Request for Gui=
dance on Restricted BMC SSH Access</strong></p><p>I would also like to unde=
rstand how to access the underlying Linux shell on a BMC when SSH access is=
 restricted by the vendor firmware.</p><p>For example, some BMCs provide SS=
H access but expose only a restricted interface, such as SMASH-CLP, instead=
 of a standard Linux shell. In such cases, what is the recommended and auth=
orized method for accessing the underlying Linux environment for debugging,=
 inspecting system configuration, and understanding the running services?</=
p><p>Are there standard OpenBMC debugging methods or configuration options =
for enabling SSH shell access during development? If access is restricted b=
y the vendor firmware, what documentation or permissions would be required =
to investigate this further?</p><b>My current hardware</b><br><br>I current=
ly have access to a Gigabyte MZ32-AR0-00 motherboard with an ASPEED AST2500=
 BMC.<br><br>I am considering using this board for my OpenBMC development. =
However, I do not have access to the complete motherboard schematic, and so=
me board-specific hardware mappings are difficult to confirm from the avail=
able documentation and original vendor firmware.<br><br>I would appreciate =
your advice on whether this is a suitable platform for learning and develop=
ing OpenBMC, or whether a different, better-documented development platform=
 would be a more practical starting point.<br><br><b>Request for developmen=
t-board recommendations</b><br><br>My budget for purchasing a BMC developme=
nt board is approximately =E2=82=B95,000=E2=80=93=E2=82=B910,000.<br><br>Co=
uld you recommend a specific development board or server motherboard that i=
s affordable, well documented, and preferably has an existing upstream Open=
BMC machine configuration?<br><br>Ideally, I would like a platform that sup=
ports learning and testing:<br><br>- OpenBMC image building using Yocto/Bit=
Bake.<br>- Hardware sensor monitoring and integration.<br>- Fan PWM/tachome=
ter control and cooling failsafe behavior.<br>- Redfish and other BMC manag=
ement interfaces.<br>- GPIO, host power control, and power sequencing.<br>-=
 QEMU-based software testing followed by physical-board validation.<br><br>=
My preference is for a platform with an existing reference implementation, =
accessible hardware documentation, and a reliable firmware recovery method.=
 Used development boards or server motherboards would also be suitable if t=
hey are available within my budget.<br><br>My goal is to choose the most pr=
actical platform, build and validate an initial OpenBMC image, and graduall=
y learn the hardware integration process before attempting to flash a physi=
cal BMC.<br><br>I would be grateful for any recommendations on suitable har=
dware, existing reference platforms, documentation, or practical guidance f=
rom developers experienced in OpenBMC platform development.<br><br>Thank yo=
u for your time and support.<br><br>Best regards,<br>Kavya M M</div>
</div>
</blockquote></div>

--0000000000002595b2065ebc526d--

