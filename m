Return-Path: <jk@ozlabs.org>
Received: from ozlabs.org (ozlabs.org [103.22.144.67])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3qwSs63BKtzDqBD
 for <openbmc@lists.ozlabs.org>; Thu, 28 Apr 2016 17:20:10 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by ozlabs.org (Postfix) with ESMTPSA id 3qwSs54B58z9sf9;
 Thu, 28 Apr 2016 17:20:09 +1000 (AEST)
Subject: Re: [PATCH 1/2] server: Allow handlers to fail init
To: Joel Stanley <joel@jms.id.au>
References: <1461820769-10414-1-git-send-email-jk@ozlabs.org>
 <CACPK8XdPjLeuFDocm+8x6L9nknfB6WBq5t2o17oVkPrZ-OOTbQ@mail.gmail.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
From: Jeremy Kerr <jk@ozlabs.org>
Message-ID: <5721B9A9.5080404@ozlabs.org>
Date: Thu, 28 Apr 2016 15:20:09 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
 Thunderbird/38.5.1
MIME-Version: 1.0
In-Reply-To: <CACPK8XdPjLeuFDocm+8x6L9nknfB6WBq5t2o17oVkPrZ-OOTbQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.20
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Thu, 28 Apr 2016 07:20:10 -0000

Hi Joel,

>>                 if (handler->init)
>> -                       handler->init(handler, console, config);
>> +                       rc = handler->init(handler, console, config);
> 
> you could do handler->active = handler-init(), and drop the rc all
> together.

Ah, but that has the logic reversed :)

I thought I'd keep it simpler by separating the function call from the
'active' check, so bugs like that become more obvious.

Cheers,


Jeremy
