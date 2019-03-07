Return-Path: <emilyshaffer@google.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2607:f8b0:4864:20::12d; helo=mail-it1-x12d.google.com;
 envelope-from=emilyshaffer@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="eAP4e63u"; 
 dkim-atps=neutral
Received: from mail-it1-x12d.google.com (mail-it1-x12d.google.com
 [IPv6:2607:f8b0:4864:20::12d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44FJtR45GHzDqBW
 for <openbmc@lists.ozlabs.org>; Thu,  7 Mar 2019 16:22:55 +1100 (AEDT)
Received: by mail-it1-x12d.google.com with SMTP id f186so2934844ita.0
 for <openbmc@lists.ozlabs.org>; Wed, 06 Mar 2019 21:22:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=5233cDrD6b2S/QprsRR6J0+kXF4dF5RaFDZSc3o1y3E=;
 b=eAP4e63uV7NatRFbozJcQSKpZ7eX4upOoRRKDu3+IH7rZ484thbc03YwW5L7TKmnrw
 XGtoL/UKeAeEPpjG1nDWEbXBFGwlnzRewHv/iUFobYFEa9g1tgZZIIaM9MB5mmk17+Pr
 9BHYl7By/FNJ9lgAU9wZaZbF9NTQbTffo+Aop15RrO0UFTksf9J4sp7UbzD2Q83ka1yw
 JJiRNX0CU/uDP5KhPhRhwDWMzuIMlvM1T1S0kUPYljJHPGZ9lPLVVx6lgeVaX0ew3G5U
 Z+4W9aaq/YqbWu+hskNfS/DC1cETKlW2TAFnJnAgelALawS+FxUY1c50c7nC6JyL2Awa
 r06g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=5233cDrD6b2S/QprsRR6J0+kXF4dF5RaFDZSc3o1y3E=;
 b=bia1KGJRPP0/OxP/Re7Yo0lcmHCWD6r/X00Q9g+mZXjSgYbDTSp0UmWtHrkZQYQOQe
 oqAoYukG+SNKHHEd1LHifJSG9PrFs6thzXT09kqkbtW5bMbnbwELlvFIZRSMs75e390b
 1JjITh3oabqJzf1ZCWizqZn8KRI/5Hlo2z0FYtwZX+N01ndpQn9H+qg+vyOvEELGSZ4g
 HYLISPuASHKMiv7mv84fkDb6CAJUA78eaIlVv6/sf6la4/gQ1QRqVXOwM/na8IwsFQIH
 bx2V8O0W87V1rA28BOgxqPwWTlJS6YfxE2oBwHKefZJeSOkDsFtj7q4jG+OEfuB1uZcg
 3A/A==
X-Gm-Message-State: APjAAAVOrRQa7cdT4rgreGIqA5o3iAqJPN3F1RePvMzkeRxtYtNoJE2H
 tkpfYkystuK2FSH8mejX7gGilUmGevvPCtN2k+MGUIusoTc=
X-Google-Smtp-Source: APXvYqwfjK2CC89wJntbW7J3adPxsBJQ6bXPOGCqyWcPmhAHSG0t9jis1jVczNBZYRWZDqZghyAzqN1zHtPVvWwj6wk=
X-Received: by 2002:a02:3b6f:: with SMTP id i47mr6588022jaf.39.1551936171377; 
 Wed, 06 Mar 2019 21:22:51 -0800 (PST)
MIME-Version: 1.0
References: <CAO9PYRJjBTPEgymzS5aygU_=e2dBqDwMezFF2iOZ-Ah016dhYQ@mail.gmail.com>
 <CAJoAoZmWD_jx+qCtJV-KOXRGa0GO0w3JpOO_q4GHJ0KzR8LKuQ@mail.gmail.com>
 <CAO9PYRLkfidAqVTV-HU-SJAAdq9RARbLH8hanC+72rr03ibYNg@mail.gmail.com>
 <CAJoAoZmO1t4gougLchF-XacYVU5b7uR2qAYyXRHpjnwJNzdm6g@mail.gmail.com>
 <CAO9PYRKF5rVO7xJedEM4z7OAKLvtUU0LYJJb=rh7bUK85rJLkQ@mail.gmail.com>
 <CAJoAoZkLH8Bvsu8c1UNKdwhoxzJEGXcZ=GpdyrYt2wf_BTTWNg@mail.gmail.com>
 <CAO9PYR+t4BaVDA1+EHG9YXTf3MVd+2kf7LAiP1PcEwQvTgCgyA@mail.gmail.com>
In-Reply-To: <CAO9PYR+t4BaVDA1+EHG9YXTf3MVd+2kf7LAiP1PcEwQvTgCgyA@mail.gmail.com>
From: Emily Shaffer <emilyshaffer@google.com>
Date: Wed, 6 Mar 2019 21:22:39 -0800
Message-ID: <CAJoAoZ=iZdB+HA1o9p1d3zgBaT9E93HpAos8PZ0fnXmcT3kJwQ@mail.gmail.com>
Subject: Re: Sensor value calculation formula
To: Deng Tyler <tyler.sabdon@gmail.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: multipart/alternative; boundary="00000000000036121305837a4c0e"
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
X-List-Received-Date: Thu, 07 Mar 2019 05:22:56 -0000

--00000000000036121305837a4c0e
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Tyler,

Sorry that I forgot. Yes, the scale is hardcoded for certain sensor types,
ie voltage is always millivolts. I have asked about this before but maybe
someone else on the list can give a better answer why that's the case.

Emily

On Wed, Mar 6, 2019, 9:19 PM Deng Tyler <tyler.sabdon@gmail.com> wrote:

> Hi Emily, thank for your kindly reply. I understood how it wok now. But I
> still have a question, which customized file can assign scale value to
> Dbus? It seems always equal -3.
>
> Tyler
>
> Emily Shaffer <emilyshaffer@google.com> =E6=96=BC 2019=E5=B9=B43=E6=9C=88=
7=E6=97=A5 =E9=80=B1=E5=9B=9B =E4=B8=8A=E5=8D=8811:46=E5=AF=AB=E9=81=93=EF=
=BC=9A
>
>> Tyler,
>>
>> In the example you cited, ideally that DBus entry reads Value: 4986;
>> Unit: Volts; Scale: -3.
>>
>>
>> https://github.com/openbmc/phosphor-dbus-interfaces/blob/master/xyz/open=
bmc_project/Sensor/Value.interface.yaml
>>
>> This essentially means the DBus entry is expressing 4986 millivolts,
>> or 4986*10^-3 volts.
>>
>> On Wed, Mar 6, 2019 at 7:39 PM Deng Tyler <tyler.sabdon@gmail.com> wrote=
:
>> >
>> > Hi Emily, thank for your reply and you are really help me a lot. I use
>> "GAIN_in1=3D5.0" in configuration file convert 2100 to 10500. Now Dbus s=
tore
>> value is 10500 and it mean 10.5V in ipmitool end. But I still have some
>> doubt about " DBus should be holding the value in units". There is a
>> example in openbmc sensor document as below:
>> > =3D=3D=3D=3D
>> > so for a DBus sensor value of 4986 meaning 4.986V, phosphor-ipmi-host
>> would encode it as
>> >
>> > x: 4986 / 20 =3D 249
>> > M: 20
>> > rExp: -3
>> >
>> > When ipmitool sensor list is called, the tool fetches sensor factors
>> and computes value as:
>> >
>> > y =3D 20 * 249 * 10^-3 =3D 4.98 (V)
>> >
>> > =3D=3D=3D=3D
>> > In above description, Dbus store value is 4986 but it is not real valu=
e
>> in unit. If user switch to REST or redfish for getting sensor then 4986
>> will be display in same time. Is it correct?
>> >
>> > Tyler
>> >
>> > Emily Shaffer <emilyshaffer@google.com> =E6=96=BC 2019=E5=B9=B43=E6=9C=
=887=E6=97=A5 =E9=80=B1=E5=9B=9B =E4=B8=8A=E5=8D=8810:02=E5=AF=AB=E9=81=93=
=EF=BC=9A
>> >>
>> >> It sounds like you may want to convert, on your sensor end, so that
>> >> you are expressing 12.0V in DBus. DBus should be holding the value in
>> >> units, rather than a raw sensor value. The alternative here would be
>> >> for you to put some context-aware conversion into host-ipmid or into
>> >> your handler on top of ipmitool, and that's not something anybody
>> >> wants :)  Later if you decide to switch to Redfish, you will have the
>> >> same problem, due to your value in DBus being a raw reading instead o=
f
>> >> something in units.
>> >>
>> >> Is it possible for you to modify your code where the value is being
>> >> pushed to DBus?
>> >>
>> >> On Wed, Mar 6, 2019 at 5:54 PM Deng Tyler <tyler.sabdon@gmail.com>
>> wrote:
>> >> >
>> >> > Hi Emily, thank for your kindly reply. This is not typo. I want to
>> dispaly 12.0V in ipmitool and my raw data in Dbus is 2100.
>> >> > I know value x length is 1 byte. I concern that why raw data
>> calculate with M, rExp before response to ipmitool.
>> >> >
>> >> > Tyler
>> >> >
>> >> > Emily Shaffer <emilyshaffer@google.com> =E6=96=BC 2019=E5=B9=B43=E6=
=9C=887=E6=97=A5 =E9=80=B1=E5=9B=9B =E4=B8=8A=E5=8D=886:47=E5=AF=AB=E9=81=
=93=EF=BC=9A
>> >> >>
>> >> >> Hi Tyler,Is this a typo? Do you mean you want to display 21.0 in
>> >> >> ipmitool? I don't know why there is scaling besides power of 10 on
>> >> >> your raw value. That is odd.Assuming it was a typo, what you want =
to
>> >> >> do is set the scale in the sensor info in order to perform /100
>> >> >> operation. Or you could set the unit, though that might be difficu=
lt
>> >> >> with a /100 (rather than increment of 1000).The scaling with m,
>> rExp,
>> >> >> etc is because the IPMI protocol has such a narrow field for senso=
r
>> >> >> data (1 byte, as you saw; this is value x).So my recommendation to
>> you
>> >> >> is to use the scale to do your 2100->21.0 rounding when displaying
>> >> >> output from ipmitool; and then to use your estimated maximum and
>> >> >> minimum y to try and figure out what kind of coefficients you want
>> to
>> >> >> use.  This doesn't need to be perfect; you will lose some precisio=
n
>> if
>> >> >> you choose exponents which give you a much wider range than you
>> need,
>> >> >> but otherwise the operation should be invisible at the other end.I=
f
>> >> >> you really did mean you want 2100 -> 12.0 then that's a different
>> >> >> question, which may require some more massaging on one end or
>> another,
>> >> >> so let us know.
>> >> >>
>> >> >> Emily
>> >> >>
>> >> >> On Wed, Mar 6, 2019 at 5:33 AM Deng Tyler <tyler.sabdon@gmail.com>
>> wrote:
>> >> >> >
>> >> >> > Hi all:
>> >> >> >     Sensor reading, according to IPMI spec, is calculated as:
>> >> >> >
>> >> >> > y =3D L[(Mx + B * 10^(bExp)) * 10^(rExp)]
>> >> >> >
>> >> >> > y: the 'final value' as reported by IPMItool
>> >> >> > x: 8 bits, unsigned, reading data encoded in IPMI response packe=
t
>> >> >> > M: 10 bits, signed integer multiplier, multiplierM in YAML
>> >> >> > B: 10 bits, signed additive offset, offsetB in YAML
>> >> >> > bExp: 4 bits, signed, bExp in YAML
>> >> >> > rExp: 4 bits, signed, rExp in YAML
>> >> >> >
>> >> >> >  ipmid calculate raw data by
>> >> >> > double value =3D variant_ns::get<T>(propValue) * std::pow(10,
>> sensorInfo.scale - sensorInfo.exponentR);
>> >> >> > auto rawData =3D static_cast<uint8_t>((value -
>> sensorInfo.scaledOffset) / sensorInfo.coefficientM);sue
>> >> >> >
>> >> >> > I am confused about why process raw data with M and rExp? M,
>> offsetB, bExp and rExp shall just responded to ipmitool and calculate wi=
th
>> raw
>> >> >> > data. I thought raw data only need calculated by scale if raw
>> data need to be adjust before respond to ipmitool.
>> >> >> > Now I met a problem, I have a raw data is 2100 and I want to
>> display 12.0 in ipmitool sdr command. I don't know how to assign M, rExp
>> and scale value in yaml.
>> >> >> > Could some one tell me how to translate sensor value? tks.
>> >> >> >
>> >> >> > Tyler
>> >> >> >
>> >> >> >
>> >> >>
>> >> >>
>> >> >> --
>> >> >> Emily Shaffer
>> >>
>> >>
>> >>
>> >> --
>> >> Emily Shaffer
>>
>>
>>
>> --
>> Emily Shaffer
>>
>

--00000000000036121305837a4c0e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">Tyler,<div dir=3D"auto"><br></div><div dir=3D"auto">Sorry=
 that I forgot. Yes, the scale is hardcoded for certain sensor types, ie vo=
ltage is always millivolts. I have asked about this before but maybe someon=
e else on the list can give a better answer why that&#39;s the case.</div><=
div dir=3D"auto"><br></div><div dir=3D"auto">Emily</div></div><br><div clas=
s=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Wed, Mar 6, 2019=
, 9:19 PM Deng Tyler &lt;<a href=3D"mailto:tyler.sabdon@gmail.com">tyler.sa=
bdon@gmail.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" st=
yle=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div =
dir=3D"ltr">Hi Emily, thank for your kindly reply. I understood how it wok =
now. But I still have a question, which customized file can assign scale va=
lue to Dbus? It seems always equal -3.<div><br></div><div>Tyler</div></div>=
<br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">Emily =
Shaffer &lt;<a href=3D"mailto:emilyshaffer@google.com" target=3D"_blank" re=
l=3D"noreferrer">emilyshaffer@google.com</a>&gt; =E6=96=BC 2019=E5=B9=B43=
=E6=9C=887=E6=97=A5 =E9=80=B1=E5=9B=9B =E4=B8=8A=E5=8D=8811:46=E5=AF=AB=E9=
=81=93=EF=BC=9A<br></div><blockquote class=3D"gmail_quote" style=3D"margin:=
0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">=
Tyler,<br>
<br>
In the example you cited, ideally that DBus entry reads Value: 4986;<br>
Unit: Volts; Scale: -3.<br>
<br>
<a href=3D"https://github.com/openbmc/phosphor-dbus-interfaces/blob/master/=
xyz/openbmc_project/Sensor/Value.interface.yaml" rel=3D"noreferrer noreferr=
er" target=3D"_blank">https://github.com/openbmc/phosphor-dbus-interfaces/b=
lob/master/xyz/openbmc_project/Sensor/Value.interface.yaml</a><br>
<br>
This essentially means the DBus entry is expressing 4986 millivolts,<br>
or 4986*10^-3 volts.<br>
<br>
On Wed, Mar 6, 2019 at 7:39 PM Deng Tyler &lt;<a href=3D"mailto:tyler.sabdo=
n@gmail.com" target=3D"_blank" rel=3D"noreferrer">tyler.sabdon@gmail.com</a=
>&gt; wrote:<br>
&gt;<br>
&gt; Hi Emily, thank for your reply and you are really help me a lot. I use=
 &quot;GAIN_in1=3D5.0&quot; in configuration file convert 2100 to 10500. No=
w Dbus store value is 10500 and it mean 10.5V in ipmitool end. But I still =
have some doubt about &quot; DBus should be holding the value in units&quot=
;. There is a example in openbmc sensor document as below:<br>
&gt; =3D=3D=3D=3D<br>
&gt; so for a DBus sensor value of 4986 meaning 4.986V, phosphor-ipmi-host =
would encode it as<br>
&gt;<br>
&gt; x: 4986 / 20 =3D 249<br>
&gt; M: 20<br>
&gt; rExp: -3<br>
&gt;<br>
&gt; When ipmitool sensor list is called, the tool fetches sensor factors a=
nd computes value as:<br>
&gt;<br>
&gt; y =3D 20 * 249 * 10^-3 =3D 4.98 (V)<br>
&gt;<br>
&gt; =3D=3D=3D=3D<br>
&gt; In above description, Dbus store value is 4986 but it is not real valu=
e in unit. If user switch to REST or redfish for getting sensor then 4986 w=
ill be display in same time. Is it correct?<br>
&gt;<br>
&gt; Tyler<br>
&gt;<br>
&gt; Emily Shaffer &lt;<a href=3D"mailto:emilyshaffer@google.com" target=3D=
"_blank" rel=3D"noreferrer">emilyshaffer@google.com</a>&gt; =E6=96=BC 2019=
=E5=B9=B43=E6=9C=887=E6=97=A5 =E9=80=B1=E5=9B=9B =E4=B8=8A=E5=8D=8810:02=E5=
=AF=AB=E9=81=93=EF=BC=9A<br>
&gt;&gt;<br>
&gt;&gt; It sounds like you may want to convert, on your sensor end, so tha=
t<br>
&gt;&gt; you are expressing 12.0V in DBus. DBus should be holding the value=
 in<br>
&gt;&gt; units, rather than a raw sensor value. The alternative here would =
be<br>
&gt;&gt; for you to put some context-aware conversion into host-ipmid or in=
to<br>
&gt;&gt; your handler on top of ipmitool, and that&#39;s not something anyb=
ody<br>
&gt;&gt; wants :)=C2=A0 Later if you decide to switch to Redfish, you will =
have the<br>
&gt;&gt; same problem, due to your value in DBus being a raw reading instea=
d of<br>
&gt;&gt; something in units.<br>
&gt;&gt;<br>
&gt;&gt; Is it possible for you to modify your code where the value is bein=
g<br>
&gt;&gt; pushed to DBus?<br>
&gt;&gt;<br>
&gt;&gt; On Wed, Mar 6, 2019 at 5:54 PM Deng Tyler &lt;<a href=3D"mailto:ty=
ler.sabdon@gmail.com" target=3D"_blank" rel=3D"noreferrer">tyler.sabdon@gma=
il.com</a>&gt; wrote:<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; Hi Emily, thank for your kindly reply. This is not typo. I wa=
nt to dispaly 12.0V in ipmitool and my raw data in Dbus is 2100.<br>
&gt;&gt; &gt; I know value x length is 1 byte. I concern that why raw data =
calculate with M, rExp before response to ipmitool.<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; Tyler<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; Emily Shaffer &lt;<a href=3D"mailto:emilyshaffer@google.com" =
target=3D"_blank" rel=3D"noreferrer">emilyshaffer@google.com</a>&gt; =E6=96=
=BC 2019=E5=B9=B43=E6=9C=887=E6=97=A5 =E9=80=B1=E5=9B=9B =E4=B8=8A=E5=8D=88=
6:47=E5=AF=AB=E9=81=93=EF=BC=9A<br>
&gt;&gt; &gt;&gt;<br>
&gt;&gt; &gt;&gt; Hi Tyler,Is this a typo? Do you mean you want to display =
21.0 in<br>
&gt;&gt; &gt;&gt; ipmitool? I don&#39;t know why there is scaling besides p=
ower of 10 on<br>
&gt;&gt; &gt;&gt; your raw value. That is odd.Assuming it was a typo, what =
you want to<br>
&gt;&gt; &gt;&gt; do is set the scale in the sensor info in order to perfor=
m /100<br>
&gt;&gt; &gt;&gt; operation. Or you could set the unit, though that might b=
e difficult<br>
&gt;&gt; &gt;&gt; with a /100 (rather than increment of 1000).The scaling w=
ith m, rExp,<br>
&gt;&gt; &gt;&gt; etc is because the IPMI protocol has such a narrow field =
for sensor<br>
&gt;&gt; &gt;&gt; data (1 byte, as you saw; this is value x).So my recommen=
dation to you<br>
&gt;&gt; &gt;&gt; is to use the scale to do your 2100-&gt;21.0 rounding whe=
n displaying<br>
&gt;&gt; &gt;&gt; output from ipmitool; and then to use your estimated maxi=
mum and<br>
&gt;&gt; &gt;&gt; minimum y to try and figure out what kind of coefficients=
 you want to<br>
&gt;&gt; &gt;&gt; use.=C2=A0 This doesn&#39;t need to be perfect; you will =
lose some precision if<br>
&gt;&gt; &gt;&gt; you choose exponents which give you a much wider range th=
an you need,<br>
&gt;&gt; &gt;&gt; but otherwise the operation should be invisible at the ot=
her end.If<br>
&gt;&gt; &gt;&gt; you really did mean you want 2100 -&gt; 12.0 then that&#3=
9;s a different<br>
&gt;&gt; &gt;&gt; question, which may require some more massaging on one en=
d or another,<br>
&gt;&gt; &gt;&gt; so let us know.<br>
&gt;&gt; &gt;&gt;<br>
&gt;&gt; &gt;&gt; Emily<br>
&gt;&gt; &gt;&gt;<br>
&gt;&gt; &gt;&gt; On Wed, Mar 6, 2019 at 5:33 AM Deng Tyler &lt;<a href=3D"=
mailto:tyler.sabdon@gmail.com" target=3D"_blank" rel=3D"noreferrer">tyler.s=
abdon@gmail.com</a>&gt; wrote:<br>
&gt;&gt; &gt;&gt; &gt;<br>
&gt;&gt; &gt;&gt; &gt; Hi all:<br>
&gt;&gt; &gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0Sensor reading, according to IPMI=
 spec, is calculated as:<br>
&gt;&gt; &gt;&gt; &gt;<br>
&gt;&gt; &gt;&gt; &gt; y =3D L[(Mx + B * 10^(bExp)) * 10^(rExp)]<br>
&gt;&gt; &gt;&gt; &gt;<br>
&gt;&gt; &gt;&gt; &gt; y: the &#39;final value&#39; as reported by IPMItool=
<br>
&gt;&gt; &gt;&gt; &gt; x: 8 bits, unsigned, reading data encoded in IPMI re=
sponse packet<br>
&gt;&gt; &gt;&gt; &gt; M: 10 bits, signed integer multiplier, multiplierM i=
n YAML<br>
&gt;&gt; &gt;&gt; &gt; B: 10 bits, signed additive offset, offsetB in YAML<=
br>
&gt;&gt; &gt;&gt; &gt; bExp: 4 bits, signed, bExp in YAML<br>
&gt;&gt; &gt;&gt; &gt; rExp: 4 bits, signed, rExp in YAML<br>
&gt;&gt; &gt;&gt; &gt;<br>
&gt;&gt; &gt;&gt; &gt;=C2=A0 ipmid calculate raw data by<br>
&gt;&gt; &gt;&gt; &gt; double value =3D variant_ns::get&lt;T&gt;(propValue)=
 * std::pow(10, sensorInfo.scale - sensorInfo.exponentR);<br>
&gt;&gt; &gt;&gt; &gt; auto rawData =3D static_cast&lt;uint8_t&gt;((value -=
 sensorInfo.scaledOffset) / sensorInfo.coefficientM);sue<br>
&gt;&gt; &gt;&gt; &gt;<br>
&gt;&gt; &gt;&gt; &gt; I am confused about why process raw data with M and =
rExp? M, offsetB, bExp and rExp shall just responded to ipmitool and calcul=
ate with raw<br>
&gt;&gt; &gt;&gt; &gt; data. I thought raw data only need calculated by sca=
le if raw data need to be adjust before respond to ipmitool.<br>
&gt;&gt; &gt;&gt; &gt; Now I met a problem, I have a raw data is 2100 and I=
 want to display 12.0 in ipmitool sdr command. I don&#39;t know how to assi=
gn M, rExp and scale value in yaml.<br>
&gt;&gt; &gt;&gt; &gt; Could some one tell me how to translate sensor value=
? tks.<br>
&gt;&gt; &gt;&gt; &gt;<br>
&gt;&gt; &gt;&gt; &gt; Tyler<br>
&gt;&gt; &gt;&gt; &gt;<br>
&gt;&gt; &gt;&gt; &gt;<br>
&gt;&gt; &gt;&gt;<br>
&gt;&gt; &gt;&gt;<br>
&gt;&gt; &gt;&gt; --<br>
&gt;&gt; &gt;&gt; Emily Shaffer<br>
&gt;&gt;<br>
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
</blockquote></div>

--00000000000036121305837a4c0e--
