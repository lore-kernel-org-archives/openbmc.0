Return-Path: <jk@ozlabs.org>
Received: from ozlabs.org (bilbo.ozlabs.org [103.22.144.67])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3xLMb20QKczDrJP
 for <openbmc@lists.ozlabs.org>; Mon, 31 Jul 2017 11:40:14 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=ozlabs.org header.i=@ozlabs.org header.b="pMmxSKcC"; 
 dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by ozlabs.org (Postfix) with ESMTPSA id 3xLMb13YwZz9sRg;
 Mon, 31 Jul 2017 11:40:13 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ozlabs.org; s=201707;
 t=1501465213; bh=UyLSOzROgQbHyMbgcWIB73GhxNv/teyvYdMnfYxiT34=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=pMmxSKcCVxe4LPti4A7SAV4cnI4Qy1tx3xwD9aUI8ps5iHk65W/aOmqq9gbXvR88I
 EabtUPxOQJ5OyHk7wdD8pKeAr9CY3jPA9pFdvTTc5JTzMV/oew5bIRKJpOVdCPrjHD
 6CeYwXsdV/DYRAbvql1ol099N0pPbsB0fFmACcovMa9A8ZRO/lp2olfumDbVotSooY
 vj/wPQFabtULHYHTijoxvmsCD6t/7z7ReuyDxCYCNapxe3VsrxJZ7sznQO+P46uCJL
 F+oOC1C9jWMjbIP3y7l5zfnusHMMN070zapoUmHm4zyhs50fWlMWakJFWM5bWllM8c
 x7E9SJKaN3jRw==
Subject: Re: [PATCH linux dev-4.10] drivers/fsi: Remove scan from master
 registration
To: Patrick Williams <patrick@stwcx.xyz>,
 Eddie James <eajames@linux.vnet.ibm.com>
Cc: openbmc@lists.ozlabs.org, "Edward A. James" <eajames@us.ibm.com>,
 cbostic@linux.vnet.ibm.com
References: <1501180508-4009-1-git-send-email-eajames@linux.vnet.ibm.com>
 <0a2cb633-ae2a-7dd2-fe7d-cf565be4d8c2@ozlabs.org>
 <9d456a46-bf10-a977-1f38-a84995b08764@linux.vnet.ibm.com>
 <20170728151405.GB14987@asimov>
From: Jeremy Kerr <jk@ozlabs.org>
Message-ID: <abbfb937-cefd-c7e3-3acf-be4092624273@ozlabs.org>
Date: Mon, 31 Jul 2017 09:40:12 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <20170728151405.GB14987@asimov>
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
X-List-Received-Date: Mon, 31 Jul 2017 01:40:15 -0000

Hi Eddie & Patrick,

> On Fri, Jul 28, 2017 at 09:57:23AM -0500, Eddie James wrote:
>> 2) FSI operations while the host is booting can cause FSI failures. 
>> Since we don't know the state of the host while booting the BMC, it's 
>> generally not safe to do FSI ops as we may disrupt the host.
> 
> From my perspective this is especially bad because it would only surface
> in specific timing conditions.  The FSI bus is, by the system
> architecture, under the control of the Host for a period during the
> boot.

OK, so this sounds like a good reason to add some form of arbitration,
but this patch isn't sufficient to handle that - we still have GPIO
initialisation on (FSI master) driver probe, and there's other
facilities that would cause the BMC to access the bus, potentially in
conflict with the host master.

So, I'd suggest this instead:

 - add a 'blocked' state to the fsi master driver, which prevents
   *all* accesses to the GPIOs, including during init; all master
   reads/writes would return -EBUSY.

 - add a boolean device tree property to indicate that a master should
   be initialised in blocked state (preventing GPIO changes during
   probe)

   It would make sense for this property to be associated with the
   'fsi-master' compatible value, as it'd potentially apply to all
   master implementations, not just GPIO-based ones.

 - add a sysfs file to control blocked state, which would be updated
   when the host acquires/releases control of the bus.

We may want to rethink the 'external mode' implementation to work with
this too.

Regards,


Jeremy
