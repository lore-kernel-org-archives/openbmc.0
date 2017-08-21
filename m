Return-Path: <joel.stan@gmail.com>
Received: from mail-lf0-x243.google.com (mail-lf0-x243.google.com
 [IPv6:2a00:1450:4010:c07::243])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3xbW5K3wQzzDrKf
 for <openbmc@lists.ozlabs.org>; Mon, 21 Aug 2017 21:03:33 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="dirfdLUA"; 
 dkim-atps=neutral
Received: by mail-lf0-x243.google.com with SMTP id z12so2019096lfd.4
 for <openbmc@lists.ozlabs.org>; Mon, 21 Aug 2017 04:03:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=eDxIUKYF7ezZ3tA1qRtWsgRBQxpYIJUjdLLwouINALE=;
 b=dirfdLUAiOjHhlegzu20uZtTaKe9EnI4siDoZqtFYrsTyypFzVUXAWM/yT8dA+fHGy
 puQwanIz4Yc6fah7oJhh5DRTQnZVZ9ihKK7B6T+hu/XNGLoDR3q17LqfRZ9q/h/MjhFx
 zMwB1mii01Hrojwp/HWWJTDo7mqlbJZZps4WxJ4hKbt/6jT8rS7vvGfcF7Amhcb1smd8
 AVu3o3hKRdUOgO2gjRCmyLuIa7xXmzn9C1P5uBOak21Ybwle6SX6idFbla5K5QPeRtrm
 zJaCisT7dVn+SPY9Lt4cSxup7I5WYyyH6G64er59uuHidb9thwuQ+4OwtfG7HZhytCNQ
 +Opg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=eDxIUKYF7ezZ3tA1qRtWsgRBQxpYIJUjdLLwouINALE=;
 b=h1Oq2K+cT5/PIpokH5flz7KcB2tbYD93fFwEZ6aO4Yus/Mb/ZzoAMdosRZa4abopv5
 mUkH4XdwQ3/XfBasgH0IGPPY4FWmTE5urGjZfyE2/JpBgaucbeUrdj81N0EQLF2rrwmJ
 3g5poTlrlYHo2uG5J5UwpdMMf6w3Acw0V4NFC+ZDdvBBE0HwfcpTr2HpEP/mO/Vo7bzH
 6MVlPLbLuuYTKvLmWie3VYMQ3kVy4/3qaoB5npw33W9zCbrsYpFtf8T/AxClyRLuqg77
 v+o1Xsom9WU67Rm+Ba8RvBvOec3s2ow6oLZDO4zi6KXmSJ7h0Eum2NKvdwV3EjhB5kO7
 dbUw==
X-Gm-Message-State: AHYfb5hRmiNA79NVw9CAs9sba7lZOjccNsIt+3XkuwdxrTCIF5gjRQxH
 1m7YSXp3rpevTO85NqRGAX5l8VjBCQ==
X-Received: by 10.46.83.25 with SMTP id h25mr6743093ljb.46.1503313410180; Mon,
 21 Aug 2017 04:03:30 -0700 (PDT)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.25.72.77 with HTTP; Mon, 21 Aug 2017 04:03:09 -0700 (PDT)
In-Reply-To: <1502849350-40252-1-git-send-email-anoo@linux.vnet.ibm.com>
References: <1502849350-40252-1-git-send-email-anoo@linux.vnet.ibm.com>
From: Joel Stanley <joel@jms.id.au>
Date: Mon, 21 Aug 2017 20:33:09 +0930
X-Google-Sender-Auth: b0OZn2gqPDfntDPff0K4I8S27qY
Message-ID: <CACPK8Xc1zk+uYf-ZJTPZM83u_6i8aQRNNUogk2PGKhGjSBntEQ@mail.gmail.com>
Subject: Re: [PATCH u-boot v2016.07-aspeed-openbmc] Add MTD and UBI support to
 ast-g5
To: Adriana Kobylak <anoo@linux.vnet.ibm.com>
Cc: Rick Altherr <raltherr@google.com>, Maxim Sloyko <maxims@google.com>, 
 Milton Miller II <miltonm@us.ibm.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
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
X-List-Received-Date: Mon, 21 Aug 2017 11:03:34 -0000

On Wed, Aug 16, 2017 at 11:39 AM, Adriana Kobylak
<anoo@linux.vnet.ibm.com> wrote:
> Add MTD and UBI support to the default g5 include, conditioned to
> having MTDPARTS_DEFAULT defined.

Can you explain what we're planning on using mtdparts for? As I
understand it this is for specifying the mtd partitions on the command
line.

Are you proposing to move away from the device tree description?

> This allows platforms to enable this support if desired without
> adding it by default since it increases the size of u-boot.

Do you have numbers? It's good to keep track in case we need to go
back and save space in the future.

> Signed-off-by: Adriana Kobylak <anoo@linux.vnet.ibm.com>
> ---
>  include/configs/ast-g5-ncsi.h | 10 ++++++++++
>  1 file changed, 10 insertions(+)
>
> diff --git a/include/configs/ast-g5-ncsi.h b/include/configs/ast-g5-ncsi.h
> index 12d6684..b126e6e 100644
> --- a/include/configs/ast-g5-ncsi.h
> +++ b/include/configs/ast-g5-ncsi.h
> @@ -28,4 +28,14 @@
>
>  #define CONFIG_HW_WATCHDOG
>
> +/* MTD and UBI */
> +#ifdef MTDPARTS_DEFAULT
> +#define CONFIG_FLASH_CFI_MTD
> +#define CONFIG_CMD_UBI

I thought Milton mentioned today that we didn't need to enable the UBI
command in u-boot, but I may have misunderstood.

> +#define CONFIG_RBTREE
> +#define CONFIG_MTD_DEVICE
> +#define CONFIG_MTD_PARTITIONS
> +#define CONFIG_CMD_MTDPARTS
> +#endif
> +
>  #endif /* __AST_G5_NCSI_CONFIG_H */
> --
> 1.8.2.2
>
