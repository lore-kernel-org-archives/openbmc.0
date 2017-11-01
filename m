Return-Path: <ckeepax@opensource.cirrus.com>
Authentication-Results: ozlabs.org; spf=none (mailfrom)
 smtp.mailfrom=opensource.cirrus.com (client-ip=67.231.149.25;
 helo=mx0b-001ae601.pphosted.com; envelope-from=ckeepax@opensource.cirrus.com;
 receiver=<UNKNOWN>)
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3yRkVf6nVyzDr4H;
 Wed,  1 Nov 2017 21:10:14 +1100 (AEDT)
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
 by mx0a-001ae601.pphosted.com (8.16.0.21/8.16.0.21) with SMTP id
 vA1A8YtG020389; Wed, 1 Nov 2017 05:09:58 -0500
Authentication-Results: ppops.net;
 spf=none smtp.mailfrom=ckeepax@opensource.cirrus.com
Received: from mail1.cirrus.com (mail1.cirrus.com [141.131.3.20])
 by mx0a-001ae601.pphosted.com with ESMTP id 2dxfrvh5rn-1;
 Wed, 01 Nov 2017 05:09:57 -0500
Received: from EX17.ad.cirrus.com (unknown [172.20.9.81])
 by mail1.cirrus.com (Postfix) with ESMTP id 1E944611E123;
 Wed,  1 Nov 2017 05:09:57 -0500 (CDT)
Received: from imbe.wolfsonmicro.main (198.61.95.81) by EX17.ad.cirrus.com
 (172.20.9.81) with Microsoft SMTP Server id 14.3.301.0; Wed, 1 Nov 2017
 10:09:56 +0000
Received: from localhost.localdomain (algalon.ad.cirrus.com [198.90.223.36])
 by imbe.wolfsonmicro.main (8.14.4/8.14.4) with ESMTP id vA1A9rYh028360;	Wed,
 1 Nov 2017 10:09:53 GMT
Date: Wed, 1 Nov 2017 10:09:53 +0000
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Andrew Jeffery <andrew@aj.id.au>
CC: <linux-gpio@vger.kernel.org>, <linus.walleij@linaro.org>,
 <robh+dt@kernel.org>, <mark.rutland@arm.com>, <frowand.list@gmail.com>,
 <joel@jms.id.au>, <ckeepax@opensource.wolfsonmicro.com>,
 <ldewangan@nvidia.com>, <ryan_chen@aspeedtech.com>,
 <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <openbmc@lists.ozlabs.org>, <linux-aspeed@lists.ozlabs.org>
Subject: Re: [PATCH v3 1/2] gpio: gpiolib: Generalise state persistence
 beyond sleep
Message-ID: <20171101100953.ye5fp33vxuol5z5a@localhost.localdomain>
References: <20171101040457.1200-1-andrew@aj.id.au>
 <20171101040457.1200-2-andrew@aj.id.au>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20171101040457.1200-2-andrew@aj.id.au>
User-Agent: NeoMutt/20170113 (1.7.2)
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 priorityscore=1501 malwarescore=0
 suspectscore=2 phishscore=0 bulkscore=0 spamscore=0 clxscore=1011
 lowpriorityscore=0 impostorscore=0 adultscore=0 classifier=spam adjust=0
 reason=mlx scancount=1 engine=8.0.1-1707230000 definitions=main-1711010144
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
X-List-Received-Date: Wed, 01 Nov 2017 10:10:19 -0000

On Wed, Nov 01, 2017 at 03:04:56PM +1100, Andrew Jeffery wrote:
> General support for state persistence is added to gpiolib with the
> introduction of a new pinconf parameter to propagate the request to
> hardware. The existing persistence support for sleep is adapted to
> include hardware support if the GPIO driver provides it. Persistence
> continues to be enabled by default; in-kernel consumers can opt out, but
> userspace (currently) does not have a choice.
> 
> The *_SLEEP_MAY_LOSE_VALUE and *_SLEEP_MAINTAIN_VALUE symbols are
> renamed, dropping the SLEEP prefix to reflect that the concept is no
> longer sleep-specific.  I feel that renaming to just *_MAY_LOSE_VALUE
> could initially be misinterpreted, so I've further changed the symbols
> to *_TRANSITORY and *_PERSISTENT to address this.
> 
> The sysfs interface is modified only to keep consistency with the
> chardev interface in enforcing persistence for userspace exports.
> 
> Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
> ---

Reviewed-by: Charles Keepax <ckeepax@opensource.cirrus.com>

Thanks,
Charles
