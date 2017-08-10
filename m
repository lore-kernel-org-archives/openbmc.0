Return-Path: <clg@kaod.org>
Received: from 3.mo179.mail-out.ovh.net (3.mo179.mail-out.ovh.net
 [178.33.251.175])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3xSfgX2qfGzDqs4
 for <openbmc@lists.ozlabs.org>; Thu, 10 Aug 2017 17:20:56 +1000 (AEST)
Received: from player168.ha.ovh.net (b6.ovh.net [213.186.33.56])
 by mo179.mail-out.ovh.net (Postfix) with ESMTP id 3D43D5B6D8
 for <openbmc@lists.ozlabs.org>; Thu, 10 Aug 2017 09:20:53 +0200 (CEST)
Received: from zorba.kaod.org (LFbn-1-10652-153.w90-89.abo.wanadoo.fr
 [90.89.238.153]) (Authenticated sender: postmaster@kaod.org)
 by player168.ha.ovh.net (Postfix) with ESMTPSA id 00A5A420093;
 Thu, 10 Aug 2017 09:20:43 +0200 (CEST)
Subject: Re: [RFC v1 4/4] ipmi_bmc: bt-aspeed: port driver to IPMI BMC
 framework
To: Jeremy Kerr <jk@ozlabs.org>, Brendan Higgins <brendanhiggins@google.com>, 
 minyard@acm.org, benjaminfair@google.com, joel@jms.id.au, andrew@aj.id.au
Cc: openipmi-developer@lists.sourceforge.net, openbmc@lists.ozlabs.org,
 linux-kernel@vger.kernel.org
References: <20170808035301.1980-1-brendanhiggins@google.com>
 <20170808035301.1980-5-brendanhiggins@google.com>
 <99a298c1-6241-f835-9587-31c526126453@ozlabs.org>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <bb6dd1f2-ab07-a24b-6020-71aece987f4e@kaod.org>
Date: Thu, 10 Aug 2017 09:20:43 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <99a298c1-6241-f835-9587-31c526126453@ozlabs.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Ovh-Tracer-Id: 672443720324254487
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrfeelkedrkeeigdduvdegucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddm
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
X-List-Received-Date: Thu, 10 Aug 2017 07:20:56 -0000

On 08/10/2017 04:31 AM, Jeremy Kerr wrote:
> Hi Brendan,
> 
>> The driver was handling interaction with userspace on its own. This
>> patch changes it to use the functionality of the ipmi_bmc framework
>> instead.
>>
>> Note that this removes the ability for the BMC to set SMS_ATN by making
>> an ioctl. If this functionality is required, it can be added back in
>> with a later patch.
> 
> As Chris has mentioned, we do use this actively at the moment, so I'd
> prefer if we could not drop the support for SMS_ATN. However, using a
> different interface should be fine, if that helps.

The ioctl is part of the kernel user API now. We should keep it.

Thanks,

C.  
