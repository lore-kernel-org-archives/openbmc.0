Return-Path: <joel.stan@gmail.com>
Received: from mail-yw0-x244.google.com (mail-yw0-x244.google.com
 [IPv6:2607:f8b0:4002:c05::244])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3xLYyF2CZdzDrLg
 for <openbmc@lists.ozlabs.org>; Mon, 31 Jul 2017 19:27:32 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="NJwnH7eM"; 
 dkim-atps=neutral
Received: by mail-yw0-x244.google.com with SMTP id n83so2401242ywn.3
 for <openbmc@lists.ozlabs.org>; Mon, 31 Jul 2017 02:27:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=n3XKCaY0gRrBqIMm+0CcS++7aWJV+w6E6Z5ey4VePJI=;
 b=NJwnH7eM5sP7w+mXOQFY3LovynAXUxwCe/DWdIPK5ERkK+pBKoTVd9JdKrjT3amYCL
 YwI1h8KF/Ty54wmsadQJke20unKD4sg58bD727eGLT+DoDU/BtHHjEDVukMqP0dfX+aT
 RsB1BIvJ/YQx4q2/Sr2NMzjVeNjL/ycRVHoNVpCxLcN7zuzcc8IGk21EgFLM/OkoCe7N
 Gdmat5bUIBweAUGHeEK+qkei9T5MwDI6n/7M8/+VILsP50PwiTZ0W2vrMg7uFo0S7mmu
 ggcWKsOEjIz3dv70PcdGVCFrQGSLPvuHGolg4DE7ME1j2PbZfppUewSRSNBuauZ+UxKv
 wIIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=n3XKCaY0gRrBqIMm+0CcS++7aWJV+w6E6Z5ey4VePJI=;
 b=mH9X6sIUU+pwYoSPCx8XwFLL5Z59wgkXfTFCf5RLLk6GglZZKWa1w7Z71O++FkC0KT
 hvkjJbTDtkeAAM3Aw3VCg5EW2aK3YoK6Ny9x5ySJuMconKfBb1YcGRrEVgp90r4X8lKr
 dFxsJ3WwlC1TxxG/lBcpS8NTFk686tH6A6pFDt70mH89AlLhnrqz1bOHMp3iJbjkmRQc
 B4LJ6dc9A7KL2KYf2n+wYxRwbqtAlRva47CXfgw4aI5R29rTg4OmOQM98aTyyfTw5o/A
 2nWmYqy/o9BtVazX3lruhsjl8iTfwRGbEEDhZehp323ppwJn5HSZjv/Ajvj4otpt4b5r
 BQVw==
X-Gm-Message-State: AIVw110haqOxNIc/cUN3Zo97oRqi0yAJR7+igxKCEuLbFh2p7j6Ru8+T
 GgT6AO38FW8VVHzSMfEcErv9qGnT/w==
X-Received: by 10.37.11.211 with SMTP id 202mr7198712ybl.194.1501493250448;
 Mon, 31 Jul 2017 02:27:30 -0700 (PDT)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.37.197.148 with HTTP; Mon, 31 Jul 2017 02:27:09 -0700 (PDT)
In-Reply-To: <20170729010012.5032-1-brendanhiggins@google.com>
References: <20170729010012.5032-1-brendanhiggins@google.com>
From: Joel Stanley <joel@jms.id.au>
Date: Mon, 31 Jul 2017 18:57:09 +0930
X-Google-Sender-Auth: qCRyWgmsaTFWUrGuDOrPRlWLXcw
Message-ID: <CACPK8XdT5yxKFj75JCuXZ+3GT1Q6x0EYADmFdu6we6SHwTMnLw@mail.gmail.com>
Subject: Re: [PATCH v1] i2c: aspeed: fixed potential null pointer dereference
To: Brendan Higgins <brendanhiggins@google.com>
Cc: Wolfram Sang <wsa@the-dreams.de>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>, 
 Patrick Venture <venture@google.com>, linux-i2c@vger.kernel.org, 
 OpenBMC Maillist <openbmc@lists.ozlabs.org>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
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
X-List-Received-Date: Mon, 31 Jul 2017 09:27:34 -0000

On Sat, Jul 29, 2017 at 10:30 AM, Brendan Higgins
<brendanhiggins@google.com> wrote:
> Before I skipped null checks when the master is in the STOP state; this
> fixes that.
>
> Signed-off-by: Brendan Higgins <brendanhiggins@google.com>

Acked-by: Joel Stanley <joel@jms.id.au>

Out of interest, was this found by code review, or did you hit this in testing?

Cheers,

Joel

> ---
>  drivers/i2c/busses/i2c-aspeed.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/i2c/busses/i2c-aspeed.c b/drivers/i2c/busses/i2c-aspeed.c
> index f19348328a71..6fdf9231c23c 100644
> --- a/drivers/i2c/busses/i2c-aspeed.c
> +++ b/drivers/i2c/busses/i2c-aspeed.c
> @@ -410,10 +410,11 @@ static bool aspeed_i2c_master_irq(struct aspeed_i2c_bus *bus)
>         }
>
>         /* We are in an invalid state; reset bus to a known state. */
> -       if (!bus->msgs && bus->master_state != ASPEED_I2C_MASTER_STOP) {
> +       if (!bus->msgs) {
>                 dev_err(bus->dev, "bus in unknown state");
>                 bus->cmd_err = -EIO;
> -               aspeed_i2c_do_stop(bus);
> +               if (bus->master_state != ASPEED_I2C_MASTER_STOP)
> +                       aspeed_i2c_do_stop(bus);
>                 goto out_no_complete;
>         }
>         msg = &bus->msgs[bus->msgs_index];
> --
> 2.14.0.rc0.400.g1c36432dff-goog
>
