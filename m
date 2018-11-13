Return-Path: <clg@kaod.org>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=kaod.org
 (client-ip=46.105.52.148; helo=10.mo5.mail-out.ovh.net;
 envelope-from=clg@kaod.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=kaod.org
Received: from 10.mo5.mail-out.ovh.net (10.mo5.mail-out.ovh.net
 [46.105.52.148])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 42vSw90ptszF3GN
 for <openbmc@lists.ozlabs.org>; Wed, 14 Nov 2018 00:22:15 +1100 (AEDT)
Received: from player756.ha.ovh.net (unknown [10.109.143.189])
 by mo5.mail-out.ovh.net (Postfix) with ESMTP id 344252041F0
 for <openbmc@lists.ozlabs.org>; Tue, 13 Nov 2018 14:03:10 +0100 (CET)
Received: from kaod.org (deibp9eh1--blueice1n0.emea.ibm.com [195.212.29.162])
 (Authenticated sender: postmaster@kaod.org)
 by player756.ha.ovh.net (Postfix) with ESMTPSA id E0BA51200A0;
 Tue, 13 Nov 2018 14:03:07 +0100 (CET)
Subject: Re: [PATCH linux dev-4.18] /dev/mem: add a devmem kernel parameter to
 activate the device
To: Andrew Jeffery <andrew@aj.id.au>, Joel Stanley <joel@jms.id.au>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
References: <20181012080723.15825-1-clg@kaod.org>
 <CACPK8XfTK7SVkq25YXjRKK94YZp8HRJreHKh20Zq6VW=qYF1fA@mail.gmail.com>
 <1541639492.1485316.1569473080.44A0676A@webmail.messagingengine.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <3583a7d8-72ed-a724-418f-016cc5fb9bcd@kaod.org>
Date: Tue, 13 Nov 2018 14:03:05 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.2.1
MIME-Version: 1.0
In-Reply-To: <1541639492.1485316.1569473080.44A0676A@webmail.messagingengine.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Ovh-Tracer-Id: 14667661039936899842
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedtkedrledugdeglecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Tue, 13 Nov 2018 13:22:17 -0000

On 11/8/18 2:11 AM, Andrew Jeffery wrote:
> On Mon, 22 Oct 2018, at 08:54, Joel Stanley wrote:
>> On Fri, 12 Oct 2018 at 18:37, Cédric Le Goater <clg@kaod.org> wrote:
>>>
>>> For security reasons, some configuration needs to run without /dev/mem
>>> but on some occasions, to debug HW for instance, it's still useful to
>>> be able to reboot the system with access to physical memory.
>>>
>>> Add a kernel parameter which activates the /dev/mem device only when
>>> 'mem.devmem' is enabled.
>>>
>>> Signed-off-by: Cédric Le Goater <clg@kaod.org>
>>
>> Thanks Cédric. I've put this in the 4.18 tree.
>>
>> Can you submit this upstream too please?
> 
> Have this been done? Just following up out of interest.

no. 

> I do wonder about it though. /dev/mem is accessible if you're root, but given
>  pretty much everything runs as root on the BMC we turn it off. But if it's just
> a kernel commandline parameter away, it's also just a
> `fw_setenv ... && reboot` away, at which point all the security is gone? If
> you're somehow not root on the BMC then you wouldn't have access even if
> it were present, and you can't change the u-boot environment either.

You seem to be suggesting that we should reactivate /dev/mem ? 

C. 
