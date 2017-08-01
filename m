Return-Path: <philippe.mathieu.daude@gmail.com>
Received: from mail-qk0-x22a.google.com (mail-qk0-x22a.google.com
 [IPv6:2607:f8b0:400d:c09::22a])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3xM1r22Y6MzDsQ3
 for <openbmc@lists.ozlabs.org>; Tue,  1 Aug 2017 13:23:46 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="Q1iXiKE9"; 
 dkim-atps=neutral
Received: by mail-qk0-x22a.google.com with SMTP id x191so2315345qka.5
 for <openbmc@lists.ozlabs.org>; Mon, 31 Jul 2017 20:23:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=hdnXKeyKGV3UWsA4ovp21eo8UduHzM8mF9hH20eHjf4=;
 b=Q1iXiKE9J2AOPMPRZ6eo21Kqwg1E/HeBcv0qNiPh7oVJRJGXusUaNTf4obAW/3jcZf
 EwyZmIzb4eynftIMpbVpEMh2OrA9++Jn1NbqJTeQIwE6235YC6u888PgHnviCoW1V+lv
 jtAu83tT/wtgULFUfPSt/5XVcp8e+G4CrHjVGsFgRZ39JSUl/F4h1a2Sxea1e5jNiP9x
 8pZNZbYTcKU1EPl+CxdddZzEo/rNEhqekpn8J89GMplAd+YHkgS/ZWlTf8axfgFl0t6G
 VQsSJBjgdJWbeLO3ZWBGATsMihVvAAc3HsW+8+0sw2I+y3wNEnmRWDUq0nNP30Z0txC6
 42qQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=hdnXKeyKGV3UWsA4ovp21eo8UduHzM8mF9hH20eHjf4=;
 b=H7HFJQv5b14rx3J06WzG5jMoWomKhGck0RrKC83elIB5Cb3hZsUlqQNF/GhDDw5siy
 n43AE0OO2Sk9sKb44nb92GTBURbJJYcAkufUzw49KogKRMTVwTAVzDzAe/pw49oXapBt
 xRE19nHoL3au9SKQB4zgODrkCzT4LOkWlg8DMffAhd5UT6TrM0I5++yeroD1f8Cbrlr6
 MSBtFtPuCiVTcy8ags7MbIxPQzDpUpsdevyda5QLeifESBB7oGqxvTusnm8oayHb+40y
 aHCi02UqOX0UF6eD6bkirGoBcl7SQxV6vjf42wdRUeG8d8j9E2V+Klf6RbFO0oiurTqb
 Lmlg==
X-Gm-Message-State: AIVw112Zn8bkgo06eEwQbsT4nFeT/w3Dz/sGQdBVlOS3imuU3bICifWs
 ZSa55k/O3X6kaQ==
X-Received: by 10.55.75.8 with SMTP id y8mr25167032qka.247.1501557823346;
 Mon, 31 Jul 2017 20:23:43 -0700 (PDT)
Received: from [192.168.1.10] ([138.117.48.223])
 by smtp.gmail.com with ESMTPSA id n60sm2396676qte.53.2017.07.31.20.23.40
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 31 Jul 2017 20:23:42 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
 <philippe.mathieu.daude@gmail.com>
Subject: Re: [Qemu-arm] [PATCH] watchdog: wdt_aspeed: Add support for the
 reset width register
To: Andrew Jeffery <andrew@aj.id.au>, qemu-arm@nongnu.org
Cc: peter.maydell@linaro.org, openbmc@lists.ozlabs.org,
 qemu-devel@nongnu.org, joel@jms.id.au, clg@kaod.org
References: <20170801010425.25778-1-andrew@aj.id.au>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <a2f01f69-13cb-dcb9-6dcb-e5ccc3bb504d@amsat.org>
Date: Tue, 1 Aug 2017 00:23:39 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <20170801010425.25778-1-andrew@aj.id.au>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Mailman-Approved-At: Tue, 01 Aug 2017 13:40:29 +1000
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
X-List-Received-Date: Tue, 01 Aug 2017 03:23:48 -0000

Hi Andrew,

On 07/31/2017 10:04 PM, Andrew Jeffery wrote:
> The reset width register controls how the pulse on the SoC's WDTRST{1,2}
> pins behaves. A pulse is emitted if the external reset bit is set in
> WDT_CTRL. WDT_RESET_WIDTH requires magic bit patterns to configure both
> push-pull/open-drain and active-high/active-low behaviours and thus
> needs some special handling in the write path.

I wanted to verify the datashit but it seems to unavailable, looking there:
https://www.verical.com/datasheet/aspeed-technology-inc-interface-misc-ast2050a3-gp-4078885.pdf

Can you point out which cpu model you are modeling and where to get this 
watchdog datashit please? You might also add this to the header, for the 
next one looking at this file :)

> 
> Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
> ---
> I understand that we're in stabilisation mode, but I thought I'd send this out
> to provoke any feedback. Happy to resend after the 2.10 release if required.

you can subject it "PATCH for 2.11" so ppl testing/closing 2.10 can keep 
focused but still queue your mail for when 2.10 release is out.

> 
>   hw/watchdog/wdt_aspeed.c | 47 +++++++++++++++++++++++++++++++++++++----------
>   1 file changed, 37 insertions(+), 10 deletions(-)
> 
> diff --git a/hw/watchdog/wdt_aspeed.c b/hw/watchdog/wdt_aspeed.c
> index 8bbe579b6b66..4ef1412e99fc 100644
> --- a/hw/watchdog/wdt_aspeed.c
> +++ b/hw/watchdog/wdt_aspeed.c
> @@ -14,10 +14,10 @@
>   #include "qemu/timer.h"
>   #include "hw/watchdog/wdt_aspeed.h"
>   
> -#define WDT_STATUS              (0x00 / 4)
> -#define WDT_RELOAD_VALUE        (0x04 / 4)
> -#define WDT_RESTART             (0x08 / 4)
> -#define WDT_CTRL                (0x0C / 4)
> +#define WDT_STATUS                      (0x00 / 4)
> +#define WDT_RELOAD_VALUE                (0x04 / 4)
> +#define WDT_RESTART                     (0x08 / 4)
> +#define WDT_CTRL                        (0x0C / 4)
>   #define   WDT_CTRL_RESET_MODE_SOC       (0x00 << 5)
>   #define   WDT_CTRL_RESET_MODE_FULL_CHIP (0x01 << 5)
>   #define   WDT_CTRL_1MHZ_CLK             BIT(4)
> @@ -25,12 +25,21 @@
>   #define   WDT_CTRL_WDT_INTR             BIT(2)
>   #define   WDT_CTRL_RESET_SYSTEM         BIT(1)
>   #define   WDT_CTRL_ENABLE               BIT(0)
> +#define WDT_RESET_WIDTH                 (0x18 / 4)
> +#define   WDT_RESET_WIDTH_ACTIVE_HIGH   BIT(31)
> +#define     WDT_POLARITY_MASK           (0xFF << 24)
> +#define     WDT_ACTIVE_HIGH_MAGIC       (0xA5 << 24)
> +#define     WDT_ACTIVE_LOW_MAGIC        (0x5A << 24)
> +#define   WDT_RESET_WIDTH_PUSH_PULL     BIT(30)
> +#define     WDT_DRIVE_TYPE_MASK         (0xFF << 24)
> +#define     WDT_PUSH_PULL_MAGIC         (0xA8 << 24)
> +#define     WDT_OPEN_DRAIN_MAGIC        (0x8A << 24)
> +#define   WDT_RESET_WIDTH_DURATION      0xFFF;

Which model? the AST2050 seems to be 0xff.

>   
> -#define WDT_TIMEOUT_STATUS      (0x10 / 4)
> -#define WDT_TIMEOUT_CLEAR       (0x14 / 4)
> -#define WDT_RESET_WDITH         (0x18 / 4)
> +#define WDT_TIMEOUT_STATUS              (0x10 / 4)
> +#define WDT_TIMEOUT_CLEAR               (0x14 / 4)
>   
> -#define WDT_RESTART_MAGIC       0x4755
> +#define WDT_RESTART_MAGIC               0x4755
>   
>   static bool aspeed_wdt_is_enabled(const AspeedWDTState *s)
>   {
> @@ -55,9 +64,10 @@ static uint64_t aspeed_wdt_read(void *opaque, hwaddr offset, unsigned size)
>           return 0;
>       case WDT_CTRL:
>           return s->regs[WDT_CTRL];
> +    case WDT_RESET_WIDTH:
> +        return s->regs[WDT_RESET_WIDTH];
>       case WDT_TIMEOUT_STATUS:
>       case WDT_TIMEOUT_CLEAR:
> -    case WDT_RESET_WDITH:
>           qemu_log_mask(LOG_UNIMP,
>                         "%s: uninmplemented read at offset 0x%" HWADDR_PRIx "\n",
>                         __func__, offset);
> @@ -119,9 +129,25 @@ static void aspeed_wdt_write(void *opaque, hwaddr offset, uint64_t data,
>               timer_del(s->timer);
>           }
>           break;
> +    case WDT_RESET_WIDTH:
> +    {
> +        uint32_t property = data & WDT_POLARITY_MASK;
> +
> +        if (property == WDT_ACTIVE_HIGH_MAGIC) {
> +            s->regs[WDT_RESET_WIDTH] |= WDT_RESET_WIDTH_ACTIVE_HIGH;
> +        } else if (property == WDT_ACTIVE_LOW_MAGIC) {
> +            s->regs[WDT_RESET_WIDTH] &= ~WDT_RESET_WIDTH_ACTIVE_HIGH;
> +        } else if (property == WDT_PUSH_PULL_MAGIC) {
> +            s->regs[WDT_RESET_WIDTH] |= WDT_RESET_WIDTH_PUSH_PULL;
> +        } else if (property == WDT_OPEN_DRAIN_MAGIC) {
> +            s->regs[WDT_RESET_WIDTH] &= ~WDT_RESET_WIDTH_PUSH_PULL;

} else {
     qemu_log_mask(LOG_GUEST_ERROR, ...

> +        }

Anyway I'm not sure about this if().
Usually watchdogs have a state machine, if you don't do all unlock steps 
ordered, the SM get reset. This is why magic is involved, else you could 
use it as a regular register.
I'd expect a guest writing ACTIVE_HIGH_MAGIC then PUSH_PULL_MAGIC to not 
modify the RESET_WIDTH register, since the correct behavior would be to 
write ordered RESTART_MAGIC, then HIGH_MAGIC, then LOW_MAGIC and finally 
the PULL/DRAIN change, but I'm just trying to model this wdg in my head 
without having study the DS so you can't rely on my comments :)

Also it seems unsafe to modify that kind of property while the watchdog 
is running, usually you disable it before modifying it, else while 
running changes are automagically ignored.

> +        s->regs[WDT_RESET_WIDTH] &= ~WDT_RESET_WIDTH_DURATION;
> +        s->regs[WDT_RESET_WIDTH] |= data & WDT_RESET_WIDTH_DURATION;
> +        break;
> +    }
>       case WDT_TIMEOUT_STATUS:
>       case WDT_TIMEOUT_CLEAR:
> -    case WDT_RESET_WDITH:
>           qemu_log_mask(LOG_UNIMP,
>                         "%s: uninmplemented write at offset 0x%" HWADDR_PRIx "\n",
>                         __func__, offset);
> @@ -167,6 +193,7 @@ static void aspeed_wdt_reset(DeviceState *dev)
>       s->regs[WDT_RELOAD_VALUE] = 0x03EF1480;
>       s->regs[WDT_RESTART] = 0;
>       s->regs[WDT_CTRL] = 0;
> +    s->regs[WDT_RESET_WIDTH] = 0XFF;

why different than your define WDT_RESET_WIDTH_DURATION?
>   
>       timer_del(s->timer);
>   }
> 
Regards,

Phil.
