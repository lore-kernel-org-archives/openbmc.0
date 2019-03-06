Return-Path: <tyler.sabdon@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::d2b; helo=mail-io1-xd2b.google.com;
 envelope-from=tyler.sabdon@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="fYuG7LCT"; 
 dkim-atps=neutral
Received: from mail-io1-xd2b.google.com (mail-io1-xd2b.google.com
 [IPv6:2607:f8b0:4864:20::d2b])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44DvnM63ggzDq9C
 for <openbmc@lists.ozlabs.org>; Thu,  7 Mar 2019 00:32:03 +1100 (AEDT)
Received: by mail-io1-xd2b.google.com with SMTP id y6so10176330ioq.10
 for <openbmc@lists.ozlabs.org>; Wed, 06 Mar 2019 05:32:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=vidL230Y502ApUAgpg7exN6ohQI3kVAjlFcLPG5qDOs=;
 b=fYuG7LCTBryD/SYoDI5I6AYBEBkvZnaneEG6iM3q5efcxRmjjHq02hQ5L38djq5R5D
 o3xaSdVU8aTa/5qRQ/uDSmNLiq/LvqyhwwFo5KIIq0+PHS4qMsc2C4TTwaSBmCabktvC
 3KJkaWg/rONn/oN9pO57Qr1ZDjePmJLu8fzNvIk6D2hYL/wZ3TCkO4bb9bTgWaiwHHNA
 k4EBAZNzi9u7zMdBO8gLT7JODcIrNyURE5IRETO3Nw3ez5ck14QaiHu6JeACo2mTvbMs
 /BdOPt3jaQp26RKFdZMYbSGyYKk5VYhLXkiY/we21bmvBw2g5P0ODKP+S6hqysM7rQ6S
 6HJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=vidL230Y502ApUAgpg7exN6ohQI3kVAjlFcLPG5qDOs=;
 b=XWjMc3MwcjzgnVfSQhKbG38z7fNcy73z0om27yE6LnC2Qdo91Sb1BK//oGtCMj7UBX
 KNj6kHZS+meSfCPISBllqdleFQ1ikkQ+3VLdvAPIwLe7Ukt2sn3WIaQx4qJq6VOzu9hR
 4XNSiie/OXCOheEflHCt1lDvTYpHkqm1g60lBcnt48A+KOV4ST51sBpBWqMUumxKQM2h
 1VvKSvTJgvOtGSUN+bM7PN8yUkIRZwe8wug+f0TsEeWKcWiz62FXy7wnwU9J0et97/FZ
 Qa27pNQiPYi+pF76KK+2621s/Ql4DsQkCiPcHVzMrIIc3cwVXYQWfz/qUw9XGScWCtSK
 C5MA==
X-Gm-Message-State: APjAAAXjRemtq/+klNd1P8H+HsATvhgWdCWhPJe/a2/vkqVCYeqFIQS9
 H7rSmxD/gGAtdl7nfceIUZTzIUpeu8d+l4Vd2GX9t7oDVHg=
X-Google-Smtp-Source: APXvYqyJUfuaLPbyD6iG0tzByaHbtP2MiqNNCE6hHtHKJZeI3X8zhA0aRfrOpaEjUZZdM6B1gKXjGaBiqzaN5KK5DE0=
X-Received: by 2002:a5e:c707:: with SMTP id f7mr3228815iop.76.1551879119743;
 Wed, 06 Mar 2019 05:31:59 -0800 (PST)
MIME-Version: 1.0
From: Deng Tyler <tyler.sabdon@gmail.com>
Date: Wed, 6 Mar 2019 21:31:48 +0800
Message-ID: <CAO9PYRJjBTPEgymzS5aygU_=e2dBqDwMezFF2iOZ-Ah016dhYQ@mail.gmail.com>
Subject: Sensor value calculation formula
To: openbmc@lists.ozlabs.org
Content-Type: multipart/alternative; boundary="000000000000aab07a05836d039a"
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
X-List-Received-Date: Wed, 06 Mar 2019 13:32:08 -0000

--000000000000aab07a05836d039a
Content-Type: text/plain; charset="UTF-8"

Hi all:
    Sensor reading, according to IPMI spec, is calculated as:

y = L[(Mx + B * 10^(bExp)) * 10^(rExp)]


   - y: the 'final value' as reported by IPMItool
   - x: 8 bits, unsigned, reading data encoded in IPMI response packet
   - M: 10 bits, signed integer multiplier, multiplierM in YAML
   - B: 10 bits, signed additive offset, offsetB in YAML
   - bExp: 4 bits, signed, bExp in YAML
   - rExp: 4 bits, signed, rExp in YAML

 ipmid calculate raw data by
double value = variant_ns::get<T>(propValue) * std::pow(10,
sensorInfo.scale - sensorInfo.exponentR);
auto rawData = static_cast<uint8_t>((value - sensorInfo.scaledOffset) /
sensorInfo.coefficientM);sue

I am confused about why process raw data with M and rExp? M, offsetB, bExp
and rExp shall just responded to ipmitool and calculate with raw
data. I thought raw data only need calculated by scale if raw data need to
be adjust before respond to ipmitool.
Now I met a problem, I have a raw data is 2100 and I want to display 12.0
in ipmitool sdr command. I don't know how to assign M, rExp and scale value
in yaml.
Could some one tell me how to translate sensor value? tks.

Tyler

--000000000000aab07a05836d039a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi all:<div>=C2=A0 =C2=A0=C2=A0<span styl=
e=3D"color:rgb(36,41,46);font-family:-apple-system,BlinkMacSystemFont,&quot=
;Segoe UI&quot;,Helvetica,Arial,sans-serif,&quot;Apple Color Emoji&quot;,&q=
uot;Segoe UI Emoji&quot;,&quot;Segoe UI Symbol&quot;">Sensor reading, accor=
ding to IPMI spec, is calculated as:</span></div><pre lang=3D"none" style=
=3D"box-sizing:border-box;font-family:SFMono-Regular,Consolas,&quot;Liberat=
ion Mono&quot;,Menlo,Courier,monospace;margin-bottom:16px;margin-top:0px;ba=
ckground-color:rgb(246,248,250);border-radius:3px;line-height:1.45;overflow=
:auto;padding:16px;color:rgb(36,41,46)"><code style=3D"box-sizing:border-bo=
x;font-family:SFMono-Regular,Consolas,&quot;Liberation Mono&quot;,Menlo,Cou=
rier,monospace;background-color:transparent;border-radius:3px;margin:0px;pa=
dding:0px;border:0px;word-break:normal;display:inline;line-height:inherit;o=
verflow:visible">y =3D L[(Mx + B * 10^(bExp)) * 10^(rExp)]
</code></pre><ul style=3D"box-sizing:border-box;margin-bottom:16px;margin-t=
op:0px;padding-left:2em;color:rgb(36,41,46);font-family:-apple-system,Blink=
MacSystemFont,&quot;Segoe UI&quot;,Helvetica,Arial,sans-serif,&quot;Apple C=
olor Emoji&quot;,&quot;Segoe UI Emoji&quot;,&quot;Segoe UI Symbol&quot;"><l=
i style=3D"box-sizing:border-box">y: the &#39;final value&#39; as reported =
by IPMItool</li><li style=3D"box-sizing:border-box;margin-top:0.25em">x: 8 =
bits, unsigned, reading data encoded in IPMI response packet</li><li style=
=3D"box-sizing:border-box;margin-top:0.25em">M: 10 bits, signed integer mul=
tiplier,<span class=3D"gmail-Apple-converted-space">=C2=A0</span><code styl=
e=3D"box-sizing:border-box;font-family:SFMono-Regular,Consolas,&quot;Libera=
tion Mono&quot;,Menlo,Courier,monospace;background-color:rgba(27,31,35,0.04=
7);border-radius:3px;margin:0px;padding:0.2em 0.4em">multiplierM</code><spa=
n class=3D"gmail-Apple-converted-space">=C2=A0</span>in YAML</li><li style=
=3D"box-sizing:border-box;margin-top:0.25em">B: 10 bits, signed additive of=
fset,<span class=3D"gmail-Apple-converted-space">=C2=A0</span><code style=
=3D"box-sizing:border-box;font-family:SFMono-Regular,Consolas,&quot;Liberat=
ion Mono&quot;,Menlo,Courier,monospace;background-color:rgba(27,31,35,0.047=
);border-radius:3px;margin:0px;padding:0.2em 0.4em">offsetB</code><span cla=
ss=3D"gmail-Apple-converted-space">=C2=A0</span>in YAML</li><li style=3D"bo=
x-sizing:border-box;margin-top:0.25em">bExp: 4 bits, signed,<span class=3D"=
gmail-Apple-converted-space">=C2=A0</span><code style=3D"box-sizing:border-=
box;font-family:SFMono-Regular,Consolas,&quot;Liberation Mono&quot;,Menlo,C=
ourier,monospace;background-color:rgba(27,31,35,0.047);border-radius:3px;ma=
rgin:0px;padding:0.2em 0.4em">bExp</code><span class=3D"gmail-Apple-convert=
ed-space">=C2=A0</span>in YAML</li><li style=3D"box-sizing:border-box;margi=
n-top:0.25em">rExp: 4 bits, signed,<span class=3D"gmail-Apple-converted-spa=
ce">=C2=A0</span><code style=3D"box-sizing:border-box;font-family:SFMono-Re=
gular,Consolas,&quot;Liberation Mono&quot;,Menlo,Courier,monospace;backgrou=
nd-color:rgba(27,31,35,0.047);border-radius:3px;margin:0px;padding:0.2em 0.=
4em">rExp</code><span class=3D"gmail-Apple-converted-space">=C2=A0</span>in=
 YAML</li></ul><span style=3D"color:rgb(36,41,46);font-family:-apple-system=
,system-ui,&quot;Segoe UI&quot;,Helvetica,Arial,sans-serif,&quot;Apple Colo=
r Emoji&quot;,&quot;Segoe UI Emoji&quot;,&quot;Segoe UI Symbol&quot;">=C2=
=A0ipmid calculate raw data by=C2=A0</span><font color=3D"#24292e" face=3D"=
-apple-system, system-ui, Segoe UI, Helvetica, Arial, sans-serif, Apple Col=
or Emoji, Segoe UI Emoji, Segoe UI Symbol"><br></font><div><div>double valu=
e =3D variant_ns::get&lt;T&gt;(propValue) * std::pow(10, sensorInfo.scale -=
 sensorInfo.exponentR);</div><div>auto rawData =3D static_cast&lt;uint8_t&g=
t;((value - sensorInfo.scaledOffset) / sensorInfo.coefficientM);sue</div></=
div><div><br></div><div>I am confused about why process raw data with M and=
 rExp? M, offsetB, bExp and rExp shall just responded to ipmitool and calcu=
late with raw</div><div>data. I thought raw data only need calculated by sc=
ale if raw data need to be adjust before respond to ipmitool.</div><div>Now=
 I met a problem, I have a raw data is 2100 and I want to display 12.0 in i=
pmitool sdr command. I don&#39;t know how to assign M, rExp and scale value=
 in yaml.</div><div>Could some one tell me how to translate sensor value? t=
ks.</div><div><br></div><div>Tyler</div><div><br></div><div><br></div></div=
></div>

--000000000000aab07a05836d039a--
