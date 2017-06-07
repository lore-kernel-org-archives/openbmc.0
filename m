Return-Path: <jk@ozlabs.org>
Received: from ozlabs.org (ozlabs.org [103.22.144.67])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3wjDPg0N24zDqKm
 for <openbmc@lists.ozlabs.org>; Wed,  7 Jun 2017 13:22:15 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by ozlabs.org (Postfix) with ESMTPSA id 3wjDPf4N0Gz9s8P;
 Wed,  7 Jun 2017 13:22:14 +1000 (AEST)
Subject: Re: [PATCH linux dev-4.10] drivers/fsi: Break and set pin states on
 GPIO master remove
To: Christopher Bostic <cbostic@linux.vnet.ibm.com>, joel@jms.id.au
Cc: openbmc@lists.ozlabs.org
References: <20170606200230.77482-1-cbostic@linux.vnet.ibm.com>
From: Jeremy Kerr <jk@ozlabs.org>
Message-ID: <1ac7a650-9524-4c50-f449-b5fc89e8d988@ozlabs.org>
Date: Wed, 7 Jun 2017 11:22:11 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.1.1
MIME-Version: 1.0
In-Reply-To: <20170606200230.77482-1-cbostic@linux.vnet.ibm.com>
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
X-List-Received-Date: Wed, 07 Jun 2017 03:22:15 -0000

Hi Chris,

> Update GPIO remove behavior to match dev-4.7.
> 
> On gpio remove: Send a break
> 		clock, translator, mux = 0
> 		data, enable = 1

While this change itself seems okay (leaving GPIOs in a defined state),
I'm concerned about *why* we need this.

If there is other code that need GPIOs in a certain state, then that
code should be doing the required init itself.

Could you add a comment on why this is required?

Cheers,


Jeremy
