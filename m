Return-Path: <ckeepax@opensource.cirrus.com>
Authentication-Results: ozlabs.org; spf=none (mailfrom)
 smtp.mailfrom=opensource.cirrus.com (client-ip=67.231.149.25;
 helo=mx0b-001ae601.pphosted.com; envelope-from=ckeepax@opensource.cirrus.com;
 receiver=<UNKNOWN>)
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3yMNr24J8WzDqlT;
 Wed, 25 Oct 2017 19:40:17 +1100 (AEDT)
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
 by mx0a-001ae601.pphosted.com (8.16.0.21/8.16.0.21) with SMTP id
 v9P84FTk023105; Wed, 25 Oct 2017 03:14:56 -0500
Authentication-Results: ppops.net;
 spf=none smtp.mailfrom=ckeepax@opensource.cirrus.com
Received: from mail1.cirrus.com (mail1.cirrus.com [141.131.3.20])
 by mx0a-001ae601.pphosted.com with ESMTP id 2dr3n01mca-1;
 Wed, 25 Oct 2017 03:14:56 -0500
Received: from EX17.ad.cirrus.com (unknown [172.20.9.81])
 by mail1.cirrus.com (Postfix) with ESMTP id 6C3B6611E12B;
 Wed, 25 Oct 2017 03:14:55 -0500 (CDT)
Received: from imbe.wolfsonmicro.main (198.61.95.81) by EX17.ad.cirrus.com
 (172.20.9.81) with Microsoft SMTP Server id 14.3.301.0; Wed, 25 Oct 2017
 09:14:54 +0100
Received: from localhost.localdomain (algalon.ad.cirrus.com [198.90.223.36])
 by imbe.wolfsonmicro.main (8.14.4/8.14.4) with ESMTP id v9P8Es8G023425;	Wed,
 25 Oct 2017 09:14:54 +0100
Date: Wed, 25 Oct 2017 09:14:54 +0100
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Andrew Jeffery <andrew@aj.id.au>
CC: Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski
 <bgolaszewski@baylibre.com>, Michael Welling <mwelling@emacinc.com>,
 "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Jonathan Corbet
 <corbet@lwn.net>, Joel Stanley <joel@jms.id.au>, Ryan Chen
 <ryan_chen@aspeedtech.com>, Rob Herring <robh+dt@kernel.org>, Frank Rowand
 <frowand.list@gmail.com>, Charles Keepax
 <ckeepax@opensource.wolfsonmicro.com>, Laxman Dewangan
 <ldewangan@nvidia.com>, "linux-doc@vger.kernel.org"
 <linux-doc@vger.kernel.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, <patches@opensource.cirrus.com>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, OpenBMC Maillist
 <openbmc@lists.ozlabs.org>, <linux-aspeed@lists.ozlabs.org>
Subject: Re: [RFC PATCH 3/5] gpio: gpiolib: Add chardev support for
 maintaining GPIO values on reset
Message-ID: <20171025081454.4avrf57mf33khu7c@localhost.localdomain>
References: <20171020033727.21557-1-andrew@aj.id.au>
 <20171020033727.21557-4-andrew@aj.id.au>
 <CACRpkdY4F-ocFxomLEsVyGA0odGooWysQq5MHi9qwUt6E_VDzA@mail.gmail.com>
 <1508490173.24322.53.camel@aj.id.au>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <1508490173.24322.53.camel@aj.id.au>
User-Agent: NeoMutt/20170113 (1.7.2)
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 priorityscore=1501 malwarescore=0
 suspectscore=2 phishscore=0 bulkscore=0 spamscore=0 clxscore=1015
 lowpriorityscore=0 impostorscore=0 adultscore=0 classifier=spam adjust=0
 reason=mlx scancount=1 engine=8.0.1-1707230000 definitions=main-1710250115
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
X-List-Received-Date: Wed, 25 Oct 2017 08:40:19 -0000

On Fri, Oct 20, 2017 at 07:32:53PM +1030, Andrew Jeffery wrote:
> On Fri, 2017-10-20 at 09:27 +0200, Linus Walleij wrote:
> > I don't see it as helpful to give userspace control over whether the line
> > is persistent or not. It is more reasonable to assume persistance for
> > userspace use cases, don't you think? Whether the system goes to sleep
> > or the gpiochip resets should not make a door suddenly close or the
> > lights in the christmas tree go out, right? I think if the gpiochip supports
> > persistance of any kind, we should try to use it and not have userspace
> > provide flags for that.
> 
> Right. I guess the counter argument to your examples is if the gpio is
> controlling any active process that we don't want to continue if we've
> lost the capacity to monitor some other inputs (some kind of dead-man's 
> switch). But maybe the argument is that should be implemented in the
> kernel anyway?
> 

To me it certainly feels like decisions like this should live in
the kernel, your talking about things that could cause very weird
hardware behaviour if set wrong, so it makes sense to me to have
that responsibility guarded in the kernel.

Thanks,
Charles
