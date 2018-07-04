Return-Path: <henbinchang@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:400d:c0d::229; helo=mail-qt0-x229.google.com;
 envelope-from=henbinchang@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="kGep5WYN"; 
 dkim-atps=neutral
Received: from mail-qt0-x229.google.com (mail-qt0-x229.google.com
 [IPv6:2607:f8b0:400d:c0d::229])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 41L4670k0rzF1Dg
 for <openbmc@lists.ozlabs.org>; Wed,  4 Jul 2018 12:03:42 +1000 (AEST)
Received: by mail-qt0-x229.google.com with SMTP id c5-v6so3365589qth.5
 for <openbmc@lists.ozlabs.org>; Tue, 03 Jul 2018 19:03:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=+6z0oXiXm71jR5Syy6Bnz2cAfWxMBselg/5a0r2CWOQ=;
 b=kGep5WYNZPtTa90AVZxEQpUngIIMAPyJL3B/fznwcnYCXv1JdG2HpUHU7oPkWtUT8x
 wenXHX6+PIN/E6/m25Km6GZabnR8WYwbM2ka/cXfC16b1N7HmC3Lubk3HIZl4Cg7UZ8b
 1yesDvne+wL4MCDilIZ8p7tHIb7x8v1BkxuJPIs8+ApSEbRJDK1fTtskxuETXDCeRRJ4
 6ed9MChfnxzS/3y8Cd6dMN6whYvieuWMycuKjVMfb2R6aIRZHIe9tkQSW34PA2PzSYKc
 XcWzYoM1Q4hNBaFY3BllQ81uXIWiFDgesPxZCuxc9H9EHglBTUVdQ8C4AtzXemfwu55Q
 bH0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=+6z0oXiXm71jR5Syy6Bnz2cAfWxMBselg/5a0r2CWOQ=;
 b=Je3sq2tt+lzglAibDunxikH9U58vgzicJDh0/ecZxAiwRP/446QrIZdRGqWpK5ez5J
 AVSXFsnjguwBqAY44oLfkoN21kXz7S+ZM6gW1CZv01pCNFMdZidx37s4VbWPab/uQ1h9
 AlugnOcF3OuFn9V7NaEk3GG05yhfpkxpITtSUQHPMiZf3ksIuHBauaSXTC9oBpem3S1O
 fYZbxDHAQ3CF/Fs5N23lmIMRnBunl2WYGHNCpCWrrgj+4uX6at+56tX+leWDdlTPJ6kq
 oh/qIenCG7vROZZSOCnCHKJIT0kiJaC6u2aUmqawwAcqJSCU6/wqmRkBta1iHo7O/LHV
 a+LQ==
X-Gm-Message-State: APt69E1Kq/oERUZjV6RvvjqYDYNgZ/WssHYdRzkbjeyZIW6EFjdnCfT3
 ShfgVlhw3l2lEMkrsfDqYBOZ/NR51oE8gPd0cdg=
X-Google-Smtp-Source: AAOMgpfJfvcjTTLbGip0ozIjDDOxZ2sUaUdh7PsctUobJln4+yeBgNlowaNCRHHmlsu6DYoedlHOZYWQEw4+xRr+hHs=
X-Received: by 2002:ac8:709:: with SMTP id g9-v6mr98456qth.110.1530669819957; 
 Tue, 03 Jul 2018 19:03:39 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:aed:26a7:0:0:0:0:0 with HTTP;
 Tue, 3 Jul 2018 19:03:39 -0700 (PDT)
In-Reply-To: <CAARXrtm1ELUMV_Hh9VNF21fMXeKnn3RpOhABLfaWRPk05Gd=RA@mail.gmail.com>
References: <CAG9c7cCPZFFg65e-1iOSkLqgb26-2t1SqH_AZ4JjB5-TigNqzw@mail.gmail.com>
 <CAARXrtm1ELUMV_Hh9VNF21fMXeKnn3RpOhABLfaWRPk05Gd=RA@mail.gmail.com>
From: Henbin Chang <henbinchang@gmail.com>
Date: Wed, 4 Jul 2018 10:03:39 +0800
Message-ID: <CAG9c7cApfyerEPeZ7e=WBN1nfcgMrxT0Yvy-vSP66S1+-KJYJA@mail.gmail.com>
Subject: Re: How to override default Kernel config
To: Lei YU <mine260309@gmail.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: multipart/alternative; boundary="000000000000e31506057022d689"
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
X-List-Received-Date: Wed, 04 Jul 2018 02:03:44 -0000

--000000000000e31506057022d689
Content-Type: text/plain; charset="UTF-8"

Thanks Lei Yu.

Actually, I want to enable CONFIG_DEVMEM in my specific machine.
I added the below config to my machine.cfg
CONFIG_DEVMEM=y
CONFIG_HWMON=y
CONFIG_SENSORS_TMP421=y

But I still saw the line in the ".config" after devtool modify linux-aspeed.
# CONFIG_DEVMEM is not set

How should I do?

Thanks.

2018-07-04 9:39 GMT+08:00 Lei YU <mine260309@gmail.com>:

> > I would like to enable a specific Kernel config in my machine.
> > I don't want to modify the 'defconfig'
> >
> > Could anyone tell me how to do?
>
> Please refer to machine-layer recipes, e.g. meta-romulus' linux recipe:
> https://github.com/openbmc/openbmc/tree/master/meta-openbmc-machines/meta-
> openpower/meta-ibm/meta-romulus/recipes-kernel/linux
>

--000000000000e31506057022d689
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Thanks Lei Yu.<div><br></div><div>Actually, I want to enab=
le CONFIG_DEVMEM in my specific machine.</div><div>I added the below config=
 to my machine.cfg</div><div>CONFIG_DEVMEM=3Dy<br></div><div><div>CONFIG_HW=
MON=3Dy</div><div>CONFIG_SENSORS_TMP421=3Dy</div><div><div><br></div></div>=
</div><div>But I still saw the line in the &quot;.config&quot; after devtoo=
l modify linux-aspeed.</div><div># CONFIG_DEVMEM is not set<br></div><div><=
br></div><div>How should I do?</div><div><br></div><div>Thanks.</div><div c=
lass=3D"gmail_extra"><br><div class=3D"gmail_quote">2018-07-04 9:39 GMT+08:=
00 Lei YU <span dir=3D"ltr">&lt;<a href=3D"mailto:mine260309@gmail.com" tar=
get=3D"_blank">mine260309@gmail.com</a>&gt;</span>:<br><blockquote class=3D=
"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(2=
04,204,204);padding-left:1ex"><span class=3D"gmail-">&gt; I would like to e=
nable a specific Kernel config in my machine.<br>
&gt; I don&#39;t want to modify the &#39;defconfig&#39;<br>
&gt;<br>
&gt; Could anyone tell me how to do?<br>
<br>
</span>Please refer to machine-layer recipes, e.g. meta-romulus&#39; linux =
recipe:<br>
<a href=3D"https://github.com/openbmc/openbmc/tree/master/meta-openbmc-mach=
ines/meta-openpower/meta-ibm/meta-romulus/recipes-kernel/linux" rel=3D"nore=
ferrer" target=3D"_blank">https://github.com/openbmc/<wbr>openbmc/tree/mast=
er/meta-<wbr>openbmc-machines/meta-<wbr>openpower/meta-ibm/meta-<wbr>romulu=
s/recipes-kernel/linux</a><br>
</blockquote></div><br></div></div>

--000000000000e31506057022d689--
