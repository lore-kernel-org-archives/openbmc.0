Return-Path: <joel.stan@gmail.com>
Received: from mail-ob0-x242.google.com (mail-ob0-x242.google.com
 [IPv6:2607:f8b0:4003:c01::242])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id C01731A0019
 for <openbmc@lists.ozlabs.org>; Thu, 11 Feb 2016 14:01:23 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b=ltIZQpO3; 
 dkim=pass (1024-bit key;
 unprotected) header.d=jms.id.au header.i=@jms.id.au header.b=KV4FCgJf; 
 dkim-atps=neutral
Received: by mail-ob0-x242.google.com with SMTP id o4so4149572obb.0
 for <openbmc@lists.ozlabs.org>; Wed, 10 Feb 2016 19:01:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc:content-type;
 bh=/ZbaB5b8q3FC3s3FnwSshzIG9PYLXdqdZiI9XYizMx0=;
 b=ltIZQpO3mun0EbWl9adYLAcp0qqWzcV6VNe9HW+VTQ29FvnbGRSuYryz9Evoqf+ac+
 wwQ6gymU9Qb+2V1ExQDnf4gC0Swj+y++nywGM6ZuaDNGfwf2ZHVrBEgdxxOpe+b081nE
 R9phryovaYHHq6MpvDEy1bw2IJ2CgM3GXiFZN5ZimjgYFVNVyvdCfSmDRKjT9oVE51V1
 +gV6PLTrjQ/UAQ5v9t7CT8Bg9bGpmlBpyM5o52WW6ImfSXA8Pxs/ut4orjZdRk0wCCg2
 p/bSiQYkFFQzvsEdpoPSsYe/o5/tslROpPaYRH4I96QTyhQe0kP+j0DWjx+AURUMeB0Q
 qIKQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc:content-type;
 bh=/ZbaB5b8q3FC3s3FnwSshzIG9PYLXdqdZiI9XYizMx0=;
 b=KV4FCgJfMX2mxsPSGSGkfL7L+KhkmZSyEAvjItjfsONPyXXeMp8P+yUTaDEd22vRu0
 v5Zy1ZhSWeZm3u8iVKZdSUY989jpC8/BTmv6VOSNpaXmdEo/ZfMpHQk0iS2dsCIbmM4O
 00JtrpWrPwaEKZbHFXvWG119ne3EQxxOiQxp4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc:content-type;
 bh=/ZbaB5b8q3FC3s3FnwSshzIG9PYLXdqdZiI9XYizMx0=;
 b=Fx6GeuQW9U2w7emjM31EPwWgNF3nEo1/WPVL1YY819n4d8SmO78TS/xqQeTcwFZTyT
 AjL8unkdnCp/Sl2XJ/JKZLDpUDV97NXkgL+dDdDh/6v5Gcxjo5cUJ++Srky1Wd//7R2X
 hsGWJM+irVMbarAEkbTk2AvDhLiNx4O2TuhwvQrSTdenDbWfr/0934u2AojONQxZnmaF
 DBZD0sCafJa9s7/tBD73ZI84anxVLJKd5mNEbQu1u4UAKaSt8yABAIfgeqRTZrxiD9ql
 UF3pLBuOSU4laB7RR2SHvbwpb/sd/kxgj2mH2fRcrw98XRol1s1FuU3L85Jicc+Cm5IL
 l59w==
X-Gm-Message-State: AG10YOSG17GXtzmArqzV4L7tjUL0oUc1C9COl3jivJA1GxlXVVIQqrot8BbFrQ0KVkep95rE7Iqsw3X47WyU1Q==
X-Received: by 10.182.148.39 with SMTP id tp7mr42361760obb.87.1455159681608;
 Wed, 10 Feb 2016 19:01:21 -0800 (PST)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.60.121.1 with HTTP; Wed, 10 Feb 2016 19:01:02 -0800 (PST)
In-Reply-To: <1455154228-7217-3-git-send-email-openbmc-patches@stwcx.xyz>
References: <1455154228-7217-1-git-send-email-openbmc-patches@stwcx.xyz>
 <1455154228-7217-3-git-send-email-openbmc-patches@stwcx.xyz>
From: Joel Stanley <joel@jms.id.au>
Date: Thu, 11 Feb 2016 13:31:02 +1030
X-Google-Sender-Auth: cPZ9RtnFDZqKWebCo_ZTyyNdojg
Message-ID: <CACPK8Xca8S5NpKH6wHf=xWYG7zAg8Q3VYw=ZRV7ctD6zkaH9XA@mail.gmail.com>
Subject: Re: [PATCH linux 2/2] arm: dts: unit address should not have 0x prefix
To: OpenBMC Patches <openbmc-patches@stwcx.xyz>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: text/plain; charset=UTF-8
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
X-List-Received-Date: Thu, 11 Feb 2016 03:01:26 -0000

On Thu, Feb 11, 2016 at 12:00 PM, OpenBMC Patches
<openbmc-patches@stwcx.xyz> wrote:
> From: "Milton D. Miller II" <miltonm@us.ibm.com>
>
> The implied format for most bus bindings implies the uname-address
> part of the unit-name should be in hex without a leading 0x.
>
> Fix the one i2c bus that did not follow this convention.
>
> Signed-off-by: Milton Miller <miltonm@us.ibm.com>

Thanks, applied.

> ---
>  arch/arm/boot/dts/ast2400.dtsi | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/arch/arm/boot/dts/ast2400.dtsi b/arch/arm/boot/dts/ast2400.dtsi
> index de816a9..49516fd 100644
> --- a/arch/arm/boot/dts/ast2400.dtsi
> +++ b/arch/arm/boot/dts/ast2400.dtsi
> @@ -159,7 +159,7 @@
>                                         interrupts = <4>;
>                                 };
>
> -                               i2c5: i2c-bus@0x180 {
> +                               i2c5: i2c-bus@180 {
>                                         #address-cells = <1>;
>                                         #size-cells = <0>;
>                                         reg = <0x180 0x40>;
> --
> 2.7.1
>
>
> _______________________________________________
> openbmc mailing list
> openbmc@lists.ozlabs.org
> https://lists.ozlabs.org/listinfo/openbmc
