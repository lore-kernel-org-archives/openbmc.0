Return-Path: <jk@ozlabs.org>
Received: from ozlabs.org (bilbo.ozlabs.org [103.22.144.67])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3xSQ9t2b7DzDqrP
 for <openbmc@lists.ozlabs.org>; Thu, 10 Aug 2017 07:57:54 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=ozlabs.org header.i=@ozlabs.org header.b="yUBmQBWv"; 
 dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by ozlabs.org (Postfix) with ESMTPSA id 3xSQ9s753mz9sNd;
 Thu, 10 Aug 2017 07:57:53 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ozlabs.org; s=201707;
 t=1502315874; bh=er1N9fiWNeIyW+SLo4l3Ig07XIcVxhkp9VpJdk8OYZA=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=yUBmQBWvrgUD5oRNmOurl9GHG1UGiH6Utyd1vofsywm/jKFUqvwq6FfVFOhCYKHZV
 s+4Kpepc2IUDVq6zP43FM5hi3i5BiIjL7O8Wqt32tdQCVU2HlDw5olmoVc9thAK5dk
 8EEdemSmuwtLQCg5HCS2aBg4mxe00CjvpUZZwLS4/44VE7fJnQCIdpdSSSYgNePXmJ
 L8J6CHpwl1pNSPfWw5TBQaHk7vZxX11IylYZkIwMOz1e0ngAiAM5PU2HJj0x0UMioR
 FJtxYpL4EgN2iW/L44WY8R/KpI3F65YDx0qHMSCrQueV/TWlNZp8yMRUOY7xnYTHoc
 Dq41MpxVQJZ2Q==
Subject: Re: [PATCH linux dev-4.10] fsi: core: Reduce console output during
 normal scan
To: Christopher Bostic <cbostic@linux.vnet.ibm.com>, joel@jms.id.au
Cc: openbmc@lists.ozlabs.org
References: <20170809191659.33078-1-cbostic@linux.vnet.ibm.com>
From: Jeremy Kerr <jk@ozlabs.org>
Message-ID: <5121a5d2-61d0-7831-aa29-3164d3332af7@ozlabs.org>
Date: Thu, 10 Aug 2017 05:57:53 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <20170809191659.33078-1-cbostic@linux.vnet.ibm.com>
Content-Type: text/plain; charset=utf-8
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
X-List-Received-Date: Wed, 09 Aug 2017 21:57:55 -0000

Hi Chris,

> To reduce amount of console output during boot / power up make
> all good path scan related messages debug type.

You beat me (and probably Joel too) to it :)

Acked-by: Jeremy Kerr <jk@ozlabs.org>

Cheers,


Jeremy
