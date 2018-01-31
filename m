Return-Path: <f.fainelli@gmail.com>
Authentication-Results: ozlabs.org; spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:400d:c0d::241; helo=mail-qt0-x241.google.com;
 envelope-from=f.fainelli@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="HYGDrOA0"; 
 dkim-atps=neutral
Received: from mail-qt0-x241.google.com (mail-qt0-x241.google.com
 [IPv6:2607:f8b0:400d:c0d::241])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3zWSkJ2r17zDqkr
 for <openbmc@lists.ozlabs.org>; Wed, 31 Jan 2018 14:03:35 +1100 (AEDT)
Received: by mail-qt0-x241.google.com with SMTP id i1so20055067qtj.8
 for <openbmc@lists.ozlabs.org>; Tue, 30 Jan 2018 19:03:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:subject:to:cc:references:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=0nbenLWKAKZe4OXNNgpOxyoDYsxfdDCIKGIERFtBFQI=;
 b=HYGDrOA0N3qiSpm0OXK19wAib0M9r/YUpXgwdsGFw1cwBEKjuBCj1PB0cn9hSuar/3
 pIa3vMXchftvHBnk+gIjBcNOmeUHV8JKkbcrNY4N31rrC9DYDFW3Lj/7m1vLhOucGvpH
 owtJtVz5q5IlcnEwDSRcOWcqqyv2LMY6o1DKi2zNicg8hIoh+B69aaJpO9fdM3CVORlh
 Nlbfeb7swtX++5KAyY0V6lZFDJ2fbXlXc1Yt0PMml5K6cA9JjFcPOVOc+hD1QNUbuWOm
 i2JznUGPbykxWYN10E7XqeHATcrkAqyY/vbMaEQbf3ZUFWvmgwqzJGbNjVoJmGdNd8iB
 G7kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:subject:to:cc:references:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=0nbenLWKAKZe4OXNNgpOxyoDYsxfdDCIKGIERFtBFQI=;
 b=iDojnMjZt0oyD26hKpzxyC75ReDunAoB0jt2viz8024BTHQ7Ni8Sbom1pQawNbh57K
 AMsoHAwssWOrrpG5EkZjeH7BI/1xoUgG1iArjyu85Afcy0AjqbM93sd9nZtQ2ny06EkF
 yjsG3E9aF1X/75Kbtrpr+RtY/CLljBZ1NLTVj3LxfGSoNPjczteZXTH7N1GY7rc9awl9
 bpPL4XR/fRNqHoB590JVfEq6YWXaxtu3Omye261+S5ye8rwF7FJxkOQO/SEVT8cEuBsb
 xjG6oI9wNMu8vEULoH47iW7uA0lx64oZncmDY+e541LVJivGcfI2Lwwy0m/QOIVkpL/m
 I+dw==
X-Gm-Message-State: AKwxytd1B01/4cFX8GZxdpam2p55dOvCumEuQclCjJY/eIuNI/um27XP
 hNqY/3T6pmtaUBQTsJNKpvU=
X-Google-Smtp-Source: AH8x224OJa5J3ZsT8vXS5T1d562nboUzwuIV8UXDuvU+UTuNFqIv5+++p4xRfLEyphH3KQ1umx3FEA==
X-Received: by 10.237.32.225 with SMTP id 88mr1231620qtb.99.1517367813567;
 Tue, 30 Jan 2018 19:03:33 -0800 (PST)
Received: from ?IPv6:2001:470:d:73f:60d3:5d7f:dbfa:245f?
 ([2001:470:d:73f:60d3:5d7f:dbfa:245f])
 by smtp.gmail.com with ESMTPSA id y29sm12774910qtk.47.2018.01.30.19.03.30
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 30 Jan 2018 19:03:32 -0800 (PST)
From: Florian Fainelli <f.fainelli@gmail.com>
Subject: Re: [patch v18 0/4] JTAG driver introduction
To: Oleksandr Shamray <oleksandrs@mellanox.com>, gregkh@linuxfoundation.org,
 arnd@arndb.de
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org, openbmc@lists.ozlabs.org, joel@jms.id.au,
 jiri@resnulli.us, tklauser@distanz.ch, linux-serial@vger.kernel.org,
 vadimp@mellanox.com, system-sw-low-level@mellanox.com, robh+dt@kernel.org,
 openocd-devel-owner@lists.sourceforge.net, linux-api@vger.kernel.org,
 davem@davemloft.net, mchehab@kernel.org
References: <1517236305-4880-1-git-send-email-oleksandrs@mellanox.com>
Message-ID: <ff739c26-d3b2-3df7-e751-fbf037ae96d1@gmail.com>
Date: Tue, 30 Jan 2018 19:03:29 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.5.0
MIME-Version: 1.0
In-Reply-To: <1517236305-4880-1-git-send-email-oleksandrs@mellanox.com>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.25
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Wed, 31 Jan 2018 03:03:37 -0000

On 01/29/2018 06:31 AM, Oleksandr Shamray wrote:
> When a need raise up to use JTAG interface for system's devices
> programming or CPU debugging, usually the user layer
> application implements jtag protocol by bit-bang or using a 
> proprietary connection to vendor hardware.
> This method can be slow and not generic.
>  
> We propose to implement general JTAG interface and infrastructure
> to communicate with user layer application. In such way, we can
> have the standard JTAG interface core part and separation from
> specific HW implementation.
> This allow new capability to debug the CPU or program system's 
> device via BMC without additional devices nor cost. 

Oleksandr, you have completed dodged my questions here:

https://lkml.org/lkml/2017/12/25/163

can you try to respond to some of these questions please?
-- 
Florian
