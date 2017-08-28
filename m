Return-Path: <jacek.anaszewski@gmail.com>
Received: from mail-wm0-x243.google.com (mail-wm0-x243.google.com
 [IPv6:2a00:1450:400c:c09::243])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3xh3BL1ftczDqD0
 for <openbmc@lists.ozlabs.org>; Tue, 29 Aug 2017 06:23:37 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="TNnofatA"; 
 dkim-atps=neutral
Received: by mail-wm0-x243.google.com with SMTP id j72so1691727wmi.3
 for <openbmc@lists.ozlabs.org>; Mon, 28 Aug 2017 13:23:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:references:cc:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding;
 bh=gUg2ZXOH6m0G2BEjygSU33ao7+NSc2iJwyNgIJ8HBfU=;
 b=TNnofatAlgljgZL54bvQeTq502IEt9RoRIGTMf0/U77xUvnv9GzHXsCfLGnFFBW34X
 VC2BlDAoB0wPHy8LCyhFETHQ9wJ/3qpNjh2okmAfSHe/rY6Dtw6oHX3K8edOAoJ+3cAe
 5icDEgdBa7Axo92BFq0+6XeqqnjQthr5LsgGspzQSGLiJ2wPSc9or+jtyvTjs62K1eUw
 NVCSOHYVF8T/E109raIckIK5MuV/sueDt8QeA2qFHF7ex6d9IFvGRyY1haEBLbFtT9X7
 M2Z3lXh8ifoLBZhS7yEC4Cwd4RyatAk3EwdNL74UE7HdYK8Wkzccz48ZSZZi/5Soj6Dk
 s9oA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:cc:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding;
 bh=gUg2ZXOH6m0G2BEjygSU33ao7+NSc2iJwyNgIJ8HBfU=;
 b=LXCfprCCzQahGIl9YH6oGvwgJifAFNxHh6ThrxmdVftmspPQUxC6UtC3O1DATa8HL4
 EUzgQPPpdVoPwCJ0qXjppLCEyQUHGWqkN94NQSSJzAjvMEx4fV7u7wC5WONRS+gGffyc
 vK9CNOAvnxypkBoEQrDbPTk+QtNIhZfkilRt04uWXCDrAvfKsMvZ3oQqt36CciW8Fixd
 pOqcVRD+BGx39K9X6+JnUM0fal8H1hbOxPyqp1sN2I+Do0Oy2DeerHYwdYIaNCDQ9GVL
 lqueeB5/s8nXFEmhnHD5GpSmVIuS1EaLMf+E2+SzZV4uuETiqFEqbknjDWl37BIsqZ/f
 Mz8Q==
X-Gm-Message-State: AHYfb5gJhi43nqkRtwcezanFloqFYLAdSZC22AI3+No+Dk+ptvux/4B1
 xQ4EYpygXrmYfKmHQC4=
X-Received: by 10.28.175.213 with SMTP id y204mr5548wme.67.1503951813933;
 Mon, 28 Aug 2017 13:23:33 -0700 (PDT)
Received: from [192.168.1.18] (dly86.neoplus.adsl.tpnet.pl. [83.24.54.86])
 by smtp.gmail.com with ESMTPSA id a6sm1050301wrh.66.2017.08.28.13.23.32
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 28 Aug 2017 13:23:33 -0700 (PDT)
Subject: Re: [PATCH v2 0/2] leds: gpio: Allow retaining state on shutdown
To: Andrew Jeffery <andrew@aj.id.au>, linux-leds@vger.kernel.org
References: <20170828001711.19662-1-andrew@aj.id.au>
Cc: rpurdie@rpsys.net, pavel@ucw.cz, robh+dt@kernel.org,
 mark.rutland@arm.com, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, joel@jms.id.au, openbmc@lists.ozlabs.org
From: Jacek Anaszewski <jacek.anaszewski@gmail.com>
Message-ID: <abb247bd-fc16-54cf-3dc1-fbba575e5fdb@gmail.com>
Date: Mon, 28 Aug 2017 22:22:49 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
 Thunderbird/45.8.0
MIME-Version: 1.0
In-Reply-To: <20170828001711.19662-1-andrew@aj.id.au>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
X-Mailman-Approved-At: Wed, 30 Aug 2017 01:19:22 +1000
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
X-List-Received-Date: Mon, 28 Aug 2017 20:23:39 -0000

Hi Andrew,

Thanks for the update.

On 08/28/2017 02:17 AM, Andrew Jeffery wrote:
> Hello,
> 
> LEDs controlled by Baseboard Management Controllers (BMCs) are sometimes
> required to retain their state across BMC resets. BMC resets may occur whilst
> the host is alive, thus the chassis and host system remain powered up. In these
> two patches I define an new devicetree property to describe the behaviour for
> GPIO LEDs and add support to the leds-gpio driver.
> 
> Changes in v2:
> * Expand BMC to Baseboard Management Controller at least once in each commit
>   message.
> 
> v1: https://lkml.org/lkml/2017/8/25/44
> 
> Please review!
> 
> Cheers,
> 
> Andrew
> 
> Andrew Jeffery (2):
>   dt-bindings: leds: gpio: Add optional retain-state-shutdown property
>   leds: gpio: Allow LED to retain state at shutdown
> 
>  Documentation/devicetree/bindings/leds/leds-gpio.txt | 3 +++
>  drivers/leds/leds-gpio.c                             | 7 ++++++-
>  include/linux/leds.h                                 | 2 ++
>  3 files changed, 11 insertions(+), 1 deletion(-)
> 

Patchset applied to the for-next branch of linux-leds.git, thanks.

-- 
Best regards,
Jacek Anaszewski
