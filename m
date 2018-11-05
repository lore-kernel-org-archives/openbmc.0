Return-Path: <daniel.lezcano@linaro.org>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=linaro.org
 (client-ip=2a00:1450:4864:20::444; helo=mail-wr1-x444.google.com;
 envelope-from=daniel.lezcano@linaro.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=linaro.org header.i=@linaro.org header.b="amU7KVp8"; 
 dkim-atps=neutral
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 42phZn3CC6zF1s8
 for <openbmc@lists.ozlabs.org>; Tue,  6 Nov 2018 05:50:37 +1100 (AEDT)
Received: by mail-wr1-x444.google.com with SMTP id r10-v6so10703816wrv.6
 for <openbmc@lists.ozlabs.org>; Mon, 05 Nov 2018 10:50:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=eQ0yEPremo8B52k/FyqcK25od7JQpyHMXbzuF9gsdN0=;
 b=amU7KVp8WunULXUkJET7bYtA0r71du004Q+APnUm5VVoHPsP0O/X1TSNXFEYSnHjuP
 Tdt6qrnyRs3w8LeBShQqy+fk7Ph6X9hBbARhDuF09Kkei6MvRz8yQL9rKW6Dq2Dy1p52
 aLTeLqQb22iSa0t37n64XAIthPGG7Bhazu1D8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=eQ0yEPremo8B52k/FyqcK25od7JQpyHMXbzuF9gsdN0=;
 b=h6QtOfuDDt1ph2tVkITRCRpDkl+iuCc4tKTxQ6nGm2Vo/imAUnBoMszgaX1p6yXIo4
 +XzpMYGR8YfI4S+LVGxMThAaLU9u4xxBUZBpTkn1DEFe+Uf3fKYEEvsKF6APHgmfuwJK
 MDgEnhkevlXv6JNHkKj2GJppH0j4C78S6MAO9xAorZoIVk/dfKIv41QFoygBzWbyMGwv
 XW9UTzY1TxS4cK7CKNb+4cQxmXF6uoFgsJwVXyj0eaFzKpYmjBIZaujjDFxzlSZG+/pL
 yjOLbLxlXkJtW9REK188G3Y0MaiG6WETnkomQG75hdXqM4gr7/i2aYbmN5Ten26wJe+u
 YZ7g==
X-Gm-Message-State: AGRZ1gJb9cGkiYyWE57s3vt11JF06SFj0CRrfGlngxX5hJM2RR6HIOeu
 XhO8yeMvISesHag4xKUU0DgXwg==
X-Google-Smtp-Source: AJdET5c6/zsiaTNeJiuVzvDeSvk/ILcuSVSHmbUJNrjV8i8PXef9QzY5AV98N9gAVB5SIWsQTvAE4A==
X-Received: by 2002:adf:9403:: with SMTP id 3-v6mr20449968wrq.54.1541443834122; 
 Mon, 05 Nov 2018 10:50:34 -0800 (PST)
Received: from [192.168.0.40] (119.151.136.77.rev.sfr.net. [77.136.151.119])
 by smtp.googlemail.com with ESMTPSA id
 y21-v6sm19345969wma.36.2018.11.05.10.50.32
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 05 Nov 2018 10:50:33 -0800 (PST)
Subject: Re: [PATCH v2] clocksource/drivers/fttmr010: fix invalid interrupt
 register access
To: Tao Ren <taoren@fb.com>, Thomas Gleixner <tglx@linutronix.de>
Cc: Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>,
 Yu Lei <mine260309@gmail.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-aspeed@lists.ozlabs.org" <linux-aspeed@lists.ozlabs.org>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Linus Walleij <linus.walleij@linaro.org>
References: <20181003215350.3550926-1-taoren@fb.com>
 <CACRpkdbbUO9_VOtnZL+Xf_0nTTgSruaaPOLnvZ4M+NQfPLzvWQ@mail.gmail.com>
 <BC1ADE3F-F31F-4E1E-A6EE-3BD83C5F2634@fb.com>
From: Daniel Lezcano <daniel.lezcano@linaro.org>
Message-ID: <279e6a06-3f2f-e736-f28e-4d099729a517@linaro.org>
Date: Mon, 5 Nov 2018 19:50:31 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.2.1
MIME-Version: 1.0
In-Reply-To: <BC1ADE3F-F31F-4E1E-A6EE-3BD83C5F2634@fb.com>
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
X-List-Received-Date: Mon, 05 Nov 2018 18:50:42 -0000

On 05/11/2018 19:43, Tao Ren wrote:
> On 10/7/18, 2:03 PM, "Linus Walleij" <linus.walleij@linaro.org> wrote:
>>
>> On Wed, Oct 3, 2018 at 11:54 PM Tao Ren <taoren@fb.com> wrote:
>>
>>> TIMER_INTR_MASK register (Base Address of Timer + 0x38) is not designed
>>> for masking interrupts on ast2500 chips, and it's not even listed in
>>> ast2400 datasheet, so it's not safe to access TIMER_INTR_MASK on aspeed
>>> chips.
>>>
>>> Similarly, TIMER_INTR_STATE register (Base Address of Timer + 0x34) is
>>> not interrupt status register on ast2400 and ast2500 chips. Although
>>> there is no side effect to reset the register in fttmr010_common_init(),
>>> it's just misleading to do so.
>>>
>>> Besides, "count_down" is renamed to "is_aspeed" in "fttmr010" structure,
>>> and more comments are added so the code is more readble.
>>>
>>> Signed-off-by: Tao Ren <taoren@fb.com>
>>> ---
>>> Changes in v2:
>>>   - "count_down" is renamed to "is_aspeed" in "fttmr010" structure.
>>>   - more comments are added to make the code more readable.
>>  
>> Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
> 
> Hi Daniel / Thomas,
> 
> Any further comments on the patch? Or is there anything needed from my side?

Oh right, sorry. Should it go to stable also ? Is there a Fixes tag it
can apply ?


-- 
 <http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog
