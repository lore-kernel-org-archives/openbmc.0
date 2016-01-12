Return-Path: <dja@axtens.net>
Received: from mail-pf0-x243.google.com (mail-pf0-x243.google.com
 [IPv6:2607:f8b0:400e:c00::243])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 66E3F1A1943
 for <openbmc@lists.ozlabs.org>; Tue, 12 Jan 2016 11:04:52 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=axtens.net header.i=@axtens.net header.b=SRqmGH+y; 
 dkim-atps=neutral
Received: by mail-pf0-x243.google.com with SMTP id 65so4153286pfd.1
 for <openbmc@lists.ozlabs.org>; Mon, 11 Jan 2016 16:04:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axtens.net; s=google;
 h=from:to:subject:in-reply-to:references:user-agent:date:message-id
 :mime-version:content-type;
 bh=WaBdX0ZKacvGH7AIqx49H4oMSp1QlPapc3iiOcLEK2E=;
 b=SRqmGH+yUwCGlTtQjSFVSIeIIr9ff9IQdjzvgImk1elNdhouzdb3zlW3oJlICiwQF1
 ttEx25XMitw/Uhc8NF07TgjIU2UcgGao1NkeMwaph/tmjrXmaktelIjc7BXReWuh8dEi
 H/VbD9UtEJ1f5JdGRxQWQRycYpsvXQ56ar2ac=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:from:to:subject:in-reply-to:references
 :user-agent:date:message-id:mime-version:content-type;
 bh=WaBdX0ZKacvGH7AIqx49H4oMSp1QlPapc3iiOcLEK2E=;
 b=eSlvXn0SIS0+lrbmhJ8vh95uIpvZyE4p2qrOS90Soc2wkPqNMReF5570XxllTK9C1e
 ANVTmynEwwQpK6jI5tjDUTB7B9C0imHnYkL2tyKRs9RY4Xr3rX8+zMJ5ZYkeloM1Lw/e
 suxSrZSQPFRMEikbk6UE92UXNesya2VHs2B22x5RCGHMPUA22+ENvga9Y9e2UGhlcuWN
 n10heUcqQqVgo5oVQaI9uYGa7dSesphiwSdbIrFxQ+RLLdPWOYZKR1rePFzE9xrN3qqm
 j9tGXOFtA0AfDA02DtTsLP91kjductdDsjb3UWDSLhqJ/95P4PV+R7PKqmIPrnivbW4j
 pn5w==
X-Gm-Message-State: ALoCoQmvs4BS7QyTSaEnHPbWbXf35E7plb0yTSHhGWnK7JBVVHYFYR3VfxYZPZx1HcucgPayhBQ6kiS2WbMWUOavENDPS/Wo3w==
X-Received: by 10.98.42.81 with SMTP id q78mr29949252pfq.142.1452557090693;
 Mon, 11 Jan 2016 16:04:50 -0800 (PST)
Received: from localhost (ppp121-45-193-224.lns20.cbr1.internode.on.net.
 [121.45.193.224])
 by smtp.gmail.com with ESMTPSA id qj8sm47153078pac.40.2016.01.11.16.04.48
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 11 Jan 2016 16:04:50 -0800 (PST)
From: Daniel Axtens <dja@axtens.net>
To: OpenBMC Patches <openbmc-patches@stwcx.xyz>, openbmc@lists.ozlabs.org
Subject: Re: [PATCH skeleton] support for W25Q256BV
In-Reply-To: <1452529251-12764-2-git-send-email-openbmc-patches@stwcx.xyz>
References: <1452529251-12764-1-git-send-email-openbmc-patches@stwcx.xyz>
 <1452529251-12764-2-git-send-email-openbmc-patches@stwcx.xyz>
User-Agent: Notmuch/0.21 (http://notmuchmail.org) Emacs/24.5.1
 (x86_64-pc-linux-gnu)
Date: Tue, 12 Jan 2016 11:04:34 +1100
Message-ID: <871t9n7je5.fsf@gamma.ozlabs.ibm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
 micalg=pgp-sha512; protocol="application/pgp-signature"
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.20
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Tue, 12 Jan 2016 00:04:52 -0000

--=-=-=
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

OpenBMC Patches <openbmc-patches@stwcx.xyz> writes:

"What's a W25Q256BV?"

(I mean, I can see from the code that it's a flash chip, but would it be
possible to put that in the commit message please?)


> From: Chris Austen <austenc@us.ibm.com>
>
> ---
>  objects/pflash/libflash/libflash.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/objects/pflash/libflash/libflash.c b/objects/pflash/libflash=
/libflash.c
> index 01eee97..762d9e7 100644
> --- a/objects/pflash/libflash/libflash.c
> +++ b/objects/pflash/libflash/libflash.c
> @@ -9,6 +9,7 @@ static const struct flash_info flash_info[] =3D {
>  	{ 0xc22019, 0x02000000, FL_ERASE_ALL | FL_CAN_4B, "Macronix MXxxL25635F=
"},
>  	{ 0xc2201a, 0x04000000, FL_ERASE_ALL | FL_CAN_4B, "Macronix MXxxL51235F=
"},
>  	{ 0xef4018, 0x01000000, FL_ERASE_ALL,             "Winbond W25Q128BV"  =
 },
> +	{ 0xef4019, 0x02000000, FL_ERASE_ALL | FL_CAN_4B | FL_ERASE_64K|FL_ERAS=
E_BULK,    "Winbond W25Q256BV"},
I think this should be wrapped like the Micron below?
        { 0xef4019, 0x02000000, FL_ERASE_ALL | FL_CAN_4B |
                                FL_ERASE_64K | FL_ERASE_BULK,
                                                          "Winbond
                                                          W25Q256BV"},
>  	{ 0x20ba20, 0x04000000, FL_ERASE_4K  | FL_ERASE_64K | FL_CAN_4B |
>                                  FL_ERASE_BULK | FL_MICRON_BUGS,
>                                                            "Micron N25Qx5=
12Ax"   },

Regards,
Daniel

> --=20
> 2.6.4
>
>
> _______________________________________________
> openbmc mailing list
> openbmc@lists.ozlabs.org
> https://lists.ozlabs.org/listinfo/openbmc

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1
Comment: GPGTools - https://gpgtools.org

iQIcBAEBCgAGBQJWlEMSAAoJEPC3R3P2I92Fjz4P+wUjVGr0cBqDyECm751mk8DU
U+wcDbbWxUpv2GH8U/COQtiEX7IIFZ6AbALqM/1H877OlNF1OuYLuymkdSiLQu4o
7eVYyA2FH3mo8VsNOZcRICKf9tWpBUyX65HrI3PVgq7iTVGpQDSsoxpRoj3ONqYZ
6/eW0B9QC5cPwbV3bjsoetHfo8IEwuPgmafWIToV3ZKHbfDLNdg8GzI+tu0vg+F9
7hxGN9vdCc2LztLgykX96AgzWa/MX0LXdACDspZYQHTl5Lpg9G2widpstGWx7gO/
zFJp0iL4CHz3+70HGc92lU7paECzGaQiaUW3+GKi5MSRs7Lvh3GuLj+qTYHKfRIx
iMTrIi4PjmQBso3m5rkk0g09k5fdiy9iiUMDX9Z8OTojVug1JX9Io5cJ6oZLQjuM
vaN3WRBOccorAYU/qrP0rq2Tvaq0R22zoXZ6M+goXKTTT4iElqgbJLVkVol7+LwS
0p24u3UxGqxAkUrXjISq/IBKG1D0pyh2h/95lGfdxvAI+z8CtXg6w1l/jxqUytCc
bQu9d0LYFY3mrf9SrbM7W0hpWm46cxk0Q0QiCTzZb8x4aUwmSt2K6lqocBD5behA
P4+HvjmrWmy8eaai2oozTOIu/7geQXoXea5kE4X1fDZAgzwbCL0Lbunu6Qlxryi/
wvgV/EMAJIUYheEhFnJq
=JMLP
-----END PGP SIGNATURE-----
--=-=-=--
