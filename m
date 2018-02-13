Return-Path: <f.fainelli@gmail.com>
Authentication-Results: ozlabs.org; spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:400d:c09::244; helo=mail-qk0-x244.google.com;
 envelope-from=f.fainelli@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="d1b12CIR"; 
 dkim-atps=neutral
Received: from mail-qk0-x244.google.com (mail-qk0-x244.google.com
 [IPv6:2607:f8b0:400d:c09::244])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3zgv493YL6zF18M
 for <openbmc@lists.ozlabs.org>; Wed, 14 Feb 2018 07:18:14 +1100 (AEDT)
Received: by mail-qk0-x244.google.com with SMTP id c82so23970759qka.0
 for <openbmc@lists.ozlabs.org>; Tue, 13 Feb 2018 12:18:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=y4bT8VQ/ISbOsU0UsYmTWEMRit/nPpr6tRo6eTPAfm8=;
 b=d1b12CIRVtKEC6ZsmVI2KWcUgrb9KR3oZ1ZyzXJ+pUyLeqwdfFcgplxku72m7iTlWv
 LkeVMUIxOW1/kuooIPLF6ljF2t+mHTAzga39TXL3ugpZoipp3FT0TXAgcoZViS2W0Iq/
 6RC+KTGucxSLCMu2/dw41dLUxgxVmStVTtryj0c9755h2JgV/+kvKSDnsQOhiECc6kDV
 8EL4eIGp8r0OuwiPNy07sFMAmbZXM0AmjdXSAXQV3p2rTAudaplAhFcaOA8Y1tlxXAE/
 YpVhopa3Wv5CQlJP3eRPAHAqgcSMVsmGgRR+F/zwH4thfR0ptEBnAkSWPM5DOWnI/Ci7
 xOWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=y4bT8VQ/ISbOsU0UsYmTWEMRit/nPpr6tRo6eTPAfm8=;
 b=bN/B1bv73hJwtjI4zkfJC32G6fGc1eF1wHQRw9cH3SMrY9pboXBooJtfzKiE/0aIcr
 590aFgRcwDuJSroNTSqCvkbc/w2bkGPL60XKEeEK45TkKnKz2ESMipGKphk2LzA1CX3r
 M2P8BYFeqYIzkVkXHANgXMxM76PO/J67YJYCyUiomsIAkd8cBusRPx4qYypDiwzlBu4Y
 EuAm0BRiTi2lDsTxErkU/puoFDWLNsSBeJ4NpyHtFdqzpSBezaozh65yqAYVX0YjzTOQ
 6hoVLZcuhachfy+qQsHPDu99Xt9L0eAqXo2IiumJczbSsL3bdG9eDzzXx9Bd1L9ise2s
 db3Q==
X-Gm-Message-State: APf1xPAs0RuVYHxm69RShnZJUp/6edQqXK2omu2SotSRiounNpsHbDu2
 3NZWq7LwF+yH/k4LAKIRV5b0aqnH
X-Google-Smtp-Source: AH8x226pEfL35hH9rzlRD4t57y9nAkIpU7IoC9/OR/Id0O9pDuEvLiKSlDO9xjdImu0jqKbZOJcfGQ==
X-Received: by 10.55.2.140 with SMTP id v12mr3684631qkg.340.1518553091066;
 Tue, 13 Feb 2018 12:18:11 -0800 (PST)
Received: from [10.69.41.93] ([192.19.223.250])
 by smtp.googlemail.com with ESMTPSA id k2sm8715142qtk.60.2018.02.13.12.18.07
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 13 Feb 2018 12:18:09 -0800 (PST)
Subject: Re: [PATCH v10 0/3] arm: npcm: add basic support for Nuvoton BMCs
To: Brendan Higgins <brendanhiggins@google.com>, robh+dt@kernel.org,
 linux@armlinux.org.uk, mark.rutland@arm.com, tmaimon77@gmail.com,
 avifishman70@gmail.com, julien.thierry@arm.com, pombredanne@nexb.com,
 arnd@arndb.de
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, openbmc@lists.ozlabs.org
References: <20180213200959.160157-1-brendanhiggins@google.com>
From: Florian Fainelli <f.fainelli@gmail.com>
Message-ID: <b33b48ba-35ef-d98e-fa52-f70ed0953dcc@gmail.com>
Date: Tue, 13 Feb 2018 12:18:05 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.6.0
MIME-Version: 1.0
In-Reply-To: <20180213200959.160157-1-brendanhiggins@google.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
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
X-List-Received-Date: Tue, 13 Feb 2018 20:18:18 -0000

On 02/13/2018 12:09 PM, Brendan Higgins wrote:
> Addressed comments from:
>  - Joel: https://www.spinics.net/lists/arm-kernel/msg634074.html
>  - Arnd: https://www.spinics.net/lists/arm-kernel/msg634091.html
> 
> Summary of changes since previous update:
>  - Replaced "nuvoton,npcm7xx-smp" compatibility string with
>    "nuvoton,npcm750-smp".
>  - Fixed some whitespace issues.
>  - Added EVB DTS to Makefile.
> 
> All changes tested on Nuvoton NPCM750 EVB.
> 

Thanks for keeping me CC, FWIW: Reviewed-by: Florian Fainelli
<f.fainelli@gmail.com>

FWIW, I don't have a vested interest in BMCs in general, just happened
to do a drive by review of your SMP code, no need to CC me on future
submissions (e.g: boards, drivers etc.). Cheers
-- 
Florian
