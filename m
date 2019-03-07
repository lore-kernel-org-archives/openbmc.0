Return-Path: <emilyshaffer@google.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2607:f8b0:4864:20::732; helo=mail-qk1-x732.google.com;
 envelope-from=emilyshaffer@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="gZkxRDDi"; 
 dkim-atps=neutral
Received: from mail-qk1-x732.google.com (mail-qk1-x732.google.com
 [IPv6:2607:f8b0:4864:20::732])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44FGkv0v4TzDqBy
 for <openbmc@lists.ozlabs.org>; Thu,  7 Mar 2019 14:46:14 +1100 (AEDT)
Received: by mail-qk1-x732.google.com with SMTP id i5so8220935qkd.13
 for <openbmc@lists.ozlabs.org>; Wed, 06 Mar 2019 19:46:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=G6DNgg9+nHBVMWT06Yns0UVMjb1fneuuUgQvm77wZsA=;
 b=gZkxRDDi2YwTIqXpEn4hK13D2o/Xd0CdT8sbty48p2dECpmtKYJvglw8CEorS8Mj+D
 S3Uza2GQ6/HRzsaoCIw/SND91CTF1uuEBlJhXo+NWB+eSPuvIYtbuBhfmz5ac3GVoUd5
 Itirb6QWyEz2LhD1yt9CXUs/5uMp2RTPyU9qXxvwrnF/On4diowOv+CI8CNwwP7/y9xv
 H/oG3quoft6XndnnZPfwQV4zQRHNoUaSHidmzyCrfAZ8P+mTbpXVFVcOcSFfjgB3ATdN
 F7X+L/qffRxOQlXcMi19UoC6N8ETHQEtDk1skA5WFZfiJIiHZfMgjKg6CumrfPWauQn9
 cjHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=G6DNgg9+nHBVMWT06Yns0UVMjb1fneuuUgQvm77wZsA=;
 b=LbAf3tgwd/h7ucn9F8D+8LBNVp3I23q2Y4SPgQxgzHQEXN5rCpL5Ow6kZWeAAThold
 Ox2I1vLseTb90CvIm+hlc6FMsaRSGd+RmMRxkol114LCGvKpEBS9e79+J4C6NTxndmJF
 4/EFWWYf9zg5KpHpkV8mlNvY/0O057z9TNu6YQH1iTUEkUpq3lBC0UYiUX7aBRbyc3IO
 Zb2/fvCBJpCw/Rz4t7meLEltUPvNDnzuhdSQKbOAVGw0heeh+h2uCteeFV2HnWt437dx
 gUIj/NdQLpKPobNSEdXPiiI6u2GiJRrwE8WG6VRD9/CMNjLsobP+VfAPSdlACY7hqDuw
 nTRw==
X-Gm-Message-State: APjAAAWWdX6xJeDPP+DlT5RncVKLv33M8iz0iPcET40v/IN2YwoJ5lbb
 0MLq+X1p78Xwy2ldKCaHIZVrdyeeFX1bc7bjJfwocQ==
X-Google-Smtp-Source: APXvYqwhFSMsWOBIhq7pbiD4SmV2KH9KPUiwa9lbotcSm5MyvVyCuVwGUbj9FoX1BjFY07piclyoRCJwIpgK569tQUM=
X-Received: by 2002:a05:620a:16ac:: with SMTP id
 s12mr8247694qkj.116.1551930369716; 
 Wed, 06 Mar 2019 19:46:09 -0800 (PST)
MIME-Version: 1.0
References: <CAO9PYRJjBTPEgymzS5aygU_=e2dBqDwMezFF2iOZ-Ah016dhYQ@mail.gmail.com>
 <CAJoAoZmWD_jx+qCtJV-KOXRGa0GO0w3JpOO_q4GHJ0KzR8LKuQ@mail.gmail.com>
 <CAO9PYRLkfidAqVTV-HU-SJAAdq9RARbLH8hanC+72rr03ibYNg@mail.gmail.com>
 <CAJoAoZmO1t4gougLchF-XacYVU5b7uR2qAYyXRHpjnwJNzdm6g@mail.gmail.com>
 <CAO9PYRKF5rVO7xJedEM4z7OAKLvtUU0LYJJb=rh7bUK85rJLkQ@mail.gmail.com>
In-Reply-To: <CAO9PYRKF5rVO7xJedEM4z7OAKLvtUU0LYJJb=rh7bUK85rJLkQ@mail.gmail.com>
From: Emily Shaffer <emilyshaffer@google.com>
Date: Wed, 6 Mar 2019 19:45:58 -0800
Message-ID: <CAJoAoZkLH8Bvsu8c1UNKdwhoxzJEGXcZ=GpdyrYt2wf_BTTWNg@mail.gmail.com>
Subject: Re: Sensor value calculation formula
To: Deng Tyler <tyler.sabdon@gmail.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
X-List-Received-Date: Thu, 07 Mar 2019 03:46:16 -0000

Tyler,

In the example you cited, ideally that DBus entry reads Value: 4986;
Unit: Volts; Scale: -3.

https://github.com/openbmc/phosphor-dbus-interfaces/blob/master/xyz/openbmc=
_project/Sensor/Value.interface.yaml

This essentially means the DBus entry is expressing 4986 millivolts,
or 4986*10^-3 volts.

On Wed, Mar 6, 2019 at 7:39 PM Deng Tyler <tyler.sabdon@gmail.com> wrote:
>
> Hi Emily, thank for your reply and you are really help me a lot. I use "G=
AIN_in1=3D5.0" in configuration file convert 2100 to 10500. Now Dbus store =
value is 10500 and it mean 10.5V in ipmitool end. But I still have some dou=
bt about " DBus should be holding the value in units". There is a example i=
n openbmc sensor document as below:
> =3D=3D=3D=3D
> so for a DBus sensor value of 4986 meaning 4.986V, phosphor-ipmi-host wou=
ld encode it as
>
> x: 4986 / 20 =3D 249
> M: 20
> rExp: -3
>
> When ipmitool sensor list is called, the tool fetches sensor factors and =
computes value as:
>
> y =3D 20 * 249 * 10^-3 =3D 4.98 (V)
>
> =3D=3D=3D=3D
> In above description, Dbus store value is 4986 but it is not real value i=
n unit. If user switch to REST or redfish for getting sensor then 4986 will=
 be display in same time. Is it correct?
>
> Tyler
>
> Emily Shaffer <emilyshaffer@google.com> =E6=96=BC 2019=E5=B9=B43=E6=9C=88=
7=E6=97=A5 =E9=80=B1=E5=9B=9B =E4=B8=8A=E5=8D=8810:02=E5=AF=AB=E9=81=93=EF=
=BC=9A
>>
>> It sounds like you may want to convert, on your sensor end, so that
>> you are expressing 12.0V in DBus. DBus should be holding the value in
>> units, rather than a raw sensor value. The alternative here would be
>> for you to put some context-aware conversion into host-ipmid or into
>> your handler on top of ipmitool, and that's not something anybody
>> wants :)  Later if you decide to switch to Redfish, you will have the
>> same problem, due to your value in DBus being a raw reading instead of
>> something in units.
>>
>> Is it possible for you to modify your code where the value is being
>> pushed to DBus?
>>
>> On Wed, Mar 6, 2019 at 5:54 PM Deng Tyler <tyler.sabdon@gmail.com> wrote=
:
>> >
>> > Hi Emily, thank for your kindly reply. This is not typo. I want to dis=
paly 12.0V in ipmitool and my raw data in Dbus is 2100.
>> > I know value x length is 1 byte. I concern that why raw data calculate=
 with M, rExp before response to ipmitool.
>> >
>> > Tyler
>> >
>> > Emily Shaffer <emilyshaffer@google.com> =E6=96=BC 2019=E5=B9=B43=E6=9C=
=887=E6=97=A5 =E9=80=B1=E5=9B=9B =E4=B8=8A=E5=8D=886:47=E5=AF=AB=E9=81=93=
=EF=BC=9A
>> >>
>> >> Hi Tyler,Is this a typo? Do you mean you want to display 21.0 in
>> >> ipmitool? I don't know why there is scaling besides power of 10 on
>> >> your raw value. That is odd.Assuming it was a typo, what you want to
>> >> do is set the scale in the sensor info in order to perform /100
>> >> operation. Or you could set the unit, though that might be difficult
>> >> with a /100 (rather than increment of 1000).The scaling with m, rExp,
>> >> etc is because the IPMI protocol has such a narrow field for sensor
>> >> data (1 byte, as you saw; this is value x).So my recommendation to yo=
u
>> >> is to use the scale to do your 2100->21.0 rounding when displaying
>> >> output from ipmitool; and then to use your estimated maximum and
>> >> minimum y to try and figure out what kind of coefficients you want to
>> >> use.  This doesn't need to be perfect; you will lose some precision i=
f
>> >> you choose exponents which give you a much wider range than you need,
>> >> but otherwise the operation should be invisible at the other end.If
>> >> you really did mean you want 2100 -> 12.0 then that's a different
>> >> question, which may require some more massaging on one end or another=
,
>> >> so let us know.
>> >>
>> >> Emily
>> >>
>> >> On Wed, Mar 6, 2019 at 5:33 AM Deng Tyler <tyler.sabdon@gmail.com> wr=
ote:
>> >> >
>> >> > Hi all:
>> >> >     Sensor reading, according to IPMI spec, is calculated as:
>> >> >
>> >> > y =3D L[(Mx + B * 10^(bExp)) * 10^(rExp)]
>> >> >
>> >> > y: the 'final value' as reported by IPMItool
>> >> > x: 8 bits, unsigned, reading data encoded in IPMI response packet
>> >> > M: 10 bits, signed integer multiplier, multiplierM in YAML
>> >> > B: 10 bits, signed additive offset, offsetB in YAML
>> >> > bExp: 4 bits, signed, bExp in YAML
>> >> > rExp: 4 bits, signed, rExp in YAML
>> >> >
>> >> >  ipmid calculate raw data by
>> >> > double value =3D variant_ns::get<T>(propValue) * std::pow(10, senso=
rInfo.scale - sensorInfo.exponentR);
>> >> > auto rawData =3D static_cast<uint8_t>((value - sensorInfo.scaledOff=
set) / sensorInfo.coefficientM);sue
>> >> >
>> >> > I am confused about why process raw data with M and rExp? M, offset=
B, bExp and rExp shall just responded to ipmitool and calculate with raw
>> >> > data. I thought raw data only need calculated by scale if raw data =
need to be adjust before respond to ipmitool.
>> >> > Now I met a problem, I have a raw data is 2100 and I want to displa=
y 12.0 in ipmitool sdr command. I don't know how to assign M, rExp and scal=
e value in yaml.
>> >> > Could some one tell me how to translate sensor value? tks.
>> >> >
>> >> > Tyler
>> >> >
>> >> >
>> >>
>> >>
>> >> --
>> >> Emily Shaffer
>>
>>
>>
>> --
>> Emily Shaffer



--=20
Emily Shaffer
