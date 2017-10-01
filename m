Return-Path: <daniel.lezcano@linaro.org>
Authentication-Results: ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=linaro.org
 (client-ip=2a00:1450:400c:c09::22e; helo=mail-wm0-x22e.google.com;
 envelope-from=daniel.lezcano@linaro.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=linaro.org header.i=@linaro.org header.b="FqeEh+tA"; 
 dkim-atps=neutral
Received: from mail-wm0-x22e.google.com (mail-wm0-x22e.google.com
 [IPv6:2a00:1450:400c:c09::22e])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3y4rnQ0tQtzDqZq
 for <openbmc@lists.ozlabs.org>; Mon,  2 Oct 2017 03:47:34 +1100 (AEDT)
Received: by mail-wm0-x22e.google.com with SMTP id i124so6589629wmf.3
 for <openbmc@lists.ozlabs.org>; Sun, 01 Oct 2017 09:47:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to
 :user-agent; bh=C5CWhmIu48clzNlGMgWDuS63n0SKTaENyRvnEFmOFio=;
 b=FqeEh+tA9XJgLGIIYrR5QLtZCzoN27Nrh4NxVEYJ4RDa2Nfv266eKK++wyOppWdgnX
 nPfNDvhNjAwgGgpDbLLl0B4GBNT0CDqKc0XbaF5r3smKIPBEkHm2NL9i1gTfgZb6Q3bW
 rjasrtvDuGXX1eGCJW1zgkH/asDSA2g++prds=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to:user-agent;
 bh=C5CWhmIu48clzNlGMgWDuS63n0SKTaENyRvnEFmOFio=;
 b=H23y+ArkKrYKN/4aouZZBlMkGTzV/ZoW4bAg1y2PUcp2qB8+QSMCaACCDap8dEvk/m
 CVWbE4ciIaY7ZoPWlhkGrc9KrCLNKT4kYQaKsmtQ099ztcSzuclFyg1npBE8PPacY5gW
 Snqtl4ASFlZfnLFxd3aiRxyzFkePoy7YLIsX74Ryj9KCU+iAXml1vIkiHZPN0MajSIFB
 N2zI5qLv0SGGtnDHf7i+rLiptzKo1EuXMtV86QhT1V8qNF9w+XdH1P+n5UUc+XdoarA8
 jX/uehZrI0pDp8ryGVTPeap2vIEtOK0h04bshL1zpiHUGIBqWWjzCTwHkDAkfF/KqYek
 P9/g==
X-Gm-Message-State: AHPjjUipEZ3OqRxkpDpAU47Vym75RGQmsZO0nYKW+cvLnfxuMgMSHcgl
 TWP0vSiZH1nhM6MVmvH6DrzsHQ==
X-Google-Smtp-Source: AOwi7QDiywUm+cHjCmcPjtOhZ/uio9z2n7iJxFTVzA5eID0AptVK6CkD9LLfS8DrhK1HpHEMfWir1A==
X-Received: by 10.28.71.25 with SMTP id u25mr7571826wma.126.1506876451436;
 Sun, 01 Oct 2017 09:47:31 -0700 (PDT)
Received: from mai ([2001:41d0:fe90:b800:3f16:bcf7:601c:a13b])
 by smtp.gmail.com with ESMTPSA id 31sm1953197wru.33.2017.10.01.09.47.28
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Sun, 01 Oct 2017 09:47:30 -0700 (PDT)
Date: Sun, 1 Oct 2017 18:47:26 +0200
From: Daniel Lezcano <daniel.lezcano@linaro.org>
To: Tomer Maimon <tmaimon77@gmail.com>
Cc: robh+dt@kernel.org, mark.rutland@arm.com, tglx@linutronix.de,
 avifishman70@gmail.com, brendanhiggins@google.com,
 raltherr@google.com, joel@jms.id.au, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, openbmc@lists.ozlabs.org
Subject: Re: [PATCH v1 0/2] clocksource: npcm: add NPCM7xx timer driver
Message-ID: <20171001164726.GB2290@mai>
References: <1506849098-18290-1-git-send-email-tmaimon77@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1506849098-18290-1-git-send-email-tmaimon77@gmail.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-Mailman-Approved-At: Tue, 03 Oct 2017 14:08:42 +1100
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
X-List-Received-Date: Sun, 01 Oct 2017 16:48:58 -0000

On Sun, Oct 01, 2017 at 12:11:36PM +0300, Tomer Maimon wrote:
> This patch set adds clocksource support for the Nuvoton NPCM7xx Baseboard
> Management Controller (BMC).
> 
> The clocksource Enable 24-bit TIMER0 and TIMER1 counters in the NPCM7xx BMC,
> while TIMER0 serves as clockevent and TIMER1 serves as clocksource.
> 
> clocksource patch set depand on approval of basic support for Nuvoton BMCs
> and Nuvoton NPCM750 device tree patches.
> https://patchwork.kernel.org/bundle/brendanhiggins/arm:%20npcm:%20add%20basic%20support%20for%20Nuvoton%20BMCs/
> 
> Tomer Maimon (2):
>   clocksource: npcm: add NPCM7xx timer driver
>   dt-binding: timer: document NPCM7xx timer DT bindings
> 
>  .../bindings/timer/nuvoton,npcm7xx-timer.txt       |  25 +++
>  drivers/clocksource/Kconfig                        |   9 +
>  drivers/clocksource/Makefile                       |   1 +
>  drivers/clocksource/npcm7xx_timer.c                | 205 +++++++++++++++++++++
>  4 files changed, 240 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/timer/nuvoton,npcm7xx-timer.txt

Add me in copy of the binding, so I can take the patch along with the driver.

Thanks.

  -- Daniel

-- 

 <http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog
