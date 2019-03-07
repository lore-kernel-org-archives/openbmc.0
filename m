Return-Path: <tyler.sabdon@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::d29; helo=mail-io1-xd29.google.com;
 envelope-from=tyler.sabdon@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="MnSaeTO7"; 
 dkim-atps=neutral
Received: from mail-io1-xd29.google.com (mail-io1-xd29.google.com
 [IPv6:2607:f8b0:4864:20::d29])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44FGbX1stXzDqCG
 for <openbmc@lists.ozlabs.org>; Thu,  7 Mar 2019 14:39:51 +1100 (AEDT)
Received: by mail-io1-xd29.google.com with SMTP id p17so12209723iol.7
 for <openbmc@lists.ozlabs.org>; Wed, 06 Mar 2019 19:39:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=P6uG16/OvDs54DHN0Uccvg5pMfbBBPgviOcZzoEdM2A=;
 b=MnSaeTO78eRj70QRs3YdwmVZHBPh/G2VGGtnOme5hah383d3yxTRqG8uT6zjfViWx/
 dd3SVP4Q6DUpEVUi9QyPpiL/g5LWdhRCKZEDfM/koVfxZUk474thLyY4cJ7JTSqKBbyI
 Kib4CImrnbfz2+P1JfRyTbb/ig3wGBo2YThmu0FfSl0ABQvo2jksPOWHkoSqwVNWwl4s
 GfzqxRpWg9y4VrIwuZSfCg9Xr2hFbE2B6JmJbDJ0DDmDeF+7210Dv1BYH08d87jRhX/Q
 /JDd47YgQ5aeEbY73crIejyRwQjtJ+clfOZWvqlMHBruFwrmbf7c1+0z8fh09ubVkynU
 sDmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=P6uG16/OvDs54DHN0Uccvg5pMfbBBPgviOcZzoEdM2A=;
 b=mTrZIufui05YGkGkH0QAlpd5BLf3utfpBbGzQ7XTm0CF2vLSVEnaIizRUrqnk3k6O9
 cCvfMFt4u1yE8uv9kCgED9ETYgsAKF8MisWh1KqLEGBomLuEDEhxU2ln2uS4dMF/9JrZ
 iUKTySDIqaTlJFjlbG2pUGcF0CK1xkG6jdmXkVYENFq3hzXsVk59gDoERP204tvT1uu/
 D3g+zfmZoDvu+/kfeXEtF39v9E5Pd1FjFluoX+UUMjJTrHv0gYbiEup+KDpE+WyB33S0
 znRy42Fg1fDYUglwHEZeuxHBRdsdxn5bLsJ9YKnjCrpCyAyk1Csi2BRIr+fXm77MkkyX
 73cw==
X-Gm-Message-State: APjAAAUjqeqgXpZl2xYOvo4D+Zek8nCZ9s3TUl2B883kbFX2djTzsLW9
 43mjDNhfXd6BIfcZrk+DozIjUhrR9fagKX5fzl4=
X-Google-Smtp-Source: APXvYqyaWCO+RRmqHeDcSdl2e1wFU7E654RV9rLrhhYckl3s0YZxElpoGlcR5Ny7XULr68dmK8VNVTiD2LwiHitVd3o=
X-Received: by 2002:a5e:de0b:: with SMTP id e11mr5644162iok.73.1551929987673; 
 Wed, 06 Mar 2019 19:39:47 -0800 (PST)
MIME-Version: 1.0
References: <CAO9PYRJjBTPEgymzS5aygU_=e2dBqDwMezFF2iOZ-Ah016dhYQ@mail.gmail.com>
 <CAJoAoZmWD_jx+qCtJV-KOXRGa0GO0w3JpOO_q4GHJ0KzR8LKuQ@mail.gmail.com>
 <CAO9PYRLkfidAqVTV-HU-SJAAdq9RARbLH8hanC+72rr03ibYNg@mail.gmail.com>
 <CAJoAoZmO1t4gougLchF-XacYVU5b7uR2qAYyXRHpjnwJNzdm6g@mail.gmail.com>
In-Reply-To: <CAJoAoZmO1t4gougLchF-XacYVU5b7uR2qAYyXRHpjnwJNzdm6g@mail.gmail.com>
From: Deng Tyler <tyler.sabdon@gmail.com>
Date: Thu, 7 Mar 2019 11:39:36 +0800
Message-ID: <CAO9PYRKF5rVO7xJedEM4z7OAKLvtUU0LYJJb=rh7bUK85rJLkQ@mail.gmail.com>
Subject: Re: Sensor value calculation formula
To: Emily Shaffer <emilyshaffer@google.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: multipart/alternative; boundary="000000000000a1b373058378db22"
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
X-List-Received-Date: Thu, 07 Mar 2019 03:39:54 -0000

--000000000000a1b373058378db22
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Emily, thank for your reply and you are really help me a lot. I use
"GAIN_in1=3D5.0" in configuration file convert 2100 to 10500. Now Dbus stor=
e
value is 10500 and it mean 10.5V in ipmitool end. But I still have some
doubt about " DBus should be holding the value in units". There is a
example in openbmc sensor document as below:
=3D=3D=3D=3D
so for a DBus sensor value of 4986 meaning 4.986V, phosphor-ipmi-host would
encode it as

x: 4986 / 20 =3D 249
M: 20
rExp: -3

When ipmitool sensor list is called, the tool fetches sensor factors and
computes value as:

y =3D 20 * 249 * 10^-3 =3D 4.98 (V)

=3D=3D=3D=3D
In above description, Dbus store value is 4986 but it is not real value in
unit. If user switch to REST or redfish for getting sensor then 4986 will
be display in same time. Is it correct?

Tyler

Emily Shaffer <emilyshaffer@google.com> =E6=96=BC 2019=E5=B9=B43=E6=9C=887=
=E6=97=A5 =E9=80=B1=E5=9B=9B =E4=B8=8A=E5=8D=8810:02=E5=AF=AB=E9=81=93=EF=
=BC=9A

> It sounds like you may want to convert, on your sensor end, so that
> you are expressing 12.0V in DBus. DBus should be holding the value in
> units, rather than a raw sensor value. The alternative here would be
> for you to put some context-aware conversion into host-ipmid or into
> your handler on top of ipmitool, and that's not something anybody
> wants :)  Later if you decide to switch to Redfish, you will have the
> same problem, due to your value in DBus being a raw reading instead of
> something in units.
>
> Is it possible for you to modify your code where the value is being
> pushed to DBus?
>
> On Wed, Mar 6, 2019 at 5:54 PM Deng Tyler <tyler.sabdon@gmail.com> wrote:
> >
> > Hi Emily, thank for your kindly reply. This is not typo. I want to
> dispaly 12.0V in ipmitool and my raw data in Dbus is 2100.
> > I know value x length is 1 byte. I concern that why raw data calculate
> with M, rExp before response to ipmitool.
> >
> > Tyler
> >
> > Emily Shaffer <emilyshaffer@google.com> =E6=96=BC 2019=E5=B9=B43=E6=9C=
=887=E6=97=A5 =E9=80=B1=E5=9B=9B =E4=B8=8A=E5=8D=886:47=E5=AF=AB=E9=81=93=
=EF=BC=9A
> >>
> >> Hi Tyler,Is this a typo? Do you mean you want to display 21.0 in
> >> ipmitool? I don't know why there is scaling besides power of 10 on
> >> your raw value. That is odd.Assuming it was a typo, what you want to
> >> do is set the scale in the sensor info in order to perform /100
> >> operation. Or you could set the unit, though that might be difficult
> >> with a /100 (rather than increment of 1000).The scaling with m, rExp,
> >> etc is because the IPMI protocol has such a narrow field for sensor
> >> data (1 byte, as you saw; this is value x).So my recommendation to you
> >> is to use the scale to do your 2100->21.0 rounding when displaying
> >> output from ipmitool; and then to use your estimated maximum and
> >> minimum y to try and figure out what kind of coefficients you want to
> >> use.  This doesn't need to be perfect; you will lose some precision if
> >> you choose exponents which give you a much wider range than you need,
> >> but otherwise the operation should be invisible at the other end.If
> >> you really did mean you want 2100 -> 12.0 then that's a different
> >> question, which may require some more massaging on one end or another,
> >> so let us know.
> >>
> >> Emily
> >>
> >> On Wed, Mar 6, 2019 at 5:33 AM Deng Tyler <tyler.sabdon@gmail.com>
> wrote:
> >> >
> >> > Hi all:
> >> >     Sensor reading, according to IPMI spec, is calculated as:
> >> >
> >> > y =3D L[(Mx + B * 10^(bExp)) * 10^(rExp)]
> >> >
> >> > y: the 'final value' as reported by IPMItool
> >> > x: 8 bits, unsigned, reading data encoded in IPMI response packet
> >> > M: 10 bits, signed integer multiplier, multiplierM in YAML
> >> > B: 10 bits, signed additive offset, offsetB in YAML
> >> > bExp: 4 bits, signed, bExp in YAML
> >> > rExp: 4 bits, signed, rExp in YAML
> >> >
> >> >  ipmid calculate raw data by
> >> > double value =3D variant_ns::get<T>(propValue) * std::pow(10,
> sensorInfo.scale - sensorInfo.exponentR);
> >> > auto rawData =3D static_cast<uint8_t>((value - sensorInfo.scaledOffs=
et)
> / sensorInfo.coefficientM);sue
> >> >
> >> > I am confused about why process raw data with M and rExp? M, offsetB=
,
> bExp and rExp shall just responded to ipmitool and calculate with raw
> >> > data. I thought raw data only need calculated by scale if raw data
> need to be adjust before respond to ipmitool.
> >> > Now I met a problem, I have a raw data is 2100 and I want to display
> 12.0 in ipmitool sdr command. I don't know how to assign M, rExp and scal=
e
> value in yaml.
> >> > Could some one tell me how to translate sensor value? tks.
> >> >
> >> > Tyler
> >> >
> >> >
> >>
> >>
> >> --
> >> Emily Shaffer
>
>
>
> --
> Emily Shaffer
>

--000000000000a1b373058378db22
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi Emily, thank for your reply and you are really help me =
a lot. I use &quot;GAIN_in1=3D5.0&quot; in configuration file convert 2100 =
to 10500. Now Dbus store value is 10500 and it mean 10.5V in ipmitool end. =
But I still have some doubt about &quot;

DBus should be holding the value in units&quot;. There is a example in open=
bmc sensor document as below:<div>=3D=3D=3D=3D</div><div><span style=3D"col=
or:rgb(36,41,46);font-family:-apple-system,BlinkMacSystemFont,&quot;Segoe U=
I&quot;,Helvetica,Arial,sans-serif,&quot;Apple Color Emoji&quot;,&quot;Sego=
e UI Emoji&quot;,&quot;Segoe UI Symbol&quot;;font-size:16px">so for a DBus =
sensor value of 4986 meaning 4.986V, phosphor-ipmi-host would encode it as<=
/span><pre style=3D"box-sizing:border-box;font-family:SFMono-Regular,Consol=
as,&quot;Liberation Mono&quot;,Menlo,Courier,monospace;font-size:13.6px;mar=
gin-bottom:16px;margin-top:0px;background-color:rgb(246,248,250);border-rad=
ius:3px;line-height:1.45;overflow:auto;padding:16px;color:rgb(36,41,46)"><c=
ode style=3D"box-sizing:border-box;font-family:SFMono-Regular,Consolas,&quo=
t;Liberation Mono&quot;,Menlo,Courier,monospace;font-size:13.6px;background=
:transparent;border-radius:3px;margin:0px;padding:0px;border:0px;word-break=
:normal;display:inline;line-height:inherit;overflow:visible">x: 4986 / 20 =
=3D 249
M: 20
rExp: -3
</code></pre><p style=3D"box-sizing:border-box;margin-bottom:16px;margin-to=
p:0px;color:rgb(36,41,46);font-family:-apple-system,BlinkMacSystemFont,&quo=
t;Segoe UI&quot;,Helvetica,Arial,sans-serif,&quot;Apple Color Emoji&quot;,&=
quot;Segoe UI Emoji&quot;,&quot;Segoe UI Symbol&quot;;font-size:16px">When =
ipmitool sensor list is called, the tool fetches sensor factors and compute=
s value as:</p><pre lang=3D"none" style=3D"box-sizing:border-box;font-famil=
y:SFMono-Regular,Consolas,&quot;Liberation Mono&quot;,Menlo,Courier,monospa=
ce;font-size:13.6px;margin-bottom:16px;margin-top:0px;background-color:rgb(=
246,248,250);border-radius:3px;line-height:1.45;overflow:auto;padding:16px;=
color:rgb(36,41,46)"><code style=3D"box-sizing:border-box;font-family:SFMon=
o-Regular,Consolas,&quot;Liberation Mono&quot;,Menlo,Courier,monospace;font=
-size:13.6px;background:transparent;border-radius:3px;margin:0px;padding:0p=
x;border:0px;word-break:normal;display:inline;line-height:inherit;overflow:=
visible">y =3D 20 * 249 * 10^-3 =3D 4.98 (V)</code></pre></div><div>=3D=3D=
=3D=3D=C2=A0<div><font color=3D"#24292e" face=3D"-apple-system, BlinkMacSys=
temFont, Segoe UI, Helvetica, Arial, sans-serif, Apple Color Emoji, Segoe U=
I Emoji, Segoe UI Symbol"><span style=3D"font-size:16px">In above descripti=
on, Dbus store value is 4986 but it is not real value in unit. If user swit=
ch to REST or redfish for getting sensor then 4986 will be display in same =
time. Is it correct?</span></font></div><div><font color=3D"#24292e" face=
=3D"-apple-system, BlinkMacSystemFont, Segoe UI, Helvetica, Arial, sans-ser=
if, Apple Color Emoji, Segoe UI Emoji, Segoe UI Symbol"><span style=3D"font=
-size:16px"><br></span></font></div><div><font color=3D"#24292e" face=3D"-a=
pple-system, BlinkMacSystemFont, Segoe UI, Helvetica, Arial, sans-serif, Ap=
ple Color Emoji, Segoe UI Emoji, Segoe UI Symbol"><span style=3D"font-size:=
16px">Tyler=C2=A0</span></font></div></div></div><br><div class=3D"gmail_qu=
ote"><div dir=3D"ltr" class=3D"gmail_attr">Emily Shaffer &lt;<a href=3D"mai=
lto:emilyshaffer@google.com">emilyshaffer@google.com</a>&gt; =E6=96=BC 2019=
=E5=B9=B43=E6=9C=887=E6=97=A5 =E9=80=B1=E5=9B=9B =E4=B8=8A=E5=8D=8810:02=E5=
=AF=AB=E9=81=93=EF=BC=9A<br></div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">It sounds like you may want to convert, on your sensor end, so t=
hat<br>
you are expressing 12.0V in DBus. DBus should be holding the value in<br>
units, rather than a raw sensor value. The alternative here would be<br>
for you to put some context-aware conversion into host-ipmid or into<br>
your handler on top of ipmitool, and that&#39;s not something anybody<br>
wants :)=C2=A0 Later if you decide to switch to Redfish, you will have the<=
br>
same problem, due to your value in DBus being a raw reading instead of<br>
something in units.<br>
<br>
Is it possible for you to modify your code where the value is being<br>
pushed to DBus?<br>
<br>
On Wed, Mar 6, 2019 at 5:54 PM Deng Tyler &lt;<a href=3D"mailto:tyler.sabdo=
n@gmail.com" target=3D"_blank">tyler.sabdon@gmail.com</a>&gt; wrote:<br>
&gt;<br>
&gt; Hi Emily, thank for your kindly reply. This is not typo. I want to dis=
paly 12.0V in ipmitool and my raw data in Dbus is 2100.<br>
&gt; I know value x length is 1 byte. I concern that why raw data calculate=
 with M, rExp before response to ipmitool.<br>
&gt;<br>
&gt; Tyler<br>
&gt;<br>
&gt; Emily Shaffer &lt;<a href=3D"mailto:emilyshaffer@google.com" target=3D=
"_blank">emilyshaffer@google.com</a>&gt; =E6=96=BC 2019=E5=B9=B43=E6=9C=887=
=E6=97=A5 =E9=80=B1=E5=9B=9B =E4=B8=8A=E5=8D=886:47=E5=AF=AB=E9=81=93=EF=BC=
=9A<br>
&gt;&gt;<br>
&gt;&gt; Hi Tyler,Is this a typo? Do you mean you want to display 21.0 in<b=
r>
&gt;&gt; ipmitool? I don&#39;t know why there is scaling besides power of 1=
0 on<br>
&gt;&gt; your raw value. That is odd.Assuming it was a typo, what you want =
to<br>
&gt;&gt; do is set the scale in the sensor info in order to perform /100<br=
>
&gt;&gt; operation. Or you could set the unit, though that might be difficu=
lt<br>
&gt;&gt; with a /100 (rather than increment of 1000).The scaling with m, rE=
xp,<br>
&gt;&gt; etc is because the IPMI protocol has such a narrow field for senso=
r<br>
&gt;&gt; data (1 byte, as you saw; this is value x).So my recommendation to=
 you<br>
&gt;&gt; is to use the scale to do your 2100-&gt;21.0 rounding when display=
ing<br>
&gt;&gt; output from ipmitool; and then to use your estimated maximum and<b=
r>
&gt;&gt; minimum y to try and figure out what kind of coefficients you want=
 to<br>
&gt;&gt; use.=C2=A0 This doesn&#39;t need to be perfect; you will lose some=
 precision if<br>
&gt;&gt; you choose exponents which give you a much wider range than you ne=
ed,<br>
&gt;&gt; but otherwise the operation should be invisible at the other end.I=
f<br>
&gt;&gt; you really did mean you want 2100 -&gt; 12.0 then that&#39;s a dif=
ferent<br>
&gt;&gt; question, which may require some more massaging on one end or anot=
her,<br>
&gt;&gt; so let us know.<br>
&gt;&gt;<br>
&gt;&gt; Emily<br>
&gt;&gt;<br>
&gt;&gt; On Wed, Mar 6, 2019 at 5:33 AM Deng Tyler &lt;<a href=3D"mailto:ty=
ler.sabdon@gmail.com" target=3D"_blank">tyler.sabdon@gmail.com</a>&gt; wrot=
e:<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; Hi all:<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0Sensor reading, according to IPMI spec, is=
 calculated as:<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; y =3D L[(Mx + B * 10^(bExp)) * 10^(rExp)]<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; y: the &#39;final value&#39; as reported by IPMItool<br>
&gt;&gt; &gt; x: 8 bits, unsigned, reading data encoded in IPMI response pa=
cket<br>
&gt;&gt; &gt; M: 10 bits, signed integer multiplier, multiplierM in YAML<br=
>
&gt;&gt; &gt; B: 10 bits, signed additive offset, offsetB in YAML<br>
&gt;&gt; &gt; bExp: 4 bits, signed, bExp in YAML<br>
&gt;&gt; &gt; rExp: 4 bits, signed, rExp in YAML<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt;=C2=A0 ipmid calculate raw data by<br>
&gt;&gt; &gt; double value =3D variant_ns::get&lt;T&gt;(propValue) * std::p=
ow(10, sensorInfo.scale - sensorInfo.exponentR);<br>
&gt;&gt; &gt; auto rawData =3D static_cast&lt;uint8_t&gt;((value - sensorIn=
fo.scaledOffset) / sensorInfo.coefficientM);sue<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; I am confused about why process raw data with M and rExp? M, =
offsetB, bExp and rExp shall just responded to ipmitool and calculate with =
raw<br>
&gt;&gt; &gt; data. I thought raw data only need calculated by scale if raw=
 data need to be adjust before respond to ipmitool.<br>
&gt;&gt; &gt; Now I met a problem, I have a raw data is 2100 and I want to =
display 12.0 in ipmitool sdr command. I don&#39;t know how to assign M, rEx=
p and scale value in yaml.<br>
&gt;&gt; &gt; Could some one tell me how to translate sensor value? tks.<br=
>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; Tyler<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt;<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt; --<br>
&gt;&gt; Emily Shaffer<br>
<br>
<br>
<br>
-- <br>
Emily Shaffer<br>
</blockquote></div>

--000000000000a1b373058378db22--
