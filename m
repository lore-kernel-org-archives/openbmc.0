Return-Path: <aaron_ppus@fmad.com>
Authentication-Results: lists.ozlabs.org;
 spf=neutral (mailfrom) smtp.mailfrom=fmad.com
 (client-ip=69.89.30.42; helo=gproxy3-pub.mail.unifiedlayer.com;
 envelope-from=aaron_ppus@fmad.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=fmad.com
Authentication-Results: lists.ozlabs.org;
 dkim=policy reason="signing key too small" (768-bit key;
 unprotected) header.d=fmad.com header.i=@fmad.com header.b="iJLH5zLY"; 
 dkim-atps=neutral
Received: from gproxy3-pub.mail.unifiedlayer.com
 (gproxy3-pub.mail.unifiedlayer.com [69.89.30.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 41RJNp1CFQzDr0d
 for <openbmc@lists.ozlabs.org>; Fri, 13 Jul 2018 00:34:33 +1000 (AEST)
Received: from cmgw12.unifiedlayer.com (unknown [10.9.0.12])
 by gproxy3.mail.unifiedlayer.com (Postfix) with ESMTP id C95D242C56
 for <openbmc@lists.ozlabs.org>; Thu, 12 Jul 2018 08:22:52 -0600 (MDT)
Received: from box313.bluehost.com ([69.89.31.113]) by cmsmtp with ESMTP
 id dcUefMPRmak7tdcUefsUJH; Thu, 12 Jul 2018 08:22:52 -0600
X-Authority-Reason: nr=8
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=fmad.com;
 s=default; h=Content-Type:To:Subject:Message-ID:Date:From:References:
 In-Reply-To:MIME-Version:Sender:Reply-To:Cc:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=IPLYamwHhltrR/81QN4oD975D9SAoIAKV5rW3WOy4Ps=; b=iJLH5zLYx7yPu0OhIcaqQ/Rohb
 9lgxujCwkrukYTdpAuQ4S26KjHWQf1ww3vyjwJvGyiIN70YTCzz9+jk1L5wgAqCbN8Gt+GJiq6LRZ
 0odlAuSDyL7PRkwe9Hr7XrBaY;
Received: from mail-oi0-f49.google.com ([209.85.218.49]:36067)
 by box313.bluehost.com with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
 (Exim 4.91) (envelope-from <aaron_ppus@fmad.com>) id 1fdcUe-003yZF-Jh
 for openbmc@lists.ozlabs.org; Thu, 12 Jul 2018 08:22:52 -0600
Received: by mail-oi0-f49.google.com with SMTP id r16-v6so56127711oie.3
 for <openbmc@lists.ozlabs.org>; Thu, 12 Jul 2018 07:22:52 -0700 (PDT)
X-Gm-Message-State: AOUpUlGG0ePKbvFvw0020pIpTJCSGt0sAlr+4bX94eY6lSTCoa7N/kd4
 6Lij0UvnYfKMgQhpnSIIOYaB32fgabPf1IsuRw==
X-Google-Smtp-Source: AAOMgpdHIkAE2Slbswzs3YC8uJ6O3m1c0hbbw89XUvkHeT4nRbqFYpbsbbFoLGh18V5lVH0K1C+pvYe+g+CsK1ySp54=
X-Received: by 2002:aca:5347:: with SMTP id
 h68-v6mr2725806oib.281.1531405371986; 
 Thu, 12 Jul 2018 07:22:51 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:aca:ce05:0:0:0:0:0 with HTTP; Thu, 12 Jul 2018 07:22:51
 -0700 (PDT)
In-Reply-To: <CABq4n+RwYT8UN4EO75DkhMr2zKnPQW-PEbKtYB+Tb1yA_JYawQ@mail.gmail.com>
References: <CABq4n+RwYT8UN4EO75DkhMr2zKnPQW-PEbKtYB+Tb1yA_JYawQ@mail.gmail.com>
From: Aaron <aaron_ppus@fmad.com>
Date: Thu, 12 Jul 2018 23:22:51 +0900
X-Gmail-Original-Message-ID: <CABq4n+Qw_vq1QZpYdgiB9LofUp0MZchkzXXOqiUC+vyqCKR-KQ@mail.gmail.com>
Message-ID: <CABq4n+Qw_vq1QZpYdgiB9LofUp0MZchkzXXOqiUC+vyqCKR-KQ@mail.gmail.com>
Subject: Re: AST2400 x86 bringup LPC problems
To: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: multipart/alternative; boundary="00000000000034587d0570ce1994"
X-AntiAbuse: This header was added to track abuse,
 please include it with any abuse report
X-AntiAbuse: Primary Hostname - box313.bluehost.com
X-AntiAbuse: Original Domain - lists.ozlabs.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - fmad.com
X-BWhitelist: no
X-Source-IP: 209.85.218.49
X-Source-L: No
X-Exim-ID: 1fdcUe-003yZF-Jh
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: mail-oi0-f49.google.com [209.85.218.49]:36067
X-Source-Auth: aaron_ppus@fmad.com
X-Email-Count: 1
X-Source-Cap: Zm1hZGNvbTtmbWFkY29tO2JveDMxMy5ibHVlaG9zdC5jb20=
X-Org: HG=bhcustomer;ORG=bluehost;
X-Local-Domain: yes
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.27
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Thu, 12 Jul 2018 14:34:35 -0000

--00000000000034587d0570ce1994
Content-Type: text/plain; charset="UTF-8"

Per usual found the issue after spamming the list. The LCLK was disabled
because lpc_ctrl was not setup correctly and error`ed out which cleans up
and disables the lclk entirely... doh.

Aaron

On 12 July 2018 at 16:47, Aaron <aaron_ppus@fmad.com> wrote:

> Hi,
>
> Currently stuck bringup an x86 server board with the AST2400 and looking
> for advice.
>
> Have based the code on the Quanta machine, theres a bunch of dst changes
> and different gpio / i2c etc mappings. Most things work now, power control,
> can control, gpios are good etc however the LPC is broken.
>
> What I cant working out is why the LPC interface is completely dead.
>
> Symptoms are:
> - LPC post code sniffer caches nothing
> - Host UART is completely missing
> - Host IO port range reading returns 0xff`s
>
> Its as if the LPC block is not being reset or theres no clock or being
> muxed out or something. Been a few days now and still cant work it out.
>
> Originally thought it was because Strap[14] = 1  (LPC reset not connected
> to PCI reset) but on the board they physically routed PERST to the to the
> pin, so it should be ok.
>
> Any suggestions or advice ?
>
> Thanks
> Aaron
>
>
>

--00000000000034587d0570ce1994
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Per usual found the issue after spamming the list. The LCL=
K was disabled because lpc_ctrl was not setup correctly and error`ed out wh=
ich cleans up and disables the lclk entirely... doh.<div><br></div><div>Aar=
on</div></div><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">On =
12 July 2018 at 16:47, Aaron <span dir=3D"ltr">&lt;<a href=3D"mailto:aaron_=
ppus@fmad.com" target=3D"_blank">aaron_ppus@fmad.com</a>&gt;</span> wrote:<=
br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left=
:1px #ccc solid;padding-left:1ex"><div dir=3D"ltr">Hi,<div><br></div><div>C=
urrently stuck bringup an x86 server board with the AST2400 and looking for=
 advice.</div><div><br></div><div>Have based the code on the Quanta machine=
, theres a bunch of dst changes and different gpio / i2c etc mappings. Most=
 things work now, power control, can control, gpios are good etc however th=
e LPC is broken.</div><div><br></div><div>What I cant working out is why th=
e LPC interface is completely dead.</div><div><br></div><div>Symptoms are:<=
/div><div>- LPC post code sniffer caches nothing</div><div>- Host UART is c=
ompletely missing</div><div>- Host IO port range reading returns 0xff`s=C2=
=A0</div><div><br></div><div>Its as if the LPC block is not being reset or =
theres no clock or being muxed out or something. Been a few days now and st=
ill cant work it out.</div><div><br></div><div>Originally thought it was be=
cause Strap[14] =3D 1=C2=A0 (LPC reset not connected to PCI reset) but on t=
he board they physically routed PERST to the to the pin, so it should be ok=
.</div><div><br></div><div>Any suggestions or advice ?</div><div><br></div>=
<div>Thanks</div><span class=3D"HOEnZb"><font color=3D"#888888"><div>Aaron<=
/div><div><br></div><div><br></div></font></span></div>
</blockquote></div><br></div>

--00000000000034587d0570ce1994--
