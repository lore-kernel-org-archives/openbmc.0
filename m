Return-Path: <osk@google.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2a00:1450:400c:c09::234; helo=mail-wm0-x234.google.com;
 envelope-from=osk@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="hBXeLzpL"; 
 dkim-atps=neutral
Received: from mail-wm0-x234.google.com (mail-wm0-x234.google.com
 [IPv6:2a00:1450:400c:c09::234])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 41hJCJ5JBdzF21T
 for <openbmc@lists.ozlabs.org>; Fri,  3 Aug 2018 04:11:24 +1000 (AEST)
Received: by mail-wm0-x234.google.com with SMTP id n11-v6so3578081wmc.2
 for <openbmc@lists.ozlabs.org>; Thu, 02 Aug 2018 11:11:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=3nZnLEeLKvSA3G33Eam17Nlr6jmok9tdTOG8NBKnvvs=;
 b=hBXeLzpLnz2U8L6kjf8HR7lJq+744VI+cr52pN4/crPbT5/2GGVh5VSMbEU9AQqf3b
 fC+fXkZ8wKQgwIN3FmgVRI20bNa2jLpA7ivM9FJ7A8hvKZYZQ4S94buQ7AWF6AoMO169
 ZYviZVXE038TgMVhpWBsxIlwIth5kC05wZkG15g8k3UrQBYzYl068FfnZkdLSvXeOQDA
 6L8C98oD8LFMKEcFKSZtvOpdkdftirOoHYvy/5pVwV8L9VA7UBgZIOUycPivepTSsQjj
 W54q8sc0j7oqxvDIdfhPD3iWmhhsN3MZ/6dUwQGfcVUp3N7IFJ+8VnHGPgHiCowR48s2
 t+2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=3nZnLEeLKvSA3G33Eam17Nlr6jmok9tdTOG8NBKnvvs=;
 b=TBxvQicPlPV/axSlb+9dAKcAmxvkIwpj0jimQRtagVcUYjKmJRv4BXSfa7jnGta+n5
 V14hsDhwoZ4/b2UoII6Aft9Zppt7M2N6ftSba62NK5fetIFdKpXDTp36BlgpbVWBwk+3
 XfGm2fvjEJXl/KOz1OkzUW/xMtqoe9aSPvFRJPjhXtNstKeHZZ8+3Nng4ffOtb1vJnyU
 jjAqi2Cx3Tdfi+3oxgSyTckcUqYpn0Qx2G8EBTQbRFK8dezbitSmAAU2tL1XVD1Ut2NN
 wQiBPdoQf6iCukdw/j2dc3UUyID62UcaUzJ2Q+1nSqYGTJZvdrswjDXamueI9sgWvf75
 sXBA==
X-Gm-Message-State: AOUpUlFyHvpxD9apirEgZSWYLQCTwfE2GAvm/g3qIGDyBbET9uJQcsTm
 SkxZ+rlRyExwTILvg55TOnH+rnIjtby9RkCT3O42GA==
X-Google-Smtp-Source: AAOMgpcohwpcHz62v386MFJRl2yix4myOyWCtFhgSGMN+w+qwQE4Nl6KeHWQVGn6SXqd9Kx3qgs0DzJcffU9vNneEWw=
X-Received: by 2002:a1c:9616:: with SMTP id
 y22-v6mr2842511wmd.72.1533233480547; 
 Thu, 02 Aug 2018 11:11:20 -0700 (PDT)
MIME-Version: 1.0
References: <CAG9c7cAwMWMXQ=SOJ0Vjxzx0jUv3M8KLF8_fXam-z_4CuMJcvg@mail.gmail.com>
 <CAO=notxVZowBBB4DSVYZv5MdC+H1CZ01r+DCPbZeYAJdqjAcug@mail.gmail.com>
 <CABoTLcRjsOonjmPMMiijX8CvJ_jM9KJcz12AxntdzW8vCxpSFg@mail.gmail.com>
 <CAG9c7cBXxc-81YVWjVspUDAPt6Xt+5OqVE4A7EzXuegwdxx8tg@mail.gmail.com>
 <CABoTLcS0M_TbGBb8XB99sBe_S7tqfrm8vE=Eb_94UGMeGW3gAQ@mail.gmail.com>
 <1533172735.788524.1460630440.2817ADF0@webmail.messagingengine.com>
 <CABoTLcTR3YFFPTJAeAecWqZxcZQEBO-TgfCjJ1Xb1sCJVfojbQ@mail.gmail.com>
 <CAARXrtm1NMpzHOuKB45nWimT6m18EY7sWYWu9FoGJaDW+ZyD7A@mail.gmail.com>
 <CABoTLcQn6s6TCV=Zf==-Mm_VSAuN8nD3caT7Z5UPoW46LthxqQ@mail.gmail.com>
 <1533180811.827947.1460716960.2A06961A@webmail.messagingengine.com>
 <CAKKbWA7bUjUAj-dzNgjbD9F+pod_CFTSqt2yFX4NpNXWi17mYA@mail.gmail.com>
In-Reply-To: <CAKKbWA7bUjUAj-dzNgjbD9F+pod_CFTSqt2yFX4NpNXWi17mYA@mail.gmail.com>
From: Oskar Senft <osk@google.com>
Date: Thu, 2 Aug 2018 14:11:08 -0400
Message-ID: <CABoTLcTsGQKhrD07KJ-u5m-537K3t+XY48GXNq7UQ-CTZ8hH2A@mail.gmail.com>
Subject: Re: UART Route setting
To: avifishman70@gmail.com
Cc: Andrew Jeffery <andrew@aj.id.au>, Lei YU <mine260309@gmail.com>, 
 OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Henbin Chang <henbinchang@gmail.com>
Content-Type: multipart/alternative; boundary="000000000000f7d469057277bc35"
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
X-List-Received-Date: Thu, 02 Aug 2018 18:11:26 -0000

--000000000000f7d469057277bc35
Content-Type: text/plain; charset="UTF-8"

Thanks! After reading the various comments on the thread, I do understand
the argument that we're missing some abstraction by exposing individual
bits of HW registers to user space. While it's certainly MUCH better than
/dev/mem and particularly useful during rapid development, I still somewhat
feel that it would be beneficial in the long-run to use a proper
abstraction layer with /sys as interface to explicitly expose the "dozens"
of configuration options.

I'm that having an explicit driver that only exposes the HICRA (to
configure UART routing) as abstract symbols would be beneficial. Do you
think I'd find support for getting that submitted?

On Thu, Aug 2, 2018 at 11:00 AM Avi Fishman <avifishman70@gmail.com> wrote:

> On Thu, Aug 2, 2018 at 6:34 AM Andrew Jeffery <andrew@aj.id.au> wrote:
> >
> > On Thu, 2 Aug 2018, at 12:50, Oskar Senft wrote:
> > > Interesting suggestion, that looks promising, thank you?
> > >
> > > What's the state of that driver? I.e. where do we expect it to land?
> >
> > If you think the bmc-misc-ctrl series is useful, please reply to the
> > upstream thread to outline all of your use-cases. There's a lot of push-
> > back on using the devicetree to describe these features, and I haven't
> > had a lot of feedback on the acceptability of the rest (driver itself,
> > userspace ABI).
> >
> > The more evidence we have of this being necessary/useful the better.
>
> Oskar,
> Here is the link to put your support:
> https://lore.kernel.org/patchwork/patch/961584/
>
> >
> > Cheers,
> >
> > Andrew
> >
> > >
> > > Thanks
> > > Oskar.
> > >
> > > On Wed, Aug 1, 2018, 10:12 PM Lei YU <mine260309@gmail.com> wrote:
> > >
> > > > On Thu, Aug 2, 2018 at 9:55 AM Oskar Senft <osk@google.com> wrote:
> > > > >
> > > > > Hi Andrew
> > > > >
> > > > > Thanks for the suggestion. I see that the register would map quite
> > > > nicely to pinmux. However, the ability to change the configuration
> from
> > > > user space is critical. How could that be done via pinmux?
> > > >
> > > > I believe Andrew Jeffery's [bmc-misc-ctr][1] driver is perfect for
> this
> > > > requirement:
> > > > 1. You can define related registers in dts and expose as sysfs
> attributes
> > > > 2. User space is able to read/write the sysfs attributes to do what
> you
> > > > need
> > > >    to configure.
> > > >
> > > > [1]: https://patchwork.ozlabs.org/cover/942322/
> > > >
>
>
>
> --
> Regards,
> Avi
>

--000000000000f7d469057277bc35
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Thanks! After reading the various comments on the thread, =
I do understand the argument that we&#39;re missing some abstraction by exp=
osing individual bits of HW registers to user space. While it&#39;s certain=
ly MUCH better than /dev/mem and particularly useful during rapid developme=
nt, I still somewhat feel that it would be beneficial in the long-run to us=
e a <span style=3D"font-size:small;text-decoration-style:initial;text-decor=
ation-color:initial;float:none;display:inline">proper abstraction layer wit=
h /sys as interface to=C2=A0</span>explicitly expose the &quot;dozens&quot;=
 of configuration options.<div><br></div><div>I&#39;m that having an explic=
it driver that only exposes the HICRA (to configure UART routing) as abstra=
ct symbols would be beneficial. Do you think I&#39;d find support for getti=
ng that submitted?</div></div><br><div class=3D"gmail_quote"><div dir=3D"lt=
r">On Thu, Aug 2, 2018 at 11:00 AM Avi Fishman &lt;<a href=3D"mailto:avifis=
hman70@gmail.com">avifishman70@gmail.com</a>&gt; wrote:<br></div><blockquot=
e class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc sol=
id;padding-left:1ex">On Thu, Aug 2, 2018 at 6:34 AM Andrew Jeffery &lt;<a h=
ref=3D"mailto:andrew@aj.id.au" target=3D"_blank">andrew@aj.id.au</a>&gt; wr=
ote:<br>
&gt;<br>
&gt; On Thu, 2 Aug 2018, at 12:50, Oskar Senft wrote:<br>
&gt; &gt; Interesting suggestion, that looks promising, thank you?<br>
&gt; &gt;<br>
&gt; &gt; What&#39;s the state of that driver? I.e. where do we expect it t=
o land?<br>
&gt;<br>
&gt; If you think the bmc-misc-ctrl series is useful, please reply to the<b=
r>
&gt; upstream thread to outline all of your use-cases. There&#39;s a lot of=
 push-<br>
&gt; back on using the devicetree to describe these features, and I haven&#=
39;t<br>
&gt; had a lot of feedback on the acceptability of the rest (driver itself,=
<br>
&gt; userspace ABI).<br>
&gt;<br>
&gt; The more evidence we have of this being necessary/useful the better.<b=
r>
<br>
Oskar,<br>
Here is the link to put your support:<br>
<a href=3D"https://lore.kernel.org/patchwork/patch/961584/" rel=3D"noreferr=
er" target=3D"_blank">https://lore.kernel.org/patchwork/patch/961584/</a><b=
r>
<br>
&gt;<br>
&gt; Cheers,<br>
&gt;<br>
&gt; Andrew<br>
&gt;<br>
&gt; &gt;<br>
&gt; &gt; Thanks<br>
&gt; &gt; Oskar.<br>
&gt; &gt;<br>
&gt; &gt; On Wed, Aug 1, 2018, 10:12 PM Lei YU &lt;<a href=3D"mailto:mine26=
0309@gmail.com" target=3D"_blank">mine260309@gmail.com</a>&gt; wrote:<br>
&gt; &gt;<br>
&gt; &gt; &gt; On Thu, Aug 2, 2018 at 9:55 AM Oskar Senft &lt;<a href=3D"ma=
ilto:osk@google.com" target=3D"_blank">osk@google.com</a>&gt; wrote:<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; Hi Andrew<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; Thanks for the suggestion. I see that the register woul=
d map quite<br>
&gt; &gt; &gt; nicely to pinmux. However, the ability to change the configu=
ration from<br>
&gt; &gt; &gt; user space is critical. How could that be done via pinmux?<b=
r>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; I believe Andrew Jeffery&#39;s [bmc-misc-ctr][1] driver is p=
erfect for this<br>
&gt; &gt; &gt; requirement:<br>
&gt; &gt; &gt; 1. You can define related registers in dts and expose as sys=
fs attributes<br>
&gt; &gt; &gt; 2. User space is able to read/write the sysfs attributes to =
do what you<br>
&gt; &gt; &gt; need<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 to configure.<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; [1]: <a href=3D"https://patchwork.ozlabs.org/cover/942322/" =
rel=3D"noreferrer" target=3D"_blank">https://patchwork.ozlabs.org/cover/942=
322/</a><br>
&gt; &gt; &gt;<br>
<br>
<br>
<br>
-- <br>
Regards,<br>
Avi<br>
</blockquote></div>

--000000000000f7d469057277bc35--
