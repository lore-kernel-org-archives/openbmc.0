Return-Path: <joel.stan@gmail.com>
Authentication-Results: ozlabs.org; spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2a00:1450:4010:c07::22d; helo=mail-lf0-x22d.google.com;
 envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="l5lgBGoL"; 
 dkim-atps=neutral
Received: from mail-lf0-x22d.google.com (mail-lf0-x22d.google.com
 [IPv6:2a00:1450:4010:c07::22d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3ymw5D55QRzDrZV
 for <openbmc@lists.ozlabs.org>; Wed, 29 Nov 2017 20:21:19 +1100 (AEDT)
Received: by mail-lf0-x22d.google.com with SMTP id t197so3039143lfe.7
 for <openbmc@lists.ozlabs.org>; Wed, 29 Nov 2017 01:21:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=qBzbaTM1i5HKualqf4EnmGx2XSMTzYvuW4OWh8L1bcs=;
 b=l5lgBGoL2Iyoa5dR+6Nuw/zK6dnsCHl+ENOJpp3P4O6Eohlh5V0euEcR1kBDGz8Koz
 nDqzNAHXVMZU2bly4KYVmVoVoM7EEn7oweyrlb/KNunvZcozHWe4qY7ccqz+GQISX//z
 liB6Z8SwgfG4YFldc1rvO5N0CShBdrb+w1/iQZNx62FOIeyQdyGNOPxSvzSE7JmaHI6s
 Z6/9+nX690/NpQ3AE4Uc2sjHh/z6v0EkRiqFfR0n/MM7SXcI75DlmqUOj3LpWU4zYEf0
 rxKfHL+3/pqsvp9qAxiPj08mrbPfoUVW9usWqjTiArkJ76dtOlYMxrtJrHGqM7jg1pF3
 /W2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=qBzbaTM1i5HKualqf4EnmGx2XSMTzYvuW4OWh8L1bcs=;
 b=h9scqANBXhfPyawgG39Oyw3HvVNaDhjf2jdSi6xlX495sgv/+oYG8e/JA+FXAgq1wu
 y9tiTT8xTh6DVCoW2bbGrDaw41Y6QkqsgGdFXqWTwyowxyOBO8OyCIfh++iPevMz/xYE
 VSmS6px4CSOb4xxjdrjy2J9Apaw+soSpyhlzMDiEmcDw2MxMvdXLwdRrMuJR2raAbdx3
 /merqvh92yL8DeLuGDPxgJ7nPN1ojUxZ3c2UoDCu/Soku+wyM6k3wpZfCXoeyHMlhi+0
 zYS6BHzFhouDbyGIBFKxyxlXRCkye2Qcjp0HELg6dlvEy7WfR0Rr0tZQG2iO/wSoK3zn
 5uEA==
X-Gm-Message-State: AJaThX76FuCZqPZQS5WwrpZL6ybFwCIIgLYF4mEQVKAifoYwc0CTORWW
 gMpsBK8RjSpEaMrGyLGx62VE4696aIMllhM3MAI=
X-Google-Smtp-Source: AGs4zMYD4pKcOqFKvXaT3CwKzhutleDoF7Ym09Jy3vnd5nL31pgWQh/h2uIt8MT01jEB8ou14bJK8K4QhTn7XU5FgDk=
X-Received: by 10.46.88.68 with SMTP id x4mr1040577ljd.138.1511947276515; Wed,
 29 Nov 2017 01:21:16 -0800 (PST)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.25.155.83 with HTTP; Wed, 29 Nov 2017 01:20:56 -0800 (PST)
In-Reply-To: <1511897285-23022-2-git-send-email-james.feist@linux.intel.com>
References: <1511897285-23022-1-git-send-email-james.feist@linux.intel.com>
 <1511897285-23022-2-git-send-email-james.feist@linux.intel.com>
From: Joel Stanley <joel@jms.id.au>
Date: Wed, 29 Nov 2017 19:50:56 +1030
X-Google-Sender-Auth: _fKYbBH03LQ1fdXNGtGnD0afKCY
Message-ID: <CACPK8Xe9Uk3jPi3L6XR9SmXdU9Z7NZHSaYJdbPt-z5aQVV-_YQ@mail.gmail.com>
Subject: Re: [PATCH linux dev-4.10 v2 2/2] ARM: dts: Add Wfp BMC Machine
To: James Feist <james.feist@linux.intel.com>, Andrew Jeffery <andrew@aj.id.au>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
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
X-List-Received-Date: Wed, 29 Nov 2017 09:21:22 -0000

On Wed, Nov 29, 2017 at 5:58 AM, James Feist
<james.feist@linux.intel.com> wrote:
> Wfp is a Intel system with an Aspeed ast2500 BMC.

Is WFP an acronym? It would be good to spell it out in the commit message.

Andrew, can you please review the bits of the device tree that you're
familiar with (mostly pinmux)?


> +
> +       chosen {
> +               stdout-path = &uart5;
> +               bootargs = "115200 earlyprintk";

I don't think 115200 will do anything. Can you explain your intent here?

> +       };
> +
> +       memory {
> +               reg = <0x80000000 0x20000000>;
> +       };

There's no reserved region for the VGA framebuffer, but you enable the
GFX node below.

With the openbmc u-boot tree the size of the memory is adjusted to
account for the framebuffer at the top of memory, but I was lead to
believe Intel machines use their own u-boot fork.

Cheers,

Joel
