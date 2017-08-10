Return-Path: <sdliyong@gmail.com>
Received: from mail-it0-x230.google.com (mail-it0-x230.google.com
 [IPv6:2607:f8b0:4001:c0b::230])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3xSj0p671RzDqrP
 for <openbmc@lists.ozlabs.org>; Thu, 10 Aug 2017 19:06:02 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="XObuitUe"; 
 dkim-atps=neutral
Received: by mail-it0-x230.google.com with SMTP id 76so10216286ith.0
 for <openbmc@lists.ozlabs.org>; Thu, 10 Aug 2017 02:06:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=j139stxh61BGpN3PtV335t7NxkayeIcSHxyUT/RD0Aw=;
 b=XObuitUeRvZW4JYdm8iwQ+HvKLFkXIAdjBtzcBSJYAp/qk1mIjIBFN0h22umW2oBlI
 yd3n2BGrQHjksd+VaQivCfCm2CEoShPTYeeB6IJ9wLLBqxq0qK7qiNQLhBjV92GGsxp2
 snos8tM5KKbYrmN0a80FTBUQtBxbNOHK080bkgxECvYK5OEO/MnA4kXyzHP2y7hhgqs8
 SM++ICcaxRH+/ZdI6WjyzE/Zh7y68ZLnEzMRd766KC8EOvYmAPUWwoblGE78vyYVSLL7
 zG3oSMpV70wXLk97DSI4gpDqIhgO1FXrD7zDXMH7DJbc0x/dSPR78rrHFSBYuxXfPEd3
 MwoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=j139stxh61BGpN3PtV335t7NxkayeIcSHxyUT/RD0Aw=;
 b=CGqcwD6xf5gIPh9mVyEZ9jR78l1mvwIFhFg/MWdWWC+yea6bG97ChWCPL3TI/+bk9D
 2hS5Xh6Y+iUl05medyif5xIL3iBLqMJHzM7FhpDBixJ9aXK3SBdkIbd2udJmD49kWT03
 k0PuAKz+0/KXbVUQqVrlgIlErtDP0H+fiGf0JcTBumUFNK5aEr+/Ht1neUyGxZG3HB5T
 0cLMicY3nCOUQU6yPC8Y5dyamlPqIhAR15s1MNLFilh95eJO1afVIS2jTiCdQotrIR3n
 gtJEVt7soKrr7x9tthda9udFzB33COQKtPpnP81Dyt5WA+cc7z8HbOrcm17paJGfhvEj
 ExQw==
X-Gm-Message-State: AHYfb5hUV939wb1CMyp8z07s6pMnAn0qwdmUFoL38Pg/1yc/5lRHGyc6
 dCfiQ2Qtu1S0QRxBPYU=
X-Received: by 10.36.81.73 with SMTP id s70mr10258250ita.65.1502355959638;
 Thu, 10 Aug 2017 02:05:59 -0700 (PDT)
Received: from [10.23.12.163] ([101.90.125.92])
 by smtp.gmail.com with ESMTPSA id b195sm2998844itb.35.2017.08.10.02.04.54
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 10 Aug 2017 02:05:58 -0700 (PDT)
Content-Type: text/plain;
	charset=gb2312
Mime-Version: 1.0 (1.0)
Subject: Re: AST SOC gpio pass-through support
From: Yong Li <sdliyong@gmail.com>
X-Mailer: iPhone Mail (14G60)
In-Reply-To: <1502353590.7946.15.camel@aj.id.au>
Date: Thu, 10 Aug 2017 17:01:45 +0800
Cc: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Content-Transfer-Encoding: quoted-printable
Message-Id: <B48C8FC6-CC36-4EC0-841D-D6267A7DC63C@gmail.com>
References: <CADO9-pd_r73SxL8eHCYwzK_jhdyfrhFYLrJ0nXif3--Tj1Jc9w@mail.gmail.com>
 <1502353590.7946.15.camel@aj.id.au>
To: Andrew Jeffery <andrew@aj.id.au>
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Thu, 10 Aug 2017 09:06:03 -0000

thanks for your quick response Andrew! i will read these info deeply. just a=
 quick question, is it possible to enable/disable the pass through dynamical=
ly after kernel boots?  how?

> =D4=DA 2017=C4=EA8=D4=C210=C8=D5=A3=AC16:28=A3=ACAndrew Jeffery <andrew@aj=
.id.au> =D0=B4=B5=C0=A3=BA
>=20
> Hi Yong,
>=20
>> On Thu, 2017-08-10 at 15:50 +0800, Yong Li wrote:
>> Hi all,
>=20
> Welcome to the list!
>=20
>>=20
>> AST SOC supports GPIOE pass-through function, I would like to know if
>> the kernel provides such API/interface to enable/disable pass-through?
>=20
> Yes, the kernel's pinmux drivers can configure GPIO passthrough for
> you. In general, all the functions are documented in the pinctrl
> devicetree bindings:
>=20
>    https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree=
/Documentation/devicetree/bindings/pinctrl/pinctrl-aspeed.txt?h=3Dv4.12
>=20
> Specifically, you are after functions/groups GPIE{0,2,4,6}. We already
> have these defined in the Aspeed DTSIs, so to configure them you can
> add something like the following snippet in your devicetree:
>=20
>    &pinctrl {
>            pinctrl-names =3D "default";
>            pinctrl-0 =3D <&pinctrl_gpie0_default
>                    &pinctrl_gpie2_default
>                    &pinctrl_gpie4_default
>                    &pinctrl_gpie6_default>;
>    }
>=20
> Specifying the mux configuration in the pinctrl node is probably as
> good a place as any, though if you have somewhere more relevant you
> should probably use that. Naturally you can remove any of these
> phandles to only select the specific pass-through configurations you
> need.
>=20
> If you want to pass-through the whole bank you can also set the board
> strapping to make it the case right from power-on. The strapping
> register *is* writeable, however the kernel's pinctrl driver treats it
> as read-only, as really, the system designer ought configure it either
> via pull-ups or in the boot firmware.
>=20
> The passthrough capability is a bit of an odd case - despite being GPIO
> I chose to represent it as a pinctrl function. Hope it makes sense to
> you.
>=20
> Cheers,
>=20
> Andrew
