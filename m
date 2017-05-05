Return-Path: <jk@ozlabs.org>
Received: from ozlabs.org (ozlabs.org [103.22.144.67])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3wJvc46Pf2zDqBQ
 for <openbmc@lists.ozlabs.org>; Fri,  5 May 2017 11:35:48 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by ozlabs.org (Postfix) with ESMTPSA id 3wJvc447lgz9s8T;
 Fri,  5 May 2017 11:35:48 +1000 (AEST)
Subject: Re: [PATCH RFC] Documentation/devicetree: Add specification for FSI
 busses
To: Eddie James <eajames@linux.vnet.ibm.com>, devicetree@vger.kernel.org,
 openbmc@lists.ozlabs.org
References: <1493704508-27119-1-git-send-email-jk@ozlabs.org>
 <eb310c6a-0b41-aecd-2ae5-025a8f64b152@linux.vnet.ibm.com>
From: Jeremy Kerr <jk@ozlabs.org>
Message-ID: <dff34fc5-bd04-4053-af4e-da12d3a824ef@ozlabs.org>
Date: Fri, 5 May 2017 09:35:48 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
 Thunderbird/45.7.0
MIME-Version: 1.0
In-Reply-To: <eb310c6a-0b41-aecd-2ae5-025a8f64b152@linux.vnet.ibm.com>
Content-Type: text/plain; charset=windows-1252
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
X-List-Received-Date: Fri, 05 May 2017 01:35:49 -0000

Hi Eddie,

> I have no problem with this as an example, but it isn't exactly how the
> tree will look under the p8/p9 fsi-attached i2c master. We will instead
> need a list of ports on the master. Then you could put actual devices
> (eeproms, etc) under the ports if desired.

Yes, this was intended as a fairly simple example. That's a good point
though, and I'll change the compatible string there so that I'm not
implying that it's representing the actual FSI I2c device that we're
working on.

Thanks for the review.

Cheers,


Jeremy
