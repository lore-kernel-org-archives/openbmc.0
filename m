Return-Path: <f.fainelli@gmail.com>
Authentication-Results: ozlabs.org; spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4003:c0f::229; helo=mail-ot0-x229.google.com;
 envelope-from=f.fainelli@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="KfJky8Tm"; 
 dkim-atps=neutral
Received: from mail-ot0-x229.google.com (mail-ot0-x229.google.com
 [IPv6:2607:f8b0:4003:c0f::229])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3z5FQY5fMpzDqmV
 for <openbmc@lists.ozlabs.org>; Tue, 26 Dec 2017 10:17:57 +1100 (AEDT)
Received: by mail-ot0-x229.google.com with SMTP id d5so30250862oti.3
 for <openbmc@lists.ozlabs.org>; Mon, 25 Dec 2017 15:17:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=FepHf0WUYpUR/fRf8zlc8tMmTFAZtywtFplKfuXhsLI=;
 b=KfJky8TmQ/Cx/r7WuL9C+x8+BavuTAy14N6A7TzQJzCrE6D3HvMpmrWleNulRHVcb0
 PKINbx0/jlOt5Sl8+mFGof2DobdZotdkccRjvVvhiRMDNUiImDpBaw1oEOiWMeUfKayX
 r8gscoLGn39HPcyaCLx7/qqn5Xoze7nMqUJ/QeVM/pSvTffHZikPzU4zBC/dFncfosv/
 GTZ5g7N+Q/Y/2MmzNlmBOQZhevc8MiDwt8N/9aD815ZhLY0sZoiHaQRroIl2t1criOv0
 qtsFm9FkPWtDGwDhecYmIKXb1TtCGBjivZnYOZBjcSJe/xXnvJO23VRRXhUcAEX8LxRz
 Z5IQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=FepHf0WUYpUR/fRf8zlc8tMmTFAZtywtFplKfuXhsLI=;
 b=lHZJbTufuyucOQ0y437wAU+M+Dl43sfykIATJUJn1egH5kpSbyC7pikUhKLhgepTze
 56ajSxpHQC5dveWKuiE5pXy3Ao6130t6DfPG4l4d/GkZFouIxlURKOaJ42dF336Xyf0B
 WsGhMKxePBOVoTa/7/Utr3QIdR10YyFQkGrq7hcz/dSWz++2jhCAWSBArzcx2No/upXS
 DjyD4IXLZgsbwQaNNFTX/a95O78yN0Ri3t2920UsrxwW6zwiVxLmv3AHPSrbGzLOi5RX
 EGCdfIejV5F+PXo+BelyTeB8mdFLDHqRbnoWH3JepMSYD90SAwCFnNh+wLnwan5SzkwG
 Wmeg==
X-Gm-Message-State: AKGB3mKnUbm0YMvm1BOsGhmACmsM49V69AyJl8Qndc+KA1dbxse4PYX7
 j9TsYum6ZYzBHUoULq53XeI=
X-Google-Smtp-Source: ACJfBouYjqnUpoqWBHlyXMxD4sC29EP7p/UtMDIq+bRksIMd7jbd2S0Jg//b1Eie8hkUC94ksaHEXA==
X-Received: by 10.157.41.147 with SMTP id n19mr19159262otb.132.1514243875183; 
 Mon, 25 Dec 2017 15:17:55 -0800 (PST)
Received: from [192.168.1.2] (ip68-109-195-31.pv.oc.cox.net. [68.109.195.31])
 by smtp.googlemail.com with ESMTPSA id
 14sm2946338otj.76.2017.12.25.15.17.51
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 25 Dec 2017 15:17:53 -0800 (PST)
Subject: Re: [patch v15 0/4] JTAG driver introduction
To: Oleksandr Shamray <oleksandrs@mellanox.com>, gregkh@linuxfoundation.org,
 arnd@arndb.de
Cc: system-sw-low-level@mellanox.com, devicetree@vger.kernel.org,
 jiri@resnulli.us, vadimp@mellanox.com, linux-api@vger.kernel.org,
 openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 openocd-devel-owner@lists.sourceforge.net, robh+dt@kernel.org,
 joel@jms.id.au, linux-serial@vger.kernel.org, tklauser@distanz.ch,
 mchehab@kernel.org, davem@davemloft.net, linux-arm-kernel@lists.infradead.org
References: <1514202808-29747-1-git-send-email-oleksandrs@mellanox.com>
From: Florian Fainelli <f.fainelli@gmail.com>
Message-ID: <4425f51e-d3b3-3555-7afd-5dd1b1e698fa@gmail.com>
Date: Mon, 25 Dec 2017 15:17:50 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.5.0
MIME-Version: 1.0
In-Reply-To: <1514202808-29747-1-git-send-email-oleksandrs@mellanox.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
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
X-List-Received-Date: Mon, 25 Dec 2017 23:17:58 -0000

Le 12/25/17 à 03:53, Oleksandr Shamray a écrit :
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

Well, the framework in its current shape is still extremely simplistic,
therefore leaving a lot of room (read: bugs, inconsistencies) within the
hands of the driver, so while the user-space interface is standard
through the proposed character device, the user experience, likely might
not.

> This allow new capability to debug the CPU or program system's 
> device via BMC without additional devices nor cost. 

If that is the case, should not we leverage the kernel's device driver
model and expect the JTAG framework to create specific devices for the
different pieces of HW discovered on the scan chain? That would also
presumably allow the core JTAG framework to retain the necessary state
changes in order to address one particular device within the scan chain.

> 
> This patch purpose is to add JTAG master core infrastructure by 
> defining new JTAG class and provide generic JTAG interface
> to allow hardware specific drivers to connect this interface.
> This will enable all JTAG drivers to use the common interface
> part and will have separate for hardware implementation.

Let's consider I want to get rid of OpenOCD, or rather, move its driver
interface within the kernel and replace it on the OpenOCD side with a
generic character device interface. I could presumably amortize the
costly operations which are currently I/O and/or system call limiting
when running in user-space, what would it look like with your proposed
framework, have you given some thoughts about that?

Thanks!
-- 
Florian
