Return-Path: <geissonator@gmail.com>
Authentication-Results: ozlabs.org; spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4001:c06::244; helo=mail-io0-x244.google.com;
 envelope-from=geissonator@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="E89NurQ1"; 
 dkim-atps=neutral
Received: from mail-io0-x244.google.com (mail-io0-x244.google.com
 [IPv6:2607:f8b0:4001:c06::244])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3yQK3K0PYXzDqmt
 for <openbmc@lists.ozlabs.org>; Mon, 30 Oct 2017 14:00:12 +1100 (AEDT)
Received: by mail-io0-x244.google.com with SMTP id b186so23999250iof.8
 for <openbmc@lists.ozlabs.org>; Sun, 29 Oct 2017 20:00:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=so/1ecnqwU91nVd978nHXSg3oHmWeF84eVtIsjlm6F0=;
 b=E89NurQ1dDi39+mY4lM/KbgLzd5PEhTPV/WFYCX0L/+c/TriLMfn2M9GGZpLLNo0oT
 wjL7h4OHXea7VFUKwX0L+SJfmG8ymM06uW3UlMKU/OTDbE9vqEh2XrBkGWtlFJBRuWQP
 rmvNnC1AczYEmG8Xq508mdFTdrP0Oev+9Qst5Tb4+ZnMUEsjse0xJoqObfkXynZmPReA
 K/gvT23xnHo+W8dstoReQhYuZaxds00vACBaIQW/XS+DJnu46evPEBB17ZBMehU8svVN
 XlqwcRHP8zCtnbrxDdPQI8448NmPauJZw3AV7VhPQ/aIVbihIxMTm1qk0QtD4blwVNK3
 FPgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=so/1ecnqwU91nVd978nHXSg3oHmWeF84eVtIsjlm6F0=;
 b=mQQRY7geIwXLQja7Ofz+K826BYpBB4d/Ce24rJE3IJ2T+lpr3Ff0pvh9cVnZ9p89F1
 oiP8HyQ/Jc0l13jmWdIpO61MeEMWDg2TnsqSVNJ6pFRgbpIl05eautMTq8l9Pl+Nfqvq
 9/YMFIPdywtS+UQ9q6852+5Rugp6UCfnA8yTAOgEFZyMv/rwLxhJZ9Fg8i2IKY6W3nrk
 9gornDxEtf4sMZBTlImYow4JcWsyZypGJyQmZ7tbjSFITqiszayO986f7Y5VwopNOhHP
 Oys/fa5IkW0UowCTXipvCU2gzM6XAJdJxfq3FZdriTk7OhcngdH/xaLwF5d8ii7bZuCO
 uEBg==
X-Gm-Message-State: AMCzsaWW/a/z0i+mz4Hc5dq/82zSUR+9B6D3xIdVjRdqAtBZFr2N9Dvv
 VsGJAZFaFzxCF5I3ia5vJ+5Q7h1wWrhzw3KUtWU=
X-Google-Smtp-Source: ABhQp+QtYGQbhnRPtU6PEzcBhGwCIy+YnBcHFHLg9OPxyIMLA2leZC97J4htOeVDx6v4PzkkdhM2YgfQx6aNdDoijr0=
X-Received: by 10.36.124.72 with SMTP id a69mr4371059itd.135.1509332409617;
 Sun, 29 Oct 2017 20:00:09 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.142.150 with HTTP; Sun, 29 Oct 2017 20:00:09 -0700 (PDT)
In-Reply-To: <20171030002707.30557-1-andrew@aj.id.au>
References: <20171030002707.30557-1-andrew@aj.id.au>
From: Andrew Geissler <geissonator@gmail.com>
Date: Sun, 29 Oct 2017 22:00:09 -0500
Message-ID: <CALLMt=qZJaYrYjg4tLhdWeKiV7YvAUHXaG1R1RJwScMZa8+ybg@mail.gmail.com>
Subject: Re: [PATCH linux dev-4.10] pmbus: core: Switch PAGE failure
 dev_warn() to dev_dbg() for serenity
To: Andrew Jeffery <andrew@aj.id.au>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>, andrewg@us.ibm.com
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
X-List-Received-Date: Mon, 30 Oct 2017 03:00:13 -0000

On Sun, Oct 29, 2017 at 7:27 PM, Andrew Jeffery <andrew@aj.id.au> wrote:
> Reduce kernel log spam from PMBus core failing a PAGE command to the
> MAX37185 (and any other device). It's a hardware-design or driver
> related fault, and is not anything the user can fix. Therefore reduce
> it from warn to debug.
>
> Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
> ---
>  drivers/hwmon/pmbus/pmbus_core.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/hwmon/pmbus/pmbus_core.c b/drivers/hwmon/pmbus/pmbus_core.c
> index d4e959bda491..c4b551b9226c 100644
> --- a/drivers/hwmon/pmbus/pmbus_core.c
> +++ b/drivers/hwmon/pmbus/pmbus_core.c
> @@ -175,9 +175,9 @@ int pmbus_set_page(struct i2c_client *client, u8 page)
>                 if (rv) {
>                         rv = i2c_smbus_write_byte_data(client, PMBUS_PAGE,
>                                                        page);
> -                       dev_warn(&client->dev,
> -                                "Failed to set page %u, performed one-shot retry %s: %d\n",
> -                                page, rv ? "and failed" : "with success", rv);
> +                       dev_dbg(&client->dev,
> +                               "Failed to set page %u, performed one-shot retry %s: %d\n",
> +                               page, rv ? "and failed" : "with success", rv);
>                 }
>
>                 newpage = i2c_smbus_read_byte_data(client, PMBUS_PAGE);
> --
> 2.11.0
>

Acked-by: Andrew Geissler <geissonator@gmail.com>
