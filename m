Return-Path: <clg@kaod.org>
Received: from 11.mo1.mail-out.ovh.net (11.mo1.mail-out.ovh.net
 [188.165.48.29])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3tDwJp5yTMzDvNT
 for <openbmc@lists.ozlabs.org>; Thu, 10 Nov 2016 18:53:14 +1100 (AEDT)
Received: from player691.ha.ovh.net (b9.ovh.net [213.186.33.59])
 by mo1.mail-out.ovh.net (Postfix) with ESMTP id A0EC11A1E9
 for <openbmc@lists.ozlabs.org>; Thu, 10 Nov 2016 08:53:10 +0100 (CET)
Received: from hermes.kaod.org (LFbn-1-2234-107.w90-76.abo.wanadoo.fr
 [90.76.55.107]) (Authenticated sender: clg@kaod.org)
 by player691.ha.ovh.net (Postfix) with ESMTPSA id 62F8B260090;
 Thu, 10 Nov 2016 08:53:06 +0100 (CET)
Subject: Re: [PATCH linux dev-4.7 7/8] ipmi: maintain a request expiry list
To: Cyril Bur <cyrilbur@gmail.com>, openbmc@lists.ozlabs.org,
 Joel Stanley <joel@jms.id.au>, Brendan Higgins <brendanhiggins@google.com>
References: <1477465067-19034-1-git-send-email-clg@kaod.org>
 <1477465067-19034-8-git-send-email-clg@kaod.org>
 <1478132769.728.3.camel@gmail.com>
 <d53f2c10-4ae7-a7f6-827f-581d671341a7@kaod.org>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <14750140-6c7f-fa2a-d45a-c25f85acae88@kaod.org>
Date: Thu, 10 Nov 2016 08:53:06 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
 Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <d53f2c10-4ae7-a7f6-827f-581d671341a7@kaod.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
X-Ovh-Tracer-Id: 2838675142433344333
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrfeelfedrtddvgddutdejucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddm
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
X-List-Received-Date: Thu, 10 Nov 2016 07:53:15 -0000

On 11/03/2016 10:06 AM, Cédric Le Goater wrote:
> On 11/03/2016 01:26 AM, Cyril Bur wrote:
>> On Wed, 2016-10-26 at 08:57 +0200, Cédric Le Goater wrote:
>>> Regarding the response expiration handling, the IPMI spec says :
>>>
>>>    The BMC must not return a given response once the corresponding
>>>    Request-to-Response interval has passed. The BMC can ensure this
>>>    by maintaining its own internal list of outstanding requests through
>>>    the interface. The BMC could age and expire the entries in the list
>>>    by expiring the entries at an interval that is somewhat shorter than
>>>    the specified Request-to-Response interval....
>>>
>>> To handle such case, we maintain list of received requests using the
>>> seq number of the BT message to identify them. The list is updated
>>> each time a request is received and a response is sent. The
>>> expirationof the reponses is handled at each updates but also 
>>> with a timer.
>>>
>>
>> I agree that the BMC kernel is most logical place to do this, at the
>> moment btbridged does attempt something similar no?
>>
>>
>> Should we patch btbridged to not? Should I least remove duplicated
>> logic? 
> 
> yes probably. Let's see what mainline says about it first. 
> The patch has a minor flaw: struct ipmi_request should include 
> the NetFn and Command values. Corey might ask for a resend.

So it seems this patch is raising more questions than solving 
problems. Let's leave it aside for the moment and keep the list
in btbridged.

Thanks,

C.
