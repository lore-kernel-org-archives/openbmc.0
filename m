Return-Path: <brendanhiggins@google.com>
Authentication-Results: ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2607:f8b0:400d:c09::243; helo=mail-qk0-x243.google.com;
 envelope-from=brendanhiggins@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="BcmDmzSB"; 
 dkim-atps=neutral
Received: from mail-qk0-x243.google.com (mail-qk0-x243.google.com
 [IPv6:2607:f8b0:400d:c09::243])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3yHVxQ73t5zDqBd
 for <openbmc@lists.ozlabs.org>; Thu, 19 Oct 2017 12:01:30 +1100 (AEDT)
Received: by mail-qk0-x243.google.com with SMTP id r64so8553645qkc.1
 for <openbmc@lists.ozlabs.org>; Wed, 18 Oct 2017 18:01:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=cXoVVJK4md0UXYq37gZiV8TdIONgLl82dlIprYZ4Hgk=;
 b=BcmDmzSBuaEZ9JZNOY9lKIJZ+kewZZdc+5u5umF0IT8U3kyLZsvVfaC39Idf3JJ+lQ
 8lyUHKCdtiTVJPKi6YweUWe3EGLMy5cweTbEChF/vFU0KYQzmRNV+P+UVl00lnnsMV25
 T1fQ+yrisTWflLnctXiXF6QKViD9OWqP+Olau99/ZpjGihbwEZNUFEY3ZmE4F/zzFtiY
 uLhczKmUJUxhpT8MALTSCDIlNydbBTH0p3c7Sd1ZRe56SFwtK7hbgNT0hvuE+3ip9Jas
 uBrVf/N1F4kPpLJUKRuoH+Faw5bu7Fjm0FTknTD1lQz/iansAlyCGNR/ciGUJBkBy412
 P7VQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=cXoVVJK4md0UXYq37gZiV8TdIONgLl82dlIprYZ4Hgk=;
 b=MEFyf7bAIg1nL+iCNSldUt2Ky0+AFcN3tFoqHInX6WPQj5iIJLl8ZlqA4mVtBCBebv
 1SF2XQpwFNDBeMeSMhtJvrRcUn6fuauvSG1d+Oc3/q1T9fvnVEeEe3hgVjOsTIrhKSAL
 rEGko2klNrrLg+8Ykc83+a26eFHL7rYgH1pS2mdrUl+V5Y6jjjiFAM/5TtZgRAEZQlkB
 sUbFnyp/YIq/G2pEpnqaYNWOqNOZw7q5GpyLSP86u2aiCbTP5f1ES+0sFiRfelNAsQt+
 OdRXwV2INxdtdfJs58/bVdL+y1bwoiVvp/1eE1nCwfIhzHoFMftQ5jvV+sbwSknW8qjS
 zy0g==
X-Gm-Message-State: AMCzsaVxlU28MZveATvbk5nKnxF9nuO0qstvXuQEnB1TbOU6awHkK5iR
 Sd90CX2l/9byU4TyZEZEYxko6bpsGCFKIvtcV2KKOg==
X-Google-Smtp-Source: ABhQp+TAKhLXcBIkRCJ0hdSsK4tHxt0BwVgsc6I5BCVL7NgQj/UzEV98O/yDkvv5e9WCq9aUbqOkfz803IDVi7ie/Cs=
X-Received: by 10.55.204.157 with SMTP id n29mr4648222qkl.243.1508374888146;
 Wed, 18 Oct 2017 18:01:28 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.81.200 with HTTP; Wed, 18 Oct 2017 18:01:27 -0700 (PDT)
In-Reply-To: <1507719023-127618-1-git-send-email-weiyongjun1@huawei.com>
References: <1507719023-127618-1-git-send-email-weiyongjun1@huawei.com>
From: Brendan Higgins <brendanhiggins@google.com>
Date: Wed, 18 Oct 2017 18:01:27 -0700
Message-ID: <CAFd5g46PbfU1OTVT7S5WsYUXt6itqRzf+6uU0ti6z+CAY0atNw@mail.gmail.com>
Subject: Re: [PATCH] irqchip/aspeed-i2c-ic: Fix return value check in
 aspeed_i2c_ic_of_init()
To: Wei Yongjun <weiyongjun1@huawei.com>
Cc: Joel Stanley <joel@jms.id.au>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>, 
 Thomas Gleixner <tglx@linutronix.de>, Jason Cooper <jason@lakedaemon.net>, 
 Marc Zyngier <marc.zyngier@arm.com>, linux-i2c@vger.kernel.org, 
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
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
X-List-Received-Date: Thu, 19 Oct 2017 01:01:31 -0000

On Wed, Oct 11, 2017 at 3:50 AM, Wei Yongjun <weiyongjun1@huawei.com> wrote:
> In case of error, the function of_iomap() returns NULL pointer not
> ERR_PTR(). The IS_ERR() test in the return value check should be
> replaced with NULL test..
>
> Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
> ---
>  drivers/irqchip/irq-aspeed-i2c-ic.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/irqchip/irq-aspeed-i2c-ic.c b/drivers/irqchip/irq-aspeed-i2c-ic.c
> index 815b88d..f20200a 100644
> --- a/drivers/irqchip/irq-aspeed-i2c-ic.c
> +++ b/drivers/irqchip/irq-aspeed-i2c-ic.c
> @@ -76,8 +76,8 @@ static int __init aspeed_i2c_ic_of_init(struct device_node *node,
>                 return -ENOMEM;
>
>         i2c_ic->base = of_iomap(node, 0);
> -       if (IS_ERR(i2c_ic->base)) {
> -               ret = PTR_ERR(i2c_ic->base);
> +       if (!i2c_ic->base) {
> +               ret = -ENOMEM;
>                 goto err_free_ic;
>         }
>
>
>
>
Reviewed-by: Brendan Higgins <brendanhiggins@google.com>
