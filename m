Return-Path: <sboyd@kernel.org>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=kernel.org
 (client-ip=198.145.29.99; helo=mail.kernel.org; envelope-from=sboyd@kernel.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.b="Do8VWefp"; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4226Vx5pw2zF39M;
 Sat,  1 Sep 2018 03:56:41 +1000 (AEST)
Received: from localhost (unknown [104.132.0.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id D6CD02083E;
 Fri, 31 Aug 2018 17:56:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1535738199;
 bh=jw8ZT2/hzccJfCeRpzevj0nKMl/gKk85QD4DWFFxztQ=;
 h=To:From:In-Reply-To:Cc:References:Subject:Date:From;
 b=Do8VWefpSTaQG2Sx88aOZKoGupNwcUPoXePUVMqYRriNwa8eCqEJvVTZirAksVEXh
 lNk+lt8gbhUrHkJrrsvtGorZDUP+E3ai3gxxbv7cKtnFfX1GWOmNbddexu2F+HDRG0
 q5PZ0eidbrfvnea0KE2XVvtmQzD/7d+xz8EFUjuQ=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
To: Eddie James <eajames@linux.vnet.ibm.com>, linux-kernel@vger.kernel.org
From: Stephen Boyd <sboyd@kernel.org>
In-Reply-To: <1535576973-8067-3-git-send-email-eajames@linux.vnet.ibm.com>
Cc: linux-media@vger.kernel.org, linux-aspeed@lists.ozlabs.org,
 openbmc@lists.ozlabs.org, andrew@aj.id.au, mchehab@kernel.org,
 joel@jms.id.au, robh+dt@kernel.org, mark.rutland@arm.com,
 devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
 mturquette@baylibre.com, linux-arm-kernel@lists.infradead.org,
 Eddie James <eajames@linux.vnet.ibm.com>
References: <1535576973-8067-1-git-send-email-eajames@linux.vnet.ibm.com>
 <1535576973-8067-3-git-send-email-eajames@linux.vnet.ibm.com>
Message-ID: <153573819934.93865.9948361566635476864@swboyd.mtv.corp.google.com>
User-Agent: alot/0.7
Subject: Re: [PATCH 2/4] clock: aspeed: Setup video engine clocking
Date: Fri, 31 Aug 2018 10:56:39 -0700
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
X-List-Received-Date: Fri, 31 Aug 2018 17:56:42 -0000

Quoting Eddie James (2018-08-29 14:09:31)
> Add the video engine reset bit. Add eclk mux and clock divider table.
> =

> Signed-off-by: Eddie James <eajames@linux.vnet.ibm.com>
> ---

Acked-by: Stephen Boyd <sboyd@kernel.org>
