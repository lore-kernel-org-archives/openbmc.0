Return-Path: <jk@ozlabs.org>
Received: from ozlabs.org (ozlabs.org [103.22.144.67])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3wHBB62DqPzDqBQ
 for <openbmc@lists.ozlabs.org>; Tue,  2 May 2017 16:25:50 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by ozlabs.org (Postfix) with ESMTPSA id 3wHBB56m19z9sDB;
 Tue,  2 May 2017 16:25:49 +1000 (AEST)
Subject: Re: [PATCH RFC] Documentation/devicetree: Add specification for FSI
 busses
To: Joel Stanley <joel@jms.id.au>
References: <1493704508-27119-1-git-send-email-jk@ozlabs.org>
 <CACPK8Xf2regdT4Y-TW4nOc1qYwDcH=zYPRqdjTqL9yvZH49bRA@mail.gmail.com>
Cc: devicetree <devicetree@vger.kernel.org>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
From: Jeremy Kerr <jk@ozlabs.org>
Message-ID: <3f346df4-b621-f2bd-0592-5016f5870865@ozlabs.org>
Date: Tue, 2 May 2017 14:25:49 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
 Thunderbird/45.7.0
MIME-Version: 1.0
In-Reply-To: <CACPK8Xf2regdT4Y-TW4nOc1qYwDcH=zYPRqdjTqL9yvZH49bRA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
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
X-List-Received-Date: Tue, 02 May 2017 06:25:50 -0000

Hi Joel,

> Looks good to me Jeremy. One small question on the description, but
> please add Acked-by: Joel Stanley <joel@jms.id.au> to future
> revisions.

Thanks for the review!

>> +The FSI bus is probe-able, so Linux is able to enumerate FSI slaves, and
>> +engines within those slaves. However, we have a facility to match devicetree
>> +nodes to probed engines. This allows for fsi engines to expose non-probeable
>> +busses, which are then exposed by the device tree. For example, a FSI engine
> 
> A nit: Can we can expose any device as part of the engine, not just a bus?

Absolutely. I'll clarify in a future version. Something like:

  This allows for fsi engines to expose non-probeable busses, or for
  drivers to access extra device properties, by data described in the
  device tree.

Cheers,


Jeremy
