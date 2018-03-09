Return-Path: <daniel.lezcano@linaro.org>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=linaro.org
 (client-ip=2a00:1450:400c:c0c::243; helo=mail-wr0-x243.google.com;
 envelope-from=daniel.lezcano@linaro.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=linaro.org header.i=@linaro.org header.b="QofoKAE/"; 
 dkim-atps=neutral
Received: from mail-wr0-x243.google.com (mail-wr0-x243.google.com
 [IPv6:2a00:1450:400c:c0c::243])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3zySmQ24wKzF1qj
 for <openbmc@lists.ozlabs.org>; Sat, 10 Mar 2018 00:25:08 +1100 (AEDT)
Received: by mail-wr0-x243.google.com with SMTP id a63so5400618wrc.10
 for <openbmc@lists.ozlabs.org>; Fri, 09 Mar 2018 05:25:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=NNv5PPbmUFj1lSfh0OFep3bsSUlj4zcQbMaFIh8KojU=;
 b=QofoKAE/rs6Zg255Vco7bJ/7VJq0HzOjaGixix/XLCpO92Zpi8u7gs+DKlWZeTEofS
 LsOiRcPLw20oL7e4cwlX0auemA1RDHG14teLqt+qvkuDhduwS10EByHnWtL2VrQf1WUW
 4FmS9kpSSVMFW9Vxrk6Rfr04ZOnGksmsGggag=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=NNv5PPbmUFj1lSfh0OFep3bsSUlj4zcQbMaFIh8KojU=;
 b=Vg/IWggpeUWd+v/pCz3HrtY6aKcwhM5smO7Br1CsMuLfnuhtAq/yYQEyCN7rP6VURb
 ASRDXt11rh05Ce0xZJjkoNNaiNg+9lhXtX5h/8Xb8Efnr7vypRWznwJIy45uO9asueWB
 g4nfy8CJvys/N9vUfbCvIvhtK3WKjyq1A5pmdYSgPHhQFSXjd6nBMy4yp/mGjIQjwiFQ
 p/cRvDwXR5m5Il0yb4j83jGY0kdjCBidm+SpmKDBvaOeqYTJ3T/9xghmnOguzuqpGmn2
 3EXC/apII6SgaYbHZlxZAdQsstf4xIo6uGP+T8WKayxDc7m4zN4SGzKm1kOLbC0X6iob
 EfZA==
X-Gm-Message-State: AElRT7G2/BO90i+Z0BVvFZxouDgJxS/Vw3O2TV58rBu1V9p9sgQ3opc7
 hYP61uwOi6Ajw6PQzeSs5S2qOV4x6lA=
X-Google-Smtp-Source: AG47ELssOBlK9N+2SlNyG9G0QmwzmovzNtXTzJrqRcP2Kv0CRmyYaTUn6DTyPOfU97ssuZFCKeyMHg==
X-Received: by 10.223.168.108 with SMTP id l99mr1499493wrc.118.1520601904766; 
 Fri, 09 Mar 2018 05:25:04 -0800 (PST)
Received: from ?IPv6:2a01:e35:879a:6cd0:3e97:eff:fe5b:1402?
 ([2a01:e35:879a:6cd0:3e97:eff:fe5b:1402])
 by smtp.googlemail.com with ESMTPSA id j89sm1105218wrj.92.2018.03.09.05.25.03
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 09 Mar 2018 05:25:04 -0800 (PST)
Subject: Re: [PATCH v5 2/2] clocksource/drivers/npcm: Add NPCM7xx timer driver
To: Tomer Maimon <tmaimon77@gmail.com>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Thomas Gleixner <tglx@linutronix.de>, Avi Fishman <avifishman70@gmail.com>,
 Brendan Higgins <brendanhiggins@google.com>, venture@google.com,
 Joel Stanley <joel@jms.id.au>, devicetree <devicetree@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
References: <1520522698-16153-1-git-send-email-tmaimon77@gmail.com>
 <1520522698-16153-3-git-send-email-tmaimon77@gmail.com>
 <2a83eb83-10a9-54f3-e0da-bd6cf32b5ac1@linaro.org>
 <CAP6Zq1gKE0xUGHuwXa7eLEsUisnaaz=QLgs=6uYnUYDGdX5ryw@mail.gmail.com>
From: Daniel Lezcano <daniel.lezcano@linaro.org>
Message-ID: <e2560cb7-8710-88ec-ac94-3e53a8f4b7e8@linaro.org>
Date: Fri, 9 Mar 2018 14:25:03 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.6.0
MIME-Version: 1.0
In-Reply-To: <CAP6Zq1gKE0xUGHuwXa7eLEsUisnaaz=QLgs=6uYnUYDGdX5ryw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.26
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Fri, 09 Mar 2018 13:25:12 -0000

On 08/03/2018 23:37, Tomer Maimon wrote:
> On 8 March 2018 at 17:33, Daniel Lezcano <daniel.lezcano@linaro.org> wrote:
>> On 08/03/2018 16:24, Tomer Maimon wrote:
>>> Add Nuvoton BMC NPCM7xx timer driver.
>>>
>>> The clocksource Enable 24-bit TIMER0 and TIMER1 counters,
>>> while TIMER0 serve as clockevent and TIMER1 serve as clocksource.
>>>
>>> Signed-off-by: Tomer Maimon <tmaimon77@gmail.com>
>>> Reviewed-by: Brendan Higgins <brendanhiggins@xxxxxxxxxx>
>>> ---
>>
>> [ ... ]
>>
>>> +
>>> +     pr_info("Enabling NPCM7xx clocksource timer base: 0x%x, IRQ: %d ",
>>> +             (int)timer_of_base(&npcm7xx_to), timer_of_irq(&npcm7xx_to));
>>
>> You can use '%p' instead of '0x%x' and remove the (int) cast.
> I think we need to use in the pr_info %px, if I use %p I get in the
> kernel boot print "(ptrval)" instead of the address.
> please refer: https://lwn.net/Articles/740249/

Ah yes, right.

Thanks

  -- Daniel


-- 
 <http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog
