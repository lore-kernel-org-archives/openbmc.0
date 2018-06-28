Return-Path: <joel.stan@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:400d:c09::241; helo=mail-qk0-x241.google.com;
 envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="T0GYg3Jk"; 
 dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.b="D7ipYEH3"; 
 dkim-atps=neutral
Received: from mail-qk0-x241.google.com (mail-qk0-x241.google.com
 [IPv6:2607:f8b0:400d:c09::241])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 41GRDs36MpzF1Nr;
 Thu, 28 Jun 2018 14:11:57 +1000 (AEST)
Received: by mail-qk0-x241.google.com with SMTP id b129-v6so2278705qke.7;
 Wed, 27 Jun 2018 21:11:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=5TpnrO7julsyRfsSpAK7CcSX+w22T2Pd7TNT22eFajM=;
 b=T0GYg3JkOGso0u5vH0+5eahuEA8Ukj2GhgcvYpvUDC5bXgrWnIHAhF4dvVXcvWo77T
 vhlmbzOWOVADX/b/29q9DeEOv1vxJPgKgFnn29glbZ5TFt80n21s3OyiJ7+ZMIwctCd3
 ZrrX0AseWUD3cZCaRrcFOMZUAqD2/PFclKkk+ojyxQXz6AuNA0in4snk+NFhJQ51rKoe
 ifqv6gBWz/hjyKUpnh8V7WW97AKO3RvTdg9Fy8H9HYTGINXaDDPFSFgcMr7FUoT5aF4T
 kr1XOb/XTYbp6WVSNt2ZrKL50D6b/x57tDWtWLoP3oATsUfwGPvDiBHmhLAk1Mv5nF9X
 9DWg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=5TpnrO7julsyRfsSpAK7CcSX+w22T2Pd7TNT22eFajM=;
 b=D7ipYEH3Pvom1fDyK5R09vECY241ZtDGF+J0G/C6He+K2k1mvluBISN6J9Z1FW0LhC
 II9bWY4rfChihgNh5DEVEKmCXeTPOvezlcoLOKptIDtI8ix0RnEkQ/6F8TlzfeDGjxiv
 33BxGuXbed8NbtCf/RG2RAuHfx0prMAN+bqB8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=5TpnrO7julsyRfsSpAK7CcSX+w22T2Pd7TNT22eFajM=;
 b=FitHRtB7cl3q964mcuxsTozzRvM0VJM8aJcRFLyE7S5bMzz9Om7MNMkINg1+qUbBC9
 ukeKwG4NUhzxUtSItzY5CSOOphNmIMi9tgihvn0/9+XrGRo1d2kGrgmLD68gnkav/VM7
 DkodSQGZFmL6SUG/i44Bb2aZkV3+RyiC0YW6Wi7ddAV4tzgFJYe3o1B9rJMo07+9KBH2
 z5bxa5Mows3xAeKFjSUxB2V2mfACEQ36SmnkIFeX4rx6zqDiB520gKI08gTRR86voim2
 QvUqCTCDq7NBHGQ73TBuz1fC9qDdRdSNSRbbOfT5Y80KBGxugofHOCH6TybBw8IbQS3M
 mfHg==
X-Gm-Message-State: APt69E2W5qc9AMDMF0RlFleDFWF5HlbU2AUWV0Ro0z4KG/KLVm7k5lED
 riBJTMLqoPmEYQd2TDMz0sPM4tCqqO7zNrlEBZsTtA==
X-Google-Smtp-Source: AAOMgpd0FYI3DCUziVl9qjLx/z+K+WbGWDNoGyRVX/N000GtqcJJnxo1HSUT8eGRP/F/7+LYdXZ4kVbXh8Y0d9YoQEk=
X-Received: by 2002:a37:c44d:: with SMTP id
 h13-v6mr7436304qkm.422.1530159115284; 
 Wed, 27 Jun 2018 21:11:55 -0700 (PDT)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 2002:ac8:169d:0:0:0:0:0 with HTTP; Wed, 27 Jun 2018 21:11:34
 -0700 (PDT)
In-Reply-To: <20180626232605.13420-7-benh@kernel.crashing.org>
References: <20180626232605.13420-1-benh@kernel.crashing.org>
 <20180626232605.13420-7-benh@kernel.crashing.org>
From: Joel Stanley <joel@jms.id.au>
Date: Thu, 28 Jun 2018 13:41:34 +0930
X-Google-Sender-Auth: QOIuqfArhNTJ1RTvyMoGPSE24dc
Message-ID: <CACPK8XfZPCiCPeNL5-TpPMcHrA_fyiLu=5pArSxBXd6wT8jkFA@mail.gmail.com>
Subject: Re: [PATCH 06/14] fsi: master-gpio: Add more tracepoints
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>
Cc: linux-aspeed@lists.ozlabs.org, OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 devicetree <devicetree@vger.kernel.org>, Andrew Jeffery <andrew@aj.id.au>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.26
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Thu, 28 Jun 2018 04:11:58 -0000

On 27 June 2018 at 08:55, Benjamin Herrenschmidt
<benh@kernel.crashing.org> wrote:
> This adds a few more tracepoints that have proven useful when
> debugging issues with the FSI bus.
>
> Signed-off-by: Benjamin Herrenschmidt <benh@kernel.crashing.org>

Reviewed-by: Joel Stanley <joel@jms.id.au>

> ---
>  drivers/fsi/fsi-master-gpio.c          | 16 ++++---
>  include/trace/events/fsi_master_gpio.h | 59 ++++++++++++++++++++++++++
>  2 files changed, 69 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/fsi/fsi-master-gpio.c b/drivers/fsi/fsi-master-gpio.c
> index 48e0e65b2982..a00a85aa6d56 100644
> --- a/drivers/fsi/fsi-master-gpio.c
> +++ b/drivers/fsi/fsi-master-gpio.c
> @@ -130,10 +130,17 @@ static void set_sda_output(struct fsi_master_gpio *master, int value)
>
>  static void clock_zeros(struct fsi_master_gpio *master, int count)
>  {
> +       trace_fsi_master_gpio_clock_zeros(master, count);
>         set_sda_output(master, 1);
>         clock_toggle(master, count);
>  }
>
> +static void echo_delay(struct fsi_master_gpio *master)
> +{
> +       clock_zeros(master, master->t_echo_delay);
> +}

This doesn't look like it belongs in this patch.

You've just moved it up. Not worth a re-spin.

> +
> +
>  static void serial_in(struct fsi_master_gpio *master, struct fsi_gpio_msg *msg,
>                         uint8_t num_bits)
>  {
> @@ -279,16 +286,19 @@ static void build_ar_command(struct fsi_master_gpio *master,
>                 addr_bits = 2;
>                 opcode_bits = 2;
>                 opcode = FSI_GPIO_CMD_SAME_AR;
> +               trace_fsi_master_gpio_cmd_same_addr(master);
>
>         } else if (check_relative_address(master, id, addr, &rel_addr)) {
>                 /* 8 bits plus sign */
>                 addr_bits = 9;
>                 addr = rel_addr;
>                 opcode = FSI_GPIO_CMD_REL_AR;
> +               trace_fsi_master_gpio_cmd_rel_addr(master, rel_addr);
>
>         } else {
>                 addr_bits = 21;
>                 opcode = FSI_GPIO_CMD_ABS_AR;
> +               trace_fsi_master_gpio_cmd_abs_addr(master, addr);
>         }
>
>         /*
> @@ -337,12 +347,6 @@ static void build_epoll_command(struct fsi_gpio_msg *cmd, uint8_t slave_id)
>         msg_push_crc(cmd);
>  }
>
> -static void echo_delay(struct fsi_master_gpio *master)
> -{
> -       set_sda_output(master, 1);
> -       clock_toggle(master, master->t_echo_delay);
> -}
> -
>  static void build_term_command(struct fsi_gpio_msg *cmd, uint8_t slave_id)
>  {
>         cmd->bits = 0;
