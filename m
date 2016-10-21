Return-Path: <f.fainelli@gmail.com>
Received: from mail-pf0-x244.google.com (mail-pf0-x244.google.com
 [IPv6:2607:f8b0:400e:c00::244])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3t0zQJ15LfzDvbb
 for <openbmc@lists.ozlabs.org>; Sat, 22 Oct 2016 08:31:36 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b=NYOko0Ju; 
 dkim-atps=neutral
Received: by mail-pf0-x244.google.com with SMTP id i85so9608685pfa.0
 for <openbmc@lists.ozlabs.org>; Fri, 21 Oct 2016 14:31:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=subject:to:references:cc:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding;
 bh=8LAdBniRGayXXTsPMoySBVHlSTWW+qi/7gbselJqx38=;
 b=NYOko0JuzijvQOY72jL7AsrveSCVQhVzp/HRSgM5jL6i3VaaT7y4JworLdkt3sTXk+
 dujf7qnZqprMfxOGf3ZN9YuTavdbsk42fHMqo9LaXjPmjgmRQWBHhDGOwfDySdAjrluR
 WEjimfAAp5ZMaib9JLKRLsOJw1KGo2TU3bchHX/VGR/EUlxJiu+3xyjU1qBFX7XS01+e
 UFCRyWFt2BAxOmInswdX7y1qedEhGNrkYnwxnjuCS8kyBWBHuxsNUXU86aW3nbXEApGx
 mY8Ex+O2oLHwb3jmC9LY8yhP7Vrjmwa9b3c9IUIsRZR/P9cTkv3M6x9YpnR9O7G0+Jow
 PUbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:subject:to:references:cc:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding;
 bh=8LAdBniRGayXXTsPMoySBVHlSTWW+qi/7gbselJqx38=;
 b=Sh3DdzyeovDMXNOGP0yP4bKSWcOnbxw/w1B/NTcsTMth6bL4GIe8Ddway4SGGsEso2
 4cGD/ONbvXOLML2dXIOJjN/8eIQr5ldtCfZk+TA9DgltYqeVWy+P2oQf45EEDFVvdWOg
 EZeVVwW4eOWXn3bSDikXCAdzJDV+WaaAOyJVmHSunJxeNCB7RoUD8Le4w/noRfY+VX3C
 JVhRTPGb+cDp+mUFmRcXDQeW8eLxP3uYRWMwV1Ji+MEfpr5nGzXMFPFwMJ1XCnWCc1bd
 wsKvBbWgiKIG+Rqwq61Wc81jxH0Q0pxKTUK8M0XxdIXn3kJGQX/tq1DU19VjJjHhzcLX
 KgfA==
X-Gm-Message-State: ABUngveuU4j7nW+RMlJSmvha7OrJRGNAwF8ACodsiV7D6S6nUsRp9mOtpo6I/dF905uP7g==
X-Received: by 10.98.70.208 with SMTP id o77mr5152336pfi.177.1477085494557;
 Fri, 21 Oct 2016 14:31:34 -0700 (PDT)
Received: from [10.112.156.244] ([192.19.255.250])
 by smtp.googlemail.com with ESMTPSA id a7sm7286951pan.34.2016.10.21.14.31.33
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 21 Oct 2016 14:31:34 -0700 (PDT)
Subject: Re: [PATCH 2/2] net: phy: broadcom: Add support for BCM54612E
To: Xo Wang <xow@google.com>
References: <1477070413-92621-1-git-send-email-xow@google.com>
 <1477070413-92621-3-git-send-email-xow@google.com>
Cc: davem@davemloft.net, jaedon.shin@gmail.com, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, openbmc@lists.ozlabs.org, joel@jms.id.au
From: Florian Fainelli <f.fainelli@gmail.com>
Message-ID: <964d671f-8994-802a-11a1-af16170e9b8f@gmail.com>
Date: Fri, 21 Oct 2016 14:31:32 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
 Thunderbird/45.3.0
MIME-Version: 1.0
In-Reply-To: <1477070413-92621-3-git-send-email-xow@google.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Mailman-Approved-At: Sat, 22 Oct 2016 11:42:42 +1100
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
X-List-Received-Date: Fri, 21 Oct 2016 21:31:36 -0000

On 10/21/2016 10:20 AM, Xo Wang wrote:
> This PHY has internal delays enabled after reset. This clears the
> internal delay enables unless the interface specifically requests them.
> 
> Signed-off-by: Xo Wang <xow@google.com>

Reviewed-by: Florian Fainelli <f.fainelli@gmail.com>

Cross checked with the datasheet, this all looks correct to me, thanks!
-- 
Florian
