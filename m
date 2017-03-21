Return-Path: <sjg@google.com>
Received: from mail-vk0-x236.google.com (mail-vk0-x236.google.com
 [IPv6:2607:f8b0:400c:c05::236])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3vnpl60z5FzDq7Z
 for <openbmc@lists.ozlabs.org>; Wed, 22 Mar 2017 10:22:58 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="WzHmjhWm"; 
 dkim=pass (1024-bit key;
 unprotected) header.d=chromium.org header.i=@chromium.org header.b="Jwa+NstQ";
 dkim-atps=neutral
Received: by mail-vk0-x236.google.com with SMTP id z204so53498733vkd.1
 for <openbmc@lists.ozlabs.org>; Tue, 21 Mar 2017 16:22:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=lffq+AMR4IcjQOvSqE88o2oyc8nfdhzRhg+t57y9vDI=;
 b=WzHmjhWmVDLbZBd4HEUWOvuQvn9+Ki2SzpC1xtOPrzFkC1WSbeG8x3huNdjS9DYWg9
 Ie8yOFR/MrYI2aoah7q3+TlT1yGN6NyAaK9mqrMBwNXPuvOZobzkVF/VU+841x3thyi8
 Oov8e1ST+BQPlDAgiji/UfZfyG1a32jwjDA5fHU7vX/qDLGiIbM2g1VgC5CjCiJYZ0pj
 IpruQ1UxZ2G8efESIcwzcT98K63sy1vG6w1dieRwyby+meYC6mDx/udi9arpNYdxoYDp
 LIiyae1BuFa0NQGP24zHkcz4t04F1KlEj2TmuKGwbJGzfFQC6xaVwFtqMf2qWuPN7PeA
 xacA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=lffq+AMR4IcjQOvSqE88o2oyc8nfdhzRhg+t57y9vDI=;
 b=Jwa+NstQ3J2Z/1jT3Y7eMvsEP9Z+9M7Lm0j1k/c9dfgAVxNJF0bveiGASRQFLKuNoP
 fcWqupLNSTjQ4I7WahOyAAdsaiktWVc0d0B/FiDT2KyqHMfw/qVl6Hr7ZqtFhnxcBymQ
 jsw8XJ0BHLMnIl55tNVWDspI3yIZA3T0e5V/8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=lffq+AMR4IcjQOvSqE88o2oyc8nfdhzRhg+t57y9vDI=;
 b=Qi6dhkRYouE63Ic9qpXVlGei2Pxkdwgr+wU1VFxKWzlGTLScZo3JRlAEmcOr/Uz7Qb
 RiDICfrkHWDdLT/pZBTFne4rKEYrZs1j3msqIOHLFlVmpaJkucgcfBwihBW7Ql8P8bWx
 UOpxw4F8+pGZM7Txwz2Z/RiHGC9KVESLSiFRhd6WZGUNyjzlLu1HTawgTdFvB92gYNXw
 aDaSKJCG8tNOqClAMUxTftpzEwZ05jDWn8kVCiBg1YDt5lYBlaHPSLSLHyVBwGNheNOr
 r0Qy+Y6MNuy/4UjhVBMJgk8CpR6ge3d86RGWoO68PMdhXDUDcss57VsMKgf62PooYwQn
 JA+g==
X-Gm-Message-State: AFeK/H0uTl2PHqbfTK3EfpUWFaTdIQifatSE++hEzJcU8EulVe+iiAPdfO0BKAJqdLfzMmJHS3/8dg+X1B51aQ+E
X-Received: by 10.176.7.38 with SMTP id h35mr16287599uah.103.1490138575853;
 Tue, 21 Mar 2017 16:22:55 -0700 (PDT)
MIME-Version: 1.0
Sender: sjg@google.com
Received: by 10.159.35.108 with HTTP; Tue, 21 Mar 2017 16:22:35 -0700 (PDT)
In-Reply-To: <20170316213624.140344-13-maxims@google.com>
References: <20170316213624.140344-1-maxims@google.com>
 <20170316213624.140344-13-maxims@google.com>
From: Simon Glass <sjg@chromium.org>
Date: Tue, 21 Mar 2017 17:22:35 -0600
X-Google-Sender-Auth: E-8umahAvVkk725oTUs2ECklKBQ
Message-ID: <CAPnjgZ2HVrCPrJYVMuc5SyMxatT_JS4NuEdq_e9B0RLozFeT3w@mail.gmail.com>
Subject: Re: [PATCH 12/17] aspeed: Enable I2C in EVB defconfig
To: Maxim Sloyko <maxims@google.com>
Cc: U-Boot Mailing List <u-boot@lists.denx.de>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
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
X-List-Received-Date: Tue, 21 Mar 2017 23:22:58 -0000

On 16 March 2017 at 15:36, Maxim Sloyko <maxims@google.com> wrote:
> Enable I2C driver in ast2500 Eval Board defconfig.
> Also enable i2c command.
>
> Signed-off-by: Maxim Sloyko <maxims@google.com>
> ---
>
>  configs/evb-ast2500_defconfig | 3 +++
>  1 file changed, 3 insertions(+)

Reviewed-by: Simon Glass <sjg@chromium.org>
