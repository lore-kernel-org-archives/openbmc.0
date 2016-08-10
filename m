Return-Path: <joel.stan@gmail.com>
Received: from mail-ua0-x232.google.com (mail-ua0-x232.google.com
 [IPv6:2607:f8b0:400c:c08::232])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3s8Sy72N4kzDqV0
 for <openbmc@lists.ozlabs.org>; Wed, 10 Aug 2016 21:06:23 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b=PZ4hKpdk; 
 dkim-atps=neutral
Received: by mail-ua0-x232.google.com with SMTP id 97so64003577uav.3
 for <openbmc@lists.ozlabs.org>; Wed, 10 Aug 2016 04:06:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=kYWKbKa5wkF7GpnFAYghJ9KCg6HbaM+ElR39fiJpOVg=;
 b=PZ4hKpdkUV1mUj0DZ1vfqYIQGmqtPUyMH6ptLLUL4h4PCNay/e6XazLewaTnfW4JbG
 g2mNws0h/j7Q+DBfkVsRBIl/GfBriB8Nngyc7ywiCa8h9oEqmI8+gYW3UaF1zdXX8f06
 3Rk38vWw4lYkE9MYpdclydQHNhwXmkTHqDhkcEkswaZuRkw/zjBeQynN8NIUc5q8goVO
 M3tlB0tW4S53EoPFJj3Do96UGiJ9HtHHS10JzOW5S5urppd01CNt0Q8obofJf/83c0Cz
 qrBqNZpHLc76XoRWkIahmd7wcwkjjuxJB8fHoRrFVyBKwKur9a1AWWUfrEVWOaU+4PHx
 KXTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=kYWKbKa5wkF7GpnFAYghJ9KCg6HbaM+ElR39fiJpOVg=;
 b=gjddL6iTkcYlpd1uQfodWfR5pQmEe3cHUI5+wJH+W8d4Zb6db5eQryLsqG68fYLNlA
 vUJXf6Q5YQtZskcrGdyUoRNXOv/Uk8j87X9XqTua+nhvYCWw/5ruwgbDufh+vrgnxbR4
 rSFo8Qf8uzy+gHWWG5xa1ed/xnYEs4COZhD85zTQYdJjWnMxaRWMpoUh/6jyfJvm56Dn
 o1srWP/UHViZouZOulDmEIT/m0EI0SdH6wZJNpJVb4SCSuDUFzu8NBXjY7no0izV6rHB
 i5JAyW5cmuiZFvUPi0BXbNO40wwVrX6tk9i5MXwFGsfBam4C4mvSAS1qN3E1sXGkmNPw
 EUiA==
X-Gm-Message-State: AEkoouvIE13lVl+JZd2crMdpctwMe8S98pO4j/6Od2xZEBew7AsBckf7QNy6ielXfoVs8z+5CIRL0JB5rntt0Q==
X-Received: by 10.176.0.115 with SMTP id 106mr1643197uai.43.1470827181181;
 Wed, 10 Aug 2016 04:06:21 -0700 (PDT)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.159.38.76 with HTTP; Wed, 10 Aug 2016 04:06:00 -0700 (PDT)
In-Reply-To: <97341470823017@webcorp01g.yandex-team.ru>
References: <97341470823017@webcorp01g.yandex-team.ru>
From: Joel Stanley <joel@jms.id.au>
Date: Wed, 10 Aug 2016 20:36:00 +0930
X-Google-Sender-Auth: 9Q8dvDO8rBToxEFRfP1ohUoodTE
Message-ID: <CACPK8XdAFqTXGRtoYLgM-PWu-Y7kB1=5cs6MKkAmQMz7u3sJeA@mail.gmail.com>
Subject: Re: OpenBMC on the OpenWRT
To: "Anton D. Kachalov" <mouse@yandex-team.ru>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: text/plain; charset=UTF-8
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.22
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Wed, 10 Aug 2016 11:06:24 -0000

Hey Anton,

On Wed, Aug 10, 2016 at 7:26 PM, Anton D. Kachalov <mouse@yandex-team.ru> wrote:
> Hello everybody.
>
> I'm working on a separate project for rack solution which utilize many portions of OpenBMC:
>
>    https://github.com/ya-mouse/openbmc-target

Nice! I came across your repository the other day.

>
> As a system base we choose OpenWRT (flexible kernel-style configurations, package manager,
> wide and experienced support for embedded systems with limited resources).

I'm not too familiar with OpenWRT aside from using it on my WiFi
router at home. I do have experience with buildroot, which uses
Kconfig and does a good job at creating small, configurable images.

Have you been happy with OpenWRT as a build system?

> We still use old u-boot that came from OpenSource release of AMI SDK.
> Have plans to move to the OpenBMC's version to start using of DTS.

Great! Let me know how you go. I'm happy to apply patches in order to
support your configuration. Our goal is to upstream our patches to
remove the need to fork it all together.

> And a few modifications over OpenBMC kernel tree:
>
> 1. I2C slave support for the aspeed adapter (it is ugly a bit).

Did you see the slave patch that Brendan submitted? Would it work for
your requirements?

  https://github.com/openbmc/linux/commit/090cb02e01906e7a7cf9c210237c4899972a9770

> 2. I2C slave support for MUX switch (pca954x).
> 3. DTS overlay support ported from Raspberry Pi with userspace dtoverlay/dtparam/dtmerge tools to manage configs.
> 4. LuaJIT + Nginx as a HTTP API backend instead of python/micropython.
>     We're on internal dissccusion of the API as a mainstream replacement for IPMB/IPMI.
>     We use local memcached for fast serving data.
> 5. Transparent master/slave i2c based IPMB driver with OpenIPMI interface
>     (works with regular ipmitool/freeipmi) to send requests to the Nodes.
>     To work in a daemon mode kernel part of ipmi_msghandler should be modified a bit
>     to receive incoming requests and store it separately while user (opener of the /dev/ipmiX)
>     assigned by the outgoing SeqId. For unwanted (from current module's point of view)
>     incoming packets there is currently no way to proper store such messages.
>
> Just for reference.
> We've compared performance of the several dynamic HTTP configurations such as
> python/micropython/lua (LuCI) and embeeded lua within nginx and discover that last one has almost
> maximum RPS comparing to the static pages serving.
> Static is about 350 RPS while dynamic nginx+luajit with auth checking is at 220RPS.
> Simple python's http serves at 40 RPS. LuCI variant is 4-6 RPS.
> First request to authentication service occurs via https and the result stored in the
> local nginx shared memory storage for the further use (configured for one minute).

Thanks for sharing your results. How does nginx go with memory usage?

Cheers,

Joel
