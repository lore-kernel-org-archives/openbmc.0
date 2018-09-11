Return-Path: <venture@google.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2607:f8b0:4864:20::542; helo=mail-pg1-x542.google.com;
 envelope-from=venture@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="Za3hF/Nt"; 
 dkim-atps=neutral
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com
 [IPv6:2607:f8b0:4864:20::542])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4290b71dKkzF37s
 for <openbmc@lists.ozlabs.org>; Wed, 12 Sep 2018 08:54:10 +1000 (AEST)
Received: by mail-pg1-x542.google.com with SMTP id l63-v6so12978080pga.7
 for <openbmc@lists.ozlabs.org>; Tue, 11 Sep 2018 15:54:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=aFgUVH3F8T3JjFWUP1NLsmrvcMsZDEQTEOvmoo1k26c=;
 b=Za3hF/Nt6YirbON2weOaRCpMHlhfE9nzhXdYxcfbJppct4bul1PqhLu2NYC5eLAu90
 Jg36HTqVE9xSM9mn/f8V9LJ1SplsW8HiCqCvt5L2jd1BjNP7vyPn+e/X2unSJL2Hrk6N
 NcJPSPFO7Bbw80un0rsanCVxFJxsIqnMhXxdWi2kUX5tXiVxtsczLDuBD5dOyU7YagZR
 Ug06TicDs/2NbGK8298d1Z3k8LPqbrhwjlhE8MGUk960tolEGbdIuNIsdnCiYfZLoKbG
 SZueGTgZBPRNJXDt3QhqtmoKJiKqTxIwYF1CwlZDhgRpfsBrjUuItAMX5hfYAraGPrzv
 cHQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=aFgUVH3F8T3JjFWUP1NLsmrvcMsZDEQTEOvmoo1k26c=;
 b=po7WVDfSpPxEWFvDB8Vc6I/9VRE6wYQZu4Fdg4O6uF+/CJAvn6BvERhz+htz0rnEk4
 6mNyNQH67W48x5Hk7TXhQo2JO7AYP5Ju+iatx0VUuvUA2uCNOmIM5SNztcGTeuPfpnz8
 A8h8mO7Kli0mhx7688Jsa8wg5/f4zJT8InnhVPskSCBpDCoZKLDKXThvngvOAPdr1pkD
 1aT4YykftKip9y29qLBXs+oILuIK3oWjyF7lQ5djaPUsTFOGiJsr9b25T80cLKzwK9P0
 2JP9p9tjtPyOh7T4TgINaLtuPn3zhH5K7y+xO1HHASdozWe0EHJROVi6sQXmSxp4z3Al
 OjJA==
X-Gm-Message-State: APzg51CUoaj6/dYWu7st4kxOtkf7XkJQxUUxin6sepmJ0yOwVOhK/94o
 rB16wayRvvFLGaWW3Rx6+SmnX4BuyDJCNIncDvrBxw==
X-Google-Smtp-Source: ANB0VdYNXbY+kBzjHePUktU0/tvAZPVV+A0q0JrtbBRVENh0sw9kGkfWHFSjNzt+ORfxRvBn3jurMv5d8g6u8Olv0yQ=
X-Received: by 2002:a62:d44a:: with SMTP id
 u10-v6mr31816615pfl.144.1536706448759; 
 Tue, 11 Sep 2018 15:54:08 -0700 (PDT)
MIME-Version: 1.0
References: <20180911225221.54513-1-venture@google.com>
In-Reply-To: <20180911225221.54513-1-venture@google.com>
From: Patrick Venture <venture@google.com>
Date: Tue, 11 Sep 2018 15:53:57 -0700
Message-ID: <CAO=notyaxeCuAxHTBYw=J6ZzJoObd_EPdnDVh+4OYqhDsJvjyA@mail.gmail.com>
Subject: Re: [PATCH] ipmi: looped device detection
To: Corey Minyard <minyard@acm.org>, Arnd Bergmann <arnd@arndb.de>,
 Greg KH <gregkh@linuxfoundation.org>
Cc: openipmi-developer@lists.sourceforge.net, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
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
X-List-Received-Date: Tue, 11 Sep 2018 22:54:12 -0000

On Tue, Sep 11, 2018 at 3:52 PM Patrick Venture <venture@google.com> wrote:
>
> Try to get the device ID repeatedly during initialization before giving up.
> The BMC isn't always responsive, and this allows it to be slightly flaky
> during early boot.
>
> Tested: Installed on a system with the BMC software disabled
> such that it was non-responsive.  The driver correctly detected this
> and gave up as expected.  Then I re-enabled the BMC software unloaded
> and reloaded the driver and it was detected properly.
>
> Signed-off-by: Patrick Venture <venture@google.com>
> ---
>  drivers/char/ipmi/ipmi_si_intf.c | 24 +++++++++++++++++++++++-
>  1 file changed, 23 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/char/ipmi/ipmi_si_intf.c b/drivers/char/ipmi/ipmi_si_intf.c
> index 90ec010bffbd..a1ca34af7698 100644
> --- a/drivers/char/ipmi/ipmi_si_intf.c
> +++ b/drivers/char/ipmi/ipmi_si_intf.c
> @@ -1918,11 +1918,14 @@ int ipmi_si_add_smi(struct si_sm_io *io)
>   * held, primarily to keep smi_num consistent, we only one to do these
>   * one at a time.
>   */
> +#define GET_DEVICE_ID_ATTEMPTS 5
>  static int try_smi_init(struct smi_info *new_smi)
>  {
>         int rv = 0;
>         int i;
>         char *init_name = NULL;
> +       bool platform_device_registered = false;

platform_device_registered -- looks like I accidentally included a
variable from my branch.

> +       unsigned long sleep_rm;
>
>         pr_info(PFX "Trying %s-specified %s state machine at %s address 0x%lx, slave address 0x%x, irq %d\n",
>                 ipmi_addr_src_to_str(new_smi->io.addr_source),
> @@ -2003,7 +2006,26 @@ static int try_smi_init(struct smi_info *new_smi)
>          * Attempt a get device id command.  If it fails, we probably
>          * don't have a BMC here.
>          */
> -       rv = try_get_dev_id(new_smi);
> +       for (i = 0; i < GET_DEVICE_ID_ATTEMPTS; i++) {
> +               pr_info(PFX "Attempting to read BMC device ID\n");
> +               rv = try_get_dev_id(new_smi);
> +               /* If it succeeded, stop trying */
> +               if (!rv)
> +                       break;
> +
> +               /* Sleep for ~0.25s before trying again instead of hammering
> +                * the BMC.
> +                */
> +               sleep_rm = msleep_interruptible(250);
> +               if (sleep_rm != 0) {
> +                       pr_info(PFX "Find BMC interrupted\n");
> +                       rv = -EINTR;
> +                       goto out_err;
> +               }
> +       }
> +
> +       /* If we exited the loop above and rv is non-zero we ran out of tries.
> +        */
>         if (rv) {
>                 if (new_smi->io.addr_source)
>                         dev_err(new_smi->io.dev,
> --
> 2.19.0.rc2.392.g5ba43deb5a-goog
>
