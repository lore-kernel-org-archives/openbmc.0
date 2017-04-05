Return-Path: <sboyd@codeaurora.org>
Received: from smtp.codeaurora.org (smtp.codeaurora.org [198.145.29.96])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3vyzzs6yWdzDqLG
 for <openbmc@lists.ozlabs.org>; Thu,  6 Apr 2017 07:50:49 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=codeaurora.org header.i=@codeaurora.org
 header.b="XoP1vMtF"; 
 dkim=pass (1024-bit key) header.d=codeaurora.org header.i=@codeaurora.org
 header.b="XoP1vMtF"; dkim-atps=neutral
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
 id E5AED60DB2; Wed,  5 Apr 2017 21:50:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
 s=default; t=1491429047;
 bh=4Srh9Vphx/hIEDRHwc/TGNZ+w5o4cG6Tgt/sUL2hBhQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=XoP1vMtFhtIRZJBwqpXj82avzJJWOw0AbnA5Qs2ETCCcA6Gk+vTWdLnBD2aBXLfZw
 s/3ZS07XbKgsW4EtxNGeQVz9PnRdmCh7vf7I1CWfSWtOZm6XOieT4OS5vo3x2VUjDH
 4DUMTLsqWMANwysYiA7Y56D5y6Qfq5feRRLGN5c4=
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 pdx-caf-mail.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.8 required=2.0 tests=ALL_TRUSTED,BAYES_00,
 DKIM_SIGNED,T_DKIM_INVALID autolearn=no autolearn_force=no version=3.4.0
Received: from localhost (i-global254.qualcomm.com [199.106.103.254])
 (using TLSv1.2 with cipher DHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: sboyd@smtp.codeaurora.org)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id ECECD60DAB;
 Wed,  5 Apr 2017 21:50:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
 s=default; t=1491429047;
 bh=4Srh9Vphx/hIEDRHwc/TGNZ+w5o4cG6Tgt/sUL2hBhQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=XoP1vMtFhtIRZJBwqpXj82avzJJWOw0AbnA5Qs2ETCCcA6Gk+vTWdLnBD2aBXLfZw
 s/3ZS07XbKgsW4EtxNGeQVz9PnRdmCh7vf7I1CWfSWtOZm6XOieT4OS5vo3x2VUjDH
 4DUMTLsqWMANwysYiA7Y56D5y6Qfq5feRRLGN5c4=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org ECECD60DAB
Authentication-Results: pdx-caf-mail.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: pdx-caf-mail.web.codeaurora.org;
 spf=none smtp.mailfrom=sboyd@codeaurora.org
Date: Wed, 5 Apr 2017 14:50:46 -0700
From: Stephen Boyd <sboyd@codeaurora.org>
To: Jonathan Cameron <jic23@kernel.org>
Cc: Rick Altherr <raltherr@google.com>, openbmc@lists.ozlabs.org,
 linux-kernel@vger.kernel.org,
 William Breathitt Gray <vilhelm.gray@gmail.com>,
 Michael Turquette <mturquette@baylibre.com>,
 Andreas Klinger <ak@it-klinger.de>, Rob Herring <robh@kernel.org>,
 Peter Meerwald-Stadler <pmeerw@pmeerw.net>,
 Quentin Schulz <quentin.schulz@free-electrons.com>,
 linux-iio@vger.kernel.org, Zhiyong Tao <zhiyong.tao@mediatek.com>,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 Lars-Peter Clausen <lars@metafoo.de>,
 Raveendra Padasalagi <raveendra.padasalagi@broadcom.com>,
 Scott Branden <scott.branden@broadcom.com>,
 Crestez Dan Leonard <leonard.crestez@intel.com>,
 Akinobu Mita <akinobu.mita@gmail.com>,
 Fabrice Gasnier <fabrice.gasnier@st.com>,
 Hartmut Knaack <knaack.h@gmx.de>, linux-clk@vger.kernel.org
Subject: Re: [PATCH v5 2/2] iio: Aspeed ADC
Message-ID: <20170405215046.GE7065@codeaurora.org>
References: <20170328215259.31622-1-raltherr@google.com>
 <20170328215259.31622-2-raltherr@google.com>
 <d05cadfe-e3d3-f4e8-129f-19dcd2f637da@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d05cadfe-e3d3-f4e8-129f-19dcd2f637da@kernel.org>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Mailman-Approved-At: Thu, 06 Apr 2017 09:25:23 +1000
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
X-List-Received-Date: Wed, 05 Apr 2017 21:50:50 -0000

On 04/01, Jonathan Cameron wrote:
> On 28/03/17 22:52, Rick Altherr wrote:
> > Aspeed BMC SoCs include a 16 channel, 10-bit ADC. Low and high threshold
> > interrupts are supported by the hardware but are not currently implemented.
> > 
> > Signed-off-by: Rick Altherr <raltherr@google.com>
> Two really trivial things inline. I'll fix them whilst applying rather than
> having you do a v6 - please do sanity check I haven't messed it up though!
> 
> Applied to the togreg branch of iio.git and pushed out as testing for
> the autobuilders to play with it.
> 

Oh I was too late. Blame work. Anyway, I made some comments on
v4. If they're fixed in a later patch or discussed on list that's
fine. No worries on my end.

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
