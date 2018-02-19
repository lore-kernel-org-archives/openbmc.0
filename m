Return-Path: <robherring2@gmail.com>
Authentication-Results: ozlabs.org; spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=209.85.218.66; helo=mail-oi0-f66.google.com;
 envelope-from=robherring2@gmail.com; receiver=<UNKNOWN>)
Received: from mail-oi0-f66.google.com (mail-oi0-f66.google.com
 [209.85.218.66])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3zlRTj0df3zDr3W
 for <openbmc@lists.ozlabs.org>; Tue, 20 Feb 2018 01:49:09 +1100 (AEDT)
Received: by mail-oi0-f66.google.com with SMTP id c12so420495oic.7
 for <openbmc@lists.ozlabs.org>; Mon, 19 Feb 2018 06:49:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=MMuC4Nns+PAV1kptk8GYLGqT5seNkbQOT/SiKV1Dua8=;
 b=QTJjDBCLBOoWFgJ/6qF3FA1YGw6LbKFc4ahpiOVkYC31S4ks7NEzNaUf3QBFnYKHRy
 jynDsRFTfBmDhim6qyxIuOM2cWR56srcU7OwdDl1UeLiyIZfwEcymUPmuLB3jS2L4S+3
 Nv+kbfIPbWONYo3eMSx8rzTEyG9RYScl25uvpZR2jmqO6zv1dE+AfKaWYw+NQAU65ZE/
 pnOV1Jk1/NxjOwFmgBmgBzoonJoivw6mxOq+dqPFEhsfXcosrX4xVvxo56cgg/wQfwWl
 NjtPLJFJjVvRkKeKiw5aoJQPM3zTLGKtER67XDRWCezn58AdoeLKc9Rwp6GiogbtQcjy
 DvdA==
X-Gm-Message-State: APf1xPCLksKiHOtPLt1IikGEMD9gduVMrFS5YgyWIJCvR4CEEYA/3vTY
 TyF6svoZEfSiy3CbgAQJiw==
X-Google-Smtp-Source: AH8x227tILHqsR0882CgUexROVoPzpvvMW0w3TfXk795FKTBSJWeVyOX0Bg/Cx9yEOh7ie/M2fMi+g==
X-Received: by 10.202.227.7 with SMTP id a7mr9961610oih.193.1519051747104;
 Mon, 19 Feb 2018 06:49:07 -0800 (PST)
Received: from localhost (216-188-254-6.dyn.grandenetworks.net.
 [216.188.254.6])
 by smtp.gmail.com with ESMTPSA id 92sm422079oth.9.2018.02.19.06.49.06
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Mon, 19 Feb 2018 06:49:06 -0800 (PST)
Date: Mon, 19 Feb 2018 08:49:05 -0600
From: Rob Herring <robh@kernel.org>
To: Brendan Higgins <brendanhiggins@google.com>
Cc: Tali Perry <tali.perry1@gmail.com>, Mark Rutland <mark.rutland@arm.com>,
 Russell King <linux@armlinux.org.uk>, Avi Fishman <avifishman70@gmail.com>,
 Tomer Maimon <tmaimon77@gmail.com>, Rick Altherr <raltherr@google.com>,
 devicetree <devicetree@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Nancy Yuen <yuenn@google.com>, Patrick Venture <venture@google.com>
Subject: Re: [PATCH v2 1/1] clk: npcm750: update text with fixed clocks
Message-ID: <20180219144905.bfrycjnas7dcuo34@rob-hp-laptop>
References: <1518701959-22899-1-git-send-email-tali.perry1@gmail.com>
 <1518701959-22899-2-git-send-email-tali.perry1@gmail.com>
 <CAFd5g44gBJp0-mYEWGdyiA67BCi2pZWAG2bYPS-WdJEwH1oA5A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAFd5g44gBJp0-mYEWGdyiA67BCi2pZWAG2bYPS-WdJEwH1oA5A@mail.gmail.com>
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
X-List-Received-Date: Mon, 19 Feb 2018 14:49:13 -0000

On Thu, Feb 15, 2018 at 02:38:12PM -0800, Brendan Higgins wrote:
> On Thu, Feb 15, 2018 at 5:39 AM, Tali Perry <tali.perry1@gmail.com> wrote:
> >
> > Signed-off-by: Tali Perry <tali.perry1@gmail.com>
> >
>  <snip>
> 
> I think this should probably be rolled into [PATCH v2 1/1] npcm750: add fixed
> clocks (moved from drivers/clk/clk-npcm7xx.c):
> https://www.spinics.net/lists/arm-kernel/msg634678.html

No, binding docs, dts files and driver code should all be separate 
patches.

Rob
