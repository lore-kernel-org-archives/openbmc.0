Return-Path: <jk@ozlabs.org>
Received: from ozlabs.org (ozlabs.org [103.22.144.67])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3vml3x3l71zDq5g
 for <openbmc@lists.ozlabs.org>; Mon, 20 Mar 2017 16:33:49 +1100 (AEDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by ozlabs.org (Postfix) with ESMTPSA id 3vml3x0GN0z9s3l;
 Mon, 20 Mar 2017 16:33:48 +1100 (AEDT)
Subject: Re: [PATCH linux dev-4.7 v2] drivers/fsi: Add delay before sampling
 input on SDA
To: Christopher Bostic <cbostic@linux.vnet.ibm.com>, joel@jms.id.au
References: <20170317211836.63576-1-cbostic@linux.vnet.ibm.com>
Cc: openbmc@lists.ozlabs.org
From: Jeremy Kerr <jk@ozlabs.org>
Message-ID: <5abc5b5b-d431-94c1-00f3-42d2d595b278@ozlabs.org>
Date: Mon, 20 Mar 2017 13:33:47 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
 Thunderbird/45.7.0
MIME-Version: 1.0
In-Reply-To: <20170317211836.63576-1-cbostic@linux.vnet.ibm.com>
Content-Type: text/plain; charset=windows-1252
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
X-List-Received-Date: Mon, 20 Mar 2017 05:33:49 -0000

Hi Chris,

> During high cpu loads the SDA in line can shift relative to the
> clock signal which can corrupt the received input data.  Slow
> down the time to sample input to account for this.

This looks much better than the previous patch, but do you know why high
CPU loads affect this? All of the GPIO interactions are performed with
the single spinlock held, so CPU load should have no bearing on the
timing of the bit-banging - the driver has exclusive use of the CPU
during a FSI transaction.

Can you elaborate on the symptoms of this?

One thing that looks a little suspicious to me is that you're running
the clock during the echo delay time, so you're potentially feeding
random data to the slave...

Cheers,


Jeremy
