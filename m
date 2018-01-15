Return-Path: <joel.stan@gmail.com>
Authentication-Results: ozlabs.org; spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:400d:c09::244; helo=mail-qk0-x244.google.com;
 envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="GXxjcdYJ"; 
 dkim-atps=neutral
Received: from mail-qk0-x244.google.com (mail-qk0-x244.google.com
 [IPv6:2607:f8b0:400d:c09::244])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3zL4lC0rgQzF0Zg
 for <openbmc@lists.ozlabs.org>; Tue, 16 Jan 2018 07:31:50 +1100 (AEDT)
Received: by mail-qk0-x244.google.com with SMTP id i141so18362095qke.0
 for <openbmc@lists.ozlabs.org>; Mon, 15 Jan 2018 12:31:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=WivQuDgPEBjJOlSKVovguYJ07jfytACLR0hOojYwCuU=;
 b=GXxjcdYJr/Cv1sAzRHMP0VEAZ2SvupuXIIIDVbU3ZgBiBp1RoaTlrSn3nc5mJkkbQz
 8nRSECpas8tI1KrVEimpUkUPyEwS7fPDG4vnAYj6WAjfXvEB1GXFHhNGtWHSm07BotFc
 PI7KLW8A351xT/wOfKKRm2CV8RftZb6LxZ2iD8JRNTxbI3BKlSxuoz6kDakbzmDlANKQ
 OlE/pMrCoNKnCfYPdw6b4FVSajRX/yR0hdbc+NGCr7TQ6ROWwliAfIfQVLj/98FKINWG
 XHss+wnbca1pgVb6WWC2wq35GUg18pnLQE5GWVt3t9BC+OKbN3236tYXBEQr/62oNDzB
 s+fA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=WivQuDgPEBjJOlSKVovguYJ07jfytACLR0hOojYwCuU=;
 b=Wuk2HMZsd/fwJbmECkeowUEtJElUQh0rgWEganBS/XchL7361L3+RV/zrDlJyhvcUg
 1tYyJrbzBoyK80oV2qXV3m3oaPfwN/LQroSly2HIKq/OUnjuATcZbNoJdprgB97kLcSb
 OT8J3biiJF2xFOwYRIGa2Q5zU9/COHaPidtt0fEy7ET1Rq1u3g6nSEjW6aa6N3gcRxsn
 9CVvzYPys17/vMw/hj5bTOrpy4xCetaWkFMgaLdsbM8dU+rchE3bacvJsu1uMjm3X+kI
 SbAeg7JCh2uJhjPhtb6tV7cwU1ChIlm9EkAYoVyqCYzymHoAYYCro+uJkgsjUwSeDD6i
 8uKg==
X-Gm-Message-State: AKwxyteGyMOvFlIA55EtOTH/P0Jdujmsu2QxcvbaqU8KrTy6ga8/7rfr
 dtUfaZIJ3eDkITrjFa2qOtXGEP3bbnq3mseNI7w=
X-Google-Smtp-Source: ACJfBosP/3oomTW3V9CEokSGi9NmQhkZZnSi4Yl7Jz2QJa0woqOQHaQkwJ8MvmnkSlgzBd+tqNbGkVwu0gp5DWYDGgg=
X-Received: by 10.55.158.5 with SMTP id h5mr11755628qke.284.1516048307897;
 Mon, 15 Jan 2018 12:31:47 -0800 (PST)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.200.29.9 with HTTP; Mon, 15 Jan 2018 12:31:27 -0800 (PST)
In-Reply-To: <1515776909-29894-4-git-send-email-oleksandrs@mellanox.com>
References: <1515776909-29894-1-git-send-email-oleksandrs@mellanox.com>
 <1515776909-29894-4-git-send-email-oleksandrs@mellanox.com>
From: Joel Stanley <joel@jms.id.au>
Date: Mon, 15 Jan 2018 14:31:27 -0600
X-Google-Sender-Auth: T_8lAKIYXrWBxAe-yTEsEcFXmag
Message-ID: <CACPK8XejAoSfQhTWHbzm4jX7A-tau1Oijm2qeWP+Gwz=PU8+tg@mail.gmail.com>
Subject: Re: [patch v16 3/4] Documentation: jtag: Add bindings for Aspeed SoC
 24xx and 25xx families JTAG master driver
To: Oleksandr Shamray <oleksandrs@mellanox.com>
Cc: Greg KH <gregkh@linuxfoundation.org>, Arnd Bergmann <arnd@arndb.de>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
 Linux ARM <linux-arm-kernel@lists.infradead.org>, 
 devicetree <devicetree@vger.kernel.org>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>, 
 =?UTF-8?B?SmnFmcOtIFDDrXJrbw==?= <jiri@resnulli.us>, 
 Tobias Klauser <tklauser@distanz.ch>, linux-serial@vger.kernel.org, 
 Vadim Pasternak <vadimp@mellanox.com>, system-sw-low-level@mellanox.com, 
 Rob Herring <robh+dt@kernel.org>, openocd-devel-owner@lists.sourceforge.net, 
 linux-api@vger.kernel.org, "David S . Miller" <davem@davemloft.net>,
 mchehab@kernel.org, Jiri Pirko <jiri@mellanox.com>
Content-Type: text/plain; charset="UTF-8"
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.24
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Mon, 15 Jan 2018 20:31:51 -0000

On Fri, Jan 12, 2018 at 11:08 AM, Oleksandr Shamray
<oleksandrs@mellanox.com> wrote:
> It has been tested on Mellanox system with BMC equipped with
> Aspeed 2520 SoC for programming CPLD devices.
>
> Signed-off-by: Oleksandr Shamray <oleksandrs@mellanox.com>
> Signed-off-by: Jiri Pirko <jiri@mellanox.com>
> Acked-by: Rob Herring <robh@kernel.org>

For the device tree bindings:

Acked-by: Joel Stanley <joel@jms.id.au>

> diff --git a/drivers/jtag/jtag-aspeed.c b/drivers/jtag/jtag-aspeed.c
> index 9cbd6da..f679041 100644
> --- a/drivers/jtag/jtag-aspeed.c
> +++ b/drivers/jtag/jtag-aspeed.c
> @@ -12,6 +12,7 @@
>  #include <linux/module.h>
>  #include <linux/of_address.h>
>  #include <linux/platform_device.h>
> +#include <linux/reset.h>

Oops, this is in the wrong patch.

>  #include <linux/slab.h>
>  #include <linux/types.h>
>  #include <uapi/linux/jtag.h>
