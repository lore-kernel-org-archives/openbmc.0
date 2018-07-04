Return-Path: <andrew@aj.id.au>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=aj.id.au
 (client-ip=66.111.4.25; helo=out1-smtp.messagingengine.com;
 envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="ByTyZ9f9"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="muOXfRcm"; dkim-atps=neutral
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 41LB0J45BszF1PF
 for <openbmc@lists.ozlabs.org>; Wed,  4 Jul 2018 16:29:04 +1000 (AEST)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 0154A21EF0;
 Wed,  4 Jul 2018 02:29:02 -0400 (EDT)
Received: from web3 ([10.202.2.213])
 by compute4.internal (MEProxy); Wed, 04 Jul 2018 02:29:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=cc
 :content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-sender
 :x-me-sender:x-sasl-enc; s=fm3; bh=z9uqWfECnptBOoeJInuOyVvl/P9l4
 MwQYg/S0qNwDpw=; b=ByTyZ9f9HGbFoCuza4J3MVK+YfaYK7AXwVsqEbnNzBsy3
 cNWgpFOtU9BxE7XdAFmVsGgoaz+mpeFqkemiJLxFmcxjjHKYHRtmk30e5R09CZr2
 aAKF0YyD0GJbOZ4fq3yZEUAOBzAx1Gj0QPifrlK5MoLWh2cOxe+i1KTUJyVjoyTP
 7ApkoY6FcrgdgLas65aI+xE/R4lYDcNC9xLA2lIXBtGRIxd6vcbc8TH+C1KK08KO
 125Y4ChUuQBcuWdlfhZgRSUCV3H3aXaPDhpXSQ74duZYQjHxnbwEjqEVS3KOPTTB
 0ILzn3BKsMgCA8mzeJHruLhUBD17FcUSdYfmoxLAw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=z9uqWf
 ECnptBOoeJInuOyVvl/P9l4MwQYg/S0qNwDpw=; b=muOXfRcmZ3/b7at2MlQ9hR
 +6PTiWBvMhgF7ekJ7dOEHBvqY1ECd+Y9pJ9BZ50ni2EnZhyLqmbxVP+CFO8KsRbW
 JETgZt7ngdRcvSXvuXPJUPZNDUrbhVLR6qjO49yh2qtEzrUTirKz6d3uRYX5UUEa
 vXPWvMKIFDboSyVFiBiyM0/wq6Zw6+ioWSo7HZ6nM5/4PPyvY0N3RMMIENfDCk0y
 cfT3Thwq+UuvYBTVvv5uEa0IHyhvYQtJL/ls7dj4/eDReXZsIwqFeaHRRY1b2oMP
 +dZpCdOa/Q8Uy1AELww5d+odGbaiM8A4QP+Qok2z8ul7TNynYATlKg2C9l9LYn/A
 ==
X-ME-Proxy: <xmx:LWk8WzhfvlLJeXrv3cr2AF4qohFUQPmN-M2f1NWwbZcVLIeDtpqq3Q>
 <xmx:LWk8W3mqzPLku5zpNbrZnJ1ygOec2uUGz3aqnTsYjVEEyNiRARgjgg>
 <xmx:LWk8WytWhHJdAe-buLa9VvbwpFHO2-nq_SrMr2E2Cd6-C6hTkW62yg>
 <xmx:LWk8W9CxGhWvcP7VoKiy8H00tFQvIL96RTBkOZaHNNv1pBDy4QqRXg>
 <xmx:LWk8W3UdMFjc8mVmszyHCqjpqV5429DBNV6AjRaQ-zyI1abVkJ3C7g>
 <xmx:LWk8W-Tc_z_LZChEyk7AjCraqEneKB_4VArowRsXjy9MdJXFgiT20A>
X-ME-Sender: <xms:LWk8WxkvrHnHJ2dpH2OfjvmTPVb0YpQ0zEaFIXHbXjUY0dxnpypyWQ>
Received: by mailuser.nyi.internal (Postfix, from userid 99)
 id C65139E48F; Wed,  4 Jul 2018 02:29:01 -0400 (EDT)
Message-Id: <1530685741.3894652.1429464440.6E988BDD@webmail.messagingengine.com>
From: Andrew Jeffery <andrew@aj.id.au>
To: Greg KH <gregkh@linuxfoundation.org>
Cc: linux-kernel@vger.kernel.org, robh+dt@kernel.org, mark.rutland@arm.com,
 joel@jms.id.au, Eugene.Cho@dell.com, a.amelkin@yadro.com,
 stewart@linux.ibm.com, benh@kernel.crashing.org,
 openbmc@lists.ozlabs.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="utf-8"
X-Mailer: MessagingEngine.com Webmail Interface - ajax-0d8ea36c
In-Reply-To: <20180703075018.GB27649@kroah.com>
References: <20180703070413.28756-1-andrew@aj.id.au>
 <20180703070413.28756-3-andrew@aj.id.au>
 <20180703075018.GB27649@kroah.com>
Subject: Re: [RFC PATCH 2/4] Documentation: ABI: Add sysfs-class-bmc
 documentation to testing
Date: Wed, 04 Jul 2018 15:59:01 +0930
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
X-List-Received-Date: Wed, 04 Jul 2018 06:29:05 -0000

On Tue, 3 Jul 2018, at 17:20, Greg KH wrote:
> On Tue, Jul 03, 2018 at 05:04:11PM +1000, Andrew Jeffery wrote:
> > Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
> 
> Same problem here :(

Will fix.
