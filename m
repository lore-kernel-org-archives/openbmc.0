Return-Path: <joel.stan@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::743; helo=mail-qk1-x743.google.com;
 envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.b="gdH1PxCX"; 
 dkim-atps=neutral
Received: from mail-qk1-x743.google.com (mail-qk1-x743.google.com
 [IPv6:2607:f8b0:4864:20::743])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 43q8GD4svczDqQg;
 Wed, 30 Jan 2019 14:38:12 +1100 (AEDT)
Received: by mail-qk1-x743.google.com with SMTP id q1so12901723qkf.13;
 Tue, 29 Jan 2019 19:38:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Dg2MenSHWrAwQe2mYdpL9kjlGddqbZ3q0zPRrt2PF6o=;
 b=gdH1PxCX3i5nIlJRizCaRCrYu2gZ8oLTOqelWVQtJMVkMvi4hxOQ/ignri279EpM1B
 FQBbxF2oSU8sgmVavHZSCGPc+OaA2exrhvn7NP7o82RWroktpcxTsKfEFNJo66qAd/Cq
 tXcPJDRorwazIlKq//clip7tOHR/Vvwjz5DYw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Dg2MenSHWrAwQe2mYdpL9kjlGddqbZ3q0zPRrt2PF6o=;
 b=Ot8jq83NvlnvcA2AbDTVkFcHQz08iHy+jz9kZTw1ZVQLQMut0+4eGwOPg7TROCwz4y
 0eHsLReg3S7uOaoNZOQXZ5+YEaoyYtwVqVrMRU/C18ZJtLr7vVuChR3E8WvBbqULQGgK
 fqTmNkCMN6J4AF8jDw01GlIdAL3Ic7UR/+H2N5cREIPFcXiASyJrXl88UteAm7KjmTLJ
 9NiPCc43Wlz6nNmSq4ASFd5U9F3ZQNgLPzzVMT4dQ83mv8ZJBnGbNzqQAULgbv16vDal
 lGlupW81Y45fI2q+Yw0qUnww6brWyc2Podma0U2qhctrxq8e88HdzgqTOwt/85PUDwdQ
 EHkQ==
X-Gm-Message-State: AJcUukePxL5UmwJfoF9AObhexyHfJEECY99hnDaawDKV/PNfZ0VMkqEM
 YSd9zsLzJFoHRg2vq+KWsDrptAlMqnjbV9AYBVE=
X-Google-Smtp-Source: ALg8bN5yQjI6Tf9kyG+GP6w6clWGHJ0xefs8q7tANRJ1rMrsVVqXcCyM+uPDE890R+YUZ3zgWz2ChuW1j9/frM7fBJY=
X-Received: by 2002:ae9:dec5:: with SMTP id
 s188mr25826624qkf.127.1548819490344; 
 Tue, 29 Jan 2019 19:38:10 -0800 (PST)
MIME-Version: 1.0
References: <20190129214624.119330-1-venture@google.com>
In-Reply-To: <20190129214624.119330-1-venture@google.com>
From: Joel Stanley <joel@jms.id.au>
Date: Wed, 30 Jan 2019 14:37:58 +1100
Message-ID: <CACPK8XeSoOkOqVtc7Xhov7Zrj8sMc28q1-BQ_t-d5FTYXMkggg@mail.gmail.com>
Subject: Re: [PATCH] ARM: dts: aspeed: quanta-q71l: enable lpc_ctrl node
To: Patrick Venture <venture@google.com>
Cc: Rob Herring <robh+dt@kernel.org>, Andrew Jeffery <andrew@aj.id.au>, 
 Mark Rutland <mark.rutland@arm.com>, devicetree <devicetree@vger.kernel.org>, 
 Linux ARM <linux-arm-kernel@lists.infradead.org>, linux-aspeed@lists.ozlabs.org,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: text/plain; charset="UTF-8"
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Wed, 30 Jan 2019 03:38:13 -0000

On Wed, 30 Jan 2019 at 08:46, Patrick Venture <venture@google.com> wrote:
>
> Enable the lpc_ctrl node in the quanta-q71l dts such that the LPC_CLK is
> enabled.
>
> Signed-off-by: Patrick Venture <venture@google.com>

Applied to the aspeed tree for 5.1.

Cheers,

Joel
