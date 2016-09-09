Return-Path: <clg@kaod.org>
X-Greylist: delayed 581 seconds by postgrey-1.36 at bilbo;
 Sat, 10 Sep 2016 02:40:19 AEST
Received: from 3.mo178.mail-out.ovh.net (3.mo178.mail-out.ovh.net
 [46.105.44.197])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3sW2xb5rlWzDrpW
 for <openbmc@lists.ozlabs.org>; Sat, 10 Sep 2016 02:40:19 +1000 (AEST)
Received: from player714.ha.ovh.net (b7.ovh.net [213.186.33.57])
 by mo178.mail-out.ovh.net (Postfix) with ESMTP id AA6A9FF9C31
 for <openbmc@lists.ozlabs.org>; Fri,  9 Sep 2016 18:30:32 +0200 (CEST)
Received: from hermes.kaod.org (LFbn-1-2234-107.w90-76.abo.wanadoo.fr
 [90.76.55.107]) (Authenticated sender: clg@kaod.org)
 by player714.ha.ovh.net (Postfix) with ESMTPSA id 557343C006B;
 Fri,  9 Sep 2016 18:30:27 +0200 (CEST)
Subject: Re: [RFC 0/2] misc: bt: added Block Transfer over I2C
To: Joel Stanley <joel@jms.id.au>, Brendan Higgins <brendanhiggins@google.com>
References: <1473370130-26681-1-git-send-email-brendanhiggins@google.com>
 <CACPK8XfeS5obZguFmRPhw5OtvaSjmSnYvsxH45N743FZDE+y2w@mail.gmail.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <e45ff4e7-9e3f-f9fc-cc45-bcd12a53172a@kaod.org>
Date: Fri, 9 Sep 2016 18:30:26 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
 Thunderbird/45.2.0
MIME-Version: 1.0
In-Reply-To: <CACPK8XfeS5obZguFmRPhw5OtvaSjmSnYvsxH45N743FZDE+y2w@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Ovh-Tracer-Id: 16404080169235352322
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrfeeluddrieeggddutdefucdltddurdefledtrddttddmucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddm
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.22
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Fri, 09 Sep 2016 16:40:20 -0000

On 09/09/2016 07:22 AM, Joel Stanley wrote:
> Hey Brendan,
> 
> On Fri, Sep 9, 2016 at 6:58 AM, Brendan Higgins
> <brendanhiggins@google.com> wrote:
>> Looking for feedback on my new bt-i2c (Block Transfer over I2C) interface.
> 
> Thanks for sending this out. You're setting a great example for the rest of us!
> 
> I don't have an specific feedback for you, other than to say I think
> what you are doing is reasonable.
> 
>> I based the slave side (BMC) driver on the bt-host driver; the file system
>> interface is fully compatible and has been tested with btbridged and ipmid
>> running on an ast2500 evb.
> 
> This is timely. Cedric has recently sent out the bt-host patches[1].
> One of the questions raised was the suitability of the userspace API
> for other users. It would be useful for you to put forward your
> thoughts on that discussion.
> 
> [1] http://www.spinics.net/lists/arm-kernel/msg527834.html

yes. The main question is about the use of the ioctl to propagate
the SMS ATN event to the host. I think this is probably the best
method but as this is a user API, we should be careful with what we
merge. I don't know any other implementation of a IPMI BT driver 
for the BMC side. 

Also, the drivers should probably be under char/ipmi. I will change
that.  

Finaly, the device name should contain "ipmi" IMO. Let's find a
name ! or a pattern at least.

Thanks,

C.
