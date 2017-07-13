Return-Path: <maxims@google.com>
Received: from mail-wr0-x22d.google.com (mail-wr0-x22d.google.com
 [IPv6:2a00:1450:400c:c0c::22d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3x7hQS0fZKzDqk3
 for <openbmc@lists.ozlabs.org>; Fri, 14 Jul 2017 02:40:47 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="sw54ZANS"; 
 dkim-atps=neutral
Received: by mail-wr0-x22d.google.com with SMTP id 77so56082538wrb.1
 for <openbmc@lists.ozlabs.org>; Thu, 13 Jul 2017 09:40:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=XvFFrIqTrEfbo7kE5vTA6wGr9bnAD12PVYF1zS7I6F8=;
 b=sw54ZANS0Bor/V/HqqH3/901LNf5XcZN18jbmL5l4ywDaDnnGHgfIWXrxtXeBIbj4a
 IgvQ6UBmuvOwQ9B0Fo/LBiqbHzQM+4NPNlkRXixt0MfHDAAcVMxgH+LzMqAQHiYYL2rE
 Lpq2m93WXEPztCSF5bxciNH/bacCJiIr9r4iY4OMxuhGgMvO5OEhuW6/A51JKUhSyJ8i
 58B2gpnB4l6q6ja+I9bAbw2bfmSgrqZVWjaY4C9/mf49GoHLXqU31PrVE92C+Es8WvHN
 62A5XdHAztOgc+AEvizz7zH0lq/U9cee01jVeilRllkhSYmQyrNyYeHlmiCeF8YSOeq/
 AmfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=XvFFrIqTrEfbo7kE5vTA6wGr9bnAD12PVYF1zS7I6F8=;
 b=MuWqJqNlfrGd+SrZEGRhOjTBwnpCPmHxo3ae+Z7UDhC1RzWTBmgcQ/CoErKU6V3C9E
 Om6ghTwxDHH+DvpMpmGYVWdokAY2Np6D15/cGfIgjeNFY2yj4EzeI3lxl899MEVDAZX6
 7sSD2iR+gWY51VFS1bIUWipUF14z0SbcJqmG4BLVn0/fAhiZmmgq/Om694IMuVUdqMZ+
 Ln0rgFzf4T1lGa+GVxwpGaFlV7EyDtDupdM8MhiO1eGKLXaPMhXocBSlm1DTVqrOnXZO
 eENsnLnlU3sPiMujychgV05qsZD0t1n6b8U1mUuuy6ToCK48AysBhbm4kq+Hvm07XwZL
 uC8Q==
X-Gm-Message-State: AIVw112xAxuFLgFJb4S5H1W7f0Iv5JcIzZaFrjSHXlmavTOKkJqYccao
 XO5nH4zuAivodP1s9ap+sUSI2LP59DRl
X-Received: by 10.223.157.35 with SMTP id k35mr2084127wre.156.1499964045130;
 Thu, 13 Jul 2017 09:40:45 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.28.134.19 with HTTP; Thu, 13 Jul 2017 09:40:44 -0700 (PDT)
In-Reply-To: <CACPK8Xfg+=fdvpUu2epQMdtMaCu6Be1cLxELJ0OM+ac5ZMQWSQ@mail.gmail.com>
References: <CAFR_W8pJRVbb75NKmZcE=S1tHsQ8F4NSUToGgJ0vavaJKkEaWQ@mail.gmail.com>
 <BF2D9544-F30B-445F-A336-2A5C0CF5E3AF@fuzziesquirrel.com>
 <CAFR_W8rJ1iQ4CLe+fBd8_pB8b8LP=Mn5oTb0bamAETY0vC2ErQ@mail.gmail.com>
 <CAPLgG=k=Tvtp3JuC601eiS6jHPF=F_Ye5e=z9BC1h1OyzAR1xQ@mail.gmail.com>
 <1499905281.4935.13.camel@aj.id.au>
 <CACPK8Xfg+=fdvpUu2epQMdtMaCu6Be1cLxELJ0OM+ac5ZMQWSQ@mail.gmail.com>
From: Maxim Sloyko <maxims@google.com>
Date: Thu, 13 Jul 2017 09:40:44 -0700
Message-ID: <CAFR_W8pbKUX8HNj=fHHgDQjFs41GT-s868GaUZ5j-0WmZN9Kxw@mail.gmail.com>
Subject: Re: Linux Kernel PMBus drivers
To: Joel Stanley <joel@jms.id.au>
Cc: Rick Altherr <raltherr@google.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>, 
 Brad Bishop <bradleyb@fuzziesquirrel.com>, Andrew Jeffery <andrew@aj.id.au>
Content-Type: multipart/alternative; boundary="f40304388d0c166dff05543598f7"
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
X-List-Received-Date: Thu, 13 Jul 2017 16:40:48 -0000

--f40304388d0c166dff05543598f7
Content-Type: text/plain; charset="UTF-8"

Thanks, everyone!

On Wed, Jul 12, 2017 at 6:03 PM, Joel Stanley <joel@jms.id.au> wrote:

> Hey Maxim
>
> On Thu, Jul 13, 2017 at 9:51 AM, Andrew Jeffery <andrew@aj.id.au> wrote:
> >> On Wed, Jul 12, 2017 at 2:17 PM, Maxim Sloyko <maxims@google.com>
> >> wrote:
> >> > Hi Brad,
> >> >
> >> > Thanks for the info. Do you know which kernel subtree should I be
> >> > basing my patches on?
>
> Looks like everyone has you sorted :) Ping me if you need help with
> anything else.
>
> Cheers,
>
> Joel
>



-- 
*M*axim *S*loyko

--f40304388d0c166dff05543598f7
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Thanks, everyone!<br><div class=3D"gmail_extra"><br><div c=
lass=3D"gmail_quote">On Wed, Jul 12, 2017 at 6:03 PM, Joel Stanley <span di=
r=3D"ltr">&lt;<a href=3D"mailto:joel@jms.id.au" target=3D"_blank">joel@jms.=
id.au</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"m=
argin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">Hey Maxim<br>
<span class=3D""><br>
On Thu, Jul 13, 2017 at 9:51 AM, Andrew Jeffery &lt;<a href=3D"mailto:andre=
w@aj.id.au">andrew@aj.id.au</a>&gt; wrote:<br>
&gt;&gt; On Wed, Jul 12, 2017 at 2:17 PM, Maxim Sloyko &lt;<a href=3D"mailt=
o:maxims@google.com">maxims@google.com</a>&gt;<br>
&gt;&gt; wrote:<br>
&gt;&gt; &gt; Hi Brad,<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; Thanks for the info. Do you know which kernel subtree should =
I be<br>
&gt;&gt; &gt; basing my patches on?<br>
<br>
</span>Looks like everyone has you sorted :) Ping me if you need help with<=
br>
anything else.<br>
<br>
Cheers,<br>
<br>
Joel<br>
</blockquote></div><br><br clear=3D"all"><div><br></div>-- <br><div class=
=3D"gmail_signature" data-smartmail=3D"gmail_signature"><div><b>M</b>axim <=
b>S</b>loyko</div></div>
</div></div>

--f40304388d0c166dff05543598f7--
