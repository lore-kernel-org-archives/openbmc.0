Return-Path: <pmenzel@molgen.mpg.de>
Authentication-Results: ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=molgen.mpg.de
 (client-ip=141.14.17.11; helo=mx1.molgen.mpg.de;
 envelope-from=pmenzel@molgen.mpg.de; receiver=<UNKNOWN>)
X-Greylist: delayed 586 seconds by postgrey-1.36 at bilbo;
 Wed, 14 Feb 2018 18:04:41 AEDT
Received: from mx1.molgen.mpg.de (mx3.molgen.mpg.de [141.14.17.11])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3zh9Q101pPzF1G1
 for <openbmc@lists.ozlabs.org>; Wed, 14 Feb 2018 18:04:40 +1100 (AEDT)
Received: from [192.168.0.3] (ip5f5bf412.dynamic.kabel-deutschland.de
 [95.91.244.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: pmenzel)
 by mx.molgen.mpg.de (Postfix) with ESMTPSA id 45B1A2012BA04E;
 Wed, 14 Feb 2018 07:54:41 +0100 (CET)
Subject: contributor license agreement (CLA) (was: Upcoming project ownership
 changes)
To: Brad Bishop <bradleyb@fuzziesquirrel.com>
References: <1518580396.11149.41.camel@fuzziesquirrel.com>
From: Paul Menzel <pmenzel@molgen.mpg.de>
Cc: openbmc@lists.ozlabs.org
Message-ID: <6a06a0b0-4ac4-899b-cfee-a325acb690df@molgen.mpg.de>
Date: Wed, 14 Feb 2018 07:54:40 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.6.0
MIME-Version: 1.0
In-Reply-To: <1518580396.11149.41.camel@fuzziesquirrel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.26
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Wed, 14 Feb 2018 07:04:41 -0000

Dear Brad,


Am 14.02.2018 um 04:53 schrieb Brad Bishop:

[…]

> I'm happy to report that these industry leaders have rallied around
> your community as the meeting point.  Very soon it will get a lot more
> busy around here.
> 
> To this end, IBM will be ceding stewardship of this project to the
> Linux Foundation in the very near future.  You can find the project
> charter here:
> 
> https://docs.google.com/document/d/1uBbi5rDhWqj8Al-eoNLxERZ9OK8KVMZThOuS08-cYto

(Note, the URL is wrapped in your message.)

Thank you. Cooperating is definitely a good thing. My knowledge of the 
goals and operation of the Linux Foundation is not good enough to 
comment on that.

> Under the new charter, contributors will be required to sign a
> contributor license agreement.  There will be corporate (your company
> signs once for all future contributions originating from your company)
> and individual agreements available:
> 
> https://docs.google.com/document/d/1veiAjszrhgabA8XrJWjYCs7lyXIhs5rcXWgaeuW-bT8
> https://docs.google.com/document/d/1m61YH8GSzQpYVt5YG95fb2QNy1Gs--1-oLD3znqPNQw
> 
> Please work with your legal team (if using the corporate CLA) or sign
> the individual CLA now and send them to me to avoid any delays in your
> development work flow when the transfer occurs.

Could you please elaborate, why CLAs are needed? The Linux Kernel is 
under the umbrella of the Linux Foundation, and no CLAs are needed 
there. CLAs are a great burden, as the legal department gets involved, 
and should be avoided at all costs, as contributors want to advance 
OpenBMC and not do paperwork.


Kind regards,

Paul
