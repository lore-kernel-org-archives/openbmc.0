Return-Path: <venture@google.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2607:f8b0:4864:20::635; helo=mail-pl1-x635.google.com;
 envelope-from=venture@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="tw//YSWq"; 
 dkim-atps=neutral
Received: from mail-pl1-x635.google.com (mail-pl1-x635.google.com
 [IPv6:2607:f8b0:4864:20::635])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 43fz7Z5DS7zDqgb
 for <openbmc@lists.ozlabs.org>; Thu, 17 Jan 2019 07:19:06 +1100 (AEDT)
Received: by mail-pl1-x635.google.com with SMTP id b5so3550043plr.4
 for <openbmc@lists.ozlabs.org>; Wed, 16 Jan 2019 12:19:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=4S9/HSlACaDL5raudCc/jvJDyLeQpqXNyRRIUN4i1rI=;
 b=tw//YSWqOc8D1wW0Qlic+5UI4Nzp0kUjZ+r+6nIiavnI/huXkOvHS/Qq8W4JpyVi+D
 z1LRzm2GQvxOxazQqpN10nis5L2dfjz4+7txPdIpQcTgeKtnyK8ByeoTAs1J2OHWjJtF
 Y/dSgJQnGCM8kygCwac9T6l96zXIrNO1yzN5sLXV9hZ3ssnzykPOtajT8tJvfhWaqqoB
 94apXg2AyWwZuvtCBukLjOO7HPMeoueVSdgcJyxxZjku0IyOPwxQr4u/bX9Vof5S8OAo
 biulOaFTl1URijkCyXDYuxhynebhOxqE9ae9eCHZzb7dNsO+qR3LBHw7shPfYHNAuFBN
 LNQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=4S9/HSlACaDL5raudCc/jvJDyLeQpqXNyRRIUN4i1rI=;
 b=L/3x3sHe0VAYSKr5wRXKcIFVL1mvrBkEAvZWOmrxTyNVUl/iZlzvrmYXkn44M9cTYO
 igjLIYqDNcvTPjiIoF+qjuKi2/jhlAXRkbkD8wWvrybm0jfy1UUmHKZ2NiPYpE9g71LH
 tr3jSgzxI87g0NRxuyYmbCAMzsTysrzP1IZlllY3rpd1m/y51G0AWz2Zut771Pn87Gvz
 wGKcxTagacMAwJxGPNHBwrJKvEyHB+6yFpqcNsUb+MYa1krnhDEEkUWroJdBBCvfclLP
 Rs+gnwGvSKxd3JpZd2K6zv3v3FT70X7o9AhAdliBfwRkS8bupbBpyDeuZbTA1Cc/TU9i
 3lDQ==
X-Gm-Message-State: AJcUukfeEJV9Y+mPFBnsnsBctAo7Qij817QSFkkL+Q7b0yf9MVso0VEd
 iCzCy2JuvoI7P7mWM/1H8xGz14q4LZWX1ZT8dZgk2g==
X-Google-Smtp-Source: ALg8bN4g4s777Gvw3h4pqgV3gp5lTpoSz4V6lK8ZApE5cjcz2Z7mDAtoeyPdCAVU7VfBRGD2i1SKoqlibhMHAjs4Lm0=
X-Received: by 2002:a17:902:780c:: with SMTP id
 p12mr11470081pll.197.1547669944110; 
 Wed, 16 Jan 2019 12:19:04 -0800 (PST)
MIME-Version: 1.0
References: <CAO=notzYAiR1nZ08=N-oi2g--XgjZ576wRomDDLYEdhLnw2pnQ@mail.gmail.com>
 <CAARXrtkYwRP63pU3o+Bn_r_NZ9K2fAQr3O-3UPZqRY7KYaL6cg@mail.gmail.com>
 <b4672b3d-92a0-b327-7717-76925519d2f0@linux.ibm.com>
 <CAARXrtkdJQsEtZK_cyc2vkR6edoHALdvM2r=Bza8a8+N40=nhw@mail.gmail.com>
In-Reply-To: <CAARXrtkdJQsEtZK_cyc2vkR6edoHALdvM2r=Bza8a8+N40=nhw@mail.gmail.com>
From: Patrick Venture <venture@google.com>
Date: Wed, 16 Jan 2019 12:18:52 -0800
Message-ID: <CAO=notwBhxENR0Herr4aG5LXUej5oA+6p-h6BP4e1Ub7PNWqGw@mail.gmail.com>
Subject: Re: phosphor-hwmon funcitonal interface
To: Lei YU <mine260309@gmail.com>
Cc: Matthew Barth <msbarth@linux.ibm.com>,
 Matt Spinler <mspinler@linux.vnet.ibm.com>, 
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
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
X-List-Received-Date: Wed, 16 Jan 2019 20:19:07 -0000

On Tue, Jan 15, 2019 at 5:51 PM Lei YU <mine260309@gmail.com> wrote:
>
> > Actually, phosphor-fan-presence/control is using the functional property
> > that's currently being created where the 'fault' file exists in sysfs
> > for the OCCs.
>
> Good to know. Thanks for the info.
>
> > > So we could re-use this property to indicate if a sensor is functional or not,
> > > especially useful for fans that will get reading error when it's turned off,
> > > e.g. the fans using Aspeed fan/pwm driver.
> > >
> > This case seems to not follow whether a fan is functional or not when
> > its turned off. The fan is still functional, just not powered.

There's also the notion in phosphor-hwmon where it'll remove a sensor
from dbus on some failures... - just throwing that out there.

>
> Yeah, but there is no way to tell the difference between power off and
> non-functional for Aspeed pwm fans, that the driver gives errors on reading
> fan speed.
> So the current solution is to use NEGATIVE_ERRNO_ON_FAIL config to tell
> phosphor-hwmon to return the -errno instead of throwing.
> That way, the reading of the sensor becomes a negative value.
>
> I think a "functional" property is more appropriate for such case than a
> negative reading of sensor value.

Yes. that's something I'm hoping to resolve.

> The code to check this property is free to check the power status as well, so
> it knows if a fan is *really* non-functional or not based on the power status.

Agreed.
