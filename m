Return-Path: <clg@kaod.org>
Received: from 20.mo1.mail-out.ovh.net (20.mo1.mail-out.ovh.net
 [188.165.45.168])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3ssrYQ5YPPzDrL1
 for <openbmc@lists.ozlabs.org>; Mon, 10 Oct 2016 17:58:02 +1100 (AEDT)
Received: from player726.ha.ovh.net (b7.ovh.net [213.186.33.57])
 by mo1.mail-out.ovh.net (Postfix) with ESMTP id 9D6F2135DD
 for <openbmc@lists.ozlabs.org>; Mon, 10 Oct 2016 08:57:57 +0200 (CEST)
Received: from hermes.kaod.org (LFbn-1-2234-107.w90-76.abo.wanadoo.fr
 [90.76.55.107]) (Authenticated sender: clg@kaod.org)
 by player726.ha.ovh.net (Postfix) with ESMTPSA id 1F68F2A006C;
 Mon, 10 Oct 2016 08:57:55 +0200 (CEST)
Subject: Re: [PATCH u-boot 00/12] config cleanups and small fixes
To: Joel Stanley <joel@jms.id.au>
References: <1475789205-19618-1-git-send-email-clg@kaod.org>
 <6450afc7-7750-5282-aecc-408fd3a11df3@kaod.org>
 <CACPK8XcoqDt_kGCVVt=B-8T28xJVbOfwYjVk1o=DEQ+DHO1ayQ@mail.gmail.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <ce2e3595-031c-97c4-7173-bccfd999bf14@kaod.org>
Date: Mon, 10 Oct 2016 08:57:55 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
 Thunderbird/45.3.0
MIME-Version: 1.0
In-Reply-To: <CACPK8XcoqDt_kGCVVt=B-8T28xJVbOfwYjVk1o=DEQ+DHO1ayQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
X-Ovh-Tracer-Id: 4320359421238217474
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrfeelvddrfeejgddvjeeiucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddm
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
X-List-Received-Date: Mon, 10 Oct 2016 06:58:03 -0000

On 10/10/2016 08:24 AM, Joel Stanley wrote:
> On Fri, Oct 7, 2016 at 6:24 PM, Cédric Le Goater <clg@kaod.org> wrote:
>> On 10/06/2016 11:26 PM, Cédric Le Goater wrote:
>>> Hello,
>>>
>>> Here is a set of cleanups on the configuration. It should ease the
>>> port on v2016.11 which is a little more strict on CONFIG_ defines.
> 
> Nice one! I had a look at all of the patches and they look good. 

The goal of the clean up is to reshuffle a bit our patches for upstreaming
and have a patchset organized like this:

  1 - core enablement G4 + G5 (minimal lowlevel init)
  2 - core enablement G4 + G5 (extra lowlevel init)
  3 - hacks patch (to fix)
  4 - ftgmac100 driver extensions patch
  5 - non ncsi platforms patch (should be only defconfigs files)
  6 - flash driver patch (needs a rewrite but there are works being done in
      that area in mainline)
  7 - aspeednic driver patch (should be deprecated  one day)
  8 - ncsi platforms patch (should be only defconfigs files)

So this is very close to what we have today and the work is mostly on the 
configuration. 

I am not sure about the 1-2 split. This is currently well contained in one
routine so it might be better to keep as it is. It would be easier to update 
also with Aspeed modifications.


> I will hold off on the last two relating to ramdisk until we see what
> upstream say.

yes. I am not sure where we stand on this. 

Uboot code is a bit fuzzy in that area as it seems that legacy images 
and ATAGS boot are not the most common path. What I found curious is 
that the load address of the ram disk image is not used at all. I hope 
the maintainers will clarify a bit what should be done. It should be a 
"simple".

>> You will need this patch to start with :
>>
>>         https://github.com/legoater/u-boot/commit/d76a5e74286cd903c4eb96c3b5f762672121b02a
>>
>> forgot to send it :/
> 
> No worries, I will include it.

Thanks,
C. 
