Return-Path: <jk@ozlabs.org>
Received: from ozlabs.org (bilbo.ozlabs.org [103.22.144.67])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3ycmYS1hXhzDqpp
 for <openbmc@lists.ozlabs.org>; Thu, 16 Nov 2017 14:14:04 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=ozlabs.org header.i=@ozlabs.org header.b="jvfHKsZ4"; 
 dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by ozlabs.org (Postfix) with ESMTPSA id 3ycmYR687Tz9s4s;
 Thu, 16 Nov 2017 14:14:03 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ozlabs.org; s=201707;
 t=1510802044; bh=Rpy4iK9ht0lfUxyExIExJzbzLb0bPpj1UYac+YDhvN4=;
 h=Subject:To:References:From:Date:In-Reply-To:From;
 b=jvfHKsZ4OQYOlFQS4c9Oi/zj1hOmNpfi7Qisfm65IrTYVO2mewFEp5Pg4iLZNoN0E
 wGe2FxuY1gouMMkUhlQXGWCv+MXBIZh0CEHiCxrTso0s7Xf5x+EQFmdGr+RE6uyYX5
 szM4yCBEB+yB06/yZJ8MKS4d+v1dIlunbn4/zvUi2QXdSOsdu6ucrzaLhcMwnnH9EG
 ZiwsX8bvw05jubn9+BvvtkUEcBN+cJDBt77P4Fm421b8K+EOXMMaZRburitJ3o0xeG
 gKSNo9NMCqaY0cqaXgModSB5u7v7mMHE6ccW+XPMnnYEp3GIaTn92oB2cK1Ixro8Y7
 v3AzJuPh/lYTw==
Subject: Re: HPM firmware update
To: "Mihm, James" <james.mihm@intel.com>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
References: <C599FC839619124CAC44E062ABB7DFE2C9F407C2@ORSMSX101.amr.corp.intel.com>
From: Jeremy Kerr <jk@ozlabs.org>
Message-ID: <14315ca0-3c06-5aa3-5b57-d5e3888fd957@ozlabs.org>
Date: Thu, 16 Nov 2017 11:14:02 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.4.0
MIME-Version: 1.0
In-Reply-To: <C599FC839619124CAC44E062ABB7DFE2C9F407C2@ORSMSX101.amr.corp.intel.com>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-AU
Content-Transfer-Encoding: 8bit
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.24
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Thu, 16 Nov 2017 03:14:04 -0000

Hi James,

> I’ve started looking at using the PICMG HPM specification that was
> recommended as the preferred API for performing firmware updates. This
> is not an open specification, and goes against the principles of the
> openbmc project.

Yes, that's very true. My previous experience is on the client-side of
HPM, which is implemented in ipmitool already.

> The HPM specification must also be purchased from the PICMG standards
> organization, and contains patent liabilities. I think using HPM is a
> non-starter.

We could always request DMTF to make it more widely available. However,
unless that does change, I'd agree with you that we'd want to avoid
HPM.1.

Regards,


Jeremy
