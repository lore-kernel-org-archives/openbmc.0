Return-Path: <tyler.sabdon@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::d30; helo=mail-io1-xd30.google.com;
 envelope-from=tyler.sabdon@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="G0ARb7ge"; 
 dkim-atps=neutral
Received: from mail-io1-xd30.google.com (mail-io1-xd30.google.com
 [IPv6:2607:f8b0:4864:20::d30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44FDFz5TCGzDqC9
 for <openbmc@lists.ozlabs.org>; Thu,  7 Mar 2019 12:54:31 +1100 (AEDT)
Received: by mail-io1-xd30.google.com with SMTP id p196so12038522iod.9
 for <openbmc@lists.ozlabs.org>; Wed, 06 Mar 2019 17:54:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=UvxEt8aFf5DA5rZ6Cu9p5MUAvMknxDdavoUdg8BOkWc=;
 b=G0ARb7geT4QzLmEG2NIPVfjNTT67q+ptxSSVb9LVp15GyTsKjDGCf0XJ5F2Mk+VT+w
 ftfsmoGXKmfLdKzOckKvZlUXOAuYLH64JRwxBXgIdj0Wh+776K2BPe8DekTGp4EeTElp
 2dbD1Mzn7K1S6edyKXyiQPDdGR/3LzvSEOp0940XADzv3ziNlSwWmmTdqSxRV2sgHtAl
 KY3jQ0pT85ahuFN4p/uQAgGNNKbNIXz9elj1V1jNbkmJd4OFi6NCjKGbDKL65NKnN6m6
 IFZG/7urouTLhvHJwu7RGKEvWrMyLUtl2MygLdXhHzNFypr9Eg7WmM2rm0XH3v30w57d
 c+ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=UvxEt8aFf5DA5rZ6Cu9p5MUAvMknxDdavoUdg8BOkWc=;
 b=CbT6MAp4LfuSJo742kKxOFn0qVpCFlRw1lVnC7Wdxcsxwek5TJRRdBMhhm3SrUgrpT
 C+ALVQ+o3jrEw5U9cb2PXEk4hZWL+QC5aOa5DUEfaFT1OMDftR038D46RZL5XIsZc/BU
 96g+oriV3JTDKunUCEkghEQf2tD+JHuiKGxif/s0lEPbH9n0XeecZwiz8brVPFgqxwkh
 cqr0EQyk6om7HiDpP0UNnZ2lvg7oJ7vnl5YhEHnHSxwID0XS0k/jWnDh8aF/wQGxEuwW
 poPaTfvpJQDzL64siT3ccFyvygkAahk3srtOp4ZV6tcyaZAvO2ZrZClw1fIsrokc+20B
 NWPA==
X-Gm-Message-State: APjAAAXCicF1depj3ZV/hPvYsMHaMpRjciV98UTKJUBzbNuclwXpEG7D
 pgrUwWsjypU8ghf0w+eWP9D40t5r7kKhuFyFVSA=
X-Google-Smtp-Source: APXvYqxpsIHHmydU87m1uV7nzHy3legpYM9gex1RgzULQII8Ifkg9MAvnZd0sv2J0iOuHWuiry2vgwPlw6LGU3iMWOA=
X-Received: by 2002:a5e:c707:: with SMTP id f7mr5299036iop.76.1551923665536;
 Wed, 06 Mar 2019 17:54:25 -0800 (PST)
MIME-Version: 1.0
References: <CAO9PYRJjBTPEgymzS5aygU_=e2dBqDwMezFF2iOZ-Ah016dhYQ@mail.gmail.com>
 <CAJoAoZmWD_jx+qCtJV-KOXRGa0GO0w3JpOO_q4GHJ0KzR8LKuQ@mail.gmail.com>
In-Reply-To: <CAJoAoZmWD_jx+qCtJV-KOXRGa0GO0w3JpOO_q4GHJ0KzR8LKuQ@mail.gmail.com>
From: Deng Tyler <tyler.sabdon@gmail.com>
Date: Thu, 7 Mar 2019 09:54:14 +0800
Message-ID: <CAO9PYRLkfidAqVTV-HU-SJAAdq9RARbLH8hanC+72rr03ibYNg@mail.gmail.com>
Subject: Re: Sensor value calculation formula
To: Emily Shaffer <emilyshaffer@google.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: multipart/alternative; boundary="000000000000cd8f8705837762a9"
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
X-List-Received-Date: Thu, 07 Mar 2019 01:54:33 -0000

--000000000000cd8f8705837762a9
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Emily, thank for your kindly reply. This is not typo. I want to dispaly
12.0V in ipmitool and my raw data in Dbus is 2100.
I know value x length is 1 byte. I concern that why raw data calculate with
M, rExp before response to ipmitool.

Tyler

Emily Shaffer <emilyshaffer@google.com> =E6=96=BC 2019=E5=B9=B43=E6=9C=887=
=E6=97=A5 =E9=80=B1=E5=9B=9B =E4=B8=8A=E5=8D=886:47=E5=AF=AB=E9=81=93=EF=BC=
=9A

> Hi Tyler,Is this a typo? Do you mean you want to display 21.0 in
> ipmitool? I don't know why there is scaling besides power of 10 on
> your raw value. That is odd.Assuming it was a typo, what you want to
> do is set the scale in the sensor info in order to perform /100
> operation. Or you could set the unit, though that might be difficult
> with a /100 (rather than increment of 1000).The scaling with m, rExp,
> etc is because the IPMI protocol has such a narrow field for sensor
> data (1 byte, as you saw; this is value x).So my recommendation to you
> is to use the scale to do your 2100->21.0 rounding when displaying
> output from ipmitool; and then to use your estimated maximum and
> minimum y to try and figure out what kind of coefficients you want to
> use.  This doesn't need to be perfect; you will lose some precision if
> you choose exponents which give you a much wider range than you need,
> but otherwise the operation should be invisible at the other end.If
> you really did mean you want 2100 -> 12.0 then that's a different
> question, which may require some more massaging on one end or another,
> so let us know.
>
> Emily
>
> On Wed, Mar 6, 2019 at 5:33 AM Deng Tyler <tyler.sabdon@gmail.com> wrote:
> >
> > Hi all:
> >     Sensor reading, according to IPMI spec, is calculated as:
> >
> > y =3D L[(Mx + B * 10^(bExp)) * 10^(rExp)]
> >
> > y: the 'final value' as reported by IPMItool
> > x: 8 bits, unsigned, reading data encoded in IPMI response packet
> > M: 10 bits, signed integer multiplier, multiplierM in YAML
> > B: 10 bits, signed additive offset, offsetB in YAML
> > bExp: 4 bits, signed, bExp in YAML
> > rExp: 4 bits, signed, rExp in YAML
> >
> >  ipmid calculate raw data by
> > double value =3D variant_ns::get<T>(propValue) * std::pow(10,
> sensorInfo.scale - sensorInfo.exponentR);
> > auto rawData =3D static_cast<uint8_t>((value - sensorInfo.scaledOffset)=
 /
> sensorInfo.coefficientM);sue
> >
> > I am confused about why process raw data with M and rExp? M, offsetB,
> bExp and rExp shall just responded to ipmitool and calculate with raw
> > data. I thought raw data only need calculated by scale if raw data need
> to be adjust before respond to ipmitool.
> > Now I met a problem, I have a raw data is 2100 and I want to display
> 12.0 in ipmitool sdr command. I don't know how to assign M, rExp and scal=
e
> value in yaml.
> > Could some one tell me how to translate sensor value? tks.
> >
> > Tyler
> >
> >
>
>
> --
> Emily Shaffer
>

--000000000000cd8f8705837762a9
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi Emily, thank for your kindly reply. This is not typo. I=
 want to dispaly 12.0V in ipmitool and my raw data in Dbus is 2100.<div>I k=
now value x length is 1 byte. I concern that why raw data calculate with M,=
 rExp before response to ipmitool.</div><div><br></div><div>Tyler</div></di=
v><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">Emil=
y Shaffer &lt;<a href=3D"mailto:emilyshaffer@google.com">emilyshaffer@googl=
e.com</a>&gt; =E6=96=BC 2019=E5=B9=B43=E6=9C=887=E6=97=A5 =E9=80=B1=E5=9B=
=9B =E4=B8=8A=E5=8D=886:47=E5=AF=AB=E9=81=93=EF=BC=9A<br></div><blockquote =
class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px sol=
id rgb(204,204,204);padding-left:1ex">Hi Tyler,Is this a typo? Do you mean =
you want to display 21.0 in<br>
ipmitool? I don&#39;t know why there is scaling besides power of 10 on<br>
your raw value. That is odd.Assuming it was a typo, what you want to<br>
do is set the scale in the sensor info in order to perform /100<br>
operation. Or you could set the unit, though that might be difficult<br>
with a /100 (rather than increment of 1000).The scaling with m, rExp,<br>
etc is because the IPMI protocol has such a narrow field for sensor<br>
data (1 byte, as you saw; this is value x).So my recommendation to you<br>
is to use the scale to do your 2100-&gt;21.0 rounding when displaying<br>
output from ipmitool; and then to use your estimated maximum and<br>
minimum y to try and figure out what kind of coefficients you want to<br>
use.=C2=A0 This doesn&#39;t need to be perfect; you will lose some precisio=
n if<br>
you choose exponents which give you a much wider range than you need,<br>
but otherwise the operation should be invisible at the other end.If<br>
you really did mean you want 2100 -&gt; 12.0 then that&#39;s a different<br=
>
question, which may require some more massaging on one end or another,<br>
so let us know.<br>
<br>
Emily<br>
<br>
On Wed, Mar 6, 2019 at 5:33 AM Deng Tyler &lt;<a href=3D"mailto:tyler.sabdo=
n@gmail.com" target=3D"_blank">tyler.sabdon@gmail.com</a>&gt; wrote:<br>
&gt;<br>
&gt; Hi all:<br>
&gt;=C2=A0 =C2=A0 =C2=A0Sensor reading, according to IPMI spec, is calculat=
ed as:<br>
&gt;<br>
&gt; y =3D L[(Mx + B * 10^(bExp)) * 10^(rExp)]<br>
&gt;<br>
&gt; y: the &#39;final value&#39; as reported by IPMItool<br>
&gt; x: 8 bits, unsigned, reading data encoded in IPMI response packet<br>
&gt; M: 10 bits, signed integer multiplier, multiplierM in YAML<br>
&gt; B: 10 bits, signed additive offset, offsetB in YAML<br>
&gt; bExp: 4 bits, signed, bExp in YAML<br>
&gt; rExp: 4 bits, signed, rExp in YAML<br>
&gt;<br>
&gt;=C2=A0 ipmid calculate raw data by<br>
&gt; double value =3D variant_ns::get&lt;T&gt;(propValue) * std::pow(10, se=
nsorInfo.scale - sensorInfo.exponentR);<br>
&gt; auto rawData =3D static_cast&lt;uint8_t&gt;((value - sensorInfo.scaled=
Offset) / sensorInfo.coefficientM);sue<br>
&gt;<br>
&gt; I am confused about why process raw data with M and rExp? M, offsetB, =
bExp and rExp shall just responded to ipmitool and calculate with raw<br>
&gt; data. I thought raw data only need calculated by scale if raw data nee=
d to be adjust before respond to ipmitool.<br>
&gt; Now I met a problem, I have a raw data is 2100 and I want to display 1=
2.0 in ipmitool sdr command. I don&#39;t know how to assign M, rExp and sca=
le value in yaml.<br>
&gt; Could some one tell me how to translate sensor value? tks.<br>
&gt;<br>
&gt; Tyler<br>
&gt;<br>
&gt;<br>
<br>
<br>
--<br>
Emily Shaffer<br>
</blockquote></div>

--000000000000cd8f8705837762a9--
