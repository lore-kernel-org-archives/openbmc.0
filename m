Return-Path: <sdliyong@gmail.com>
Received: from mail-it0-x230.google.com (mail-it0-x230.google.com
 [IPv6:2607:f8b0:4001:c0b::230])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3xSj244TfqzDqrP
 for <openbmc@lists.ozlabs.org>; Thu, 10 Aug 2017 19:07:08 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="iUlnTQOg"; 
 dkim-atps=neutral
Received: by mail-it0-x230.google.com with SMTP id 77so10233676itj.1
 for <openbmc@lists.ozlabs.org>; Thu, 10 Aug 2017 02:07:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=dKBYlbElwSBDbalL1BpORGDb4JvEs4+/tpadCHX9B4I=;
 b=iUlnTQOgS+QpaU7d+PV8V6szr/rk5XxDHF1b8F0yHNNhXvpvObYJRcRxuK/nYK1ZhG
 O/EpDJGTYxNcXKYPQLvqCmFpUBGlWuK2AoUWio9S9dccm1+J451XWCzFgQt+WyY6GvGq
 rQD3LHWRXOjD5q/Jt1Haa4/Oio0nx2eMbOdiJXmeWuKGm4LeaVmzj1SOs8Q05xA0Cg/l
 lodfQtKHybOJN8OCw3gE49NW0+rjB7WCv2W/8JjbDecnHhe6mDQFF7nkyp+24Rc2HhtA
 XOsf3CvurAmQkeyvYzxl84RiLM5VkAjJi5CxVQCJRLqOEJf9YQa19C5AieUtBn5/gYra
 0HsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=dKBYlbElwSBDbalL1BpORGDb4JvEs4+/tpadCHX9B4I=;
 b=XvJSeYflIIAeldFGVb+Z/GF0MgyQvpl8sLZVdKA3u0C7zfvxvePFbs0/YBrxPx/ECw
 Tjp6QVMTklKq6hlRcyJYopFqotHF0T0QFotpBpbQpIdqwLUOot2a5Eeev3CuYT5/trJG
 bp0bTCU20u4PeTfjZxnPNb6RHHDux8v5XvxJn43GCBWwmd1VqaSDDWPjCF6c2ttJ0fiR
 sCuNxXYTqiigyN+VgG8Mf+N6rCcPuwV414gwDhIFP2fWjkYEK8FG3+55a7xCP053tBFE
 dcrbxuVCuHEmlWWTzU6xUMZoeum4n0wBu5evGfonVeEPPZdcQ+7WGiCICN3nPIBoPtGE
 ImGg==
X-Gm-Message-State: AIVw113wNgx1kfJsG1Dnn5LReB6sArqoPUDnoXgYNdCqxHFmwCq0V0f4
 NO32D62eztFqoModWXs=
X-Received: by 10.36.51.6 with SMTP id k6mr9184542itk.77.1502356026713;
 Thu, 10 Aug 2017 02:07:06 -0700 (PDT)
Received: from [10.23.12.163] ([101.90.125.92])
 by smtp.gmail.com with ESMTPSA id g63sm2877058iod.8.2017.08.10.02.07.00
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 10 Aug 2017 02:07:06 -0700 (PDT)
Content-Type: text/plain;
	charset=gb2312
Mime-Version: 1.0 (1.0)
Subject: Re: AST SOC gpio pass-through support
From: Yong Li <sdliyong@gmail.com>
X-Mailer: iPhone Mail (14G60)
In-Reply-To: <1502353590.7946.15.camel@aj.id.au>
Date: Thu, 10 Aug 2017 17:06:34 +0800
Cc: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Content-Transfer-Encoding: quoted-printable
Message-Id: <EC7284AD-1A7E-4071-9610-2917FBB76C53@gmail.com>
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
X-List-Received-Date: Thu, 10 Aug 2017 09:07:09 -0000

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
>   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/=
Documentation/devicetree/bindings/pinctrl/pinctrl-aspeed.txt?h=3Dv4.12
>=20
> Specifically, you are after functions/groups GPIE{0,2,4,6}. We already
> have these defined in the Aspeed DTSIs, so to configure them you can
> add something like the following snippet in your devicetree:
>=20
>   &pinctrl {
>           pinctrl-names =3D "default";
>           pinctrl-0 =3D <&pinctrl_gpie0_default
>                   &pinctrl_gpie2_default
>                   &pinctrl_gpie4_default
>                   &pinctrl_gpie6_default>;
>   }
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
