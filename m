Return-Path: <jk@ozlabs.org>
Received: from ozlabs.org (ozlabs.org [103.22.144.67])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3vQCL03L8QzDq5W
 for <openbmc@lists.ozlabs.org>; Sat, 18 Feb 2017 12:41:44 +1100 (AEDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by ozlabs.org (Postfix) with ESMTPSA id 3vQCKz1D4lz9s8c;
 Sat, 18 Feb 2017 12:41:43 +1100 (AEDT)
Subject: Re: [PATCH linux dev-4.7 2/5] drivers/fsi: Initialize hub master
 engine
To: Christopher Bostic <cbostic@linux.vnet.ibm.com>, joel@jms.id.au
References: <20170216220434.79474-1-cbostic@linux.vnet.ibm.com>
 <20170216220434.79474-3-cbostic@linux.vnet.ibm.com>
 <f0976d5f-bd57-6ec3-9fec-1235429e9d9b@ozlabs.org>
 <51fcb28c-72c9-13d2-92a1-2b007cfe0cf9@linux.vnet.ibm.com>
Cc: openbmc@lists.ozlabs.org
From: Jeremy Kerr <jk@ozlabs.org>
Message-ID: <b17345e1-bcd1-a043-c5e0-304c72be3d6a@ozlabs.org>
Date: Sat, 18 Feb 2017 09:41:25 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
 Thunderbird/45.7.0
MIME-Version: 1.0
In-Reply-To: <51fcb28c-72c9-13d2-92a1-2b007cfe0cf9@linux.vnet.ibm.com>
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
X-List-Received-Date: Sat, 18 Feb 2017 01:41:44 -0000

Hi Chris,

>> [that's why you've altered fsi_dev->size in the master driver, and can
>> potentially lead to conflicts with other drivers in future]
> I altered the dev size due to the incorrect size of hMFSI links/ports in 
> the config table.  More on that below.

But I don't think the sizes are incorrect, if the HW appears as is
described in the docs. More on that below too.

>>  From what I can glean from the docs, the hub master has a couple of
>> interfaces:
>>
>>   - the control register set described in the slave configuration table
>>     as type 0x1d
>>   - a description of the links, as entries in the slave configuration
>>     table as type 0x1c
> 
> I think 0x1d and 0x1c types are swapped in the overall discussion.

Yep, I'd realised that after I sent it, sorry!

>> For cascaded masters, we can probably keep this model of using a slave
>> engine driver, but I just don't think it's suitable for the hubs.
> 
> There isn't much difference conceptually between a cMFSI master and hub 
> hMFSI master.

There is one critical difference for a driver implementation:

 - cMFSI: the master's address space is contained entirely within the
   slave engine (ie, the address and size described in the upstream
   configuration table)

 - hMFSI: the master's address space is entirely *outside* the slave
   engine. The slave engine's address range only describes the
   configuration registers.

> Only things that vary between the two are number of 
> links/ports that might be supported off of them and what size address 
> space their links/ports span.  The cMFSI master on P9 has a 0x8000 byte 
> addressable window per link/port  whereas hMFSI accesses 0x80000 per link.
> 
> The P9 CFAM configuration space does not list the hMFSI port size 
> correctly.  Each link/port is listed as size *0*.
> The cMFSI link/port size is correct, 0x20 1k pages.

I disagree that it's incorrect: the link/port entries in the
configuration table *should* have a zero size, as they do not describe
any address range allocated to a *slave engine*.

[from above: the address range for a hMFSI is not within a slave engine]

What they do give us is the count of links, so we should use them for
that.

Because we know that there's a 0x80000-byte range per link, the link
count does tell us how much of the *slave* address space to allocate,
but that's not what the configuration table size field is intended to
describe.

> Given their similarities it would make sense to me to use the refactored 
> approach you describe above for both hMFSI and and in the future, cMFSI.

The difference above means that cMFSI can be implemented as a
slave-engine driver, because its accesses are all within a slave
engine's allocated address space.

We can probably share a lot of code between the two, because of the
shared control register set. But let's focus on one at a time for now :)

Cheers,


Jeremy
