Return-Path: <avifishman70@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::d43; helo=mail-io1-xd43.google.com;
 envelope-from=avifishman70@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="kCrIszJc"; 
 dkim-atps=neutral
Received: from mail-io1-xd43.google.com (mail-io1-xd43.google.com
 [IPv6:2607:f8b0:4864:20::d43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44Dsnf21ZyzDqBV
 for <openbmc@lists.ozlabs.org>; Wed,  6 Mar 2019 23:02:14 +1100 (AEDT)
Received: by mail-io1-xd43.google.com with SMTP id v10so9968849iop.4
 for <openbmc@lists.ozlabs.org>; Wed, 06 Mar 2019 04:02:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Fzj6yPpBGyW4gOpuAAbL2fwAcOWh2YoVhdgHI+EcGA4=;
 b=kCrIszJcTtk+3LdPm4ffSCk2J1dNdecrc0gcscf2vC/UrhS52XUqTEXNgU6I8C1oyB
 KZHYKLoI6rAGb859yq9Wu05fPEKCfqmKwspKJMQBOMhiE5a29bxuDao3QNc9qiR9Lu0p
 ao8VNjbTM5lLHOCm9nr5aD1ilZWwo7DQk7r5yZF39zSZIh8coFj7lfCP/ZYvngsBwKYi
 vs5F6NZlyLDnWQ9c+2z++WjNKYu63TEADoDIyDMLtT33SG2pfvHzsQfmq0lozqvUKQYJ
 cw2BdR5sp0lwvHpKcHh8cXrulxEDQU7F/Dnz+xXlQ6S2lDzrecB1Ieddme+0LRscNlPW
 M0mQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Fzj6yPpBGyW4gOpuAAbL2fwAcOWh2YoVhdgHI+EcGA4=;
 b=CY/wqzu4EOU8HxEUDPDeTFwarI5udoBUGaXyCXLG4E0dVdR+HXn9B8IziA5+NtgLuH
 30UY8Cuw4lw/8QwPK7r+BgepCMaH5pAsEX1NfL/jVAMLOUxR0meAlNBz3r8kix/IwRCS
 PlbiRXSbMXv0ONwQleGLgYsI/ZhYuTBOpixKf2nLsX1UvV+jNH/2Xoo1JGWMx4+7bMpa
 N8kdmgCmEQFRqhErUx3Kp+9rVEDMXHuQNq2jS+5rBNQu49GOplJlpSvYCPJ1OfmsMPSu
 Xm45mFMn5L0n0qxfeEVAaWnRLxYaUGENQobsyfu7Y/q4dwo4NGHmCt3Q9/Xm1AR/yaNY
 4HDg==
X-Gm-Message-State: APjAAAUQex+ENyz1EkdYPVnPo5eOjaM/1HHxS5jQ0CseRSbyuKb277f9
 3eoteoOkFy0Jc2dGKsTyp/jjr1e4B1raxIJiyw==
X-Google-Smtp-Source: APXvYqwMULG/0LsNZs5dQ/vRRzS3aOp+5TFQKotnuB5Bf7TcMqNvyNQ2PwHkyaKIocekl24dvxlrjToFUb2taQpl1Go=
X-Received: by 2002:a6b:691c:: with SMTP id e28mr2748773ioc.295.1551873731203; 
 Wed, 06 Mar 2019 04:02:11 -0800 (PST)
MIME-Version: 1.0
References: <1551785646-46173-1-git-send-email-wen.yang99@zte.com.cn>
 <1551785646-46173-6-git-send-email-wen.yang99@zte.com.cn>
In-Reply-To: <1551785646-46173-6-git-send-email-wen.yang99@zte.com.cn>
From: Avi Fishman <avifishman70@gmail.com>
Date: Wed, 6 Mar 2019 14:02:01 +0200
Message-ID: <CAKKbWA45Fwd_7Eq7r3T9FAFE9WEfnN=pKjypYifz7NtBOJtTow@mail.gmail.com>
Subject: Re: [PATCH v2 06/15] arm: npcm: fix a leaked reference by adding
 missing of_node_put
To: Wen Yang <wen.yang99@zte.com.cn>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 wang.yi59@zte.com.cn, 
 Tomer Maimon <tmaimon77@gmail.com>, Patrick Venture <venture@google.com>,
 Nancy Yuen <yuenn@google.com>, 
 Brendan Higgins <brendanhiggins@google.com>,
 Russell King <linux@armlinux.org.uk>, 
 Linux ARM <linux-arm-kernel@lists.infradead.org>, 
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: text/plain; charset="UTF-8"
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
X-List-Received-Date: Wed, 06 Mar 2019 12:02:15 -0000

On Tue, Mar 5, 2019 at 1:33 PM Wen Yang <wen.yang99@zte.com.cn> wrote:
>
> The call to of_get_next_child returns a node pointer with refcount
> incremented thus it must be explicitly decremented after the last
> usage.
>
> Detected by coccinelle with the following warnings:
> ./arch/arm/mach-npcm/platsmp.c:52:1-7: ERROR: missing of_node_put; acquired a node pointer with refcount incremented on line 31, but without a corresponding object release within this function.
> ./arch/arm/mach-npcm/platsmp.c:68:2-8: ERROR: missing of_node_put; acquired a node pointer with refcount incremented on line 60, but without a corresponding object release within this function.
>
> Signed-off-by: Wen Yang <wen.yang99@zte.com.cn>
> Reviewed-by: Florian Fainelli <f.fainelli@gmail.com>
> Cc: Avi Fishman <avifishman70@gmail.com>
> Cc: Tomer Maimon <tmaimon77@gmail.com>
> Cc: Patrick Venture <venture@google.com>
> Cc: Nancy Yuen <yuenn@google.com>
> Cc: Brendan Higgins <brendanhiggins@google.com>
> Cc: Russell King <linux@armlinux.org.uk>
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: openbmc@lists.ozlabs.org
> Cc: linux-kernel@vger.kernel.org
> ---
> v2->v1: add a missing space between "adding" and "missing"
>
>  arch/arm/mach-npcm/platsmp.c | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/arch/arm/mach-npcm/platsmp.c b/arch/arm/mach-npcm/platsmp.c
> index 21633c7..fe63edc 100644
> --- a/arch/arm/mach-npcm/platsmp.c
> +++ b/arch/arm/mach-npcm/platsmp.c
> @@ -35,6 +35,7 @@ static int npcm7xx_smp_boot_secondary(unsigned int cpu,
>                 goto out;
>         }
>         gcr_base = of_iomap(gcr_np, 0);
> +       of_node_put(gcr_np);
>         if (!gcr_base) {
>                 pr_err("could not iomap gcr");
>                 ret = -ENOMEM;
> @@ -63,6 +64,7 @@ static void __init npcm7xx_smp_prepare_cpus(unsigned int max_cpus)
>                 return;
>         }
>         scu_base = of_iomap(scu_np, 0);
> +       of_node_put(scu_np);
>         if (!scu_base) {
>                 pr_err("could not iomap scu");
>                 return;
> --
> 2.9.5
>

Reviewed-by: Avi Fishman <avifishman70@gmail.com>
-- 
Regards,
Avi
