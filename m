Return-Path: <sboyd@kernel.org>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=kernel.org
 (client-ip=198.145.29.99; helo=mail.kernel.org; envelope-from=sboyd@kernel.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.b="WGIpPvBC"; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4226Vt0jFmzF39M;
 Sat,  1 Sep 2018 03:56:38 +1000 (AEST)
Received: from localhost (unknown [104.132.0.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 572F02083D;
 Fri, 31 Aug 2018 17:56:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1535738196;
 bh=3uL735fi3XpmUvssJYIjT4jT/Oj0sJyM1Af+Blw/H1E=;
 h=To:From:In-Reply-To:Cc:References:Subject:Date:From;
 b=WGIpPvBCJzl8iRuEUgv7ocWGiAIUR/geA+C2v78OHKSx6cVa3xG9QHiRrDDyTh4Il
 vvZsT+rJbm7f1Cxi45ECH5LWXV/6NzdJOISgnNKwx7L9Y8olra89wqRqWK2slQHwhq
 XFHPWhxM1iR1PucaxGPHBi/PB992Vl3w2GCIsRn0=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
To: Eddie James <eajames@linux.vnet.ibm.com>, linux-kernel@vger.kernel.org
From: Stephen Boyd <sboyd@kernel.org>
In-Reply-To: <1535576973-8067-2-git-send-email-eajames@linux.vnet.ibm.com>
Cc: linux-media@vger.kernel.org, linux-aspeed@lists.ozlabs.org,
 openbmc@lists.ozlabs.org, andrew@aj.id.au, mchehab@kernel.org,
 joel@jms.id.au, robh+dt@kernel.org, mark.rutland@arm.com,
 devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
 mturquette@baylibre.com, linux-arm-kernel@lists.infradead.org,
 Eddie James <eajames@linux.vnet.ibm.com>
References: <1535576973-8067-1-git-send-email-eajames@linux.vnet.ibm.com>
 <1535576973-8067-2-git-send-email-eajames@linux.vnet.ibm.com>
Message-ID: <153573819579.93865.16877422358186375613@swboyd.mtv.corp.google.com>
User-Agent: alot/0.7
Subject: Re: [PATCH 1/4] clock: aspeed: Add VIDEO reset index definition
Date: Fri, 31 Aug 2018 10:56:35 -0700
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
X-List-Received-Date: Fri, 31 Aug 2018 17:56:38 -0000

Quoting Eddie James (2018-08-29 14:09:30)
> Add an index into the array of resets kept in the Aspeed clock driver.
> This isn't a HW bit definition.
> =

> Signed-off-by: Eddie James <eajames@linux.vnet.ibm.com>
> ---

Acked-by: Stephen Boyd <sboyd@kernel.org>
