Return-Path: <sboyd@kernel.org>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=kernel.org
 (client-ip=198.145.29.99; helo=mail.kernel.org; envelope-from=sboyd@kernel.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.b="o/fx3Dzu"; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4226Vp2zB3zF39P;
 Sat,  1 Sep 2018 03:56:34 +1000 (AEST)
Received: from localhost (unknown [104.132.0.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id E6E5C2083A;
 Fri, 31 Aug 2018 17:56:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1535738192;
 bh=KG/3ythGtcjo33PlyAHYtmrvADEPn7PWnFoiFtJ0yLA=;
 h=To:From:In-Reply-To:Cc:References:Subject:Date:From;
 b=o/fx3Dzu3V4NriwOyhgAY9l7+jOHQgqky0YgQ5sBNYZHlQMqjv/wOQzZvima31JfR
 +d15FqGaL5yTzV4kesIgHkgXXuUkfsK7rmeJurIRGoV8kWWmO6EcCGGkf2HdLt4YzG
 LbPLVkKEKT2whareylqNSdZEM88/NmLt26JVx0dk=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
To: Eddie James <eajames@linux.vnet.ibm.com>, linux-kernel@vger.kernel.org
From: Stephen Boyd <sboyd@kernel.org>
In-Reply-To: <1535576973-8067-1-git-send-email-eajames@linux.vnet.ibm.com>
Cc: linux-media@vger.kernel.org, linux-aspeed@lists.ozlabs.org,
 openbmc@lists.ozlabs.org, andrew@aj.id.au, mchehab@kernel.org,
 joel@jms.id.au, robh+dt@kernel.org, mark.rutland@arm.com,
 devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
 mturquette@baylibre.com, linux-arm-kernel@lists.infradead.org,
 Eddie James <eajames@linux.vnet.ibm.com>
References: <1535576973-8067-1-git-send-email-eajames@linux.vnet.ibm.com>
Message-ID: <153573819126.93865.1884182656081956202@swboyd.mtv.corp.google.com>
User-Agent: alot/0.7
Subject: Re: [PATCH 0/4] media: platform: Add Aspeed Video Engine driver
Date: Fri, 31 Aug 2018 10:56:31 -0700
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
X-List-Received-Date: Fri, 31 Aug 2018 17:56:35 -0000

Quoting Eddie James (2018-08-29 14:09:29)
> The Video Engine (VE) embedded in the Aspeed AST2400 and AST2500 SOCs
> can capture and compress video data from digital or analog sources. With
> the Aspeed chip acting as a service processor, the Video Engine can
> capture the host processor graphics output.
> =

> This series adds a V4L2 driver for the VE, providing a read() interface
> only. The driver triggers the hardware to capture the host graphics output
> and compress it to JPEG format.
> =

> Testing on an AST2500 determined that the videobuf/streaming/mmap interfa=
ce
> was significantly slower than the simple read() interface, so I have not
> included the streaming part.
> =

> It's also possible to use an automatic mode for the VE such that
> re-triggering the HW every frame isn't necessary. However this wasn't
> reliable on the AST2400, and probably used more CPU anyway due to excessi=
ve
> interrupts. It was approximately 15% faster.
> =

> The series also adds the necessary parent clock definitions to the Aspeed
> clock driver, with both a mux and clock divider.

Please let me know your merge strategy here. I can ack the clk patches
because they look fine from high-level clk driver perspective (maybe
Joel can take a closer look) or I can merge the patches into clk-next
and get them into next release while the video driver gets reviewed.
