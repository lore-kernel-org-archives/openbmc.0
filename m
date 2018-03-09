Return-Path: <daniel.lezcano@linaro.org>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=linaro.org
 (client-ip=2a00:1450:400c:c09::229; helo=mail-wm0-x229.google.com;
 envelope-from=daniel.lezcano@linaro.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=linaro.org header.i=@linaro.org header.b="QQjrarmR"; 
 dkim-atps=neutral
Received: from mail-wm0-x229.google.com (mail-wm0-x229.google.com
 [IPv6:2a00:1450:400c:c09::229])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3zySmm6s5HzF1sn
 for <openbmc@lists.ozlabs.org>; Sat, 10 Mar 2018 00:25:28 +1100 (AEDT)
Received: by mail-wm0-x229.google.com with SMTP id x7so3899712wmc.0
 for <openbmc@lists.ozlabs.org>; Fri, 09 Mar 2018 05:25:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=Z6eIwp8WPCamNH/ru0lF+UEv68mG08yBasjByzJ3fyE=;
 b=QQjrarmRzj2w7ACRcW/VEfgB0lDTFf94pGoUwcOK05mVpFlXWlb/zpKdWGCyztyFOJ
 eAfsmZFGA+MTgvmmJy/kaO76mqgQHvD/Uu8bugSwZkMUuI6dz2NMsGKuTobqtmSjtXsN
 /iKhj3kJ5rXAyDetCgBzL781hMNhJuijho8/M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Z6eIwp8WPCamNH/ru0lF+UEv68mG08yBasjByzJ3fyE=;
 b=dgP110gKvq2AybbPn8ptpQHeVwuJW2rj8ackzdJdndKWc2fpfDtk/HUZJcWS56QefM
 pQNA1q/ziPz2ChkNH5Q/kcWrbph8YyijqWTAY9U7rRfTj0sbJ9r/tdgBdBkFyNKHlpH5
 YzzUqNjyp0b4Ujo61m3LTIE4eAFzOaZkMqF8UJ1XRhz2Q04lfFjKjLnGiFlonPPwLdLc
 jygVRWT9ZtP5rMO37uvfgIesDLnsvuCSNU1xYLSxaEj3qivO5p+DOeWZK1utLcO5YPvT
 g3Bmfl53rfvrSPl8DK44YtYuWP/toMjwUEo3rLbs4xXPCDeoTsCh4/+eIkqUziy4shIe
 zJYg==
X-Gm-Message-State: AElRT7FqA5313s0YEVhqp8k4meH0VYDyK/l8fDHtn6/AOXnJZ11jag4r
 HoSe11TbpDZn33l5CYkO+93pSf5GwbU=
X-Google-Smtp-Source: AG47ELsaMv7UD22knU262GYVJ9gzpT3dQOcMel8OQe7y944Rw7yLNKFyiHF/XijLdfit1qXd7DxeBQ==
X-Received: by 10.28.30.210 with SMTP id e201mr2029773wme.34.1520601925403;
 Fri, 09 Mar 2018 05:25:25 -0800 (PST)
Received: from ?IPv6:2a01:e35:879a:6cd0:3e97:eff:fe5b:1402?
 ([2a01:e35:879a:6cd0:3e97:eff:fe5b:1402])
 by smtp.googlemail.com with ESMTPSA id m191sm1324738wma.21.2018.03.09.05.25.24
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 09 Mar 2018 05:25:24 -0800 (PST)
Subject: Re: [PATCH v5 0/2] clocksource/drivers/npcm: Add NPCM7xx timer driver
To: Tomer Maimon <tmaimon77@gmail.com>, robh+dt@kernel.org,
 mark.rutland@arm.com, tglx@linutronix.de, avifishman70@gmail.com,
 brendanhiggins@google.com, venture@google.com, joel@jms.id.au
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 openbmc@lists.ozlabs.org
References: <1520522698-16153-1-git-send-email-tmaimon77@gmail.com>
From: Daniel Lezcano <daniel.lezcano@linaro.org>
Message-ID: <e4e32ab8-bdaa-b4ee-a538-a1f03ddcaef3@linaro.org>
Date: Fri, 9 Mar 2018 14:25:23 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.6.0
MIME-Version: 1.0
In-Reply-To: <1520522698-16153-1-git-send-email-tmaimon77@gmail.com>
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
X-List-Received-Date: Fri, 09 Mar 2018 13:25:29 -0000


Applied, thanks.

  -- Daniel


-- 
 <http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog
