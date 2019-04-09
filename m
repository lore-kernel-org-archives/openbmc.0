Return-Path: <mine260309@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::12d; helo=mail-it1-x12d.google.com;
 envelope-from=mine260309@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="Vk7QFWic"; 
 dkim-atps=neutral
Received: from mail-it1-x12d.google.com (mail-it1-x12d.google.com
 [IPv6:2607:f8b0:4864:20::12d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44dY7x3M8GzDqM1
 for <openbmc@lists.ozlabs.org>; Tue,  9 Apr 2019 13:44:44 +1000 (AEST)
Received: by mail-it1-x12d.google.com with SMTP id z17so1664078itc.1
 for <openbmc@lists.ozlabs.org>; Mon, 08 Apr 2019 20:44:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=U6haIJtqV0vxW1QVEiPG6rbcScIyS2543aeV3Ypzd88=;
 b=Vk7QFWicRe9ZpNQ24EDETttwHDmhCwBcsp0dSCS2xjhGPRdS4loLLegvZhTgFn0D+/
 TjvqyEPILN/5gk3iky9S7HvlT+VFpW6gKeUWbDZKqy4L6msvVA+WlK/SOz5kUo1d60qY
 mt7TUfIhGnsjIUbIL3fNAU1REg7mmjgMaSGtUllVHXUMZaRUNUy/z+dVTlOI5CStX1O7
 pbcBYJDWsagrg5Zb3ANy++2aqkltvkZk6ageVC2Q7WK/iFchKAwJG27iBc9Jj+MngWJr
 3fn5NvsbMbaIgUtqoa46rdezrReR79xHB5rW3KtD1sM4k3N5/g6sLvk97V4txUyCjlcZ
 651A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=U6haIJtqV0vxW1QVEiPG6rbcScIyS2543aeV3Ypzd88=;
 b=VezJN4QgEelr03aXCCgMoygRsROwKsttPimFKu65UXR68ZkkKF+MlaCkU3J3Z/+dih
 U3CrjOs3zBW3IhzgEzXQTXjpi+zda0xJnnmPvwUWkIVVQI4r9Bt8IeLQjTAIp/6UIL3k
 /pSbw0WaVDbRHil2Nfy0CVrFpXLm6rbosIZ1RerRGqQrH8l5f4HwVjrkNT5YfcJoOcb5
 Gd3JeCHcW5E264ggd3LosIhCVYkiKLDjsC20YV6UpyS8YRXMC/TQA/6MOj9bzpIitdyz
 aF0C60iNOPGPKlcx+U6F5PAhj8ZF7F2uHtT0fXx8hzBCBRjXJ4fUM3KDZUUKsn7GX4kl
 0lIA==
X-Gm-Message-State: APjAAAWyUfhKIQzbmElTnPBY6IQ1sibWqFOxOGH1Z9f0KmMv7QPPjOfe
 mvwPNXMPoT8uimtrgn/cnMYBD/7xO//d3Qu3NStHH4zKyQ0=
X-Google-Smtp-Source: APXvYqyuVH61rDbK9pBdJ+FNJvglKWpRRNHN7imLJYqf7eZaxF3IE0vsOG+s3spGQh+AXuJbFCYtSMLPFioNNgebrF4=
X-Received: by 2002:a24:e14b:: with SMTP id n72mr21080784ith.34.1554781480901; 
 Mon, 08 Apr 2019 20:44:40 -0700 (PDT)
MIME-Version: 1.0
References: <8daf9ac9deee4bc0808a55733681d67e@Eltsrv03.Eltan.local>
In-Reply-To: <8daf9ac9deee4bc0808a55733681d67e@Eltsrv03.Eltan.local>
From: Lei YU <mine260309@gmail.com>
Date: Tue, 9 Apr 2019 11:44:27 +0800
Message-ID: <CAARXrtmt9ObNmmkS2H2Qmon6qXVHiSjVmuyrfLXpzsSqP7j5PA@mail.gmail.com>
Subject: Re: using phosphor-dbus-monitor
To: Wim Vervoorn <wvervoorn@eltan.com>, Matthew Barth <msbarth@linux.ibm.com>
Cc: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
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
X-List-Received-Date: Tue, 09 Apr 2019 03:44:46 -0000

> I am trying to use phosphor-dbus-monitor to create logging of sensor exce=
ptions like a Critical state on a specific sensor.
> I am able to create a solution with a building yaml but at the end it doe=
sn=E2=80=99t deliver me the desired result.
> As there are very limited examples (on a few in the witherspoon) it is ve=
ry hard to figure out where the mistake is.

There is an example yaml config in the repo:
https://github.com/openbmc/phosphor-dbus-monitor/blob/master/src/example/ex=
ample.yaml

And I have the same feeling that it's hard to know what's wrong if
something is wrong.

> Are there any tools that can be used to make this easier?

@Matthew Barth Could you kindly help to add some doc/tool to make it
easier to use?

> Additionally is this the correct method to achieve this goal or should I =
use something else to define conditions for logging?

I think so. This repo is intended to watch the dbus and do stuff as yaml co=
nfig.
