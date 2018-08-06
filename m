Return-Path: <mine260309@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4001:c0b::22b; helo=mail-it0-x22b.google.com;
 envelope-from=mine260309@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="J4Bzc5iq"; 
 dkim-atps=neutral
Received: from mail-it0-x22b.google.com (mail-it0-x22b.google.com
 [IPv6:2607:f8b0:4001:c0b::22b])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 41kRbt5S1TzF3HG
 for <openbmc@lists.ozlabs.org>; Mon,  6 Aug 2018 15:51:37 +1000 (AEST)
Received: by mail-it0-x22b.google.com with SMTP id d16-v6so11333557itj.0
 for <openbmc@lists.ozlabs.org>; Sun, 05 Aug 2018 22:51:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=SBSJw4tpbzQoU8SZIlf8f04+ZAF1X9O/Tke9XA5TxdQ=;
 b=J4Bzc5iqxuKbZCVM5RknbLIWEIxlxlOhN3ZNSTDiVjYLmly28wO541Wez8sVVt2vQa
 FTtu9NbCyPb3i+78tgKa1/FJeioMLYMFOzKVncEESPmZtkR9tDfzxKxGZg+nczx1fRuo
 5zekfgI6UjpkoFnqX+LMuwAySCW8146XJjJ0/AXZ97XFHzlhnSm7/5LhLlKTDKjqrcOt
 00Tg1m/LSBy3zubf/P+fKrg1o/tkaHNq8AX6kUGNFEdTwmjbFW2mynlnc9ygKHxZ+aOM
 TMxNzf2HRwgs8BkEcSQBE8cL1HdLoN5ycBdQVoyTS3gk+gRVxuRHsgK29bmzgs98wl69
 w78g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=SBSJw4tpbzQoU8SZIlf8f04+ZAF1X9O/Tke9XA5TxdQ=;
 b=AXP52Iul2PYw6UEZt05Jh0fAdumzGyyVB3WuqDj6QNmiay0+v2PNbHaqVpd4iwwz3M
 xZOas/hXYS7f2PTKKNXpbWXZKAZIw8NfuxO0hFE4KcDNhRZNpCkvya7luvs5+JgOIyoN
 fGH7HkokmKo9feqtbC8R/WHxNC7Hnvd3caiY5YdlziQk//wb59HzHQqvj3Srgq9xE7lQ
 mNpl2yY6SDLVt1K8GEgRlLquiEivk10ZIMfw2h4RfOyb+9LHr9reTvW4ADNJ7i/dl+wH
 xdBh7Ti3koI3mIxqKl4GdBqmU9rVVppLyk4eYWDXi7fQ++Qvw2M1egKmXtNPZI2oN77/
 xjtA==
X-Gm-Message-State: AOUpUlEwPY2jxtSw0QykesZap6wpgMoPoAXiw5Cb4jM1H581X1ZRUnwc
 9carZfBRTXPNq90fbM3EdIU6W8pccBPOE9CFxOM=
X-Google-Smtp-Source: AAOMgpcc6cI+pLJCxq0jM9VYOu5HO82EvGcn+wYNrqmk99HsTeZzsynEtnnYOaqRTmK474i5iLWZmfDfywz90fe3Iio=
X-Received: by 2002:a02:5e42:: with SMTP id
 h63-v6mr11550330jab.117.1533534695235; 
 Sun, 05 Aug 2018 22:51:35 -0700 (PDT)
MIME-Version: 1.0
References: <CAARXrtm64qpSkDD31+m9HGa-Bw4k0jkRizHiS9fc73JZHMfmXQ@mail.gmail.com>
 <fe3a6c3b-28cf-0af7-5c9d-5ac4dcaa3363@intel.com>
In-Reply-To: <fe3a6c3b-28cf-0af7-5c9d-5ac4dcaa3363@intel.com>
From: Lei YU <mine260309@gmail.com>
Date: Mon, 6 Aug 2018 13:51:23 +0800
Message-ID: <CAARXrtkx00w-5D98nhooV+XB1OsaFWqVSdEn6ikHMAk753d=Kg@mail.gmail.com>
Subject: Re: What is the proper way to read RTC battery voltage
To: "Tanous, Ed" <ed.tanous@intel.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: text/plain; charset="UTF-8"
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.27
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Mon, 06 Aug 2018 05:51:39 -0000

> > 3. We could use gpio-mux and io-channel-mux driver, that let kernel to
> >     automatically pull the GPIO while reading the sensor. (See
> >     https://github.com/mine260309/linux/commit/8e60647389e5400a85c705685ca2f6b875856c99
> >     for example).
> >     However, it requires some delay between GPIO pulled high and reading the ADC
> >     channel, if the delay is too small, the ADC channel reading becomes
> >     incorrect, e.g. it gets 0 or a lower value than expected.
> >
>
> This sounds like a cleaner solution, but more difficult to execute in
> practice.  I think either 2 or 3 would solve it.  Is there an easy way
> to delay in the driver without blocking?  It doesn't need to be terribly
> deterministic to work correctly.

I did not know a way to delay without blocking, I was thinking:
1. Is it reasonable to do udelay/mdelay in driver?
2. If yes, which driver should use the delay? The io-channel-mux driver,
   or adc driver?

> Another thing to note is that even with this, your battery life is
> affected by how often you poll the voltage, so in general we reduce the
> scan rate of the battery voltage readings compared to other sensors to
> keep the battery life more sustainable over the long term.

Yup, current phosphor-hwmon is able to config the sensor read interval, in
practice we probably read the battery voltage once every day.
