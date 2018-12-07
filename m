Return-Path: <jk@ozlabs.org>
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 43B0nG0FtQzDrc1
 for <openbmc@lists.ozlabs.org>; Fri,  7 Dec 2018 16:06:42 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=ozlabs.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=ozlabs.org header.i=@ozlabs.org header.b="fuV9LqlQ"; 
 dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ozlabs.org (Postfix) with ESMTPSA id 43B0nD3crTz9s0t;
 Fri,  7 Dec 2018 16:06:40 +1100 (AEDT)
Authentication-Results: ozlabs.org;
 dmarc=none (p=none dis=none) header.from=ozlabs.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ozlabs.org; s=201707;
 t=1544159201; bh=DHGewJXVziTDcsm00Z8uv/kdRF7j4n6JaP8RLQW3EeY=;
 h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
 b=fuV9LqlQwAFo1RjaOXJws+POUan7Ocl/99vfRI1ymXffRak+U/JQvINLHi10ERsMS
 pqunQq7ttzfzCveXlIlgEblibkxRYy/fgpum6IcasKMf+MntpAnEHI4cnJeN4uhCEk
 qiX9jiQO1KAA7T3vvownx9lFR/GIu+Qac6m6FKnXwjvaL+BTmQsRTsenYwXqAVHGg6
 eGpLmn5LHYJRKV4mWwPqlFvBAKFkH8EUEdTI62DBCztLklWcOnT8FF0kCMNdlTdMoS
 2hKeDe9oFuAtvi1rgCvDMOAz4XwZ1Rsde6EQrnld8Ug3NDimRhr1BOkOqQnY5ONEcA
 wWDMnPMJPwQyQ==
Message-ID: <b6a65831e47d25a624835a895b8af935f321999d.camel@ozlabs.org>
Subject: Re: Initial MCTP design proposal
From: Jeremy Kerr <jk@ozlabs.org>
To: "Naidoo, Nilan" <nilan.naidoo@intel.com>, openbmc
 <openbmc@lists.ozlabs.org>
Cc: Supreeth Venkatesh <Supreeth.Venkatesh@arm.com>, David Thompson
 <dthompson@mellanox.com>, Emily Shaffer <emilyshaffer@google.com>, Dong Wei
 <Dong.Wei@arm.com>, Andrew Geissler <geissonator@gmail.com>
Date: Fri, 07 Dec 2018 13:06:39 +0800
In-Reply-To: <471CB8EC3D4A874BBFE213C33E2BC2170E8C95D6@ORSMSX122.amr.corp.intel.com>
References: <a75abc9a6c5c2ae50b39576a60a2bb07c65567d4.camel@ozlabs.org>
 <471CB8EC3D4A874BBFE213C33E2BC2170E8C95D6@ORSMSX122.amr.corp.intel.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.30.2-1 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
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
X-List-Received-Date: Fri, 07 Dec 2018 05:06:42 -0000

Hi Nilan,

Thanks for taking a look.

> As far as the features that need to be supported, we are initially
> interested in PCIe VDM and SMBus/I2C hardware bindings.

OK, sure thing. Is this on ASPEED hardware?

>   The BMC will also need to be the Bus owner for the interfaces.
>  It is not clear to be yet if we would also need bridging for our
> initial use cases.

Yes, I think this matches our designs too; I don't see us needing
bridging at present.

>   The message types that we need to support are NVMe-SI, PLDM and
> Vendor Defined - PCI (0x7E). We currently don't have a strong need for
> supporting the host interface. 

Oh, interesting, I didn't expect folks to be using MCTP but not
including the host channel. There's no issue with that, so I'll update
the wording so it's clear that this can be accommodated.

Cheers,


Jeremy
