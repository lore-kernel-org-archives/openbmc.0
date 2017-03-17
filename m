Return-Path: <geissonator@gmail.com>
Received: from mail-it0-x244.google.com (mail-it0-x244.google.com
 [IPv6:2607:f8b0:4001:c0b::244])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3vkm0Z1WF3zDqZH
 for <openbmc@lists.ozlabs.org>; Fri, 17 Mar 2017 11:09:02 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="ZiNdBhGE"; 
 dkim-atps=neutral
Received: by mail-it0-x244.google.com with SMTP id u69so1188836ita.3
 for <openbmc@lists.ozlabs.org>; Thu, 16 Mar 2017 17:09:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=F2vrV7J7zKeI0qP6FgudlGCNbMRB+dOH+46x0ibd9wk=;
 b=ZiNdBhGEdRqAqRB5oNWfwzWerbXrD3sQFB0sMDZg5ONpjhfxIArYMVtxvNloR8zv8P
 gB89z3zyPpgSpPcszqf/htUYD1FaZ6u/u4GuoPUxyCQ0NTL6J458MxiFaK31mXno4kto
 oMYnB/B/bF1ZTUBCFaf1YALqsOQMQ+YEC8aEXJvlBzR2FpGpZ/b4hXmMiVGx29E082J0
 dbycovway41r3RsZE/HaAOu+xPsuc1/nu7FH7nUnrI1q54XWxxeqHgYZ3OvCqSxEIAoe
 CnHjWkGUVHk0psW45hrJw40lK1h3NsvVjYDCyiAuafEkjtkAfYbKNksa8/kWM8ZoRSs4
 E7BQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=F2vrV7J7zKeI0qP6FgudlGCNbMRB+dOH+46x0ibd9wk=;
 b=DkWuHLDpYlUVGfXSBP2V5J0y0dGj4tXhVaExZlSn5Ku/NNPob543WdSgg9/j+0Y/pL
 y2HHmHnLlqVyz1VjyQYtH9VWbza7AF7tYqjqeXSNUEoKeIjLvaztl3QqbgxmQafyf5lK
 DQ1rq6LCCgsJKQBfrkaNrgOFu4mbMy/Fho3YEgLnNYoePCZRqqAM4OTcFc77cOPZVn5b
 e9LcMxKjJn/G8/Tx/J6ho4iz9cgrz5At7aHGF7Eg6yXU8Y0FDK+OPYIzbnlBBRdhHfjQ
 yBKvkwLWPzx3JFRVZv40ZPai19dVjIC1U23MKDmG6MdwY3LBu7Pon/L1WWwqCPUxo8iN
 oi6w==
X-Gm-Message-State: AFeK/H2TSl0FDmrZ5SU9deZNun+KEVM2MX8Q/F4/DdGzt38WQwBy3ngWgU1LXaB5/CMH5T7gbz5Z0iJPvEReaA==
X-Received: by 10.36.116.7 with SMTP id o7mr460659itc.31.1489709340426; Thu,
 16 Mar 2017 17:09:00 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.53.91 with HTTP; Thu, 16 Mar 2017 17:09:00 -0700 (PDT)
In-Reply-To: <20170315212550.65964-1-cbostic@linux.vnet.ibm.com>
References: <20170315212550.65964-1-cbostic@linux.vnet.ibm.com>
From: Andrew Geissler <geissonator@gmail.com>
Date: Thu, 16 Mar 2017 19:09:00 -0500
Message-ID: <CALLMt=qPEK9YbTBz2jhLSTk2J7FaMiH-fcoChqN_JmxYoUrq6w@mail.gmail.com>
Subject: Re: [PATCH linux dev-4.7] drivers/fsi: Add more time between clocking
 and data sampling
To: Christopher Bostic <cbostic@linux.vnet.ibm.com>
Cc: Joel Stanley <joel@jms.id.au>, OpenBMC Maillist <openbmc@lists.ozlabs.org>
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
X-List-Received-Date: Fri, 17 Mar 2017 00:09:03 -0000

On Wed, Mar 15, 2017 at 4:25 PM, Christopher Bostic
<cbostic@linux.vnet.ibm.com> wrote:
> Under high work loads the ARM core can occasionaly hit invalid
> timings between the FSI clock and data lines which leads to
> data crc errors.  Add further delay between clock switch and
> data line changes.
>
> Signed-off-by: Christopher Bostic <cbostic@linux.vnet.ibm.com>
> ---
>  drivers/fsi/fsi-master-gpio.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/fsi/fsi-master-gpio.c b/drivers/fsi/fsi-master-gpio.c
> index a8976d5..a93453f 100644
> --- a/drivers/fsi/fsi-master-gpio.c
> +++ b/drivers/fsi/fsi-master-gpio.c
> @@ -13,7 +13,7 @@
>
>  #include "fsi-master.h"
>
> -#define        FSI_GPIO_STD_DLY        1       /* Standard pin delay in nS */
> +#define        FSI_GPIO_STD_DLY        1       /* Standard pin delay in uS */
>  #define        FSI_ECHO_DELAY_CLOCKS   16      /* Number clocks for echo delay */
>  #define        FSI_PRE_BREAK_CLOCKS    50      /* Number clocks to prep for break */
>  #define        FSI_BREAK_CLOCKS        256     /* Number of clocks to issue break */
> @@ -86,9 +86,9 @@ static void clock_toggle(struct fsi_master_gpio *master, int count)
>         int i;
>
>         for (i = 0; i < count; i++) {
> -               ndelay(FSI_GPIO_STD_DLY);
> +               udelay(FSI_GPIO_STD_DLY);
>                 gpiod_set_value(master->gpio_clk, 0);
> -               ndelay(FSI_GPIO_STD_DLY);
> +               udelay(FSI_GPIO_STD_DLY);
>                 gpiod_set_value(master->gpio_clk, 1);
>         }
>  }
> @@ -97,7 +97,7 @@ static int sda_in(struct fsi_master_gpio *master)
>  {
>         int in;
>
> -       ndelay(FSI_GPIO_STD_DLY);
> +       udelay(FSI_GPIO_STD_DLY);
>         in = gpiod_get_value(master->gpio_data);
>         return in ? 1 : 0;
>  }
> --
> 1.8.2.2
>

Acked-by: Andrew Geissler <geissonator@gmail.com>
