Return-Path: <jk@ozlabs.org>
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3wk1Bs00PWzDqL5
 for <openbmc@lists.ozlabs.org>; Thu,  8 Jun 2017 20:00:36 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by ozlabs.org (Postfix) with ESMTPSA id 3wk1Br2lnGz9s89;
 Thu,  8 Jun 2017 20:00:36 +1000 (AEST)
Subject: Re: [PATCH linux dev-4.10] drivers/fsi: Break and set pin states on
 GPIO master remove
To: Alistair Popple <alistair@popple.id.au>, openbmc@lists.ozlabs.org
Cc: Christopher Bostic <cbostic@linux.vnet.ibm.com>
References: <20170606200230.77482-1-cbostic@linux.vnet.ibm.com>
 <1ac7a650-9524-4c50-f449-b5fc89e8d988@ozlabs.org>
 <bdb441e5-5485-9a67-1749-029f684162f9@linux.vnet.ibm.com>
 <2986922.Yi4HN7lb1t@new-mexico>
From: Jeremy Kerr <jk@ozlabs.org>
Message-ID: <ce283d8e-ba55-9476-8409-e5982a63034f@ozlabs.org>
Date: Thu, 8 Jun 2017 18:00:35 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.1.1
MIME-Version: 1.0
In-Reply-To: <2986922.Yi4HN7lb1t@new-mexico>
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
X-List-Received-Date: Thu, 08 Jun 2017 10:00:37 -0000

Hi Alistair & Chris,

>> The pins are set here mainly for the benefit of the Cronus debug 
>> tools.   Its common practice in test and bringup labs to switch back and 
>> forth between BMC and FSP-2 with Cronus to access the host processor 
>> CFAMs over FSI.  Without the remove pin state changes Cronus cannot access.
> 
> As far as I know you have to run "systemctl start fsi-disable.service"
> to switch over to Cronus mode. I think Jeremy's point is that it
> should be that service which explicitly sets up the hardware in a
> suitable mode rather than relying on side-effects from removing the
> kernel driver.

Yep, spot on.

Also, those side-effects might not be how the GPIOs need to configured
for the next usage of the FSI bus (which could be Cronus, but could also
be any other tool). So, let those tools handle the init correctly,
rather than the kernel making a guess at it.

Cheers,


Jeremy
