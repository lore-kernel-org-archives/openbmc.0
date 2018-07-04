Return-Path: <andrew@aj.id.au>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=aj.id.au
 (client-ip=66.111.4.25; helo=out1-smtp.messagingengine.com;
 envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="V6OfZtGF"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="gi926LKg"; dkim-atps=neutral
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 41LB0l3kMszF1QS
 for <openbmc@lists.ozlabs.org>; Wed,  4 Jul 2018 16:29:27 +1000 (AEST)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id E9C3C21990;
 Wed,  4 Jul 2018 02:29:24 -0400 (EDT)
Received: from web3 ([10.202.2.213])
 by compute4.internal (MEProxy); Wed, 04 Jul 2018 02:29:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=cc
 :content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-sender
 :x-me-sender:x-sasl-enc; s=fm3; bh=c1fdkL1TdGyuyNLpjnli/9Pr0kqAK
 lGspU5VhH0O7CY=; b=V6OfZtGFrugwxvAH4WOkzS8Csq3Bu6esBI9BjmqIYNDk3
 Q7VnQkmpOb81AYJtXpNZbHQqmIL/wvi/7+5NCHS7ht0io2UgKQdzn7PnevA4/724
 3hybyQdKPum4JObB3Qdz6ebC9P+t/MaWW2qvFE7J9Y2kvXHUS3T1rpT7lQ4tkjR3
 7iZ1hE2PBKn/8TsYOiGfzISEAjMTwMDTdZedCISUBVqjYrmkF/hti7iFX2CHBORO
 4Y1PKrGi+6bJC8/SfF46XvHOKFveHwsiVABv+HxOxXH/hy2JkDhBOmpNuD9tVlQi
 2TZsQlSqU8IswLTfj3slJKvmL2CMPv19Na9QWIXEQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=c1fdkL
 1TdGyuyNLpjnli/9Pr0kqAKlGspU5VhH0O7CY=; b=gi926LKgOKxTNssvchzkQ3
 xPkuBXXIdM4xxAhc+truyXMOF0/LQX+RsRFkz1s1cz5YyXP0bGfkBBqJC8+cljwR
 L7zvxeYwdgKPMoOtYX0BsSh4XZ25LWvbsyMxQ8OwS7FIJp1BZdNz6x79iqvIsvil
 Xngagb5G0fjf7D94iMwhXl3kt72tNNndjcDGntG5bRVRE//af57IeKx+lz05syjw
 gpVG3yCupaFTIh8mVjZlD0XtAZ8cf5vwS9EOPDDeudSBbBBcbtp4+zi+027eEeZe
 SdBuKVQbRjNXfcvuoSMP2D6hZsjwfMcG5ZXuFYm2sZ+0ogg7PU4kNezeIcQgq/JA
 ==
X-ME-Proxy: <xmx:RGk8Wx9vCDDL7EcKxIdXgqb2Ku1RITvOFjmRKwtihKMz-mYwaUQTGg>
 <xmx:RGk8WyQRzdG8iuDjRU5iH1o1T6u7JEPAi4mazJJJ4XZ3VARlj2fTZA>
 <xmx:RGk8WzfdjArPsjhZIrRA1ZKSWRfPQ4KHee29g16XaChmZelEdVNtMQ>
 <xmx:RGk8W8Sb4t3DHcgd9_p5IKKrZLgUiVcM1Z6yFHRVCa3d0LO-pdAswA>
 <xmx:RGk8W3JCPP6B3q3AmTEgaM3Wo2yrz_ovru3R_cdUMfv1YH0Rvs0HyQ>
 <xmx:RGk8W6v_J5bo0QDmXj0vs5zWvAIEkMNc6Rcq7XlJjXcKh5uAe4qIvg>
X-ME-Sender: <xms:RGk8WzZvffP3xLy6XQyiBVQKaSeHAs3qVwazBk72mwAYWk_6TJC1Qw>
Received: by mailuser.nyi.internal (Postfix, from userid 99)
 id B4BFA9E48F; Wed,  4 Jul 2018 02:29:24 -0400 (EDT)
Message-Id: <1530685764.3894654.1429464640.1DF76135@webmail.messagingengine.com>
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
Subject: Re: [RFC PATCH 4/4] dts: aspeed-g5: Add bmc-misc-ctrl nodes to
 devicetree
Date: Wed, 04 Jul 2018 15:59:24 +0930
In-Reply-To: <20180703075434.GD27649@kroah.com>
References: <20180703070413.28756-1-andrew@aj.id.au>
 <20180703070413.28756-5-andrew@aj.id.au>
 <20180703075434.GD27649@kroah.com>
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
X-List-Received-Date: Wed, 04 Jul 2018 06:29:28 -0000

On Tue, 3 Jul 2018, at 17:24, Greg KH wrote:
> On Tue, Jul 03, 2018 at 05:04:13PM +1000, Andrew Jeffery wrote:
> > Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
> > ---
> >  arch/arm/boot/dts/aspeed-g5.dtsi | 192 +++++++++++++++++++++++++++++++
> >  1 file changed, 192 insertions(+)
> 
> No changelog :(

Will fix.
