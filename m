Return-Path: <daniel.lezcano@linaro.org>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=linaro.org
 (client-ip=2a00:1450:4864:20::443; helo=mail-wr1-x443.google.com;
 envelope-from=daniel.lezcano@linaro.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=linaro.org header.i=@linaro.org header.b="cpzQws6b"; 
 dkim-atps=neutral
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 43B3PX3QYczDrQD
 for <openbmc@lists.ozlabs.org>; Fri,  7 Dec 2018 18:04:44 +1100 (AEDT)
Received: by mail-wr1-x443.google.com with SMTP id b14so2727308wru.12
 for <openbmc@lists.ozlabs.org>; Thu, 06 Dec 2018 23:04:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=VYaH+iK80F2dK8xvwFZZ+PfPb10+61RH8PGauKSiAVk=;
 b=cpzQws6b6/Cw1bfa9E8Plxhux9LWhlAagO8y2Wryt1XlpSAz0tQD31RDaSm8dV0f0g
 C0Io9A8BioRjhLetJkeFosMxQz9h3CYK8kKwAhyfS3pey0b+9EdwQ5nHu0/lCZYYBrH4
 mXMXt1tNspBMT/B+rjzlIG9Ghm9QsCCjdFax0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=VYaH+iK80F2dK8xvwFZZ+PfPb10+61RH8PGauKSiAVk=;
 b=obLQGeZu5PFxsFJNxWhqLA9jEGWF47Y7vnruMGwdviw3C95msxQrTaE9hM4u5VuDo2
 vIrypvVFxhW/hU2CBXx3DGeJzKk9+mkhoBcDnJkoGAnLcQnoumTsCs57970Gwr8wTqe8
 vgOPebIgbiwgB3EGlB4ul8ioLI9bshvwyBEfBT7bcGQYKhwcM2WQrEUX1S6Jn22Mo+Zk
 KuHKbx40rJka5zKt2eRLwBQ17tZQMvJoU5JYT90uh0pjzpvSRmh/2tb/FLs+WXvG2dop
 dVgiEqBN/tQfhIc5iVoMD6mk+nFOm21e70mkiJrGMRp2BBINzxxcVa7phThms5mDLyQm
 FMEw==
X-Gm-Message-State: AA+aEWZCT8AAuzAwgL0RmlFu/YsrJAssleLSEQI5YBh9J3/HKo5OZs0R
 NdEwpZBmMfGw7NLAIrTHPDyoWg==
X-Google-Smtp-Source: AFSGD/V7qVEW0Rxapwhz2KPm2aJJhQ1P8jBcQ6RZgOZtKoXRNcDbmufBIuyzBSSqYJltqYQj09+RqA==
X-Received: by 2002:adf:e54a:: with SMTP id z10mr781386wrm.238.1544166281527; 
 Thu, 06 Dec 2018 23:04:41 -0800 (PST)
Received: from [192.168.0.40] (80.149.136.77.rev.sfr.net. [77.136.149.80])
 by smtp.googlemail.com with ESMTPSA id y34sm7103070wrd.68.2018.12.06.23.04.40
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 06 Dec 2018 23:04:40 -0800 (PST)
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
 <279e6a06-3f2f-e736-f28e-4d099729a517@linaro.org>
 <7284BEA6-FAE9-4293-94E0-FC29304AA36D@fb.com>
 <48A12A26-5AF0-483C-85D4-428F00038D7A@fb.com>
From: Daniel Lezcano <daniel.lezcano@linaro.org>
Message-ID: <47d85e8e-bf01-11a7-9c02-6d934d911178@linaro.org>
Date: Fri, 7 Dec 2018 08:04:39 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.2.1
MIME-Version: 1.0
In-Reply-To: <48A12A26-5AF0-483C-85D4-428F00038D7A@fb.com>
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
X-List-Received-Date: Fri, 07 Dec 2018 07:04:49 -0000

On 07/12/2018 02:13, Tao Ren wrote:
> On 11/5/18, 11:00 AM, "Tao Ren" <taoren@fb.com> wrote:
> 
>> On 11/5/18, 10:51 AM, "Daniel Lezcano" <daniel.lezcano@linaro.org> wrote:
>>> Oh right, sorry. Should it go to stable also ? Is there a Fixes tag it can apply ?
>>>
>> Personally I don't think it needs to go to stable, because I don't see any functional failures caused by this invalid register access.
> 
> Hi Daniel,
> 
> Not sure if I missed any emails from you, but looks like the patch is not included in your tree? Are we planning to include the patch in 4.21 merge window?

Yes, I have it in the tree. I updated the next branch.

Thanks

  -- Daniel


-- 
 <http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog
