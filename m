Return-Path: <sboyd@kernel.org>
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=kernel.org
 (client-ip=198.145.29.99; helo=mail.kernel.org; envelope-from=sboyd@kernel.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=kernel.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 40796j4VXSzF0lf
 for <openbmc@lists.ozlabs.org>; Sat, 24 Mar 2018 04:11:05 +1100 (AEDT)
Received: from localhost (unknown [104.132.1.75])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 13BC821835;
 Fri, 23 Mar 2018 17:11:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 13BC821835
Authentication-Results: mail.kernel.org;
 dmarc=none (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org;
 spf=none smtp.mailfrom=sboyd@kernel.org
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
To: avifishman70@gmail.com, brendanhiggins@google.com, linux@armlinux.org.uk, 
 mark.rutland@arm.com, mturquette@baylibre.com, raltherr@google.com,
 robh+dt@kernel.org, sboyd@codeaurora.org, tali.perry1@gmail.com,
 tmaimon77@gmail.com
From: Stephen Boyd <sboyd@kernel.org>
In-Reply-To: <1521553249-6971-2-git-send-email-tali.perry1@gmail.com>
Cc: devicetree@vger.kernel.org, openbmc@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, Tali Perry <tali.perry1@gmail.com>,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <1521553249-6971-1-git-send-email-tali.perry1@gmail.com>
 <1521553249-6971-2-git-send-email-tali.perry1@gmail.com>
Message-ID: <152182506241.178046.9923016351698583201@swboyd.mtv.corp.google.com>
User-Agent: alot/0.7
Subject: Re: [PATCH v11 1/2] dt-binding: clk: npcm750: Add binding for Nuvoton
 NPCM7XX Clock
Date: Fri, 23 Mar 2018 10:11:02 -0700
X-Mailman-Approved-At: Mon, 26 Mar 2018 09:48:48 +1100
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
X-List-Received-Date: Fri, 23 Mar 2018 17:11:09 -0000

Quoting tali.perry1@gmail.com (2018-03-20 06:40:48)
> From: Tali Perry <tali.perry1@gmail.com>
> =

> * Nuvoton NPCM7XX Clock Controller
> =

> Nuvoton Poleg BMC NPCM7XX contains an integrated clock controller, which
> generates and supplies clocks to all modules within the BMC.
> =

> ---
> =

> 10 =3D=3D> 11
> update documentation. "eth" replaced with "ethernet" in use case eaxample.
> =

> 2 =3D=3D> 10
> update documentation. add external clocks as inputs to clk driver.
> fix SPDX comment.
> =

> 1 =3D=3D> 2
> This patch includes fix request described here:
> https://patchwork.kernel.org/patch/10200033/
> (move fixed clocks to DT)
> =

> Signed-off-by: Tali Perry <tali.perry1@gmail.com>
> Reviewed-by: Rob Herring <robh@kernel.org>

But this part goes before the triple dash. I'll apply it and fix it up
on clk-next.
