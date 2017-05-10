Return-Path: <jk@ozlabs.org>
Received: from ozlabs.org (ozlabs.org [103.22.144.67])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3wN0TP3wwYzDqKm
 for <openbmc@lists.ozlabs.org>; Wed, 10 May 2017 12:25:45 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by ozlabs.org (Postfix) with ESMTPSA id 3wN0TP1PsKz9ryb;
 Wed, 10 May 2017 12:25:45 +1000 (AEST)
Subject: Re: [PATCH linux dev-4.10 0/7] OpenFSI Updates for dev-4.10 kernel
To: Christopher Bostic <cbostic@linux.vnet.ibm.com>, joel@jms.id.au
References: <20170509213902.37939-1-cbostic@linux.vnet.ibm.com>
Cc: openbmc@lists.ozlabs.org
From: Jeremy Kerr <jk@ozlabs.org>
Message-ID: <2739f657-9419-1bd2-2a22-6c208c62828f@ozlabs.org>
Date: Wed, 10 May 2017 10:25:43 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
 Thunderbird/45.8.0
MIME-Version: 1.0
In-Reply-To: <20170509213902.37939-1-cbostic@linux.vnet.ibm.com>
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
X-List-Received-Date: Wed, 10 May 2017 02:25:45 -0000

Hi Chris,

If (and only if) you're planning to send another revision of the fsi
patches upstream, I'd suggest squashing these into their original
commits:

>   drivers/fsi: Unscan on master unregister
>   drivers/fsi: Fix one and two byte bus reads/writes

But if not, I'm happy for these to stay separate.

Other than that, this series should be fine for the openbmc tree.

Cheers,


Jeremy
