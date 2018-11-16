Return-Path: <groeck7@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::641; helo=mail-pl1-x641.google.com;
 envelope-from=groeck7@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="p1PS3W1P"; 
 dkim-atps=neutral
Received: from mail-pl1-x641.google.com (mail-pl1-x641.google.com
 [IPv6:2607:f8b0:4864:20::641])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 42wzPp6KwGzF3fy
 for <openbmc@lists.ozlabs.org>; Fri, 16 Nov 2018 11:19:42 +1100 (AEDT)
Received: by mail-pl1-x641.google.com with SMTP id g59-v6so10243831plb.10
 for <openbmc@lists.ozlabs.org>; Thu, 15 Nov 2018 16:19:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=D4ec80u+BNIi7PJtY//hky+X61mrrrkMKiO81xuskZo=;
 b=p1PS3W1P5LBam6Lt0h6QSyB0CGxMUucNElUWKzEgcxjdZ3EBgrI4ar2m5zKgGfmknj
 Zv45+ehoCwKEVrF+slJG82KotMH93N8/EblUNY55msqro+igQgu60k+DHX+/iYHwLLqp
 udXZR0vknSUlwrdWTKCXe9WBIbBz3Yxq5uPgmHUj/c76dTk/uVyvXhqzgw9Nr/bQcAZp
 bxID15rKgEb1d5uT4C0VlBrtT1F68PgUbdGF9u2k+ePMF3x7Ak8ENGDTPXQ1SRqzFNi4
 klucCB1fXfx+zZDJ0TPEENtTP1/XqeN9oxLq4TlzeOKPRf4UmiNFzmry8wbSv4mZNRq/
 uiXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :references:mime-version:content-disposition:in-reply-to:user-agent;
 bh=D4ec80u+BNIi7PJtY//hky+X61mrrrkMKiO81xuskZo=;
 b=QM4f0JXvwsXzbb4qKacjZ5bmt8g/KbdzIadwnUa4J4KbHMczdHuyxMaX0DN8H0lnOK
 5y00DasGQZn8Cy7fnE7wQLMniJK+kFXSTRlBPkAXJcMx7tKYJLhRqZnEi8zSqG/To8mv
 68Pjzg4nM/v6aemwd0yRZJ35NCtyazCbR/cWzLaGrQG8l3viV1jkTVViNLe7xBZkfqbg
 vYf7/TvRfPY2uQ3r7QqaDujg3LVlY9Dkr0pMYcUB3gQAbcWgWXOrkjrJr3tii0e99gwE
 VnjcugM3NdCuMmoIwG1IR1rOFzA2OzhYX9jopXXW9IXc91NTHJxndGsf0IeJ9ShVopkL
 6i7w==
X-Gm-Message-State: AGRZ1gKHmDg09N1E9Oa0YHvTuFtsOQvGi7oBxkBvqqiKnp80/gmrlBKk
 HNrUr/lwNOx8fm10KCdoJPo=
X-Google-Smtp-Source: AJdET5e9WTZAYFyAVmC4n2gSNsDxfy5ZqWR+RmZFcZ0ET8v3Pzl/rQI1dBWIPHbIe0pOEJazRLdILQ==
X-Received: by 2002:a17:902:650a:: with SMTP id
 b10-v6mr8429095plk.36.1542327580424; 
 Thu, 15 Nov 2018 16:19:40 -0800 (PST)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id k24sm16636321pfj.13.2018.11.15.16.19.38
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 15 Nov 2018 16:19:39 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Thu, 15 Nov 2018 16:19:38 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Tao Ren <taoren@fb.com>
Cc: Wim Van Sebroeck <wim@linux-watchdog.org>,
 "linux-watchdog@vger.kernel.org" <linux-watchdog@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Subject: Re: [PATCH] watchdog: core: suppress "watchdog did not stop" message
Message-ID: <20181116001938.GA16009@roeck-us.net>
References: <20181115234413.27009-1-taoren@fb.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20181115234413.27009-1-taoren@fb.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
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
X-List-Received-Date: Fri, 16 Nov 2018 00:19:43 -0000

On Thu, Nov 15, 2018 at 11:44:26PM +0000, Tao Ren wrote:
> Currently "watchdog did not stop!" message is printed when the watchdog
> timer is not stopped at close. For example, people may see the message
> when rebooting the system, or the message will be logged to console
> periodically if watchdog is kicked by a scirpt which runs "echo k >
> /dev/watchdog" command.
> 
> Given a critical message usually indicates a serious hardware/software
> failure, this message could easily lead to confusion, so it's better to
> just delete the message.
> 
> Signed-off-by: Tao Ren <taoren@fb.com>

NACK. This message is displayed if/when the watchdog application
exits without stopping the watchdog and/or without closing properly.
This _is_ critical since it will reboot the system after the next
timeout period.

If userspace triggers this message on purpose (eg by the mentioned
script, which does not exit properly), userspace is at fault,
not the kernel.

Guenter

> ---
>  drivers/watchdog/watchdog_dev.c | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/drivers/watchdog/watchdog_dev.c b/drivers/watchdog/watchdog_dev.c
> index f6c24b22b37c..65e9ebbd8759 100644
> --- a/drivers/watchdog/watchdog_dev.c
> +++ b/drivers/watchdog/watchdog_dev.c
> @@ -879,7 +879,6 @@ static int watchdog_release(struct inode *inode, struct file *file)
>  
>  	/* If the watchdog was not stopped, send a keepalive ping */
>  	if (err < 0) {
> -		pr_crit("watchdog%d: watchdog did not stop!\n", wdd->id);
>  		watchdog_ping(wdd);
>  	}
>  
> -- 
> 2.17.1
> 
