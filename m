Return-Path: <daniel.lezcano@linaro.org>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=linaro.org
 (client-ip=2a00:1450:400c:c09::241; helo=mail-wm0-x241.google.com;
 envelope-from=daniel.lezcano@linaro.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=linaro.org header.i=@linaro.org header.b="Kzi4cUGo"; 
 dkim-atps=neutral
Received: from mail-wm0-x241.google.com (mail-wm0-x241.google.com
 [IPv6:2a00:1450:400c:c09::241])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3zxvfm3tS9zF1s0
 for <openbmc@lists.ozlabs.org>; Fri,  9 Mar 2018 02:33:18 +1100 (AEDT)
Received: by mail-wm0-x241.google.com with SMTP id q83so23589wme.5
 for <openbmc@lists.ozlabs.org>; Thu, 08 Mar 2018 07:33:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=dHZu2s2oH57IbXOA70PqclI6OeRCIlueq8vPpd4bu+Q=;
 b=Kzi4cUGohxgQ8TyHeHoH6LA+tL15TQsL8mnvT8VqvfZzv0OMngYY6jNL3RrqTJSc/8
 L9Nbi3T81h5biCjlW6FztLScOW+AtPdiLIAZRyxhsxVSMOmTjLZEWFW4Z6lMGjwkJ2kO
 ebPZiILw4tzdjDcoYk+Bz8IoK2kSx2F+JV1qk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=dHZu2s2oH57IbXOA70PqclI6OeRCIlueq8vPpd4bu+Q=;
 b=semMR9jmZZKTsXXP7xRzo+0QlqkYODU+zZPPDQxkTv1lsH1wRmu6TFAlirfALv7ped
 WTNYKBwjvjIMydFEZqYtXOMiuqFsR+qfbiqEtbWtRWtaJzYWwiwbswZtM75MQr9oHP+G
 vHq61apyzaMtSdgCcDKw6s6GoKs6M3aUU4mrrrwXxHQA2qVdLk7KBolr+kn9zD6tEz8f
 caLpqC4Rwb2gxKmpI5cS0fhj31Ex9gtRw9AxgrR8EHNocPDqdDOZS45qItniS08YGbr7
 0PThIs3wmCAN1D08X53VdbqIj3inM/MsYufWalDGyBD8c7jNVlvmQ93x2rNTg5Jit8OL
 t4tQ==
X-Gm-Message-State: AElRT7GpVv/AD+TPgKyWGiPhGkdMBzEo615f/u8VwRq84NYM9zBdFEoi
 g1VliywzG+qtxkptOg7Jos99O7pzvPk=
X-Google-Smtp-Source: AG47ELuNfOHzXHNYVhe02WW4xk433kK2nXggO3lxdWHm9JNJUPb6FAArmdKY9mNZo6Cm/gMEmlnkbQ==
X-Received: by 10.28.247.26 with SMTP id v26mr17110020wmh.115.1520523195561;
 Thu, 08 Mar 2018 07:33:15 -0800 (PST)
Received: from ?IPv6:2a01:e35:879a:6cd0:3e97:eff:fe5b:1402?
 ([2a01:e35:879a:6cd0:3e97:eff:fe5b:1402])
 by smtp.googlemail.com with ESMTPSA id 67sm14035398wmw.17.2018.03.08.07.33.14
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 08 Mar 2018 07:33:14 -0800 (PST)
Subject: Re: [PATCH v5 2/2] clocksource/drivers/npcm: Add NPCM7xx timer driver
To: Tomer Maimon <tmaimon77@gmail.com>, robh+dt@kernel.org,
 mark.rutland@arm.com, tglx@linutronix.de, avifishman70@gmail.com,
 brendanhiggins@google.com, venture@google.com, joel@jms.id.au
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 openbmc@lists.ozlabs.org
References: <1520522698-16153-1-git-send-email-tmaimon77@gmail.com>
 <1520522698-16153-3-git-send-email-tmaimon77@gmail.com>
From: Daniel Lezcano <daniel.lezcano@linaro.org>
Message-ID: <2a83eb83-10a9-54f3-e0da-bd6cf32b5ac1@linaro.org>
Date: Thu, 8 Mar 2018 16:33:13 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.6.0
MIME-Version: 1.0
In-Reply-To: <1520522698-16153-3-git-send-email-tmaimon77@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
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
X-List-Received-Date: Thu, 08 Mar 2018 15:33:21 -0000

On 08/03/2018 16:24, Tomer Maimon wrote:
> Add Nuvoton BMC NPCM7xx timer driver.
> 
> The clocksource Enable 24-bit TIMER0 and TIMER1 counters,
> while TIMER0 serve as clockevent and TIMER1 serve as clocksource.
> 
> Signed-off-by: Tomer Maimon <tmaimon77@gmail.com>
> Reviewed-by: Brendan Higgins <brendanhiggins@xxxxxxxxxx>
> ---

[ ... ]

> +
> +	pr_info("Enabling NPCM7xx clocksource timer base: 0x%x, IRQ: %d ",
> +		(int)timer_of_base(&npcm7xx_to), timer_of_irq(&npcm7xx_to));

You can use '%p' instead of '0x%x' and remove the (int) cast.

I'm fine with the driver. If there is no comment, I will take it and do
the change (if you are ok), no need on this case to resend a v6.



-- 
 <http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog
