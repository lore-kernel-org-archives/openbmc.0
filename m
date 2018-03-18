Return-Path: <robherring2@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=209.85.192.194; helo=mail-pf0-f194.google.com;
 envelope-from=robherring2@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=kernel.org
Received: from mail-pf0-f194.google.com (mail-pf0-f194.google.com
 [209.85.192.194])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 403zcZ2cFnzDqlT
 for <openbmc@lists.ozlabs.org>; Sun, 18 Mar 2018 23:52:29 +1100 (AEDT)
Received: by mail-pf0-f194.google.com with SMTP id x1so5958220pfh.7
 for <openbmc@lists.ozlabs.org>; Sun, 18 Mar 2018 05:52:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=bKRo04fsokIMHHWr2JemwABx4e+qhuZ8iULXDvWYMfI=;
 b=S9vIwDlQgKZ26K0P6J648JG8nlX5Q81B8B5pO8CNcmplTsgQsWsfKVb/kC5y90tmWa
 09iz//FofHRS+j1QhIu4rqRbdaC9LPGm3hjo6Zh9TtY1yTEN4a0+cQ076bRLEMl1CGg7
 kSuqADj+MF/wBatQOxvG81u/fpEBRCyyoxXhn9kxdm26HcpNsXP2BG2xIqSJOiFF3C89
 Isa0PsbmsTmCanxrNEI/CIQRTGclIJUrcB+qiZAg3coFv+MqEuRyjj90CHk3jRAcbMBV
 nNkK4sVQ2n58JJ6ef6VbhLQYYJ0OaK+vLoQ0O3JKybcCvJegj9A5eAMFkUjhNSIVouER
 0M4g==
X-Gm-Message-State: AElRT7FUbZ6ETs6SWMBCG0bKm8J59VmQ453qGbkXJpglIMmyPFpfU0yY
 OQvLM5K0bvfZ9FZZYzN0cA==
X-Google-Smtp-Source: AG47ELuwMRAK6eFvbNWycGvaafFvD3xIaVfAiw4OiekJhyUeCbSXZc+hh2HJQ8aeXBs51w8TaN9Bvg==
X-Received: by 10.98.138.66 with SMTP id y63mr7203092pfd.12.1521377547504;
 Sun, 18 Mar 2018 05:52:27 -0700 (PDT)
Received: from localhost (165084180235.ctinets.com. [165.84.180.235])
 by smtp.gmail.com with ESMTPSA id z28sm15102915pgc.15.2018.03.18.05.52.26
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Sun, 18 Mar 2018 05:52:27 -0700 (PDT)
Date: Sun, 18 Mar 2018 07:52:25 -0500
From: Rob Herring <robh@kernel.org>
To: Tali Perry <tali.perry1@gmail.com>
Cc: brendanhiggins@google.com, mark.rutland@arm.com, linux@armlinux.org.uk,
 avifishman70@gmail.com, tmaimon77@gmail.com, raltherr@google.com,
 mturquette@baylibre.com, sboyd@codeaurora.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, openbmc@lists.ozlabs.org,
 linux-clk@vger.kernel.org
Subject: Re: [PATCH v11 1/2] clk: npcm750: Add binding for Nuvoton NPCM7XX
 clock\n
Message-ID: <20180318125225.sp7ppfumxhcbzbfm@rob-hp-laptop>
References: <1521121518-32217-1-git-send-email-tali.perry1@gmail.com>
 <1521121518-32217-2-git-send-email-tali.perry1@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1521121518-32217-2-git-send-email-tali.perry1@gmail.com>
User-Agent: NeoMutt/20170609 (1.8.3)
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
X-List-Received-Date: Sun, 18 Mar 2018 12:52:31 -0000

On Thu, Mar 15, 2018 at 03:45:17PM +0200, Tali Perry wrote:
> * Nuvoton NPCM7XX Clock Controller

Trailing '\n' on the subject.
> 
> Nuvoton Poleg BMC NPCM7XX contains an integrated clock controller, which
> generates and supplies clocks to all modules within the BMC.
> 
> 10 ==> 11
> update documentation. "eth" replaced with "ethernet" in use case eaxample.
> 
> 2 ==> 10
> update documentation. add external clocks as inputs to clk driver.
> fix SPDX comment.
> 
> 1 ==> 2
> This patch includes fix request described here:
> https://patchwork.kernel.org/patch/10200033/
> (move fixed clocks to DT)

Changelog goes after the '---' so it doesn't end up in the git commit.

> 
> Signed-off-by: Tali Perry <tali.perry1@gmail.com>
> 
> ---
> 
> 
>  .../bindings/clock/nuvoton,npcm750-clk.txt         | 100 +++++++++++++++++++++
>  include/dt-bindings/clock/nuvoton,npcm7xx-clock.h  |  44 +++++++++
>  2 files changed, 144 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/clock/nuvoton,npcm750-clk.txt
>  create mode 100644 include/dt-bindings/clock/nuvoton,npcm7xx-clock.h

With those fixed,

Reviewed-by: Rob Herring <robh@kernel.org>
