Return-Path: <robherring2@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=209.85.214.66; helo=mail-it0-f66.google.com;
 envelope-from=robherring2@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=fail (p=none dis=none) header.from=kernel.org
Received: from mail-it0-f66.google.com (mail-it0-f66.google.com
 [209.85.214.66])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 41mjsX3TKyzDqgF
 for <openbmc@lists.ozlabs.org>; Fri, 10 Aug 2018 08:41:20 +1000 (AEST)
Received: by mail-it0-f66.google.com with SMTP id v71-v6so231133itb.3
 for <openbmc@lists.ozlabs.org>; Thu, 09 Aug 2018 15:41:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:date:from:to:subject:references
 :in-reply-to:cc:cc:status:lines;
 bh=yxo9iveNN6kDZ8fDNtmg8eg2v8lFrmhciyFI/ZkLH+A=;
 b=jO4vcERTW1FesSMJhnmwWEDBApSNx7hq7xTfLOq5hpUmglrudD7eqe9xww0EKtmh+s
 vcplXI6b2ypUcwJz15zo3AWTr/hoSEpcZBQjGNC3WBqzQvrhldRILIcT6ydqyyxOW24j
 W4pfakwb6y/S5/zhAKbFEh4ih6tJ1/QkrSiNdgY/bx6h+/3htahKaMtsWJs1WacA1w9E
 OWIr3KcAfTZnWf0rH6Qr0imQrbxgjvArNLx2+uG+79hfiWODMEfDb/XSMmniCKW1OXlJ
 AbvM6HmIMw+GmIUD97Fln9SuTdQkdePkUh6MpIUqIaIN0ay6V858uhESZB9jN0Yemcpx
 udKw==
X-Gm-Message-State: AOUpUlH8qdEgFBRpXAmdGjdhyZZRHt9ESoOdzDfYSQ03lxT9bGOLUsgu
 V713hxKGf7OY3RIo/Ja/tA==
X-Google-Smtp-Source: AA+uWPz60G/XBGrNAjRIqzfkTwcIHBflNOTQlGeLg+vZbbI73orj6CCbHRYiJ+SDcuX97pltID9Ntw==
X-Received: by 2002:a24:2f09:: with SMTP id j9-v6mr180511itj.86.1533854477946; 
 Thu, 09 Aug 2018 15:41:17 -0700 (PDT)
Received: from localhost ([24.51.61.72])
 by smtp.gmail.com with ESMTPSA id i199-v6sm186866ita.11.2018.08.09.15.41.17
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Thu, 09 Aug 2018 15:41:17 -0700 (PDT)
Message-ID: <5b6cc30d.1c69fb81.d8527.11e1@mx.google.com>
Date: Thu, 09 Aug 2018 16:41:16 -0600
From: Rob Herring <robh@kernel.org>
To: tali.perry1@gmail.com
Subject: Re: [PATCH v2 1/2] dt-binding: i2c: npcm7xx: add binding for i2c
 controller
References: <20180807110709.31847-1-tali.perry1@gmail.com>
 <20180807110709.31847-2-tali.perry1@gmail.com>
In-Reply-To: <20180807110709.31847-2-tali.perry1@gmail.com>
Cc: tali.perry1@gmail.com, avifishman70@gmail.com, tmaimon77@gmail.com,
 venture@google.com, yuenn@google.com, brendanhiggins@google.com,
 robh+dt@kernel.org, mark.rutland@arm.com, davem@davemloft.net,
 mchehab+samsung@kernel.org, gregkh@linuxfoundation.org,
 akpm@linux-foundation.org, arnd@arndb.de, wsa@the-dreams.de,
 andriy.shevchenko@linux.intel.com, pierre-yves.mordret@st.com,
 cedric.madianga@gmail.com, baolin.wang@spreadtrum.com,
 jarkko.nikula@linux.intel.com, hdegoede@redhat.com, rmk+kernel@armlinux.org.uk,
 ard.biesheuvel@linaro.org, thor.thayer@linux.intel.com, geert@linux-m68k.org,
 heikki.krogerus@linux.intel.com, tglx@linutronix.de
Cc: linux-i2c@vger.kernel.org, openbmc@lists.ozlabs.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
X-Mailman-Approved-At: Fri, 10 Aug 2018 10:59:07 +1000
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.27
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Thu, 09 Aug 2018 22:41:21 -0000

Hi, this is an automated email from Rob's (experimental) review bot. I
found a couple of common problems with your patch. Please see below.

On Tue,  7 Aug 2018 14:07:08 +0300, Tali Perry wrote:
> Nuvoton NPCM7XX I2C Controller
> NPCM7xx includes 16 I2C contollers. THis driver operates the controller.
> This module also includes a slave mode, which will be submitted later on.
> 
> Any feedback would be appreciated.  
> 
> v2 -> v1:
> 	- run check patch in strict mode.
> 	- use linux crc.
> 	- define regs in constant offset without base.
> 	- remove debug prints.
> 	- no declerations for local functions.
> 	
> v1: initial version
> 
> Signed-off-by: Tali Perry <tali.perry1@gmail.com>
> 

The preferred subject prefix is "dt-bindings: <binding dir>: ...".

> ---
>  .../devicetree/bindings/i2c/i2c-npcm7xx.txt        | 27 ++++++++++++++++++++++
>  MAINTAINERS                                        |  8 +++++++
>  2 files changed, 35 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/i2c/i2c-npcm7xx.txt
> 
