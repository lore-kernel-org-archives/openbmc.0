Return-Path: <emilyshaffer@google.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2607:f8b0:4864:20::72e; helo=mail-qk1-x72e.google.com;
 envelope-from=emilyshaffer@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="XKjXRKPE"; 
 dkim-atps=neutral
Received: from mail-qk1-x72e.google.com (mail-qk1-x72e.google.com
 [IPv6:2607:f8b0:4864:20::72e])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44F86K2gQgzDqBj
 for <openbmc@lists.ozlabs.org>; Thu,  7 Mar 2019 09:47:36 +1100 (AEDT)
Received: by mail-qk1-x72e.google.com with SMTP id m9so7889286qkl.4
 for <openbmc@lists.ozlabs.org>; Wed, 06 Mar 2019 14:47:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=TXAmMnjkA+lC+isrBEmiDUWN/cyxYv1GGoairVayasY=;
 b=XKjXRKPE7I5xjHt2EAz4ucmGLuEImjEI90EG9JCeh7iCltvXCw+7xGAH7Qri0ykw8F
 zjS9QaBWYnhbG4Bssy6Pxgbw6j1aGxMKyCaeT68LVy+zimsRqz6VAvPy8vj7PAnxRlWY
 tz+jKfDHIk9BuM3jIceDreOG7gb73ChmRPQWvrCuKQerOy1mA+NUu9eXcMWupPU4csDd
 NmxEyGy84oFkUwr33ktB8VTEd2+ZGfI7r8YoHP4XGZOM7vQrr504BUM/jTBG6en7O6vy
 KWCpr3g2a22OVnx0w+jawkvQfxu6exJe9d4/7zIscv1L3g7af7v8bSX4gR+8tPuWJxCP
 5aeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=TXAmMnjkA+lC+isrBEmiDUWN/cyxYv1GGoairVayasY=;
 b=NtLRk9eBDsqOY7div2xRjECeTiRjG9Uv9a2X4NaB6l3eGJiPlQRkVybjUhdEuusAs5
 o3Z+EPTlNW0jF+d2TyBEVDEu8gmhiJQTjHYkKNF3OZ8xxPeaR0K+SQnVZHAPKwQ0lwYz
 IEEC5NTxxLBMTQqEF7XlVXiLzGeE//AD64e1Mj8UFt4JRWud6SUNYGLxo/pxvgEjpDBY
 YWHlxM9rbWfK69ptIf+a5a4xi7+ytNIVo5ed/EKWnG6ZoAaX/fjtmxx9m9q7+V2AHv+A
 CLO+D4h0ScGcNh0fzsboVuLtwZm5k7UDOEeP22ZpiMf/pWgM7270XHTyaiomfP9JXRXv
 W32g==
X-Gm-Message-State: APjAAAVXsU9UnsbD79/Q7zcW1zEMZF16UBuQ2JPAbyVZyIcxrLDu/yiK
 o0gpkCrU2QxeY8Vv2j7BUh46JmauIoblk4g7SFxIAQ==
X-Google-Smtp-Source: APXvYqwIOIMOhiZ2atF5xn82tcm7wMYaKwQ+qgU0oUbE2eLT+q2N4s8tSD0H/LsnhgLVWx4qYld0mZfWfQv7meqi9RQ=
X-Received: by 2002:a37:370c:: with SMTP id e12mr7576239qka.64.1551912452786; 
 Wed, 06 Mar 2019 14:47:32 -0800 (PST)
MIME-Version: 1.0
References: <CAO9PYRJjBTPEgymzS5aygU_=e2dBqDwMezFF2iOZ-Ah016dhYQ@mail.gmail.com>
In-Reply-To: <CAO9PYRJjBTPEgymzS5aygU_=e2dBqDwMezFF2iOZ-Ah016dhYQ@mail.gmail.com>
From: Emily Shaffer <emilyshaffer@google.com>
Date: Wed, 6 Mar 2019 14:47:21 -0800
Message-ID: <CAJoAoZmWD_jx+qCtJV-KOXRGa0GO0w3JpOO_q4GHJ0KzR8LKuQ@mail.gmail.com>
Subject: Re: Sensor value calculation formula
To: Deng Tyler <tyler.sabdon@gmail.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: text/plain; charset="UTF-8"
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
X-List-Received-Date: Wed, 06 Mar 2019 22:47:39 -0000

Hi Tyler,Is this a typo? Do you mean you want to display 21.0 in
ipmitool? I don't know why there is scaling besides power of 10 on
your raw value. That is odd.Assuming it was a typo, what you want to
do is set the scale in the sensor info in order to perform /100
operation. Or you could set the unit, though that might be difficult
with a /100 (rather than increment of 1000).The scaling with m, rExp,
etc is because the IPMI protocol has such a narrow field for sensor
data (1 byte, as you saw; this is value x).So my recommendation to you
is to use the scale to do your 2100->21.0 rounding when displaying
output from ipmitool; and then to use your estimated maximum and
minimum y to try and figure out what kind of coefficients you want to
use.  This doesn't need to be perfect; you will lose some precision if
you choose exponents which give you a much wider range than you need,
but otherwise the operation should be invisible at the other end.If
you really did mean you want 2100 -> 12.0 then that's a different
question, which may require some more massaging on one end or another,
so let us know.

Emily

On Wed, Mar 6, 2019 at 5:33 AM Deng Tyler <tyler.sabdon@gmail.com> wrote:
>
> Hi all:
>     Sensor reading, according to IPMI spec, is calculated as:
>
> y = L[(Mx + B * 10^(bExp)) * 10^(rExp)]
>
> y: the 'final value' as reported by IPMItool
> x: 8 bits, unsigned, reading data encoded in IPMI response packet
> M: 10 bits, signed integer multiplier, multiplierM in YAML
> B: 10 bits, signed additive offset, offsetB in YAML
> bExp: 4 bits, signed, bExp in YAML
> rExp: 4 bits, signed, rExp in YAML
>
>  ipmid calculate raw data by
> double value = variant_ns::get<T>(propValue) * std::pow(10, sensorInfo.scale - sensorInfo.exponentR);
> auto rawData = static_cast<uint8_t>((value - sensorInfo.scaledOffset) / sensorInfo.coefficientM);sue
>
> I am confused about why process raw data with M and rExp? M, offsetB, bExp and rExp shall just responded to ipmitool and calculate with raw
> data. I thought raw data only need calculated by scale if raw data need to be adjust before respond to ipmitool.
> Now I met a problem, I have a raw data is 2100 and I want to display 12.0 in ipmitool sdr command. I don't know how to assign M, rExp and scale value in yaml.
> Could some one tell me how to translate sensor value? tks.
>
> Tyler
>
>


--
Emily Shaffer
