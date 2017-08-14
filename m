Return-Path: <sam@mendozajonas.com>
Received: from new2-smtp.messagingengine.com (new2-smtp.messagingengine.com
 [66.111.4.224])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3xVy7G1H2BzDqYY
 for <openbmc@lists.ozlabs.org>; Mon, 14 Aug 2017 11:04:25 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=mendozajonas.com header.i=@mendozajonas.com
 header.b="TQyeaJ9q"; dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="bFVtKwta"; dkim-atps=neutral
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
 by mailnew.nyi.internal (Postfix) with ESMTP id 868E81A77;
 Sun, 13 Aug 2017 21:04:21 -0400 (EDT)
Received: from frontend1 ([10.202.2.160])
 by compute2.internal (MEProxy); Sun, 13 Aug 2017 21:04:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 mendozajonas.com; h=cc:content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-sender:x-me-sender:x-sasl-enc:x-sasl-enc; s=
 fm1; bh=1Kq7yMOZR+IuhgzRGPMxcFDo77knlOHUMM/XLDhIWyA=; b=TQyeaJ9q
 gZC783dzD0137npPz92s5hge5B0DtRTuqyRBTlmdoGedtOniksFiZuu9K06UMLMy
 bMfkt4CbU76m7I2y1fEI8IQQzMckThVx0x/t6aXseYzgdE5Y11fKReU7SVA1K7Xp
 UNG9ILRa1c7kNTBRZUKMdRYYc2e2ixr8HxUmnQg4DXnbKV4R3AJoU/fskpisabND
 D2lbzFNc8tNm8QMs4Nh9TAZZBsNxB9ZmMxbl+Wg+qwGznsRqj2iDPCQG7Kv9THwB
 NoRbD9s1nGm2FWZQqnLCk/ybO4j+6M1ZFPKlC+mYnMG36JiZCSzbAiaMBlF1yZlb
 vRWI0r+v9TeXGA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-sender:x-me-sender:x-sasl-enc:x-sasl-enc; s=
 fm1; bh=1Kq7yMOZR+IuhgzRGPMxcFDo77knlOHUMM/XLDhIWyA=; b=bFVtKwta
 IUyLA+G3tnZIwwESsnhNjVheOtHxuZlp7nfuY/iLKMkGgN3fFEjs23PFpMHXNiYf
 pmedewSxBjeVijd12gZloTlNXbhoDwYYLwEGr7hBEgeRelrwwVTzWtkDmHzdErwD
 RgI4YpBGDYFPlkEvyYaOUZ6u1yHVKgVzjXzVcFV2xuoRZAZLjrU3OEY32pzijHTm
 RXYkKYfZj/wyYa2U41W1xhz7ZOfJY3ilLNRJ49n0JB0jW1OyGFU+17BqSxSvWYAW
 IHtVftqsC8Rp9IbLfjX0MlEwQGpmql4qBKP1SC7I7GgdSsMERuOO9Akz1dFPBtk3
 y1p3HaRwwZV8AQ==
X-ME-Sender: <xms:FfeQWfQRzsGhfszRIy4sbwV446K9EJquyxZao5fdyGVu8zlh3G2ICA>
X-Sasl-enc: P3UkrN7m1GCUgBoaDrUl9HY1GkJS3g5LXVDMEH2LzZk1 1502672660
Received: from v4.ozlabs.ibm.com (unknown [122.99.82.10])
 by mail.messagingengine.com (Postfix) with ESMTPA id A43317E70C;
 Sun, 13 Aug 2017 21:04:18 -0400 (EDT)
Message-ID: <1502672656.913.1.camel@mendozajonas.com>
Subject: Re: [PATCH 0/3] NCSI VLAN Filtering Support
From: Samuel Mendoza-Jonas <sam@mendozajonas.com>
To: David Miller <davem@davemloft.net>
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
 openbmc@lists.ozlabs.org, joel@jms.id.au, benh@kernel.crashing.org, 
 gwshan@linux.vnet.ibm.com, ratagupt@in.ibm.com
Date: Mon, 14 Aug 2017 11:04:16 +1000
In-Reply-To: <20170811.144823.1928647996484981190.davem@davemloft.net>
References: <20170811061648.19661-1-sam@mendozajonas.com>
 <20170811.144823.1928647996484981190.davem@davemloft.net>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.24.5 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
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
X-List-Received-Date: Mon, 14 Aug 2017 01:04:27 -0000

On Fri, 2017-08-11 at 14:48 -0700, David Miller wrote:
> From: Samuel Mendoza-Jonas <sam@mendozajonas.com>
> Date: Fri, 11 Aug 2017 16:16:45 +1000
> 
> > This series (mainly patch 3) adds VLAN filtering to the NCSI implementation.
> > A fair amount of code already exists in the NCSI stack for VLAN filtering but
> > none of it is actually hooked up. This goes the final mile and fixes a few
> > bugs in the existing code found along the way (patch 2).
> > 
> > Patch 1 adds the appropriate flag to the ftgmac100 driver to enable filtering
> > as it's a large consumer of NCSI (and what I've been testing on).
> 
> This patch series does not apply cleanly to net-next, you need to respin.

Sorry about that, silly Friday mistake :)
I noticed I've also squashed an ftgmac100 change into the wrong patch,
I'll fix that up along with the respin.

Cheers,
Sam
