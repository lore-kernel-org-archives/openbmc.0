Return-Path: <daniel.lezcano@linaro.org>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=linaro.org
 (client-ip=2a00:1450:4864:20::341; helo=mail-wm1-x341.google.com;
 envelope-from=daniel.lezcano@linaro.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=linaro.org header.i=@linaro.org header.b="Ab9fIbS7"; 
 dkim-atps=neutral
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 42QFfn3hwxzF37y
 for <openbmc@lists.ozlabs.org>; Wed,  3 Oct 2018 22:28:15 +1000 (AEST)
Received: by mail-wm1-x341.google.com with SMTP id a8-v6so1451995wmf.1
 for <openbmc@lists.ozlabs.org>; Wed, 03 Oct 2018 05:28:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=r+xJeJiTViUaKyUEJIiLdGISDhU3g624RQT6SjXnmOk=;
 b=Ab9fIbS7Wm0JYNbTzTR+ku9qugi/ZM6tgCkQ5IMniRvPO1XXo+1DnQYK1nXviBtjlN
 8RTBQARY3u6cboxf25VPhHYCtcMtqjTrPtg/gsUognYqX8lHNWt8uOyqkfigvzMHt+Nr
 JcCe0kpBTPu3FLTBGDltIRlnD+gMd6AD58VmE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=r+xJeJiTViUaKyUEJIiLdGISDhU3g624RQT6SjXnmOk=;
 b=o9ehPGrdzMNoW47Vrj/UT38Cwxe+cThDAOC2h5AJMspwJNhxytaGwy1Y5ofz/Ki0mw
 Qt+crgkor5q1Eag8FQKNtmPHgZcxsHoCWaIwhcCCRBNJYlTiH4pxOsLFJYi0sXWpaHvP
 wgr7S66jXJYbbDLSAl1JyLrNtMdNG5zKMibbiwGsGCARQie9O1zBy4OFHgwU2esVY+33
 ypGk/yn2CtRpWk65TsFiMK0e9113s9K+R1zvrkWEWj++5HRc//mQb71rIyfwcjZZcJDM
 xwhOiUxmz1rEfBv+gejH/zR0thJE1VIJcXaAczPTOpYIPZpzFjIOx4OTRzQNTB2igVdw
 mlsw==
X-Gm-Message-State: ABuFfohjL3Tdpq57k75Mb57LxBggAO4VMPVkcebnoxXJekFrLdhD0vym
 jRiIr0i10GpoSLqYiYsEdyurPQ==
X-Google-Smtp-Source: ACcGV61CIbOoIy0zVCHEcAiH2MROk3PNgsI4FK1d/UviLcZscycS/6MYduI5aD5En6A3jIQm2jcVTQ==
X-Received: by 2002:a1c:4d0b:: with SMTP id
 o11-v6mr1346968wmh.94.1538569692156; 
 Wed, 03 Oct 2018 05:28:12 -0700 (PDT)
Received: from [192.168.0.41] (84.152.136.77.rev.sfr.net. [77.136.152.84])
 by smtp.googlemail.com with ESMTPSA id
 w192-v6sm1943417wmf.33.2018.10.03.05.28.10
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 03 Oct 2018 05:28:11 -0700 (PDT)
Subject: Re: [PATCH] clocksource/drivers/fttmr010: fix invalid interrupt
 register access
To: Tao Ren <taoren@fb.com>, Linus Walleij <linus.walleij@linaro.org>
Cc: Thomas Gleixner <tglx@linutronix.de>, Joel Stanley <joel@jms.id.au>,
 Andrew Jeffery <andrew@aj.id.au>, Yu Lei <mine260309@gmail.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-aspeed@lists.ozlabs.org" <linux-aspeed@lists.ozlabs.org>
References: <20181002041437.2493192-1-taoren@fb.com>
 <CACRpkdY4VaH2Yoob2gWwAk11P1NTDdza262zKGs=gju0NH9skQ@mail.gmail.com>
 <3a294c92-bcc6-b42e-b3af-72bc5f607fd9@fb.com>
 <CACRpkdZXum+bQg1FO+EHhKWpxtPYXfeRhoAKkFXeMQh1Jng3Ww@mail.gmail.com>
 <966C48A9-98F7-4B2B-BCD0-FAF3066C5794@fb.com>
From: Daniel Lezcano <daniel.lezcano@linaro.org>
Message-ID: <6e7703e4-461b-77bf-5c9d-cc9e91c5ef3d@linaro.org>
Date: Wed, 3 Oct 2018 14:28:09 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <966C48A9-98F7-4B2B-BCD0-FAF3066C5794@fb.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
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
X-List-Received-Date: Wed, 03 Oct 2018 12:28:18 -0000

On 03/10/2018 09:46, Tao Ren wrote:
> On 10/2/18, 11:57 PM, "Linus Walleij" <linus.walleij@linaro.org>
> wrote:
> 
>> My thought is go for (2) and do all changes in one patch :)
> 
> No problem, Linus. One more question: looks like my first patch
> 4451d3f59f2a (fix set_next_event handler) is not merged back to
> "timers/core". Should I generate this patch on top of the first patch
> or on top of the current "timers/core"? Which one would be easier for
> you (or Daniel/Thomas)? Sorry I'm pretty new to the community..


Hi Tao,

the branch tip:timers/urgent will be merged in tip:/timers/core, so the
fixes will be propagated to the master branch.

Base your change in top of tip:timers/urgent, the merge will happen soon
and both fixes will end up in tip:timers/core.

  -- Daniel


-- 
 <http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog
