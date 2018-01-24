Return-Path: <mine260309@gmail.com>
Authentication-Results: ozlabs.org; spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4001:c0b::233; helo=mail-it0-x233.google.com;
 envelope-from=mine260309@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="kZAwmihk"; 
 dkim-atps=neutral
Received: from mail-it0-x233.google.com (mail-it0-x233.google.com
 [IPv6:2607:f8b0:4001:c0b::233])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3zRGPW484NzDr4p
 for <openbmc@lists.ozlabs.org>; Wed, 24 Jan 2018 18:04:30 +1100 (AEDT)
Received: by mail-it0-x233.google.com with SMTP id 196so3988780iti.5
 for <openbmc@lists.ozlabs.org>; Tue, 23 Jan 2018 23:04:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=gEwFyK1rtN3BEzgqShvqsf76O7lkv85Var88XKosECw=;
 b=kZAwmihkCKJH9C7UWoGJEy5WnwS6lcqgr/zQPfYOS99ZbT71RQ4XZAKb59PRiU3EpN
 Zeveh1ov/guHWVX4DLG4GJWtrqgM/U70w/q5AHVfJPrSK73vfsYWdmLui4XOcJL4z9WX
 2FtUyzAna97zpvI5gIguPe2L3vSUYwTl8kQl4tjx3dOfacD5+SuMrgFkssI357xOSg+K
 1QDikg8VLZOHW0Cbg4HaR7UAJlq6yX0MXoS5r5ZrZ3GZsHfhrIi/DdHqxxIjNrAYlq4f
 MoVpbaAdb5Kw+73EVNROKEDH/Qz0axbZaN1HDoSz/ZITsUy3dxdT/jOiURkK8VPICMuz
 Jcgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=gEwFyK1rtN3BEzgqShvqsf76O7lkv85Var88XKosECw=;
 b=p+wm+LviWDs1TX5WPvyCnlbsvYRuab/MpGMu8rguh+ol6GE4Yn2Y5uOYYmjaOUmA0i
 avG2HKuS/7jnYvGC/SRI+PL8AxquXDknC3RQNnKjRaqmqBFtgnD61kQje1qoYGQ8MsT5
 zlOTO7ktdr9HtgX0zW1FYvYdp0O0xdQfOJTAkA3z8GUcZJW9FMZkO1f0R7fOPMh0QAlK
 oG2nk7L4wWdCB99JqkUpCh35U+xmACKUz6YpMARITfjGKctYW2Oyntkwq6BHi6gEe4ZM
 yWp++XiNV1xLg6TNfkc/7hTVQzleE4aTV6MyCC12Bp5zRifHiYcrlPR3tUHz9/rqBeY4
 W0CA==
X-Gm-Message-State: AKwxytdcGukqofFp67KOz8M/Ri5x4PU2n2Y1bkvmB6AaLHtg09qzejk7
 1pWPlcYG3h5bzlvHKRjUgG/uKuvHI9AGjLRiWgQ=
X-Google-Smtp-Source: AH8x225VNZIqmVgFv0suPJx6dqucyP/M3sqwyLTc+59gBQ730GGiZWkCGjU4MGeNOc0YIXbEkxcGGS5sfJhXBoXaU4s=
X-Received: by 10.36.215.69 with SMTP id y66mr7412845itg.10.1516777467864;
 Tue, 23 Jan 2018 23:04:27 -0800 (PST)
MIME-Version: 1.0
Received: by 10.79.159.68 with HTTP; Tue, 23 Jan 2018 23:04:27 -0800 (PST)
In-Reply-To: <32335E8B-FAAF-4B96-9B2E-57FF1FAFDD1A@cisco.com>
References: <32335E8B-FAAF-4B96-9B2E-57FF1FAFDD1A@cisco.com>
From: Lei YU <mine260309@gmail.com>
Date: Wed, 24 Jan 2018 15:04:27 +0800
Message-ID: <CAARXrt=r8C5WvWKb33C4LDuJi9KW61aHp0G3+a3RzF7ArKe+Tg@mail.gmail.com>
Subject: Re: Porting hwmon sensors to openBMC
To: "Sachin Naik (sachnaik)" <sachnaik@cisco.com>
Cc: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.25
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Wed, 24 Jan 2018 07:04:32 -0000

On Tue, Jan 23, 2018 at 3:33 PM, Sachin Naik (sachnaik)
<sachnaik@cisco.com> wrote:
> Hi All
>
> I am porting a new board to openbmc.
> I have question on mapping hwmon type sensors to Dbus
>
> So far I have created machine layer and added U-boot config, Kernel confi=
g and device tree. In kernel config I have enabled lm75 hwmon driver for LM=
75 temperature device. Corresponding entry added in device tree.
>
> Right now I have created hwmon temperature sensors entry in our machine l=
ayer by extending recipes-phosphor/sensors/phosphor-hwmon%.bbappend
> and created conf file with temperature sensors label.
>
> Now my question is how do implement/map dbus temperature sensor value int=
erface to our hwmon temperature sensors? Is above implementation is enough =
or it requires
> Some mapping for dbus to hwmon instance?

After you added config files for the temperature sensors with
phosphor-hwmon%.bbappend, phosphor-hwmon will read from
hwmon instance and create dbus objects at
/xyz/openbmc_project/sensors/, which will at least have "Value",
=E2=80=9CScale" and "Unit" properties.

I do not think it requires other configs, unless I misunderstand
your case?

>
> Thanks and regards
> Sachin
>
>
