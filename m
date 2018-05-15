Return-Path: <sboyd@kernel.org>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=kernel.org
 (client-ip=198.145.29.99; helo=mail.kernel.org; envelope-from=sboyd@kernel.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.b="YwNKwttU"; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 40lsM70c6TzF2DP
 for <openbmc@lists.ozlabs.org>; Wed, 16 May 2018 08:15:14 +1000 (AEST)
Received: from localhost (unknown [104.132.1.75])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 047B620677;
 Tue, 15 May 2018 22:15:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1526422513;
 bh=pQD81kkjLz2goo8RLfqdLtg0SrxiVMuMpxesDxCJbGA=;
 h=To:From:In-Reply-To:Cc:References:Subject:Date:From;
 b=YwNKwttUUMKKpL0tRpcSKnJePyRNAYNrNmADM3D/l0AiJvoACaAPaJIjFhWk/1Eyc
 Ct0dp+uySkgTzcHRc1In0FQiQM+95Y90MMIJG8HoKVYlLCuon2c/N8f4+y+hny7CCN
 0MKpG4pvWxpN5QFAPIkPW8b6zxImTxqo4I63H9O8=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
To: Tali Perry <tali.perry1@gmail.com>, avifishman70@gmail.com,
 brendanhiggins@google.com, linux@armlinux.org.uk, mark.rutland@arm.com,
 raltherr@google.com, robh+dt@kernel.org, tmaimon77@gmail.com,
 weiyongjunl@huawei.com
From: Stephen Boyd <sboyd@kernel.org>
In-Reply-To: <1525159407-31708-2-git-send-email-tali.perry1@gmail.com>
Cc: devicetree@vger.kernel.org, openbmc@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, Tali Perry <tali.perry1@gmail.com>,
 Wei Yongjun <weiyongjun1@huawei.com>, linux-arm-kernel@lists.infradead.org
References: <1525159407-31708-1-git-send-email-tali.perry1@gmail.com>
 <1525159407-31708-2-git-send-email-tali.perry1@gmail.com>
Message-ID: <152642251190.237094.2880285895652897578@swboyd.mtv.corp.google.com>
User-Agent: alot/0.7
Subject: Re: [PATCH v1 1/1] clk: npcm750: fix base address and
 of_clk_get_by_name
 error handling. Also update error messages to be more informative
Date: Tue, 15 May 2018 15:15:11 -0700
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
X-List-Received-Date: Tue, 15 May 2018 22:15:15 -0000

Quoting Tali Perry (2018-05-01 00:23:27)
> =

> Nuvoton NPCM7XX Clock Controller
> fix base address and of_clk_get_by_name error handling.
>     Also update error messages to be more informative.
>     =

>     In case clk_base allocation is erronoeous the return value is null.
>     Also fix handling of of_clk_get_by_name returns an error. =

>     Print a better error message pointing to the dt-binding documention.
> =

> =

> Signed-off-by: Tali Perry <tali.perry1@gmail.com>
> Reviewed-by: Rob Herring <robh@kernel.org>
> Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
> =

> Tali Perry (2):
>  =


This doesn't apply to clk-next so I'm not sure what's going on. Please
resend if something needs to be fixed.
