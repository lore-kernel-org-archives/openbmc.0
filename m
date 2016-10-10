Return-Path: <linus.walleij@linaro.org>
Received: from mail-oi0-x229.google.com (mail-oi0-x229.google.com
 [IPv6:2607:f8b0:4003:c06::229])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3sssww6mBbzDrbq
 for <openbmc@lists.ozlabs.org>; Mon, 10 Oct 2016 19:00:00 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=linaro.org header.i=@linaro.org header.b=br6UTiql; 
 dkim-atps=neutral
Received: by mail-oi0-x229.google.com with SMTP id m72so119021337oik.3
 for <openbmc@lists.ozlabs.org>; Mon, 10 Oct 2016 01:00:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=3iUNBkhF/pGw4pQnlAP64nQ9Xdp5W/xrUKc9WBbvpbQ=;
 b=br6UTiqlOcOH98cL3yuDEe0fRcWFgQrIeXAkW+5P4T2vEGnii0K2UJDJRglHkrGAWh
 mss61d6+l9dMw7xjo0GwsF+TitC8YuiafIOq4EycqwKzjaBwpOQzhDbXbry6WvsA1jKi
 b1Fv4x5lNkaazJF+lW4fCJ2E2IVrcjMyMBiEY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=3iUNBkhF/pGw4pQnlAP64nQ9Xdp5W/xrUKc9WBbvpbQ=;
 b=QKE6ha/6Ly7x/68b4yRYee7I/WDgjJ7GUdHtellv0sc9DD00afXl8UkgVH3uRIdwcM
 JaMKGCYfFB6rZBucA577K7FDeIzsLs1QmVLUX2UWbl7UOB2qcUzg6FZxMIDfgL7ap9QX
 KU75a37GyDZcIgpoZ3Uqi0bG6RWBGUEauuT4T0M+XtsZl5ItQgBwcrr5i4jGmfQlC3mr
 FHB0OrqwMW36DJWiSof86Qle/9QMpuxFan8N6hAt0lhOCjuHHt66TMXfFrU8dqTFKNpt
 JruDsKD1r5PpvXkbCUW2MrYZYbnds7WKPQ65mOT8jmz5Q8C4HG20ANhrQgqB9ZzyEdqe
 YS1w==
X-Gm-Message-State: AA6/9RnO+/pQuqld11ABCpbwPt+sZTEaC/q/aVAG2HVk4+G9S7tv/1bpwkmKGlAKh6e9jkMluZNV3X+J5g3bv4Q/
X-Received: by 10.202.50.67 with SMTP id y64mr4568679oiy.50.1476086398530;
 Mon, 10 Oct 2016 00:59:58 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.182.146.12 with HTTP; Mon, 10 Oct 2016 00:59:57 -0700 (PDT)
In-Reply-To: <cover.115463f791b69859c5ce9dafd61a5755ea039f4b.1474986045.git-series.andrew@aj.id.au>
References: <cover.115463f791b69859c5ce9dafd61a5755ea039f4b.1474986045.git-series.andrew@aj.id.au>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 10 Oct 2016 09:59:57 +0200
Message-ID: <CACRpkdZWbx1_SYJMOn40teQaEw1JAq80kDAp7N+OYaMRRO6NBg@mail.gmail.com>
Subject: Re: [PATCH 0/8] pinctrl: aspeed: Fixes for core and g5, implement
 remaining pins
To: Andrew Jeffery <andrew@aj.id.au>
Cc: Joel Stanley <joel@jms.id.au>, Mark Rutland <mark.rutland@arm.com>, 
 Rob Herring <robh+dt@kernel.org>, 
 "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, 
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, 
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 openbmc@lists.ozlabs.org
Content-Type: text/plain; charset=UTF-8
X-Mailman-Approved-At: Mon, 10 Oct 2016 19:54:26 +1100
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
X-List-Received-Date: Mon, 10 Oct 2016 08:00:01 -0000

On Tue, Sep 27, 2016 at 4:50 PM, Andrew Jeffery <andrew@aj.id.au> wrote:

> The initial Aspeed pinctrl patches implemented a subset of pins for each of the
> g4 and g5 SoCs. This series provides a number of fixes to the initial patches,
> mostly for issues identified in the g5 driver. The fixes account for the first
> half of the series (up to and including "pinctrl: aspeed-g5: Fix pin
> association of SPI1 function") and should be applied for 4.9.

Those are applied for fixes.

> The second half, from "pinctrl: aspeed: Enable capture of off-SCU pinmux
> state", implements some additional functionality in the core engine for the
> Aspeed SoCs and follows up with patches implementing mux configuration tables
> for all remaining pins. Given the significant additions in the last few
> patches, their lateness in the cycle and the light testing they have received
> they are best left for 4.10, but I'm keen to get them out for review.

I'm holding these back until v4.9-rc1 is out.

Yours,
Linus Walleij
