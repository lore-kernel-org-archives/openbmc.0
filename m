Return-Path: <joel.stan@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:400d:c0d::241; helo=mail-qt0-x241.google.com;
 envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="bV//QFO/"; 
 dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.b="IvHjF+90"; 
 dkim-atps=neutral
Received: from mail-qt0-x241.google.com (mail-qt0-x241.google.com
 [IPv6:2607:f8b0:400d:c0d::241])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 40WgC22dW1zDqGZ;
 Thu, 26 Apr 2018 11:55:57 +1000 (AEST)
Received: by mail-qt0-x241.google.com with SMTP id m5-v6so162171qti.1;
 Wed, 25 Apr 2018 18:55:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=v1/ERZ9NWXUY6GgFL64gzQApH28t8NkhM1YtLTTnynY=;
 b=bV//QFO/ephzpo9+QwwQ+adRY60IAWPIcLS7esjrGYY+baKfQO1OoF5I5zX8DBXzXq
 vYPf186oqZsipLhPba/vlB9yaXZfTgkyGCioKvDYMzgi60h4y/JYPY5CZEGQC7mHGAS0
 JbWuClEwHPNMxxg39tDVatp2KCHoZEZMPoX4uSs3oB1hHAcPFDNk7ec03XX+volhfeBA
 m9BbcGhMvj7EFH1skuRDU/W4F2+1sJslT7SxfB5OyCg/OHLbDZoFit7hkcqvEaQsOrW5
 q6LMLOh8kp1tyiNIg4V95IGmuVOA/a8A1GQlvcRQ39zCulVpfEBsVlqxD2yazBws0qSH
 bvaQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=v1/ERZ9NWXUY6GgFL64gzQApH28t8NkhM1YtLTTnynY=;
 b=IvHjF+907RIeL9DhmgbVAajfzlBXdRS4r7UEdL3X9Rv/yBYQs5oPbGVCh6hdjEYxQG
 gjrqDmL9HqiYkJyJt4wsve71GmuRqg6Z4XofbCz9NBEVCPS8fN4BBtYH8Molb25fgdlW
 wmNolglzeZpEH+1uCMAIf99GS534VMWONt8Fg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=v1/ERZ9NWXUY6GgFL64gzQApH28t8NkhM1YtLTTnynY=;
 b=t8Tq5D98TlPZnusBisPMqqRomvp7NOAU2eB9vNRtng/VqfjudBycDiapMhjYAAH/Up
 VLpLTFlnzbQn3hpBM90ykZzf66eB8MhcmYdF1sK4Q3anRtpDQ6vFd9WUICetwer8JW3B
 q6hl04oLOQ+URiUVzu9cn+KSqt3FzUmw/StLZlOJqWosFAIShxNsv3cAlyS9hISZuPR4
 OdDwXb1AWA0uOfOleez/9GzuB2+yAsHiw3TXLmmweAXLQOs8rEp7NHbq6B9laRu/iX6o
 bECptENt8Oek1Hmxj34iaObCvdyqWl/2tyi/py53fEAQMSqDuQQOSBmo1UmBgCOV5M4D
 3aiQ==
X-Gm-Message-State: ALQs6tAj9BUSI6yMvCGrRRs/eIKjLLVyeyxYLFggoJZT5r8TUsw7SVZY
 5tkwVn6misbjFazG2Dx9aTbIjuSCpwhnFZF9OEg=
X-Google-Smtp-Source: AB8JxZox0atozSdn8f2eyctzkz1z4NBeLkkbPMuLLbUsZdHolvld7szygujZmtHuPDFWF/d6NzxODRI7j1MPWRw33EY=
X-Received: by 10.12.155.138 with SMTP id o10mr10525652qve.89.1524707754301;
 Wed, 25 Apr 2018 18:55:54 -0700 (PDT)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.200.24.79 with HTTP; Wed, 25 Apr 2018 18:55:33 -0700 (PDT)
In-Reply-To: <20180424224056.23384-1-jae.hyun.yoo@linux.intel.com>
References: <20180424224056.23384-1-jae.hyun.yoo@linux.intel.com>
From: Joel Stanley <joel@jms.id.au>
Date: Thu, 26 Apr 2018 11:25:33 +0930
X-Google-Sender-Auth: jVxfbwcuwVOrMKKocJNfbgTNkaY
Message-ID: <CACPK8Xe99zZ9Q0Y2HqoaGDXigBaZpkTcbfRe=gvsR5x6XMWzYA@mail.gmail.com>
Subject: Re: [PATCH linux dev-4.13] clk:aspeed: Fix reset bits for PCI/VGA and
 PECI
To: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
Cc: Andrew Jeffery <andrew@aj.id.au>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>, 
 linux-aspeed@lists.ozlabs.org, OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: text/plain; charset="UTF-8"
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
X-List-Received-Date: Thu, 26 Apr 2018 01:56:01 -0000

Hello Jae,

On 25 April 2018 at 08:10, Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com> wrote:
> This commit fixes incorrect setting of reset bits for PCI/VGA and
> PECI modules.
>
> 1. Reset bit for PCI/VGA is 8.
> 2. PECI reset logic is missing so added bit 10 as its reset bit.

Great find!

Can you please send these upstream as a fix? Apply to 4.17-rc2, and
use get_maintainers.pl to identify the lists to send it to.

Also add:

Fixes: 15ed8ce5f84e ("clk: aspeed: Register gated clocks")
Cc: stable <stable@vger.kernel.org>

> +++ b/include/dt-bindings/clock/aspeed-clock.h
> @@ -43,8 +43,8 @@
>  #define ASPEED_RESET_ADC               2
>  #define ASPEED_RESET_JTAG_MASTER       3
>  #define ASPEED_RESET_MIC               4
> -#define ASPEED_RESET_PWM               5
> -#define ASPEED_RESET_PCIVGA            6
> +#define ASPEED_RESET_PECI              5
> +#define ASPEED_RESET_PWM               6

This numbers form the kernel ABI, so we shouldn't be changing them.
However, none of the mainline device trees use PCIVGA, so we can
rename that without breaking any one.

If we leave PWM as 5, and rename PCIVGA to PECI, we won't break any
existing device trees.

Cheers,

Joel


>  #define ASPEED_RESET_I2C               7
>  #define ASPEED_RESET_AHB               8
>  #define ASPEED_RESET_CRT1              9
> --
> 2.7.4
>
