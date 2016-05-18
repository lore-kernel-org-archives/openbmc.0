Return-Path: <joel.stan@gmail.com>
Received: from mail-qk0-x242.google.com (mail-qk0-x242.google.com
 [IPv6:2607:f8b0:400d:c09::242])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3r8wwt4dKbzDqCH
 for <openbmc@lists.ozlabs.org>; Thu, 19 May 2016 00:06:38 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b=XMo9cd/M; 
 dkim=pass (1024-bit key;
 unprotected) header.d=jms.id.au header.i=@jms.id.au header.b=NAvBGakA; 
 dkim-atps=neutral
Received: by mail-qk0-x242.google.com with SMTP id l68so4444806qkf.3
 for <openbmc@lists.ozlabs.org>; Wed, 18 May 2016 07:06:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc:content-transfer-encoding;
 bh=IDCOrlHmDSGQVC/9TxAlSeZaLZ6CIIG0ynWh+5ygeN8=;
 b=XMo9cd/MdYRuDs76c7UnlHSj/0CMsIxtPAw4CjGg9wqAqcAGcHsjS0zRsqOHsXmcck
 XM2HWykHct6s4BX7spG2LP6Z3IEG3u2mNXVRRqeinrHO2s1vkESF6gilmXhi/eQMdWVJ
 fF5GhaOtVznBWNnYOiA0V5+24+9iMINGecQsmZ+98tRgJsvzcGixsuk9QKZ9c/rYCOyd
 LE9hk5kqRYJWGuiZmfDCRAz10kB/oYa8or2Ih+iTaU5XdG1uz+LphVNGGkUiLo6QXreL
 ejU5Z5jmzk7PHxnaiclXGwSGgoooqpgQE8ErZEC7NSf6r8sAnOLCrtzvjGUAMzaKx0oD
 le+g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc:content-transfer-encoding;
 bh=IDCOrlHmDSGQVC/9TxAlSeZaLZ6CIIG0ynWh+5ygeN8=;
 b=NAvBGakA7/MbrQykNmGLyOwJPUSNxLM8KHV8C78nzh8XrR7sOscXAcafDZn0uikNar
 N3QvY3L08NxBx2PMocacvEZVAEgQv+xPvENufMsGEYG+LDnZOOujuyJp6FuDfq5UJtUy
 flmIo3Cfuaj5HYqSe2nQvNZQjnbkkhizwPai4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc:content-transfer-encoding;
 bh=IDCOrlHmDSGQVC/9TxAlSeZaLZ6CIIG0ynWh+5ygeN8=;
 b=bFfX0vnRf0hIZcINL3PqDS31b22NoyCUU7HN7mzx2tSojzh4eKnSQ7FFYoYq9Q2L7x
 x3I5e0RHEoTqwGgVUpuOa7Gg62f60/RAZZXpIMZsrGVnDUmnIQHcDiQ6Z/Xv7B6hVPOU
 9H2wkEfw4M25OVbLZHAE0YZzs9PZFoPdaUIeGBnqFGxZcm0t+oraUX4fys7TBTPgve+T
 cMp06FGkMDA6SJb95+NQ9uIBQ0f6RPl9YL6FKulBpqq49VGUzVy1T5yLu5WD3nkIFRCW
 M+/qh5jcgD/vqIe0DGHWLULtqrYgp7Zwf2EP7mzYsYGtjfo5Ffm0FCinO36HEutaDD3a
 s+bg==
X-Gm-Message-State: AOPr4FXA4dhmx9p5eItHVnmRVNmWLjeT9vuBMoFleY7QiZ4AYIhyGS3N4GXdGdmhAdtqafcurpVbmeacXYnu7g==
X-Received: by 10.55.46.197 with SMTP id u188mr8189270qkh.210.1463580395817;
 Wed, 18 May 2016 07:06:35 -0700 (PDT)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.237.51.135 with HTTP; Wed, 18 May 2016 07:06:16 -0700 (PDT)
In-Reply-To: <573C7223.10002@kaod.org>
References: <1463513102-14135-1-git-send-email-clg@kaod.org>
 <1463513102-14135-3-git-send-email-clg@kaod.org>
 <CACPK8XdKaan0TN38dhonHWs=mZhn=0=Oqw10Wcqg6h7J_4Xtzg@mail.gmail.com>
 <573C7223.10002@kaod.org>
From: Joel Stanley <joel@jms.id.au>
Date: Wed, 18 May 2016 23:36:16 +0930
X-Google-Sender-Auth: nl7CTl3paA7zTgOjNrK97LBEZyI
Message-ID: <CACPK8XdLk84OOSN_Ke_Hc6Hwc=ng2NmB7ZjvNZRYipv26Ttbfg@mail.gmail.com>
Subject: Re: [PATCH qemu 2/3] ast2400: add a rtc device on I2C bus 0
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Andrew Jeffery <andrew@aj.id.au>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.22
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Wed, 18 May 2016 14:06:39 -0000

On Wed, May 18, 2016 at 11:16 PM, C=C3=A9dric Le Goater <clg@kaod.org> wrot=
e:
> On 05/18/2016 03:33 PM, Joel Stanley wrote:
>> Hey Cedric,
>>
>> On Wed, May 18, 2016 at 4:55 AM, C=C3=A9dric Le Goater <clg@kaod.org> wr=
ote:
>>> The palmetto platform has a ds3231 RTC device but not qemu. Let's use
>>> a ds1338 instead.
>>>
>>> The aspeed-bmc-opp-palmetto dts file needs to be changed consequently
>>> with :
>>>
>>>         rtc@68 {
>>>                 compatible =3D "dallas,ds1338";
>>>                 reg =3D <0x68>;
>>>         };
>>
>> Please see my comments for the tmp device.
>>
>> How much does the register layout differ between the 1338 and the 3231?
>
> Will tell you soon.
>
> But on my palmetto running OpenBMC, I see :
>
>         [    5.630000] rtc-ds1307: probe of 0-0068 failed with error -5
>
> So do we really have a RTC available on this bus ?

The schematic I have suggests it's at  0x0e on the Palmetto. But I am
sure we've used that device tree as-is and the clock works on the
hardware. I will check tomorrow.

>         root@palmetto:~# i2cdetect -y 0
>              0  1  2  3  4  5  6  7  8  9  a  b  c  d  e  f
>         00:          -- -- -- -- -- -- -- -- -- -- -- -- --
>         10: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
>         20: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
>         30: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
>         40: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
>         50: UU -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
>         60: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
>         70: -- -- -- -- -- -- -- --
>
> There are plenty of other devices on the other busses though, but
> none with Ox68.
>
> There is also a RTC directly connected to APB bus. I guess we need a
> model for this one also.

That one in the SoC isn't battery backed. It's currently disabled in
the device tree for openbmc machines to avoid confusion with the
battery backed i2c device.

I'd suggest it's a low priority to model the internal one.
