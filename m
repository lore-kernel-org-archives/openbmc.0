Return-Path: <xow@google.com>
Received: from mail-qk0-x230.google.com (mail-qk0-x230.google.com
 [IPv6:2607:f8b0:400d:c09::230])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3tD5ND6pRdzDvdJ
 for <openbmc@lists.ozlabs.org>; Wed,  9 Nov 2016 10:38:20 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="d7zOULce"; 
 dkim-atps=neutral
Received: by mail-qk0-x230.google.com with SMTP id n21so126434335qka.3
 for <openbmc@lists.ozlabs.org>; Tue, 08 Nov 2016 15:38:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20120113;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=eddPur/8igKLXE6aTK0nyD856UFm880wlzemDYuNcC8=;
 b=d7zOULcexxJ5okIxZJN8cyxM5FBX8BQ6e5KR8ajJnX2GBX8N9EL+JMKNPIvSDdQihc
 bW2y2F4wg7iiHxWEU9I4MNUCFT+QMgDUaZHiLecGr8P4IzgxTJDF7NG0qKekNqimtn2s
 XXvOk8mrzWNRRPFJ6AmbFgkb7m9SjR/7W+c116W0e6Ibs78USHUfJFdU67A1Pjf2X2rh
 hxgNyDFsakFSvfO/4RX0GF5ld8DIIWccPpiqznt0syXkr2DTIbbE+CoUuJipA1JQ9ZCQ
 uAOjADEBNLHcv99DbUB46AdELysOJJB4g7XdkoHwTngfDUvGFZd6mw7fYBfTQRpGc9KD
 uBxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=eddPur/8igKLXE6aTK0nyD856UFm880wlzemDYuNcC8=;
 b=SkcMSrmdwMtcDWZSWK5CXmCQXJTsL83/a/Qwi7PjKhi4govEMQY6Grrh7pWsG7/iv+
 BwxjIyZAY9yGiEC2IB2hChLUCaSWNmMWBZ0XoHAcinTgK04mgKyIzDFipZM7ZRylFF1h
 PhFuKrjsse++9SZAHhxQhDIiSpFp1/ybH1JsIFOVqVYIgg8om2pMzTBGwqGIRJWqsILf
 4MBusAx+8U9tNzJrp6VRbw06SH43kyHu/xskxmkqYu81mehVyL5Y/Zal9dGc8ae7VKON
 4qRq85a/YWVPj+v5VC/sohxF96pbHVN6aUC7kFY1WfsspX4yRGCGWSi7OT9qX4KOKtJP
 3hBA==
X-Gm-Message-State: ABUngvfJmhc8CgCY/aTT9FjnHmQlw/xk8iGzjCcohPy/MRJgtNffNeDwhPYMwtrveOdsMEB8jymnfKMaVxVkLmMR
X-Received: by 10.55.165.10 with SMTP id o10mr15388883qke.233.1478648298618;
 Tue, 08 Nov 2016 15:38:18 -0800 (PST)
MIME-Version: 1.0
Received: by 10.237.57.199 with HTTP; Tue, 8 Nov 2016 15:38:18 -0800 (PST)
In-Reply-To: <CAARXrt=FA=kTrjJ3KAyB03cuiBP=ka6BHf6YuNYh8x-DtyCcHw@mail.gmail.com>
References: <CAARXrtmemiSFPH7RGxFLcddt1Ld4pGTwsDX-rPtAmf2coS8VDg@mail.gmail.com>
 <20161107040643.GE15757@heinlein.lan>
 <OF7F37D1BE.BCC7E74A-ON48258064.00313B2C-48258064.003271BA@notes.na.collabserv.com>
 <20161107161903.7gbgafvj6vb6w4k4@asimov>
 <CAARXrtmur716MDJJPhHKNwOcGVVnczey0n2ZxXdXV2YB67+Png@mail.gmail.com>
 <CAPH-5w6jxPPBYPSh1NQF-vg2w2HJ7ZU_r50ttSsUsXDMPS3_5A@mail.gmail.com>
 <CAARXrt=FA=kTrjJ3KAyB03cuiBP=ka6BHf6YuNYh8x-DtyCcHw@mail.gmail.com>
From: Xo Wang <xow@google.com>
Date: Tue, 8 Nov 2016 15:38:18 -0800
Message-ID: <CAPH-5w7+to8ch2w8LDYeh97D8wTKdNKdFvtXCYJ=KhbaL7nh-Q@mail.gmail.com>
Subject: Re: How to handle GPIO differences between P8 and P9
To: Mine <mine260309@gmail.com>
Cc: Patrick Williams <patrick@stwcx.xyz>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: multipart/alternative; boundary=94eb2c0647fc96d48d0540d2a2f5
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
X-List-Received-Date: Tue, 08 Nov 2016 23:38:21 -0000

--94eb2c0647fc96d48d0540d2a2f5
Content-Type: text/plain; charset=UTF-8

On Tue, Nov 8, 2016 at 1:13 PM, Mine <mine260309@gmail.com> wrote:

> On Mon, Nov 7, 2016 at 3:53 PM, Xo Wang <xow@google.com> wrote:
> > On Mon, Nov 7, 2016 at 9:01 AM, Mine <mine260309@gmail.com> wrote:
> >> On Mon, Nov 7, 2016 at 10:19 AM, Patrick Williams <patrick@stwcx.xyz>
> wrote:
> >>> On Mon, Nov 07, 2016 at 05:10:59PM +0800, Yi TZ Li wrote:
> >>>> I committed a patch: https://gerrit.openbmc-project.xyz/#/c/1019/
> >>>> to add a getSystemName() dbus method in org.obmc.managers.System
> interface.
> >>>> There are several places in skeleton requires fix for a specific
> system.
> >>>>
> >>>> Other way be add a compile flag in yocto when building Skeleton.
> >>>
> >>> We are really trying to avoid "if (machine_type == ...)" type code.
> This
> >>> becomes a gigantic problem when we are talking about supporting 3 dozen
> >>> machines.
> >>>
> >>> --
> >>> Patrick Williams
> >>
> >> Yup, I prefer not to write `if (machine_type == ...)` type code, nor
> >> to have a compile flag (it just becomes `#if xxx` or `#ifdef xxx`).
> >>
> >> The temp fix by not defining `IDBTN` will not only cause error log,
> >> but also prevent the code in `op-hostctl/control_host_obj.c` to work,
> >> because it will get error during opening the GPIO, and jump out,
> >> resulting in error: "GPIO sequence failed".
> >>
> >> If we are targeting for booting P9 up, I would suggest a temp fix by
> >> defining `IDBTN` for both Witherspoon and Romulus.
> >> It will not block power on, but may break a function related to LED.
> >>
> >> --
> >> BRs,
> >> Lei YU
> >> _______________________________________________
> >> openbmc mailing list
> >> openbmc@lists.ozlabs.org
> >> https://lists.ozlabs.org/listinfo/openbmc
> >
> > We had a similar issue in the op-pwrctl where the source hard-coded
> > the system net names. There I put in a short-term solution of adding a
> > function-specific abstraction over the net names into the System.py
> > config, removing the per-machine patches for name and polarity:
> > https://gerrit.openbmc-project.xyz/#/c/606/
> > https://gerrit.openbmc-project.xyz/#/c/689/
> >
> > It's not difficult to extend POWER_CONFIG for GPIO functions that only
> > exist on one machine, like so:
> > https://gerrit.openbmc-project.xyz/#/c/608/3
> >
> > With the abstraction taking place in the Python machine config, we
> > don't need per-machine dispatch in the user interface (op-pwrctl,
> > op-hostctl, op-pwr-button, etc).
> >
> > Does that work for you in the short term?
> >
> > cheers
> > xo
>
> Yup, that could be a solution. It's just the GPIOs are not for power
> control,
> so following the solution would probably introduce similar code to
> hostctl_gpio.h/c.
>
> Maybe I can combine the power_gpio and hostctl_gpio, so they share the same
> code?
>
> Something like:
>
> GPIO_CONFIG = {
>   'power_gpios': {
>     'latch_out' : 'BMC_UCD_LATCH_LE',
>     'power_good_in' : 'SYS_PWROK_BUFF',
>     'power_up_outs' : [
>         ('SOFTWARE_PGOOD', True),
>         ('BMC_POWER_UP', True),
>     ],
>     'reset_outs' : [
>     ],
>   },
>   'hostctl_gpios': {
>     'fsi_data' : 'FSI_DATA',
>     ...
>     'optionals' : [
>       ('BMC_THROTTLE', True),
>       ('IDBTN', False),
>     ],
>   }
> }
>
> What do you think?
>
> --
> BRs,
> Lei YU
>

Yes, that sounds reasonable to me. Maybe change the name of the PowerGpio
stuff to reflect your more general approach.

FYI something that I didn't implement was adding GPIO polarity support
into libopenbmc_intf/gpio. So, all the polarity (active high/low) logic
needs to be handled by the application, which is less than ideal.

cheers
xo

--94eb2c0647fc96d48d0540d2a2f5
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><div class=3D"gmail_quote">On T=
ue, Nov 8, 2016 at 1:13 PM, Mine <span dir=3D"ltr">&lt;<a href=3D"mailto:mi=
ne260309@gmail.com" target=3D"_blank">mine260309@gmail.com</a>&gt;</span> w=
rote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8e=
x;border-left:1px solid rgb(204,204,204);padding-left:1ex"><div class=3D"gm=
ail-HOEnZb"><div class=3D"gmail-h5">On Mon, Nov 7, 2016 at 3:53 PM, Xo Wang=
 &lt;<a href=3D"mailto:xow@google.com">xow@google.com</a>&gt; wrote:<br>
&gt; On Mon, Nov 7, 2016 at 9:01 AM, Mine &lt;<a href=3D"mailto:mine260309@=
gmail.com">mine260309@gmail.com</a>&gt; wrote:<br>
&gt;&gt; On Mon, Nov 7, 2016 at 10:19 AM, Patrick Williams &lt;<a href=3D"m=
ailto:patrick@stwcx.xyz">patrick@stwcx.xyz</a>&gt; wrote:<br>
&gt;&gt;&gt; On Mon, Nov 07, 2016 at 05:10:59PM +0800, Yi TZ Li wrote:<br>
&gt;&gt;&gt;&gt; I committed a patch: <a href=3D"https://gerrit.openbmc-pro=
ject.xyz/#/c/1019/" rel=3D"noreferrer" target=3D"_blank">https://gerrit.ope=
nbmc-<wbr>project.xyz/#/c/1019/</a><br>
&gt;&gt;&gt;&gt; to add a getSystemName() dbus method in org.obmc.managers.=
System interface.<br>
&gt;&gt;&gt;&gt; There are several places in skeleton requires fix for a sp=
ecific system.<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt; Other way be add a compile flag in yocto when building Ske=
leton.<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; We are really trying to avoid &quot;if (machine_type =3D=3D ..=
.)&quot; type code.=C2=A0 This<br>
&gt;&gt;&gt; becomes a gigantic problem when we are talking about supportin=
g 3 dozen<br>
&gt;&gt;&gt; machines.<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; --<br>
&gt;&gt;&gt; Patrick Williams<br>
&gt;&gt;<br>
&gt;&gt; Yup, I prefer not to write `if (machine_type =3D=3D ...)` type cod=
e, nor<br>
&gt;&gt; to have a compile flag (it just becomes `#if xxx` or `#ifdef xxx`)=
.<br>
&gt;&gt;<br>
&gt;&gt; The temp fix by not defining `IDBTN` will not only cause error log=
,<br>
&gt;&gt; but also prevent the code in `op-hostctl/control_host_obj.<wbr>c` =
to work,<br>
&gt;&gt; because it will get error during opening the GPIO, and jump out,<b=
r>
&gt;&gt; resulting in error: &quot;GPIO sequence failed&quot;.<br>
&gt;&gt;<br>
&gt;&gt; If we are targeting for booting P9 up, I would suggest a temp fix =
by<br>
&gt;&gt; defining `IDBTN` for both Witherspoon and Romulus.<br>
&gt;&gt; It will not block power on, but may break a function related to LE=
D.<br>
&gt;&gt;<br>
&gt;&gt; --<br>
&gt;&gt; BRs,<br>
&gt;&gt; Lei YU<br>
&gt;&gt; ______________________________<wbr>_________________<br>
&gt;&gt; openbmc mailing list<br>
&gt;&gt; <a href=3D"mailto:openbmc@lists.ozlabs.org">openbmc@lists.ozlabs.o=
rg</a><br>
&gt;&gt; <a href=3D"https://lists.ozlabs.org/listinfo/openbmc" rel=3D"noref=
errer" target=3D"_blank">https://lists.ozlabs.org/<wbr>listinfo/openbmc</a>=
<br>
&gt;<br>
&gt; We had a similar issue in the op-pwrctl where the source hard-coded<br=
>
&gt; the system net names. There I put in a short-term solution of adding a=
<br>
&gt; function-specific abstraction over the net names into the System.py<br=
>
&gt; config, removing the per-machine patches for name and polarity:<br>
&gt; <a href=3D"https://gerrit.openbmc-project.xyz/#/c/606/" rel=3D"norefer=
rer" target=3D"_blank">https://gerrit.openbmc-<wbr>project.xyz/#/c/606/</a>=
<br>
&gt; <a href=3D"https://gerrit.openbmc-project.xyz/#/c/689/" rel=3D"norefer=
rer" target=3D"_blank">https://gerrit.openbmc-<wbr>project.xyz/#/c/689/</a>=
<br>
&gt;<br>
&gt; It&#39;s not difficult to extend POWER_CONFIG for GPIO functions that =
only<br>
&gt; exist on one machine, like so:<br>
&gt; <a href=3D"https://gerrit.openbmc-project.xyz/#/c/608/3" rel=3D"norefe=
rrer" target=3D"_blank">https://gerrit.openbmc-<wbr>project.xyz/#/c/608/3</=
a><br>
&gt;<br>
&gt; With the abstraction taking place in the Python machine config, we<br>
&gt; don&#39;t need per-machine dispatch in the user interface (op-pwrctl,<=
br>
&gt; op-hostctl, op-pwr-button, etc).<br>
&gt;<br>
&gt; Does that work for you in the short term?<br>
&gt;<br>
&gt; cheers<br>
&gt; xo<br>
<br>
</div></div>Yup, that could be a solution. It&#39;s just the GPIOs are not =
for power control,<br>
so following the solution would probably introduce similar code to<br>
hostctl_gpio.h/c.<br>
<br>
Maybe I can combine the power_gpio and hostctl_gpio, so they share the same=
<br>
code?<br>
<br>
Something like:<br>
<br>
GPIO_CONFIG =3D {<br>
=C2=A0 &#39;power_gpios&#39;: {<br>
=C2=A0 =C2=A0 &#39;latch_out&#39; : &#39;BMC_UCD_LATCH_LE&#39;,<br>
=C2=A0 =C2=A0 &#39;power_good_in&#39; : &#39;SYS_PWROK_BUFF&#39;,<br>
=C2=A0 =C2=A0 &#39;power_up_outs&#39; : [<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 (&#39;SOFTWARE_PGOOD&#39;, True),<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 (&#39;BMC_POWER_UP&#39;, True),<br>
=C2=A0 =C2=A0 ],<br>
=C2=A0 =C2=A0 &#39;reset_outs&#39; : [<br>
=C2=A0 =C2=A0 ],<br>
=C2=A0 },<br>
=C2=A0 &#39;hostctl_gpios&#39;: {<br>
=C2=A0 =C2=A0 &#39;fsi_data&#39; : &#39;FSI_DATA&#39;,<br>
=C2=A0 =C2=A0 ...<br>
=C2=A0 =C2=A0 &#39;optionals&#39; : [<br>
=C2=A0 =C2=A0 =C2=A0 (&#39;BMC_THROTTLE&#39;, True),<br>
=C2=A0 =C2=A0 =C2=A0 (&#39;IDBTN&#39;, False),<br>
=C2=A0 =C2=A0 ],<br>
=C2=A0 }<br>
}<br>
<br>
What do you think?<br>
<br>
--<br>
BRs,<br>
Lei YU<br></blockquote><div><br></div><div>Yes, that sounds reasonable to m=
e. Maybe change the name of the PowerGpio stuff to reflect your more genera=
l approach.</div><div><br></div><div>FYI something that I didn&#39;t implem=
ent was adding GPIO polarity support into=C2=A0libopenbmc_intf/gpio. So, al=
l the polarity (active high/low) logic needs to be handled by the applicati=
on, which is less than ideal.</div><div><br></div><div>cheers</div><div>xo<=
/div></div><br></div></div>

--94eb2c0647fc96d48d0540d2a2f5--
