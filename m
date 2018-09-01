Return-Path: <sboyd@kernel.org>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=kernel.org
 (client-ip=198.145.29.99; helo=mail.kernel.org; envelope-from=sboyd@kernel.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.b="xcaEn/U2"; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 422LGp071CzF398;
 Sat,  1 Sep 2018 12:46:57 +1000 (AEST)
Received: from localhost (unknown [104.132.0.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 0A41620841;
 Sat,  1 Sep 2018 02:46:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1535770015;
 bh=uJvyBvVcdWB5b80VVmO2LOPhef+0oGbkkySSfNHYqTo=;
 h=To:From:In-Reply-To:Cc:References:Subject:Date:From;
 b=xcaEn/U2aVim4GBo2GuK5eFE8MSD9bzrFEP9OTYRzuQ4n7uyfhYf+cbMHto3+fVUr
 EAeDAoZPfmgLzHdvnPl0YWTE4Z8gxPM8gT9puI8Zi1yoJ30gLmfzEQR5oYMJGmM3b9
 puvVtdIkMgxFt0OEXbX/E4rYtLTcZHtm7O2hMd0Q=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
To: Eddie James <eajames@linux.vnet.ibm.com>, linux-kernel@vger.kernel.org
From: Stephen Boyd <sboyd@kernel.org>
In-Reply-To: <a959a032-6817-dcb4-2c5f-b4bd17fc1c8b@linux.vnet.ibm.com>
Cc: linux-media@vger.kernel.org, linux-aspeed@lists.ozlabs.org,
 openbmc@lists.ozlabs.org, andrew@aj.id.au, mchehab@kernel.org,
 joel@jms.id.au, robh+dt@kernel.org, mark.rutland@arm.com,
 devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
 mturquette@baylibre.com, linux-arm-kernel@lists.infradead.org
References: <1535576973-8067-1-git-send-email-eajames@linux.vnet.ibm.com>
 <153573819126.93865.1884182656081956202@swboyd.mtv.corp.google.com>
 <a959a032-6817-dcb4-2c5f-b4bd17fc1c8b@linux.vnet.ibm.com>
Message-ID: <153577001451.19113.16924655760277630355@swboyd.mtv.corp.google.com>
User-Agent: alot/0.7
Subject: Re: [PATCH 0/4] media: platform: Add Aspeed Video Engine driver
Date: Fri, 31 Aug 2018 19:46:54 -0700
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
X-List-Received-Date: Sat, 01 Sep 2018 02:46:58 -0000

Quoting Eddie James (2018-08-31 12:30:02)
> =

> =

> On 08/31/2018 12:56 PM, Stephen Boyd wrote:
> > Quoting Eddie James (2018-08-29 14:09:29)
> > Please let me know your merge strategy here. I can ack the clk patches
> > because they look fine from high-level clk driver perspective (maybe
> > Joel can take a closer look) or I can merge the patches into clk-next
> > and get them into next release while the video driver gets reviewed.
> =

> Thanks for taking a look! Probably preferable to get the clk patches =

> into clk-next first (though Joel reviewing would be great). I just put =

> everything in the same set for the sake of explaining the necessity of =

> the clk changes.
> =


Ok. If Joel is able to review then I can easily merge it into clk-next.
