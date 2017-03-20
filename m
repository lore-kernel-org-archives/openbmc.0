Return-Path: <geissonator@gmail.com>
Received: from mail-it0-x243.google.com (mail-it0-x243.google.com
 [IPv6:2607:f8b0:4001:c0b::243])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3vmdv15c2kzDq5g
 for <openbmc@lists.ozlabs.org>; Mon, 20 Mar 2017 12:40:45 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="qezoXLHG"; 
 dkim-atps=neutral
Received: by mail-it0-x243.google.com with SMTP id 190so3822086itm.3
 for <openbmc@lists.ozlabs.org>; Sun, 19 Mar 2017 18:40:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=ZL4o10gdAJ7vJoqwLydG67EWCKCWdil2B0Lk3ULdPcY=;
 b=qezoXLHGeEFrRzbK6PH8GwByK1/8//47xQvMkd3u3GncmEVDdkmarSvA7YuV4Y1SLG
 C1tVsiQK0/X5hw0SGaB6afbCFMeQ0fjyIQqKAob6DEwTTT0OIBHHpKz4BA/l3bJUCJrP
 F3UWk5O1IPVjTE4yrG/dklMlbC+rdlC9ZM8uqeGbW8VoqsAr677c3Dk0Lm7l47e0G8rQ
 gHZGApiw5mwR9dQivmP1763zfJD2Dq6u2FUXHMIy48blGIEkqG44GThDMJ5R+7kbuFYJ
 6SzfjYGCu7UoNgMGDKIvu5tO6v8ORJmx0C3rDt45EC/+6MLJo9N/CagSgzS4HCpsDBrk
 I2rA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=ZL4o10gdAJ7vJoqwLydG67EWCKCWdil2B0Lk3ULdPcY=;
 b=YaACUbnJMf2P319RPrguo7WuMnc26YNT7hEgQQb2kOH7JlIbqK54HUEXecrCXM3vW8
 5BmDnobPHvXSf1kCTsUbhP0mwp1li8YKTggvP7R6M2lnb0FAw9pLYv3C5O7GjlwZ9Pgx
 F4Lh1MqPUyOZq89mKODqnP/ZotEJWCvcMi+wn0KNe1iWx62LP+WPPPd36bmmrIA/T5ab
 IHkPKlUDTr0zyZ4cRLntdH7JoW4CCgVSz8mKjujFKFgk0V1QnNO54/NPwBBmJdVHSZB9
 QDd+9Pei3uQG1C4uMqk75nUlVV2JnfvyhvpQ6fOhO9p+qX4etiMXLHlsY0LpXrkyu3nA
 0FFw==
X-Gm-Message-State: AFeK/H2OL6B7QAqzwAY/+prlf0CoOuWpmNaxgihkZfDSqBynKkyzNrEGY41hCiiNns1heuxdAnCWGoRqICnvoQ==
X-Received: by 10.107.166.207 with SMTP id p198mr24528368ioe.15.1489974043694; 
 Sun, 19 Mar 2017 18:40:43 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.53.156 with HTTP; Sun, 19 Mar 2017 18:40:43 -0700 (PDT)
In-Reply-To: <20170317211836.63576-1-cbostic@linux.vnet.ibm.com>
References: <20170317211836.63576-1-cbostic@linux.vnet.ibm.com>
From: Andrew Geissler <geissonator@gmail.com>
Date: Sun, 19 Mar 2017 20:40:43 -0500
Message-ID: <CALLMt=pk0a1JUPWc=zP-Zb9oqT9bKyZ3dHVof6BqdSvrL_WUAg@mail.gmail.com>
Subject: Re: [PATCH linux dev-4.7 v2] drivers/fsi: Add delay before sampling
 input on SDA
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
X-List-Received-Date: Mon, 20 Mar 2017 01:40:46 -0000

On Fri, Mar 17, 2017 at 4:18 PM, Christopher Bostic
<cbostic@linux.vnet.ibm.com> wrote:
> During high cpu loads the SDA in line can shift relative to the
> clock signal which can corrupt the received input data.  Slow
> down the time to sample input to account for this.
>
> Signed-off-by: Christopher Bostic <cbostic@linux.vnet.ibm.com>
> ---
> v2 - Increase delay for SDA in sampling only.
>    - Decrease the original delay for SDA sampling from 1us to 200ns
> ---
>  drivers/fsi/fsi-master-gpio.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/fsi/fsi-master-gpio.c b/drivers/fsi/fsi-master-gpio.c
> index a8976d5..8e832e0 100644
> --- a/drivers/fsi/fsi-master-gpio.c
> +++ b/drivers/fsi/fsi-master-gpio.c
> @@ -14,6 +14,7 @@
>  #include "fsi-master.h"
>
>  #define        FSI_GPIO_STD_DLY        1       /* Standard pin delay in nS */
> +#define        FSI_GPIO_SDA_IN_DLY     200     /* Wait to sample SDA line, in nS */
>  #define        FSI_ECHO_DELAY_CLOCKS   16      /* Number clocks for echo delay */
>  #define        FSI_PRE_BREAK_CLOCKS    50      /* Number clocks to prep for break */
>  #define        FSI_BREAK_CLOCKS        256     /* Number of clocks to issue break */
> @@ -97,7 +98,7 @@ static int sda_in(struct fsi_master_gpio *master)
>  {
>         int in;
>
> -       ndelay(FSI_GPIO_STD_DLY);
> +       ndelay(FSI_GPIO_SDA_IN_DLY);
>         in = gpiod_get_value(master->gpio_data);
>         return in ? 1 : 0;
>  }
> --
> 1.8.2.2
>

Acked-by: Andrew Geissler <geissonator@gmail.com>
