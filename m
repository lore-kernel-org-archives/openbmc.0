Return-Path: <osk@google.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2a00:1450:400c:c09::230; helo=mail-wm0-x230.google.com;
 envelope-from=osk@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="jsaLT0M9"; 
 dkim-atps=neutral
Received: from mail-wm0-x230.google.com (mail-wm0-x230.google.com
 [IPv6:2a00:1450:400c:c09::230])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 41gwRK5lqhzF1Qn
 for <openbmc@lists.ozlabs.org>; Thu,  2 Aug 2018 13:20:28 +1000 (AEST)
Received: by mail-wm0-x230.google.com with SMTP id w24-v6so788315wmc.1
 for <openbmc@lists.ozlabs.org>; Wed, 01 Aug 2018 20:20:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=4IOihiLitoIKnSkm+Mg+GLPB02WOJiS7MDQCk3V5874=;
 b=jsaLT0M95lH89myUZ7MT2nkyIbX+fWBJDz8J0dVshlVBnbtMa91HqpTuNd/brRQCrn
 n04WFLCxzDnde78VWExrISKJSTZgRlPtjLTrCi+WTaM/0x2JjwGmQRRcg0KBM7NSXrzM
 mLa2/1NDsqQYV4KwoBwKaGAI2c33R+4bgPxpAwjgaFHMnVfmvloXY6zOidWyX1KSH0Ey
 NQ7t9qP9dVjMEHTrf4zo6tpI1CWl68A4sa5Vgmcs1oYhvIaFy5F7R1bJe94AHYE/tkIr
 jEB4quv7HnI5vB5o5cIDTl4GiTFqCDRbq3mGE06Nj1qkyFCYayAnTpnWQ2z6+cg0od7V
 UZ8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=4IOihiLitoIKnSkm+Mg+GLPB02WOJiS7MDQCk3V5874=;
 b=KPHMg7GqmfZg0mbS0mnMvppOgvR1k2rNcmjtmXxhZWdZ9+f5FxK0y3NZuh+Wrp78PU
 AyqNqknxSLRgazxMX5g78kDQpY+PmWOAFVHjaRW1DgekPBVcX9ekGFrO0/6Q0PekKnvl
 bZaw11xY4L3FzjmwOHPSSAQGhj07Sx7RBGDM0PrYOWc/siCy19iQH9+RLshJLfuAERP+
 c41NPmdvZlrHAFH7p5UFlKO34WshhBZu1zHLrWUaRjHOB8VKgbWam43a1ka0Gkq5oM5U
 mjDE40HbRQO/Mn8jK8uqzzKDb1H9VnbKGO6ctbWjFSOoL0aL5wO+lEPw7KdL3d2K6usg
 jscA==
X-Gm-Message-State: AOUpUlGNV8zP4Od+7Y7EvVbEbcle0IpI331f90iVPGSbyCbRbg/hFCym
 f5lJrKNVxF8YZIED1PiuxDmuQ9GshAGAT94QU6unTA==
X-Google-Smtp-Source: AAOMgpe30ooVMj5gk1Vot6YtOusT0yRyhvfU1+3xC1e53lIl6JBiGPrpD78LK4VLL8x+dUyiyFsSpg5QV4Fy7BLlR0o=
X-Received: by 2002:a1c:6709:: with SMTP id b9-v6mr615992wmc.68.1533180024880; 
 Wed, 01 Aug 2018 20:20:24 -0700 (PDT)
MIME-Version: 1.0
References: <CAG9c7cAwMWMXQ=SOJ0Vjxzx0jUv3M8KLF8_fXam-z_4CuMJcvg@mail.gmail.com>
 <CAO=notxVZowBBB4DSVYZv5MdC+H1CZ01r+DCPbZeYAJdqjAcug@mail.gmail.com>
 <CABoTLcRjsOonjmPMMiijX8CvJ_jM9KJcz12AxntdzW8vCxpSFg@mail.gmail.com>
 <CAG9c7cBXxc-81YVWjVspUDAPt6Xt+5OqVE4A7EzXuegwdxx8tg@mail.gmail.com>
 <CABoTLcS0M_TbGBb8XB99sBe_S7tqfrm8vE=Eb_94UGMeGW3gAQ@mail.gmail.com>
 <1533172735.788524.1460630440.2817ADF0@webmail.messagingengine.com>
 <CABoTLcTR3YFFPTJAeAecWqZxcZQEBO-TgfCjJ1Xb1sCJVfojbQ@mail.gmail.com>
 <CAARXrtm1NMpzHOuKB45nWimT6m18EY7sWYWu9FoGJaDW+ZyD7A@mail.gmail.com>
In-Reply-To: <CAARXrtm1NMpzHOuKB45nWimT6m18EY7sWYWu9FoGJaDW+ZyD7A@mail.gmail.com>
From: Oskar Senft <osk@google.com>
Date: Wed, 1 Aug 2018 23:20:11 -0400
Message-ID: <CABoTLcQn6s6TCV=Zf==-Mm_VSAuN8nD3caT7Z5UPoW46LthxqQ@mail.gmail.com>
Subject: Re: UART Route setting
To: Lei YU <mine260309@gmail.com>
Cc: Andrew Jeffery <andrew@aj.id.au>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>, 
 =?UTF-8?B?5by15ryi5b2s?= <henbinchang@gmail.com>
Content-Type: multipart/alternative; boundary="000000000000c3187105726b4a79"
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
X-List-Received-Date: Thu, 02 Aug 2018 03:20:31 -0000

--000000000000c3187105726b4a79
Content-Type: text/plain; charset="UTF-8"

Interesting suggestion, that looks promising, thank you?

What's the state of that driver? I.e. where do we expect it to land?

Thanks
Oskar.

On Wed, Aug 1, 2018, 10:12 PM Lei YU <mine260309@gmail.com> wrote:

> On Thu, Aug 2, 2018 at 9:55 AM Oskar Senft <osk@google.com> wrote:
> >
> > Hi Andrew
> >
> > Thanks for the suggestion. I see that the register would map quite
> nicely to pinmux. However, the ability to change the configuration from
> user space is critical. How could that be done via pinmux?
>
> I believe Andrew Jeffery's [bmc-misc-ctr][1] driver is perfect for this
> requirement:
> 1. You can define related registers in dts and expose as sysfs attributes
> 2. User space is able to read/write the sysfs attributes to do what you
> need
>    to configure.
>
> [1]: https://patchwork.ozlabs.org/cover/942322/
>

--000000000000c3187105726b4a79
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">Interesting suggestion, that looks promising, thank you?<=
div dir=3D"auto"><br></div><div dir=3D"auto">What&#39;s the state of that d=
river? I.e. where do we expect it to land?</div><div dir=3D"auto"><br></div=
><div dir=3D"auto">Thanks</div><div dir=3D"auto">Oskar.</div></div><br><div=
 class=3D"gmail_quote"><div dir=3D"ltr">On Wed, Aug 1, 2018, 10:12 PM Lei Y=
U &lt;<a href=3D"mailto:mine260309@gmail.com">mine260309@gmail.com</a>&gt; =
wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8e=
x;border-left:1px #ccc solid;padding-left:1ex">On Thu, Aug 2, 2018 at 9:55 =
AM Oskar Senft &lt;<a href=3D"mailto:osk@google.com" target=3D"_blank" rel=
=3D"noreferrer">osk@google.com</a>&gt; wrote:<br>
&gt;<br>
&gt; Hi Andrew<br>
&gt;<br>
&gt; Thanks for the suggestion. I see that the register would map quite nic=
ely to pinmux. However, the ability to change the configuration from user s=
pace is critical. How could that be done via pinmux?<br>
<br>
I believe Andrew Jeffery&#39;s [bmc-misc-ctr][1] driver is perfect for this=
<br>
requirement:<br>
1. You can define related registers in dts and expose as sysfs attributes<b=
r>
2. User space is able to read/write the sysfs attributes to do what you nee=
d<br>
=C2=A0 =C2=A0to configure.<br>
<br>
[1]: <a href=3D"https://patchwork.ozlabs.org/cover/942322/" rel=3D"noreferr=
er noreferrer" target=3D"_blank">https://patchwork.ozlabs.org/cover/942322/=
</a><br>
</blockquote></div>

--000000000000c3187105726b4a79--
