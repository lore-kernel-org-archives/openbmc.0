Return-Path: <jk@ozlabs.org>
Received: from ozlabs.org (ozlabs.org [103.22.144.67])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 398721A0F42
 for <openbmc@lists.ozlabs.org>; Wed, 28 Oct 2015 12:41:02 +1100 (AEDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by ozlabs.org (Postfix) with ESMTPSA id C7B03140D8F;
 Wed, 28 Oct 2015 12:41:01 +1100 (AEDT)
Subject: Re: [PATCH linux 2/3] gpio/aspeed: Expose entire bank as one gpio chip
To: Joel Stanley <joel@jms.id.au>, Norman James <njames@us.ibm.com>
References: <1445951600-17505-1-git-send-email-patches@stwcx.xyz>
 <1445951600-17505-3-git-send-email-patches@stwcx.xyz>
 <201510271331.t9RDVvi1017078@d03av03.boulder.ibm.com>
 <CACPK8XfeRSMrbOvw7wG=kKcxLvK+gt=LHa98r7wr+m3E61be6Q@mail.gmail.com>
Cc: OpenBMC Patches <patches@stwcx.xyz>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
From: Jeremy Kerr <jk@ozlabs.org>
Message-ID: <563027A9.7030301@ozlabs.org>
Date: Wed, 28 Oct 2015 09:40:57 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
 Thunderbird/38.3.0
MIME-Version: 1.0
In-Reply-To: <CACPK8XfeRSMrbOvw7wG=kKcxLvK+gt=LHa98r7wr+m3E61be6Q@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.20
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Wed, 28 Oct 2015 01:41:02 -0000

Hi all,

>> Will the old gpio #'s still work with this?
> 
> You will need to update the numbers.
> 
> Jeremy, can you let Norm know how to calculate the numbers? Perhaps
> some documentation in the docs repo as a cheatsheet?

Good plan, I'll do that.

>> Can I export by gpio pin name? echo "A3" > /sys/class/gpio/export?
> 
> It appears the gpio subsystem does not allow for this; we need to
> export by numbers. Once you have exported the device it shows up with
> the GPIOX# name as used in the datasheet and schematic.

... and that seems a bit silly. I'll see if we can add functionality to
export by name. If not, let's drop the names (as you need to know the
numbers to be able to export anyway).

Regards,


Jeremy
