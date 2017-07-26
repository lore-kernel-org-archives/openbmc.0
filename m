Return-Path: <joel.stan@gmail.com>
Received: from mail-yw0-x244.google.com (mail-yw0-x244.google.com
 [IPv6:2607:f8b0:4002:c05::244])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3xHQ5r6v9KzDqmV
 for <openbmc@lists.ozlabs.org>; Wed, 26 Jul 2017 16:23:12 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="t5YaSI91"; 
 dkim-atps=neutral
Received: by mail-yw0-x244.google.com with SMTP id i6so4858900ywb.3
 for <openbmc@lists.ozlabs.org>; Tue, 25 Jul 2017 23:23:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=AZMRdoNDAV1PJLryWev5ajpxLSmM87/J5K/r5BWzswo=;
 b=t5YaSI91I1ldCF9jjgxPoOVHpGvDaOQidMjyIWV1dwESTNGFrZI/UzfMuioQLTkTIa
 UM1UQMcB+Le8f1ZC4tAgtRwJq/hHyzdqMloEOWuw4CpggzwgA92/PiKUpb3sK07/Mrbg
 eRcK2FtlK5TFORZiul7szfL31NlkFULsc0LgHFSjKttw4/TRJG6utWRj352TO3AlcXte
 ZUDk+NV2Y/YCfxEkBKwvuhqRIYoWzrdUimnY/30zNie+ddJqpad8JoPKydhoH+V5fnzF
 wBHZGwvEKQd3qSm5g+aZ/fjmWvSbXHQido38wCaL5JWQIf+tVt+y2u6/SU6EK99eQ+4l
 G6Ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=AZMRdoNDAV1PJLryWev5ajpxLSmM87/J5K/r5BWzswo=;
 b=o93xNhqhk3vMSwtqCVH1MXYtsBlQmWgJ1dVQWe5wxtfFUlppi1+oVvdHfMhURJ4y18
 lBX5+fxqOzgwq2F+M/waK40f5PY7iVD8ZqM5a5O9QL38CVyUjqijPGi1sFWEUcgz4qup
 C76Gf5dczKrWO+DPzjiPrTZnh+DVb8g/eX27jzCF1HcnYaezcadHlmy3EDXf6nSik2xe
 OEJae0W5+GNGE8rzbx+KO1mq2i5fgYepGrajRAPqPFxMncLYI41SKa7SV82LwB74/C9D
 3dRDZsBYLNhLcYVh5kut6U74Qq+BIVjAR8C76ODNhUq9c8wvWpoN8Zf/411wg05mmvR1
 NHYg==
X-Gm-Message-State: AIVw111qxz4E1M8wC7nD+aXwKtpaRhecaMlqNMVhlDhCci6P6Olb483J
 FZeyX3h2K4tCZwzlahuG9C5J7H3XzQ==
X-Received: by 10.37.174.34 with SMTP id a34mr5461532ybj.331.1501050190549;
 Tue, 25 Jul 2017 23:23:10 -0700 (PDT)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.37.170.177 with HTTP; Tue, 25 Jul 2017 23:22:50 -0700 (PDT)
In-Reply-To: <1500567765-4990-1-git-send-email-anoo@linux.vnet.ibm.com>
References: <1500567765-4990-1-git-send-email-anoo@linux.vnet.ibm.com>
From: Joel Stanley <joel@jms.id.au>
Date: Wed, 26 Jul 2017 15:52:50 +0930
X-Google-Sender-Auth: AkzzXxOrHzOzuKxuDaSn56liE7Q
Message-ID: <CACPK8Xcz3wqR4Y_t7=y6AWy3soH4cPm=gCw=8zMa7s-EQU+vJw@mail.gmail.com>
Subject: Re: [PATCH] arm: configs: aspeed_g5_defconfig: Enable Automount
To: Adriana Kobylak <anoo@linux.vnet.ibm.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
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
X-List-Received-Date: Wed, 26 Jul 2017 06:23:13 -0000

On Fri, Jul 21, 2017 at 1:52 AM, Adriana Kobylak
<anoo@linux.vnet.ibm.com> wrote:
> Enable CONFIG_AUTOFS4_FS to be able to support systemd
> automount units.
> This config is already present in the aspeed_g4_defconfig.

The kconfig help for this option says:

 If you are not a part of a fairly large, distributed network or
 don't have a laptop which needs to dynamically reconfigure to the
 local network, you probably do not need an automounter, and can say
 N here.

I'm not overly familiar with systemd automount units. Can you explain
why we need this option enabled?

Cheers,

Joel


>
> Signed-off-by: Adriana Kobylak <anoo@linux.vnet.ibm.com>
> ---
>  arch/arm/configs/aspeed_g5_defconfig | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/arch/arm/configs/aspeed_g5_defconfig b/arch/arm/configs/aspeed_g5_defconfig
> index 1868442..c8bd79e 100644
> --- a/arch/arm/configs/aspeed_g5_defconfig
> +++ b/arch/arm/configs/aspeed_g5_defconfig
> @@ -193,6 +193,7 @@ CONFIG_FSI_SBEFIFO=y
>  CONFIG_OCCFIFO=y
>  CONFIG_FIRMWARE_MEMMAP=y
>  CONFIG_FANOTIFY=y
> +CONFIG_AUTOFS4_FS=y
>  CONFIG_OVERLAY_FS=y
>  CONFIG_TMPFS=y
>  CONFIG_JFFS2_FS=y
> --
> 1.8.2.2
>
