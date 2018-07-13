Return-Path: <gregkh@linuxfoundation.org>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=linuxfoundation.org
 (client-ip=140.211.169.12; helo=mail.linuxfoundation.org;
 envelope-from=gregkh@linuxfoundation.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linuxfoundation.org
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org
 [140.211.169.12])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 41S2KK3Ym5zF35V
 for <openbmc@lists.ozlabs.org>; Sat, 14 Jul 2018 05:04:05 +1000 (AEST)
Received: from localhost (LFbn-1-12247-202.w90-92.abo.wanadoo.fr
 [90.92.61.202])
 by mail.linuxfoundation.org (Postfix) with ESMTPSA id 016FFCA4;
 Fri, 13 Jul 2018 19:04:03 +0000 (UTC)
Date: Fri, 13 Jul 2018 21:03:20 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Eugene.Cho@dell.com
Cc: a.amelkin@yadro.com, andrew@aj.id.au, benh@kernel.crashing.org,
 robh@kernel.org, mark.rutland@arm.com, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, joel@jms.id.au, stewart@linux.ibm.com,
 openbmc@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [RFC PATCH v2 1/4] dt-bindings: misc: Add bindings for misc. BMC
 control fields
Message-ID: <20180713190320.GB30539@kroah.com>
References: <20180711053122.30773-1-andrew@aj.id.au>
 <20180711053122.30773-2-andrew@aj.id.au>
 <20180711200450.GB17291@rob-hp-laptop>
 <1531356830.3551458.1437853280.551CA8C5@webmail.messagingengine.com>
 <CAL_JsqKpXxR4t_-3BOy-0mFePXkaSck_4PfHRD=OZQ-_-T5P=w@mail.gmail.com>
 <b6ced4cad4d7ff78330181b2c893855c23103953.camel@kernel.crashing.org>
 <1531463489.747186.1439263128.075AECE1@webmail.messagingengine.com>
 <a521b9fc-4c10-06c1-fd73-5c64379538f6@yadro.com>
 <bc2d6bd30ce243768d07b2aa5ed9cee4@AUSX13MPC105.AMER.DELL.COM>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <bc2d6bd30ce243768d07b2aa5ed9cee4@AUSX13MPC105.AMER.DELL.COM>
User-Agent: Mutt/1.10.0 (2018-05-17)
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.27
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Fri, 13 Jul 2018 19:04:05 -0000

On Fri, Jul 13, 2018 at 06:49:04PM +0000, Eugene.Cho@dell.com wrote:
> Dell - Internal Use - Confidential  

Really?  To a public mailing list?  odd...
