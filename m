Return-Path: <ckeepax@opensource.cirrus.com>
Authentication-Results: ozlabs.org; spf=none (mailfrom)
 smtp.mailfrom=opensource.cirrus.com (client-ip=67.231.149.25;
 helo=mx0b-001ae601.pphosted.com; envelope-from=ckeepax@opensource.cirrus.com;
 receiver=<UNKNOWN>)
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3yN1Jb305tzDqkH;
 Thu, 26 Oct 2017 20:03:42 +1100 (AEDT)
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
 by mx0a-001ae601.pphosted.com (8.16.0.21/8.16.0.21) with SMTP id
 v9Q8xGJi005347; Thu, 26 Oct 2017 04:03:21 -0500
Authentication-Results: ppops.net;
 spf=none smtp.mailfrom=ckeepax@opensource.cirrus.com
Received: from mail4.cirrus.com ([87.246.98.35])
 by mx0a-001ae601.pphosted.com with ESMTP id 2dr3n03rdw-1;
 Thu, 26 Oct 2017 04:03:21 -0500
Received: from EX17.ad.cirrus.com (unknown [172.20.9.81])
 by mail4.cirrus.com (Postfix) with ESMTP id BBA83611CE6C;
 Thu, 26 Oct 2017 04:03:18 -0500 (CDT)
Received: from imbe.wolfsonmicro.main (198.61.95.81) by EX17.ad.cirrus.com
 (172.20.9.81) with Microsoft SMTP Server id 14.3.301.0; Thu, 26 Oct 2017
 10:03:19 +0100
Received: from localhost.localdomain (algalon.ad.cirrus.com [198.90.223.36])
 by imbe.wolfsonmicro.main (8.14.4/8.14.4) with ESMTP id v9Q93IA4010607;	Thu,
 26 Oct 2017 10:03:18 +0100
Date: Thu, 26 Oct 2017 10:03:18 +0100
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Andrew Jeffery <andrew@aj.id.au>
CC: <linux-gpio@vger.kernel.org>, <linus.walleij@linaro.org>,
 <robh+dt@kernel.org>, <mark.rutland@arm.com>, <frowand.list@gmail.com>,
 <joel@jms.id.au>, <ckeepax@opensource.wolfsonmicro.com>,
 <ldewangan@nvidia.com>, <ryan_chen@aspeedtech.com>,
 <bgolaszewski@baylibre.com>, <mwelling@emacinc.com>,
 <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <openbmc@lists.ozlabs.org>, <linux-aspeed@lists.ozlabs.org>
Subject: Re: [PATCH 1/2] gpio: gpiolib: Expand sleep tolerance to include
 controller reset
Message-ID: <20171026090318.uv6lvmkt4injiihc@localhost.localdomain>
References: <20171025050417.27992-1-andrew@aj.id.au>
 <20171025050417.27992-2-andrew@aj.id.au>
 <20171025083201.wdudlzgphypyhmwc@localhost.localdomain>
 <1508978453.13477.7.camel@aj.id.au>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1508978453.13477.7.camel@aj.id.au>
User-Agent: NeoMutt/20170113 (1.7.2)
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 priorityscore=1501 malwarescore=0
 suspectscore=2 phishscore=0 bulkscore=0 spamscore=0 clxscore=1015
 lowpriorityscore=0 impostorscore=0 adultscore=0 classifier=spam adjust=0
 reason=mlx scancount=1 engine=8.0.1-1707230000 definitions=main-1710260126
X-Mailman-Approved-At: Mon, 30 Oct 2017 15:18:14 +1100
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
X-List-Received-Date: Thu, 26 Oct 2017 09:03:43 -0000

On Thu, Oct 26, 2017 at 11:10:53AM +1030, Andrew Jeffery wrote:
> On Wed, 2017-10-25 at 09:32 +0100, Charles Keepax wrote:
> > On Wed, Oct 25, 2017 at 03:34:16PM +1030, Andrew Jeffery wrote:
> > This means that if we have a set_config we are directly
> > equating PERSISTENT to RESET_TOLERANT, which seems wrong to
> > me. I might have a GPIO on a controller with pinconf that
> > doesn't have anything to do with RESET_TOLERANT. Should the
> > PIN_CONFIG_RESET_TOLERANT, really just be PIN_CONFIG_PERSISTENT?
> > And then its upto the driver what persistence means for that
> > chip?
> 
> Right, maybe I'm tying the design in a bit too closely with the Aspeed hardware
> again. I'm coming out in favour of changing it based on my thoughts below.
> 
> However, I want to understand whether there are alternatives to reset tolerance
> as a property. The obvious one is sleep persistence as implemented in the
> Arizona driver, but it didn't take the set_config() route with its initial
> implementation.
> 
> The set_config() approach was largely driven by the sysfs patch in
> the RFC series, because I wanted a way to propagate the desired property
> to hardware without affecting (or again calling through the handlers for) the
> export state or direction. It seemed to come out neat enough in general so I
> kept it.
> 
> Were you thinking of using set_config() to control the Arizona's behaviour and
> do something other than the calls to gpiochip_line_is_persistent() in
> arizona_gpio_direction_{in,out}() (as in, keep the state inside the device
> driver rather than querying gpiolib where the state is currently stored)? That
> would seem neat in that it gives us one method of setting both persistence
> types (and in this case I should rename the pinconf parameter). With that we
> could probably get rid of gpiochip_line_is_persistent(). A small downside is
> some duplicated state (we probably still want to keep FLAG_TRANSITORY in
> gpiolib).
> 
> Would it be reasonable for other drivers to implement sleep persistence in the
> same manner as the Arizona driver currently does? If that's the case, I don't
> think there is a third tolerance option in addition to sleep and reset, and so
> we might not need to rename the pinconf parameter.
> 
> Finally, we could implement reset persistence in the same manner as the
> Arizona's sleep persistence (with gpiochip_line_is_persistent()) given the
> sysfs patch has been thrown away.
> 
> So to summarise, having rambled a bit, I see the situation as:
> 
> 1. Rename the pinconf parameter, and patch the Arizona driver to use
>    set_config() and hold sleep persistence state internally.
> 2. Drop the pinconf parameter and do something similar to the Arizona's sleep
>    persistence for reset persistence in the Aspeed driver.
> 3. Keep things as proposed are and live with two approaches to persistence
> 
> Point 3 seems like the least desirable. I'm leaning towards 1. I could probably
> live with 2. after experimenting with it and confirming it's workable for me.
> 
> If you think 1. is the way to go are you happy for me to send a patch to the
> Arizona driver implementing the change?
> 

I guess the design was more playing to the fact that in the
Arizona case we arn't really setting any register bit for the
persisence, we are just not letting the CODEC power down whilst
the GPIO is in use. The config approach does make more sense in
the case where you are actually setting register bits.

I don't have any great objection to keeping the persistence state
in the Arizona GPIO driver, but it does seem to be duplicating
the state a little. Also an early version of the patch chain did
that and we decided it would better in the core.

I am not opposed to option 3 either. For example open-drain has
a similar setup where there is a pin config option for it and
also a GPIO function call to check for its presence on a specific
GPIO. Certainly my objection was just that we were equating the
very generic property to a very specific pinconf.

I think I would probably be keen to see what Linus's thoughts
are, but my feelings are really your patch is probably good if we
just rename the RESET_TOLERANT pinconf to something a little more
generic.

Thanks,
Charles
