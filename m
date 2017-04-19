Return-Path: <sjg@google.com>
Received: from mail-vk0-x22c.google.com (mail-vk0-x22c.google.com
 [IPv6:2607:f8b0:400c:c05::22c])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3w72Vc0yFDzDq9L
 for <openbmc@lists.ozlabs.org>; Wed, 19 Apr 2017 10:11:52 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="n0XOEGhe"; 
 dkim=pass (1024-bit key;
 unprotected) header.d=chromium.org header.i=@chromium.org header.b="duI6YH30";
 dkim-atps=neutral
Received: by mail-vk0-x22c.google.com with SMTP id j127so4558478vkh.0
 for <openbmc@lists.ozlabs.org>; Tue, 18 Apr 2017 17:11:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=I38sGnSQZcjo5NLe5Ttm8nZLpwJVOckiWg6RfrsHD6g=;
 b=n0XOEGhePXlpSLhRRXdL8XuntWujS38PMtkKGbcV67MPpl/lpL6Ym/A0wEvb7aFwF6
 SNR4C1CEszZxmvanPRJ5T2wdk6q6U/f+7o/xclvBIsiMtVM20Pb6JSiTj1YfFpFmZV0D
 /UyCzth7WOs8L6Ws7SZDcsA385Rl6No3se0GPYq9pYbbkOZmw9iApJKBStN2Qcms1T2s
 4sAtOLPUMmNAoip4xgThaAB/xMDgQ3dbYCYfcLjQnHXKaGVawHKFhYaJogiF8eZAaoRy
 wFEKQhEqTASs48KaocH+FOQUAXc3qd0nyv8tEBhs1gW8A/A2YNaod1ZFkIgSTYGRqTYW
 AVtA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=I38sGnSQZcjo5NLe5Ttm8nZLpwJVOckiWg6RfrsHD6g=;
 b=duI6YH30egdjJqs5ODIyX/u6VC3i0Lgzf5EECK7ssB36+sH2bdS8tSzk3TfMALHznv
 7nukw240KClWKz+wg+ZP284SuIkKinI+XG0brHviLhUetArEFCt5kvh/fcPjt/eHZ6XN
 vIz6H2Jdk+IJ02CSLc7O1pW9ixPCL7oqIa/mM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=I38sGnSQZcjo5NLe5Ttm8nZLpwJVOckiWg6RfrsHD6g=;
 b=iYsg4F8LjUFZnjHVWrr9iDunper8qUjAutyspdUxsgpuNvwH+YHjMq40Ivyvs6D4Db
 yySorNnBRnJtXNePAP4YtTfBXHPvqnU6w+kl2HijHedmzqd4yjKZQin8UF/KVxfuI+Dz
 DwUw/LD2tq65NHzAjCwQqy7r8e6D8ukNPFe9KxgTDSUIngle0Gs1+Fa8swwAidBLSJeW
 PRUXHGBg4XW3pffKTDq60k7ycKk9fGCrX2GShB2iZMiKakIbjYYKENsfARVM2oF4iJ17
 MNhA1hbMkarBGpa/uI9EmkfsdTEsjdei/aV8Bu+excPx+Z/DLR6yaNrY83t+/+hcH6QP
 4iFg==
X-Gm-Message-State: AN3rC/5FlBfIJlC6STekGwmU6Zzf5Hhu+5WW5IQ/K46Sx80DuPcZdALx
 YpgJz85EtftD2jfBqLk7lmWkSFUBSDvB
X-Received: by 10.31.177.131 with SMTP id a125mr37245vkf.80.1492560709402;
 Tue, 18 Apr 2017 17:11:49 -0700 (PDT)
MIME-Version: 1.0
Sender: sjg@google.com
Received: by 10.176.17.106 with HTTP; Tue, 18 Apr 2017 17:11:29 -0700 (PDT)
In-Reply-To: <20170417190034.71945-3-maxims@google.com>
References: <20170417190034.71945-1-maxims@google.com>
 <20170417190034.71945-3-maxims@google.com>
From: Simon Glass <sjg@chromium.org>
Date: Tue, 18 Apr 2017 18:11:29 -0600
X-Google-Sender-Auth: PGBjfwSp8cJD9BcOFR-YmIQ7geA
Message-ID: <CAPnjgZ0LU+t50rW8A6fbz=KRMoQ4pLWVgPUgQW26fC3zAD5Huw@mail.gmail.com>
Subject: Re: [PATCH v1 02/15] dm: Simple Watchdog uclass
To: Maxim Sloyko <maxims@google.com>
Cc: U-Boot Mailing List <u-boot@lists.denx.de>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>, 
 Stephen Warren <swarren@nvidia.com>
Content-Type: text/plain; charset=UTF-8
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Wed, 19 Apr 2017 00:11:52 -0000

Hi Maxim,

On 17 April 2017 at 13:00, Maxim Sloyko <maxims@google.com> wrote:
> This is a simple uclass for Watchdog Timers. It has four operations:
> start, restart, reset, stop. Drivers must implement start, restart and
> stop operations, while implementing reset is optional: It's default
> implementation expires watchdog timer in one clock tick.
>
> Signed-off-by: Maxim Sloyko <maxims@google.com>
> ---
>
> Changes in v1:
> - Rename wdt_reset to wdt_expire_now
> - Rename wdt_restart to wdt_reset
> - Clarified function documentation in few cases
> - Add Sandbox WDT driver and unit tests
>
>
> ---
>  arch/sandbox/dts/test.dts        |   4 ++
>  arch/sandbox/include/asm/state.h |   9 ++++
>  configs/sandbox_defconfig        |   2 +
>  drivers/watchdog/Kconfig         |  21 ++++++++
>  drivers/watchdog/Makefile        |   2 +
>  drivers/watchdog/sandbox_wdt.c   |  76 +++++++++++++++++++++++++++
>  drivers/watchdog/wdt-uclass.c    |  72 ++++++++++++++++++++++++++
>  include/dm/uclass-id.h           |   1 +
>  include/wdt.h                    | 107 +++++++++++++++++++++++++++++++++++++++
>  test/dm/Makefile                 |   1 +
>  test/dm/wdt.c                    |  40 +++++++++++++++
>  11 files changed, 335 insertions(+)
>  create mode 100644 drivers/watchdog/sandbox_wdt.c
>  create mode 100644 drivers/watchdog/wdt-uclass.c
>  create mode 100644 include/wdt.h
>  create mode 100644 test/dm/wdt.c

Reviewed-by: Simon Glass <sjg@chromium.org>

nits below

[...]

> diff --git a/drivers/watchdog/sandbox_wdt.c b/drivers/watchdog/sandbox_wdt.c
> new file mode 100644
> index 0000000000..34d90bee7e
> --- /dev/null
> +++ b/drivers/watchdog/sandbox_wdt.c
> @@ -0,0 +1,76 @@
> +/*
> + * Copyright 2017 Google, Inc
> + *
> + * SPDX-License-Identifier:    GPL-2.0+
> + */
> +
> +#include <common.h>
> +#include <dm.h>
> +#include <asm/state.h>

Put this after wt.h

> +#include <wdt.h>
> +
> +DECLARE_GLOBAL_DATA_PTR;
> +
> +static int sandbox_wdt_start(struct udevice *dev, u64 timeout, ulong flags)
> +{
> +       struct sandbox_state *state = state_get_current();
> +
> +       state->wdt.counter = timeout;
> +       state->wdt.running = true;
> +
> +       return 0;
> +}
> +
> +static int sandbox_wdt_stop(struct udevice *dev)
> +{
> +       struct sandbox_state *state = state_get_current();
> +
> +       state->wdt.running = false;
> +
> +       return 0;
> +}
> +
> +static int sandbox_wdt_reset(struct udevice *dev)
> +{
> +       struct sandbox_state *state = state_get_current();
> +
> +       state->wdt.reset_count++;
> +
> +       return 0;
> +}
> +
> +static int sandbox_wdt_expire_now(struct udevice *dev, ulong flags)
> +{
> +       sandbox_wdt_start(dev, 1, flags);
> +
> +       return 0;
> +}
> +
> +static int sandbox_wdt_probe(struct udevice *dev)
> +{
> +       struct sandbox_state *state = state_get_current();
> +
> +       memset(&state->wdt, 0, sizeof(state->wdt));

Driver model does this for you so this function is not needed.

> +
> +       return 0;
> +}
> +
> +static const struct wdt_ops sandbox_wdt_ops = {
> +       .start = sandbox_wdt_start,
> +       .reset = sandbox_wdt_reset,
> +       .stop = sandbox_wdt_stop,
> +       .expire_now = sandbox_wdt_expire_now,
> +};
> +
> +static const struct udevice_id sandbox_wdt_ids[] = {
> +       { .compatible = "sandbox,wdt" },
> +       {}
> +};
> +
> +U_BOOT_DRIVER(wdt_sandbox) = {
> +       .name = "wdt_sandbox",
> +       .id = UCLASS_WDT,
> +       .of_match = sandbox_wdt_ids,
> +       .ops = &sandbox_wdt_ops,
> +       .probe = sandbox_wdt_probe,
> +};

[...]
