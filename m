Return-Path: <mine260309@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::334; helo=mail-ot1-x334.google.com;
 envelope-from=mine260309@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="XOx8UtvM"; 
 dkim-atps=neutral
Received: from mail-ot1-x334.google.com (mail-ot1-x334.google.com
 [IPv6:2607:f8b0:4864:20::334])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 42bqyX3zhkzDqNG
 for <openbmc@lists.ozlabs.org>; Fri, 19 Oct 2018 13:45:08 +1100 (AEDT)
Received: by mail-ot1-x334.google.com with SMTP id u22so31800573ota.12
 for <openbmc@lists.ozlabs.org>; Thu, 18 Oct 2018 19:45:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=QPB+MNgssOqpjXqSbINg6lEJsV0ATVP34unXIerKDvM=;
 b=XOx8UtvMA1R671dg163myR0/neG2ZFJatb3paZTk9n54FrE4Y2uwff5hT+qO9/xW3K
 olFX8vEn+PHsl4qqB/A87Ht6Hc+X8/NrJ+vS30Os3guSuaT5Fy259XKR0V5eEE1dmbQI
 u5BFT+AmmcNdPTNwmV+DTXJpp8HbeV/1zMCL+Kab9q4rnz5PNWVA9wTHShvVYDvJ0/ao
 dqo/IFsVd85AOrL0cdl+Kf8XuLnCiIialO2cN4FyHfrXbSX6NGijAqOm2bXdtxhj6lz6
 KxOxY5zznxmE7LdoTXJTtbMX8rM06B+T9O3e73wW2H1OY/Rh5ga37iJTMf8ixPW9y3Yj
 UduA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=QPB+MNgssOqpjXqSbINg6lEJsV0ATVP34unXIerKDvM=;
 b=OetsNDw02I5KEULPuoVonPp/17ZczlJ3GURcsIcsJMVZzj864L4S9vyRPBAqkHhkZb
 td1tHsw9a6kElnoXLRRXF9wKI2Pr2mo1W647JuJarunkIj/fgR4WyQmcasnfRgPzuLZG
 OAowhi0rXrc69gJ7uZO2JogTXqwUCM5KdlRgRpkmt+I/VSLHEc3kyctfXUGvo5gjzz3e
 wYpfmdkNgbj/xSigPiEUdWN3UCZPpd5cHPCye32+9fbZIToqR39jhYX/Ow1aY01IovJQ
 D/ZPEanz/yaAqlhF8kRnkYK4tUfjDgjhQELKWeajIGKYuV7mYaB5PZiZL34ygyDFqLL6
 RkUw==
X-Gm-Message-State: ABuFfohuFzHEpg1XPWXhDors28oWi9JPviAQQil65VY0P4GGA0usEADl
 CLdgv7m6v1kUbbPFArv/u+SrTIhcbQGdt5G8As8=
X-Google-Smtp-Source: ACcGV60rNHu4AXt9hHpGFy1yATEa7SzbKFFJiVxb8C40Yc4cHAGd4unPh+bWkyr0Fka0zvdeso2NuoXaizelH5V3J2c=
X-Received: by 2002:a9d:11ab:: with SMTP id v40mr20585891otf.194.1539917105879; 
 Thu, 18 Oct 2018 19:45:05 -0700 (PDT)
MIME-Version: 1.0
References: <0b3c953807d24f4ca154c766fe22eaea@yadro.com>
In-Reply-To: <0b3c953807d24f4ca154c766fe22eaea@yadro.com>
From: Lei YU <mine260309@gmail.com>
Date: Fri, 19 Oct 2018 10:44:48 +0800
Message-ID: <CAARXrtmwhmQAOC88vSYgwQQRoXVzaN6iVnZA1X4_BdgrqcyeEA@mail.gmail.com>
Subject: Re: Total server power consumpion
To: a.soldatov@yadro.com
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Brad Bishop <bradleyb@fuzziesquirrel.com>
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
X-List-Received-Date: Fri, 19 Oct 2018 02:45:09 -0000

On Thu, Oct 18, 2018 at 4:58 PM Alexander Soldatov <a.soldatov@yadro.com> w=
rote:
>   We have faced with the problem of showing total server power consumptio=
n in the webui. Total power consumption is calculated as sum of the PSUs in=
put powers. Input power values are read from PSU using PMBus protocol and a=
re published in the Linux sysfs.  We are using our proprietary PSU driver. =
So I have an idea. Driver should create virtual hwmon device with total pow=
er parameters. We could use standart phopshor-hwmon to publish total power =
in DBus.
>   But the phosphor-hwmon requires the physical device path (calloutPath).=
 This parameter is transmitted using %p option of the udev. There is no pat=
h for the virtual device. The phosphor-hwmon does not get calloutPath and e=
xits with error.

phosphor-hwmon has two arguments, -o (dev-path) or -p (path). You could use=
 -p
to specify the hwmon path directly.

>   There are some questions:
>   1. How is this problem solved in other projects (the Witherspoon etc.)?
Witherspoon's total power is reported by occ, which is handled by occ-hwmon
driver.

>   2. The Witherspoon server has 2,2 kW PSUs. The maximum value of power i=
n linux sysfs on the 32 bit system is 2147483647 =C2=B5W. How the correct p=
ower view is solved?
The code use unit64_t for Value property, so it is ok.

>   3. How does the phosphor-hwmon use calloutPath besides logs info output=
?
>   4. Does it make sense to give the phosphor-hwmon an ability to work wit=
h virtual devices?
It could work with -p argument.
