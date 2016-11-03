Return-Path: <clg@kaod.org>
Received: from 11.mo1.mail-out.ovh.net (11.mo1.mail-out.ovh.net
 [188.165.48.29])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3t8vZJ731wzDvVg
 for <openbmc@lists.ozlabs.org>; Fri,  4 Nov 2016 06:06:00 +1100 (AEDT)
Received: from player770.ha.ovh.net (b7.ovh.net [213.186.33.57])
 by mo1.mail-out.ovh.net (Postfix) with ESMTP id 97C781809D
 for <openbmc@lists.ozlabs.org>; Thu,  3 Nov 2016 19:46:32 +0100 (CET)
Received: from hermes.kaod.org (LFbn-1-2234-107.w90-76.abo.wanadoo.fr
 [90.76.55.107]) (Authenticated sender: clg@kaod.org)
 by player770.ha.ovh.net (Postfix) with ESMTPSA id E4FB73C007D;
 Thu,  3 Nov 2016 19:46:28 +0100 (CET)
Subject: Re: [PATCH linux dev-4.7 7/8] ipmi: maintain a request expiry list
To: Patrick Williams <patrick@stwcx.xyz>, Cyril Bur <cyrilbur@gmail.com>,
 Brendan Higgins <brendanhiggins@google.com>
References: <1477465067-19034-1-git-send-email-clg@kaod.org>
 <1477465067-19034-8-git-send-email-clg@kaod.org>
 <1478132769.728.3.camel@gmail.com> <20161103182300.wt2lyseogigfxqfn@asimov>
Cc: openbmc@lists.ozlabs.org
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <53954820-3eaf-56c6-0a4c-9347ff4dc358@kaod.org>
Date: Thu, 3 Nov 2016 19:46:28 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
 Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <20161103182300.wt2lyseogigfxqfn@asimov>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 8bit
X-Ovh-Tracer-Id: 9657969403954498306
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrfeelvddrkeejgddutddtucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddm
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
X-List-Received-Date: Thu, 03 Nov 2016 19:06:01 -0000

On 11/03/2016 07:23 PM, Patrick Williams wrote:
> On Thu, Nov 03, 2016 at 11:26:09AM +1100, Cyril Bur wrote:
>> On Wed, 2016-10-26 at 08:57 +0200, Cédric Le Goater wrote:
>>> Regarding the response expiration handling, the IPMI spec says :
>>>
>>>    The BMC must not return a given response once the corresponding
>>>    Request-to-Response interval has passed. The BMC can ensure this
>>>    by maintaining its own internal list of outstanding requests
>>> through
>>>    the interface. The BMC could age and expire the entries in the
>>> list
>>>    by expiring the entries at an interval that is somewhat shorter
>>> than
>>>    the specified Request-to-Response interval....
>>>
>>> To handle such case, we maintain list of received requests using the
>>> seq number of the BT message to identify them. The list is updated
>>> each time a request is received and a response is sent. The
>>> expiration
>>> of the reponses is handled at each updates but also with a timer.
>>>
>>
>> I agree that the BMC kernel is most logical place to do this, at the
>> moment btbridged does attempt something similar no?
>>
>> Should we patch btbridged to not? Should I least remove duplicated
>> logic? 
>>
> 
> Brendan,
> 
> Are you paying attention to this discussion?  I think you had some
> opposition to the kernel doing any additional work in this space because
> you wanted to run a non-IPMI protocol over the IPMI bridge.

We will then need a new kernel driver for the non-IPMI interface. 
This one is for the iBT interface which is IPMI oriented. 

I am sure we can find some common points though. Hopefully, the 
userspace interface would be the same. For the moment we only
have an ioctl for the SMS ATN interrupt but we should be adding
some more.

Thanks,

C.  
