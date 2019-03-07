Return-Path: <emilyshaffer@google.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2607:f8b0:4864:20::730; helo=mail-qk1-x730.google.com;
 envelope-from=emilyshaffer@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="EG5vcyCS"; 
 dkim-atps=neutral
Received: from mail-qk1-x730.google.com (mail-qk1-x730.google.com
 [IPv6:2607:f8b0:4864:20::730])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44FDRM3jPqzDqC9
 for <openbmc@lists.ozlabs.org>; Thu,  7 Mar 2019 13:02:36 +1100 (AEDT)
Received: by mail-qk1-x730.google.com with SMTP id h28so8121665qkk.7
 for <openbmc@lists.ozlabs.org>; Wed, 06 Mar 2019 18:02:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=qpFp2eCp437s7ADmAYaoHNRYCkniTy9LErglOgGXzMg=;
 b=EG5vcyCSMiUSllf13QnhM2RcP2AtLrK/n8ds5kFZdELSMlq9xfVETDqD4JJ11DEhvl
 xGUIGh1Q0fZbzQtje+pCL/m2hNPjhAk73z3IbL5leSczgLjBIK1tK2jhmZjnzkwZLQEm
 NOpdVng7MW7BEvld0HTHjl+IJ1+oGcL7FOMIMBvXQ/Ipt17S/ySnniz4kNMl1wlbzUnc
 F2KXBePl70L87t3UX+949MB61XI0iEEVutuk0NikZRgDmGdOMujIXCkcI7S+qQCPncGo
 9d+mioUtuyRqLqMpNvou1oY5Qki0FB/BSn6pusetsbC1+OJBgU98cpI7BX27QO1rZIyR
 X9sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=qpFp2eCp437s7ADmAYaoHNRYCkniTy9LErglOgGXzMg=;
 b=gDZAM8XL2xR6BPCd+1L4qVGMVivIzljP2pQZri7vDimOYBtJk69BNqThmZIUZpTH++
 JMi29PPDt4ntbG+LQg0VtA4G+VNnor/CZcnAFd4IrjLZk7FNTROpS2QIexbyuXBQX/vH
 claudcRGoCULdUaSCNuDRvTPHI1o2VnI5SJcUStsV6sP1sc3xeh8GmzRUo0MbLInLhlq
 olDSCmb6RrzXHUfknKuzDtaoG399geecC9sbpBfrx8c0r64CqTQGcT9MjOegigiBPxcq
 9kLl+DwyMmyT7z8WK1C+uAjG0kIHeASme0+TEK+hlcUqMwf5pzcFDXh4bG4Q94dONZyM
 m8YQ==
X-Gm-Message-State: APjAAAVyqBPMOZiGRfMIxh9PSAXfEwaJBBtS17j2XtcD3oU0pMCvwn/l
 jxfTJ1GJ8znb7dDrZ/OtFWvchOrmcI7W619hq+CrVQ==
X-Google-Smtp-Source: APXvYqwUc/hrryTk3agwZjY8Dh0MA5owCmHonM53WYJSoXAxrDcvkcxcngkRs2nIWsy7u5iMUhdkhx8QL2wGB4d+jIc=
X-Received: by 2002:a37:370c:: with SMTP id e12mr8083364qka.64.1551924152562; 
 Wed, 06 Mar 2019 18:02:32 -0800 (PST)
MIME-Version: 1.0
References: <CAO9PYRJjBTPEgymzS5aygU_=e2dBqDwMezFF2iOZ-Ah016dhYQ@mail.gmail.com>
 <CAJoAoZmWD_jx+qCtJV-KOXRGa0GO0w3JpOO_q4GHJ0KzR8LKuQ@mail.gmail.com>
 <CAO9PYRLkfidAqVTV-HU-SJAAdq9RARbLH8hanC+72rr03ibYNg@mail.gmail.com>
In-Reply-To: <CAO9PYRLkfidAqVTV-HU-SJAAdq9RARbLH8hanC+72rr03ibYNg@mail.gmail.com>
From: Emily Shaffer <emilyshaffer@google.com>
Date: Wed, 6 Mar 2019 18:02:21 -0800
Message-ID: <CAJoAoZmO1t4gougLchF-XacYVU5b7uR2qAYyXRHpjnwJNzdm6g@mail.gmail.com>
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
X-List-Received-Date: Thu, 07 Mar 2019 02:02:40 -0000

It sounds like you may want to convert, on your sensor end, so that
you are expressing 12.0V in DBus. DBus should be holding the value in
units, rather than a raw sensor value. The alternative here would be
for you to put some context-aware conversion into host-ipmid or into
your handler on top of ipmitool, and that's not something anybody
wants :)  Later if you decide to switch to Redfish, you will have the
same problem, due to your value in DBus being a raw reading instead of
something in units.

Is it possible for you to modify your code where the value is being
pushed to DBus?

On Wed, Mar 6, 2019 at 5:54 PM Deng Tyler <tyler.sabdon@gmail.com> wrote:
>
> Hi Emily, thank for your kindly reply. This is not typo. I want to dispal=
y 12.0V in ipmitool and my raw data in Dbus is 2100.
> I know value x length is 1 byte. I concern that why raw data calculate wi=
th M, rExp before response to ipmitool.
>
> Tyler
>
> Emily Shaffer <emilyshaffer@google.com> =E6=96=BC 2019=E5=B9=B43=E6=9C=88=
7=E6=97=A5 =E9=80=B1=E5=9B=9B =E4=B8=8A=E5=8D=886:47=E5=AF=AB=E9=81=93=EF=
=BC=9A
>>
>> Hi Tyler,Is this a typo? Do you mean you want to display 21.0 in
>> ipmitool? I don't know why there is scaling besides power of 10 on
>> your raw value. That is odd.Assuming it was a typo, what you want to
>> do is set the scale in the sensor info in order to perform /100
>> operation. Or you could set the unit, though that might be difficult
>> with a /100 (rather than increment of 1000).The scaling with m, rExp,
>> etc is because the IPMI protocol has such a narrow field for sensor
>> data (1 byte, as you saw; this is value x).So my recommendation to you
>> is to use the scale to do your 2100->21.0 rounding when displaying
>> output from ipmitool; and then to use your estimated maximum and
>> minimum y to try and figure out what kind of coefficients you want to
>> use.  This doesn't need to be perfect; you will lose some precision if
>> you choose exponents which give you a much wider range than you need,
>> but otherwise the operation should be invisible at the other end.If
>> you really did mean you want 2100 -> 12.0 then that's a different
>> question, which may require some more massaging on one end or another,
>> so let us know.
>>
>> Emily
>>
>> On Wed, Mar 6, 2019 at 5:33 AM Deng Tyler <tyler.sabdon@gmail.com> wrote=
:
>> >
>> > Hi all:
>> >     Sensor reading, according to IPMI spec, is calculated as:
>> >
>> > y =3D L[(Mx + B * 10^(bExp)) * 10^(rExp)]
>> >
>> > y: the 'final value' as reported by IPMItool
>> > x: 8 bits, unsigned, reading data encoded in IPMI response packet
>> > M: 10 bits, signed integer multiplier, multiplierM in YAML
>> > B: 10 bits, signed additive offset, offsetB in YAML
>> > bExp: 4 bits, signed, bExp in YAML
>> > rExp: 4 bits, signed, rExp in YAML
>> >
>> >  ipmid calculate raw data by
>> > double value =3D variant_ns::get<T>(propValue) * std::pow(10, sensorIn=
fo.scale - sensorInfo.exponentR);
>> > auto rawData =3D static_cast<uint8_t>((value - sensorInfo.scaledOffset=
) / sensorInfo.coefficientM);sue
>> >
>> > I am confused about why process raw data with M and rExp? M, offsetB, =
bExp and rExp shall just responded to ipmitool and calculate with raw
>> > data. I thought raw data only need calculated by scale if raw data nee=
d to be adjust before respond to ipmitool.
>> > Now I met a problem, I have a raw data is 2100 and I want to display 1=
2.0 in ipmitool sdr command. I don't know how to assign M, rExp and scale v=
alue in yaml.
>> > Could some one tell me how to translate sensor value? tks.
>> >
>> > Tyler
>> >
>> >
>>
>>
>> --
>> Emily Shaffer



--=20
Emily Shaffer
