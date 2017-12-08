Return-Path: <clg@kaod.org>
Authentication-Results: ozlabs.org; spf=pass (mailfrom) smtp.mailfrom=kaod.org
 (client-ip=178.33.42.204; helo=8.mo6.mail-out.ovh.net;
 envelope-from=clg@kaod.org; receiver=<UNKNOWN>)
X-Greylist: delayed 602 seconds by postgrey-1.36 at bilbo;
 Fri, 08 Dec 2017 19:28:01 AEDT
Received: from 8.mo6.mail-out.ovh.net (8.mo6.mail-out.ovh.net [178.33.42.204])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3ytQTY1Fq3zDsNJ
 for <openbmc@lists.ozlabs.org>; Fri,  8 Dec 2017 19:27:59 +1100 (AEDT)
Received: from player735.ha.ovh.net (b9.ovh.net [213.186.33.59])
 by mo6.mail-out.ovh.net (Postfix) with ESMTP id 02600127485
 for <openbmc@lists.ozlabs.org>; Fri,  8 Dec 2017 09:12:15 +0100 (CET)
Received: from zorba.kaod.org (LFbn-1-2231-173.w90-76.abo.wanadoo.fr
 [90.76.52.173]) (Authenticated sender: postmaster@kaod.org)
 by player735.ha.ovh.net (Postfix) with ESMTPSA id 564A31600B0;
 Fri,  8 Dec 2017 09:12:10 +0100 (CET)
Subject: Re: [PATCH linux dev-4.10] ipmi: add an Aspeed KCS IPMI BMC driver
To: Joel Stanley <joel@jms.id.au>, Haiyue Wang <haiyue.wang@linux.intel.com>
Cc: Andrew Jeffery <andrew@aj.id.au>, Jeremy Kerr <jk@ozlabs.org>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
References: <1512700492-22384-1-git-send-email-haiyue.wang@linux.intel.com>
 <CACPK8XfF1zSL-gF2eUWVyt3x4C1yHSqgLN5+gHH-vDTp4RomSA@mail.gmail.com>
 <000401d36fe9$013e7590$03bb60b0$@linux.intel.com>
 <CACPK8Xd1c=T5WmSE+4MD=ndk5VS4ndtGJX_mB1o-mhnF8onMxw@mail.gmail.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <706c7bda-139e-5024-8648-9022815b9b9c@kaod.org>
Date: Fri, 8 Dec 2017 09:12:09 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.4.0
MIME-Version: 1.0
In-Reply-To: <CACPK8Xd1c=T5WmSE+4MD=ndk5VS4ndtGJX_mB1o-mhnF8onMxw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Ovh-Tracer-Id: 5286944489023179522
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedtuddrudelgdduvdduucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddm
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.24
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Fri, 08 Dec 2017 08:28:01 -0000

On 12/08/2017 07:01 AM, Joel Stanley wrote:
> On Fri, Dec 8, 2017 at 4:24 PM, Haiyue Wang <haiyue.wang@linux.intel.com> wrote:
>> Great notes, will update a new patch later, thanks Joel.
>>
>> I implemented the kcs by referenced the upstream bt driver. And the upstream maintainer is as bellowing,
>> I hope the openbmc expert to review my patch firstly, will send to the maintainer soon. :-)
>>
>> ./scripts/get_maintainer.pl drivers/char/ipmi/bt-bmc.c
>> Corey Minyard <minyard@acm.org> (supporter:IPMI SUBSYSTEM)
>> openipmi-developer@lists.sourceforge.net (moderated list:IPMI SUBSYSTEM)
>> linux-kernel@vger.kernel.org (open list)
> 
> Yep, add to that list:
> 
> openbmc@lists.ozlabs.org
> clg@fr.ibm.com
> jk@ozlabs.org
> andrew@aj.id.au
> joel@jms.id.au

and what about the linux-aspeed@lists.ozlabs.org ? 

C.

> In the past we have spent a long time pre-reviewing on the openbmc
> list, and then had another extensive review process on the upstream
> list. I hope it will help us get the code in a mergeable state faster
> by doing the work upstream, with the OpenBMC team providing input.
> 
> Cheers,
> 
> Joel
> 
