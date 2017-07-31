Return-Path: <jk@ozlabs.org>
Received: from ozlabs.org (bilbo.ozlabs.org [103.22.144.67])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3xLNqV107GzDrKT
 for <openbmc@lists.ozlabs.org>; Mon, 31 Jul 2017 12:36:06 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=ozlabs.org header.i=@ozlabs.org header.b="hlK1kLor"; 
 dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by ozlabs.org (Postfix) with ESMTPSA id 3xLNqT32g1z9sRW;
 Mon, 31 Jul 2017 12:36:05 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ozlabs.org; s=201707;
 t=1501468565; bh=j748pSUWHyUIZtnbvwR/ITEKU6ydM1eW8v40BEVWLuM=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=hlK1kLorcG+Bw7Ctm8UTXGAtnBm6z+LR3PNYLHpIrDJ3FS13pblLAn7XwtajFZF7A
 n3GSJH+tyYKvWy3ij2Rcfiih26W0LRHBFg7xXcvOyouzB1LteGMXHPG6qpNNxXuL2c
 qfVX3S/48vNAse0ZFopMK/uE97jwaYnPMeNI0GboqD5ljNw7sj1wh4astV6EhXRHB+
 Efk1+i280PHE4OuO3+rchP1HAgTFaAAT6hELltxzKjNMbibiuDkHpqYJ0A/4N+pVdE
 xeOcNToYdIKJp8ukD3apDjn19maJgiRs1qvhCO1NfPnUxPE7rAWZcZ4/gyr0mltD/V
 YmJK6wQlra7pw==
Subject: Re: [PATCH linux dev-4.10] drivers/fsi: Remove scan from master
 registration
To: Christopher Bostic <cbostic@linux.vnet.ibm.com>,
 Patrick Williams <patrick@stwcx.xyz>,
 Eddie James <eajames@linux.vnet.ibm.com>
Cc: "Edward A. James" <eajames@us.ibm.com>, openbmc@lists.ozlabs.org
References: <1501180508-4009-1-git-send-email-eajames@linux.vnet.ibm.com>
 <0a2cb633-ae2a-7dd2-fe7d-cf565be4d8c2@ozlabs.org>
 <9d456a46-bf10-a977-1f38-a84995b08764@linux.vnet.ibm.com>
 <20170728151405.GB14987@asimov>
 <abbfb937-cefd-c7e3-3acf-be4092624273@ozlabs.org>
 <d4b089af-9b63-2c0c-32ac-1d9f664937c7@linux.vnet.ibm.com>
From: Jeremy Kerr <jk@ozlabs.org>
Message-ID: <dd1e2e71-c548-2341-d37f-deea820b1fb0@ozlabs.org>
Date: Mon, 31 Jul 2017 10:36:04 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <d4b089af-9b63-2c0c-32ac-1d9f664937c7@linux.vnet.ibm.com>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-AU
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
X-List-Received-Date: Mon, 31 Jul 2017 02:36:06 -0000

Hi Chris,

> Not sure I follow what the FSI GPIO master probe would do if it can't
> access the GPIO itself, assuming we're in blocked mode. Would this
> require a deferred probe of some kind once access is unblocked?

Yes, any state change from blocked to unblocked would need to reinit the
GPIOs, and potentially initiate a scan.

So, if we're initialised in blocked mode, the fsi master gpio driver
would still claim the GPIOs (but not change any of their states),
register with the FSI core, etc, but couldn't start any operations that
require GPIO activity.

> Also, in the existing FSP-2 implementation there is a bit in the FSI
> slave SISC which indicates if OPB if fence by host.  Which I believe is
> set whenever host boot is using the FSI bus.   Possibly we could use
> that info to determine if any FSI accesses past the CFAM slave engines
> are allowed.   This might be racy though since BMC can't control when
> that bit is set and cleared.

OK, I'm confused - are we able to access *some* parts of the FSI bus
(ie, the SISC register in the CFAM) while the host is booting?

But as you say, this might race. It would seem simpler to use the BMC's
knowledge of when the host is booting to decide when the BMC is able to
access the bus.

Cheers,


Jeremy
