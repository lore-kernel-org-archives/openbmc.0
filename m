Return-Path: <tmaimon77@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::143; helo=mail-it1-x143.google.com;
 envelope-from=tmaimon77@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="c/30ruKk"; 
 dkim-atps=neutral
Received: from mail-it1-x143.google.com (mail-it1-x143.google.com
 [IPv6:2607:f8b0:4864:20::143])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44D7H50qB2zDqGm
 for <openbmc@lists.ozlabs.org>; Tue,  5 Mar 2019 18:06:40 +1100 (AEDT)
Received: by mail-it1-x143.google.com with SMTP id z124so2835807itc.2
 for <openbmc@lists.ozlabs.org>; Mon, 04 Mar 2019 23:06:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=QsC09dTUolK18ak8Geeb7e6aXARlmKRLThQA3ja4nfo=;
 b=c/30ruKkqwzWNpp5zcBFK/ZDYj33xHAAUq8zX6OAm7/Wi6iiNWFYwaulOAD+9XolRU
 n1aMA6UihLMTN9EaAEYDt4T9bCdJdR429xugR1KqW3W8Y2o6OV5rYtPP6C60LGqLG07i
 EfQHnyfb77JBS7TWXe2vZI/K1xFQkzlE0CTiArKZijqu0OPi5FHHSl0AcxhMGdk46ymX
 JHJZudRTI/X/uyheYQc+ZBeOV0UgOQVRIAvBdmQVICsIWpX846HV9DJOdHHD5fxIQqgl
 YVrQN626s1JrLj7c4ucm/EZejxfJuDyxqsCno5/2CWsXKV7f0JRB5Q2R9Lg6i0wFGBFy
 Yi9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=QsC09dTUolK18ak8Geeb7e6aXARlmKRLThQA3ja4nfo=;
 b=crGr5NISgYlUEhCVp9HJ7zKiTk8xXJbtfGNQ/NhyGLMUQgLtULoSD4k/bDyzm95nHa
 QXfB8XQtv3PjOcuCb4YsBYVPR+T1y1b6S3iB2xnOJZWfVgrnCF0TDrYsreo6EHlQudB3
 hSJ+9fjfnaQXLFNU4hVFlzAdyuW5najT78kp8vD6MTb0SRBJ7ByJTRLeSTk9GqhQWerk
 dUtQrcDAHVwZ2RTBHqMTx8Sf5NCjvwN3Wf55NuJdd/B/nEpbYPkyNLOmGCezNczdAd2M
 FdnlQBAqj5gaQOXMSTx0yJT0JiSJ6+WISw5fjLORGtPB+Xb2PfUDdguObtly12+YftnS
 +4iQ==
X-Gm-Message-State: APjAAAV2EGcRG8Gk1B3y5zy1CPlEYLHMkxCbo6kKE8VfR2GRAGN+tQrf
 XXRgbcEmGN9GuD8AaIidM8VgYKC+iz75lF7ajq0o4gdO
X-Google-Smtp-Source: APXvYqyiBa0gTqx7N7N3AyMRF1vI39wsFYhvBum3T1eHh5uVDf3hOafMarqj2xx5MmviSOALdvHWaHECSIbOKAsLBMU=
X-Received: by 2002:a24:22c5:: with SMTP id o188mr2085456ito.68.1551769597223; 
 Mon, 04 Mar 2019 23:06:37 -0800 (PST)
MIME-Version: 1.0
References: <20190228094925.5419-1-fran.hsu@quantatw.com>
 <CACPK8XcDgnyYpg-QfZOGj5-xTScWUpyhEUigWadGzZQ8kkeH4A@mail.gmail.com>
 <6368ebf3122c4357ac469d4733c346ea@quantatw.com>
 <CACPK8Xc-dg+6cu82C1bO=5f4MdyMSANTmn4_MZa+d0KhJTGCKg@mail.gmail.com>
In-Reply-To: <CACPK8Xc-dg+6cu82C1bO=5f4MdyMSANTmn4_MZa+d0KhJTGCKg@mail.gmail.com>
From: Tomer Maimon <tmaimon77@gmail.com>
Date: Tue, 5 Mar 2019 09:13:48 +0200
Message-ID: <CAP6Zq1geiaRc2O897ZejEWswrrbgAm97QKPHnSKSnzC=1ij5kw@mail.gmail.com>
Subject: Re: [PATCH dev-4.19 v3] Add Quanta GSJ board device tree v2.
To: Joel Stanley <joel@jms.id.au>
Cc: =?UTF-8?B?RnJhbiBIc3UgKOW+kOiqjOismSk=?= <Fran.Hsu@quantatw.com>, 
 Emily Shaffer <emilyshaffer@google.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>, 
 Benjamin Fair <benjaminfair@google.com>
Content-Type: multipart/alternative; boundary="0000000000009da6f905835383d6"
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Tue, 05 Mar 2019 07:06:42 -0000

--0000000000009da6f905835383d6
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Joel,

On Tue, 5 Mar 2019 at 03:33, Joel Stanley <joel@jms.id.au> wrote:

> On Tue, 5 Mar 2019 at 01:13, Fran Hsu (=E5=BE=90=E8=AA=8C=E8=AC=99) <Fran=
.Hsu@quantatw.com> wrote:
> > Regarding the part of nuvoton-npcm730.dtsi.
> > Please have a look at this link
> https://patchwork.ozlabs.org/patch/1045899/
> > This patch was pushed by Nuvoton Inc and wait for the review.
>
> Thanks for pointing that out. I didn't receive that email (a recurring
> problem with Gmail and mailing lists).
>
> nuvoton-common-npcm7xx.dtsi file include the rest of the SoC devices.
nuvoton-common-npcm7xx.dtsi file already upstream to OpenBMC Linux
repository

That dtsi does not contain all of the SoC devices that yours does. You
> will want to add the rest on top of that patch.
>
> Cheers,
>
> Joel
>

Cheers,

Tomer

--0000000000009da6f905835383d6
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi Joel,</div><br><div class=3D"gmail_quote"><div dir=
=3D"ltr" class=3D"gmail_attr">On Tue, 5 Mar 2019 at 03:33, Joel Stanley &lt=
;<a href=3D"mailto:joel@jms.id.au">joel@jms.id.au</a>&gt; wrote:<br></div><=
blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-l=
eft:1px solid rgb(204,204,204);padding-left:1ex">On Tue, 5 Mar 2019 at 01:1=
3, Fran Hsu (=E5=BE=90=E8=AA=8C=E8=AC=99) &lt;<a href=3D"mailto:Fran.Hsu@qu=
antatw.com" target=3D"_blank">Fran.Hsu@quantatw.com</a>&gt; wrote:<br>
&gt; Regarding the part of nuvoton-npcm730.dtsi.<br>
&gt; Please have a look at this link <a href=3D"https://patchwork.ozlabs.or=
g/patch/1045899/" rel=3D"noreferrer" target=3D"_blank">https://patchwork.oz=
labs.org/patch/1045899/</a><br>
&gt; This patch was pushed by Nuvoton Inc and wait for the review.<br>
<br>
Thanks for pointing that out. I didn&#39;t receive that email (a recurring<=
br>
problem with Gmail and mailing lists).<br>
<br></blockquote><div><font face=3D"arial, helvetica, sans-serif" color=3D"=
#000000"><span style=3D"font-size:13px">nuvoton-common-npcm7xx.dtsi file in=
clude the rest of the SoC=C2=A0</span><span style=3D"font-size:13px">device=
s.</span></font></div><div><font face=3D"arial, helvetica, sans-serif" colo=
r=3D"#000000"><span style=3D"font-size:13px">nuvoton-common-npcm7xx.dtsi fi=
le already upstream to OpenBMC Linux repository</span>=C2=A0</font></div><d=
iv><font face=3D"arial, helvetica, sans-serif" color=3D"#000000"><br></font=
></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;=
border-left:1px solid rgb(204,204,204);padding-left:1ex">
That dtsi does not contain all of the SoC devices that yours does. You<br>
will want to add the rest on top of that patch.<br>
<br>
Cheers,<br>
<br>
Joel<br></blockquote><div><br></div><div>Cheers,</div><div><br></div><div>T=
omer=C2=A0</div></div></div>

--0000000000009da6f905835383d6--
