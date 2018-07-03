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
 by lists.ozlabs.org (Postfix) with ESMTPS id 41KbxV5C5fzF1LS
 for <openbmc@lists.ozlabs.org>; Tue,  3 Jul 2018 17:54:38 +1000 (AEST)
Received: from localhost (LFbn-1-12247-202.w90-92.abo.wanadoo.fr
 [90.92.61.202])
 by mail.linuxfoundation.org (Postfix) with ESMTPSA id 5216BD10;
 Tue,  3 Jul 2018 07:54:36 +0000 (UTC)
Date: Tue, 3 Jul 2018 09:54:34 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Andrew Jeffery <andrew@aj.id.au>
Cc: linux-kernel@vger.kernel.org, robh+dt@kernel.org, mark.rutland@arm.com,
 joel@jms.id.au, Eugene.Cho@dell.com, a.amelkin@yadro.com,
 stewart@linux.ibm.com, benh@kernel.crashing.org,
 openbmc@lists.ozlabs.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [RFC PATCH 4/4] dts: aspeed-g5: Add bmc-misc-ctrl nodes to
 devicetree
Message-ID: <20180703075434.GD27649@kroah.com>
References: <20180703070413.28756-1-andrew@aj.id.au>
 <20180703070413.28756-5-andrew@aj.id.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20180703070413.28756-5-andrew@aj.id.au>
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
X-List-Received-Date: Tue, 03 Jul 2018 07:54:39 -0000

On Tue, Jul 03, 2018 at 05:04:13PM +1000, Andrew Jeffery wrote:
> Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
> ---
>  arch/arm/boot/dts/aspeed-g5.dtsi | 192 +++++++++++++++++++++++++++++++
>  1 file changed, 192 insertions(+)

No changelog :(
