Return-Path: <maxims@google.com>
Received: from mail-yw0-x232.google.com (mail-yw0-x232.google.com
 [IPv6:2607:f8b0:4002:c05::232])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3st51z1FWCzDrbq
 for <openbmc@lists.ozlabs.org>; Tue, 11 Oct 2016 03:20:06 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b=o7tqaiHw; 
 dkim-atps=neutral
Received: by mail-yw0-x232.google.com with SMTP id u124so74868619ywg.3
 for <openbmc@lists.ozlabs.org>; Mon, 10 Oct 2016 09:20:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20120113;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=cs1wEhW6O97iwcQoRBMW0X5oohPhtEuWWjwrYSggvvw=;
 b=o7tqaiHwPC1TY76JwQSJQRxu49R9LRmvvVKbCqSZNNRTNb6abnwuP1AzfNkNV10rVY
 AHAjCf8eu3T7fGgjhZt/U+rsEhn/r8RKg1WiKkVjF+RVObu8EVy0i/LFC5V5r/V5OTBv
 /kC/8V6J/6hBdeJnu8dS9ix0QPySaHVb+dRjfa/quiYvoQhb/9Ffxix3PZ+nCXaLLd6V
 stEqxGYkQd4U99qC84JbrZSxKfpt6GIgFeR5QgMkPdnIOAKb1xjRtOfwS3sYDjvAcXUP
 fjzlXupGFfZZQ7RL4KKvZAUAykXTSeIZ+MTNJWt8v+EF5HYLgvrTXmE7GOPgoA9PsAEf
 aRqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=cs1wEhW6O97iwcQoRBMW0X5oohPhtEuWWjwrYSggvvw=;
 b=Ii/RDLl+2uaGundm+9esOhcYnzq8v9Uq3z/dl19LCVU2KGkywJO2lgCImcY/hH66JA
 qeZvTl4yohy01bt+v9dEVo1hMM3NOlQymagP0eedlxoH+U1cBt4SfLujdvsRC3qmEzqJ
 tdkhBr3Q1Ru2s4h9t1KUs/QcvN8+bFgVJG3D9GsshH7ZIFFpzv16bKSLTO+CapLjXYal
 IcpA90FUI59E71K/FfYQkVKEcg2UTptlH+7F4enKj04cAAKNEzlIgOfKBVEbhtTx9X31
 0GxxxYZIPH8FbH2a+wh7JCKY0J1zdzlDycC1tv6NPJ7xZMhEHN1l10DwuEOLZK6Hee1p
 UqsA==
X-Gm-Message-State: AA6/9Rkcm9JVmrJZuJ1YI6x+3BPlILSkVafob/Pn4rzSpCL3eZLzlrkEKU3vGiF82FMuMVUbRmETxW53ai/M9ZuD
X-Received: by 10.129.99.132 with SMTP id x126mr3025201ywb.313.1476116403780; 
 Mon, 10 Oct 2016 09:20:03 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.37.210.2 with HTTP; Mon, 10 Oct 2016 09:20:03 -0700 (PDT)
In-Reply-To: <CACPK8XfidRBwJW6qFrnDcMBif5dHQBa0gHx9Bac71+iTWqjWEQ@mail.gmail.com>
References: <1474306018-101166-1-git-send-email-maxims@google.com>
 <1474998214-12720-1-git-send-email-maxims@google.com>
 <1474998214-12720-3-git-send-email-maxims@google.com>
 <CACPK8XekqQyXVfkY6BoNBXWxZSwDXngtxU_8e4uuEZ-JdDmoRw@mail.gmail.com>
 <CAFR_W8r663kSg16-4eNYSHkAYabJyBSMC7o0GGhpTyKS9Zc=Kg@mail.gmail.com>
 <CACPK8XfidRBwJW6qFrnDcMBif5dHQBa0gHx9Bac71+iTWqjWEQ@mail.gmail.com>
From: Maxim Sloyko <maxims@google.com>
Date: Mon, 10 Oct 2016 09:20:03 -0700
Message-ID: <CAFR_W8r+LUtXfx9zML+V_4tYEHWJva32SjVs9VBNvb_5qAhF0w@mail.gmail.com>
Subject: Re: [PATCH 3/3] aspeed/g5: I2C driver.
To: Joel Stanley <joel@jms.id.au>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: multipart/alternative; boundary=001a1141cd3ee59bf1053e852107
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
X-List-Received-Date: Mon, 10 Oct 2016 16:20:07 -0000

--001a1141cd3ee59bf1053e852107
Content-Type: text/plain; charset=UTF-8

On Mon, Oct 10, 2016 at 12:19 AM, Joel Stanley <joel@jms.id.au> wrote:

> On Tue, Oct 4, 2016 at 7:41 AM, Maxim Sloyko <maxims@google.com> wrote:
> >> > +
> >> > +static const struct udevice_id ast_i2c_ids[] = {
> >> > +       {.compatible = "aspeed,ast2400-i2c-controller",},
> >> > +       {.compatible = "aspeed,ast2400-i2c-bus",},
> >>
> >> Your subject says g5, but your compatible strings say g4.
> >>
> >> Your probe function doesn't test for which string you're using. Why do
> >> you have both -controller and -bus?
> >
> >
> > I think this has something to do with how the device tree is processed,
> but
> > it seems that because i2c buses are specified under a single controller
> > node, if I don't specify compatibility with -controller, it does not
> match
> > -bus nodes.
>
> I don't follow?
>
> The hardware has a few registers that are common across many busses.
> The device tree describes them in the controller node, with the buses
> being children of this node.
>
> Cheers,
>
> Joel
>

I don't use them in this driver. At least not directly.

What are you proposing?



-- 
*M*axim *S*loyko

--001a1141cd3ee59bf1053e852107
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_extra"><br><div class=3D"gmail_quo=
te">On Mon, Oct 10, 2016 at 12:19 AM, Joel Stanley <span dir=3D"ltr">&lt;<a=
 href=3D"mailto:joel@jms.id.au" target=3D"_blank">joel@jms.id.au</a>&gt;</s=
pan> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex=
;border-left:1px #ccc solid;padding-left:1ex"><span class=3D"">On Tue, Oct =
4, 2016 at 7:41 AM, Maxim Sloyko &lt;<a href=3D"mailto:maxims@google.com">m=
axims@google.com</a>&gt; wrote:<br>
&gt;&gt; &gt; +<br>
&gt;&gt; &gt; +static const struct udevice_id ast_i2c_ids[] =3D {<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0{.compatible =3D &quot;aspeed,ast=
2400-i2c-<wbr>controller&quot;,},<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0{.compatible =3D &quot;aspeed,ast=
2400-i2c-bus&quot;,},<br>
&gt;&gt;<br>
&gt;&gt; Your subject says g5, but your compatible strings say g4.<br>
&gt;&gt;<br>
&gt;&gt; Your probe function doesn&#39;t test for which string you&#39;re u=
sing. Why do<br>
&gt;&gt; you have both -controller and -bus?<br>
&gt;<br>
&gt;<br>
&gt; I think this has something to do with how the device tree is processed=
, but<br>
&gt; it seems that because i2c buses are specified under a single controlle=
r<br>
&gt; node, if I don&#39;t specify compatibility with -controller, it does n=
ot match<br>
&gt; -bus nodes.<br>
<br>
</span>I don&#39;t follow?<br>
<br>
The hardware has a few registers that are common across many busses.<br>
The device tree describes them in the controller node, with the buses<br>
being children of this node.<br>
<br>
Cheers,<br>
<br>
Joel<br></blockquote><div><br></div><div>I don&#39;t use them in this drive=
r. At least not directly.</div><div><br></div><div>What are you proposing?=
=C2=A0</div></div><br><br clear=3D"all"><div><br></div>-- <br><div class=3D=
"gmail_signature" data-smartmail=3D"gmail_signature"><div><b>M</b>axim <b>S=
</b>loyko</div></div>
</div></div>

--001a1141cd3ee59bf1053e852107--
