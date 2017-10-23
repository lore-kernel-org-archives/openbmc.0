Return-Path: <jk@ozlabs.org>
Received: from ozlabs.org (bilbo.ozlabs.org [103.22.144.67])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3yL1KB2HN2zDqXj
 for <openbmc@lists.ozlabs.org>; Mon, 23 Oct 2017 13:57:18 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=ozlabs.org header.i=@ozlabs.org header.b="Jfn5pKUo"; 
 dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by ozlabs.org (Postfix) with ESMTPSA id 3yL1K96YDyz9t2V;
 Mon, 23 Oct 2017 13:57:17 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ozlabs.org; s=201707;
 t=1508727438; bh=+6dH727Sw8O5ZRskTZru24ARAEgB/XPYUXvO89JBMW4=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=Jfn5pKUowPobhHYjMB6/Z4KQoTITkrtorVpVMPkIg1RYgmGZDroyC58ZUqjGTO1Hy
 rSywW39F7LPp8x6++AjAUWZAiHf452SqTLJkXuoydjf+Y9UJSl5WyjUvcXuwLYi16R
 Om4kU5jUhsWcO4U3ZMAiV46yTOilRL/oomC2n5fsOjxoeo5VCrYgQAzBMBbmBU80XI
 byX9h+o1eUcZm3xTpI/O3py2zmDae3Tv7gKMRhYIGSWdMbBDKbQtU94p3bqSNrLK4m
 u96gOrZydyHVvgTyHLMGiPJtBrqebctleLqRTDYBaCNT5+2AlMIgCmZnMFJ7lDBWs5
 u9U6xusbpOKVQ==
Subject: Re: [PATCH linux dev-4.10] fsi: core: Allow more BREAKs to recover a
 failing link
To: Christopher Bostic <cbostic@linux.vnet.ibm.com>, andrew@aj.id.au
Cc: openbmc@lists.ozlabs.org
References: <20171020173237.76535-1-cbostic@linux.vnet.ibm.com>
From: Jeremy Kerr <jk@ozlabs.org>
Message-ID: <34b84ff0-4f65-5537-d6c7-272cf2e3c6b8@ozlabs.org>
Date: Mon, 23 Oct 2017 10:57:17 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.4.0
MIME-Version: 1.0
In-Reply-To: <20171020173237.76535-1-cbostic@linux.vnet.ibm.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-AU
Content-Transfer-Encoding: 7bit
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
X-List-Received-Date: Mon, 23 Oct 2017 02:57:19 -0000

Hi Chris,

> Recovering a failing FSI link can require more than a single
> BREAK command to reset the FSI slave. Test results indicate
> that communications can be restored when a second or third
> BREAK is sent when the previous attempts fail.

This seems somewhat suspicious to me. Do we have any indication from the
CFAM documentation, or the folks responsible for the CFAM implentation,
that multiple breaks will actually cause any difference in behaviour
that a single one? Or is this based only on experimentation?

I'm worried that we'd be papering-over the underlying issue here.

Regards,


Jeremy
