Return-Path: <andrew@aj.id.au>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=aj.id.au
 (client-ip=64.147.123.25; helo=wout2-smtp.messagingengine.com;
 envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="fWYMlnB5"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="tH7Bmc75"; dkim-atps=neutral
Received: from wout2-smtp.messagingengine.com (wout2-smtp.messagingengine.com
 [64.147.123.25])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 41phrt0lG1zDr5t
 for <openbmc@lists.ozlabs.org>; Mon, 13 Aug 2018 14:02:37 +1000 (AEST)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.west.internal (Postfix) with ESMTP id 527122E2;
 Mon, 13 Aug 2018 00:02:34 -0400 (EDT)
Received: from web3 ([10.202.2.213])
 by compute4.internal (MEProxy); Mon, 13 Aug 2018 00:02:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=cc
 :content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-sender
 :x-me-sender:x-sasl-enc; s=fm3; bh=bWy7TN93oZTb81ytU7R9MaeRYztjx
 SlBV6m1PalD5B8=; b=fWYMlnB5KLDg6fJPTr8uJUsvuFzwOoJvQl6dcY4EHv99l
 25IqVhhVIJCl/qLgGeH1fmTHsov8+sywnwIHHu2QJ4e21dficF76ZObmHYBdeyeT
 fjW6RVqlBuybLtgBMsiMM1eXz6H6mfdo6bJ0RK+Xm0DHSg7k9tTbsfiMf61fgJf2
 dSrJVIXFmw03oTOYaTQXKZk3HwGRZpxOtXDSSUZX77shHF+XG06MIfcQj+DxDg3B
 oN+mIGbSTaAVuETUGPWpRPUjkb4KInWhskOneGcHo/cDmAGcliXwVeuMcEETWMud
 PKgQZRLvYhADrJim8jwQm4Q6DU11TtS2rzJxUu+Sw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=bWy7TN
 93oZTb81ytU7R9MaeRYztjxSlBV6m1PalD5B8=; b=tH7Bmc75s+pYujN1zVzEJe
 a2692ggoodIeHPaVnWFxaSu1tLR/kylM5NKys7jIdBni5soql9CDrDc6Rz/SqOev
 S1IEeAPzvYEbA93NwNL0ZwNr/qM8taNRJ2ro1hVoN5CrCeuy7YbKry+F9v1I3IWh
 FZv/L46WN1u2wkDt6TxDrKecLdAZRQTGDVE8DQlVxw6ldYE+jLetUMMTBw8dAjHD
 DZcT0tH71n4qWekRf5KjMYx31wiGqWRj/7yaxtLJysKYDp9alV79DZSk0XaDkbgq
 OfsXcQd/rUe8Fl/H3pzHlrPFNg8ifIfAGkCk5PmT8LThZkVku5Qv0SY79DXjMdfA
 ==
X-ME-Proxy: <xmx:2AJxW3Vt1GggfEk-dFTjeugM0HNAY_qrccpOSFIZKSSzpbt7YdMc1Q>
 <xmx:2AJxW20GHaLO5lj6bus8eQbe241oyomt70M4MovHdn1AkzL14fk07w>
 <xmx:2AJxW-TxHb344Os_t_YY0fwBuIBhxpOB7kTqsyKk-t05XMHXuUZbSw>
 <xmx:2AJxWyRerUJZYFB19CVOmPximvWtpY9Lt_HU8duLEA60zGXCWpdtTg>
 <xmx:2AJxW3Wss8VEvSTEekGWFDWLtOTTyjvg7n54TKTsvRqT6_QeojoHbw>
 <xmx:2QJxWxId7ClTfn8k5TJE68HGG-QlYg2Jt3HpDD7iXn9H210xJzDYGw>
X-ME-Sender: <xms:2AJxW6r5fsVhFnsEGJpg8M4Fj4zgvtEWoMfrkt1WUnZ838-do2rhqg>
Received: by mailuser.nyi.internal (Postfix, from userid 99)
 id 0A9B49E4EC; Mon, 13 Aug 2018 00:02:32 -0400 (EDT)
Message-Id: <1534132951.313265.1471981800.2789D0E9@webmail.messagingengine.com>
From: Andrew Jeffery <andrew@aj.id.au>
To: Henbin Chang <henbinchang@gmail.com>
Cc: Joel Stanley <joel@jms.id.au>, Adriana Kobylak <anoo@linux.vnet.ibm.com>, 
 OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Brad Bishop <bradleyb@fuzziesquirrel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="utf-8"
X-Mailer: MessagingEngine.com Webmail Interface - ajax-9a5384d7
References: <CAG9c7cAk-B=cSwWz3373eywPud3mQdBKCBMwb_iwuCcAwX9Udw@mail.gmail.com>
 <CACPK8Xf1bDR_vPSDF7p1qW1cGjmjmRXSe2qdei9YMjKtqRHL8Q@mail.gmail.com>
 <CAG9c7cB7sNDGX+o4x4BXxNgw=H6uk=NDzjSnfn9xH+1k=+DT9w@mail.gmail.com>
 <1534120584.257240.1471848920.37585ACD@webmail.messagingengine.com>
 <CAG9c7cDCbbDcJpnXoNfW6OO=DMF6KCRCOQWSAy+iUqLv-7COHg@mail.gmail.com>
In-Reply-To: <CAG9c7cDCbbDcJpnXoNfW6OO=DMF6KCRCOQWSAy+iUqLv-7COHg@mail.gmail.com>
Date: Mon, 13 Aug 2018 13:32:31 +0930
Subject: Re: Patch files not apply while devtool modify linux-aspeed
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
X-List-Received-Date: Mon, 13 Aug 2018 04:02:40 -0000

On Mon, 13 Aug 2018, at 11:20, Henbin Chang wrote:
> Hi Andrew,
> Thanks for your response.
> 
> It's really missing from the DTS.
> 
> I met the issue after upgrading to Yocto 2.5.
> The devtool worked well previously.
> 
> I tried other recipe, e.g. 'devtool modify u-boot-aspeed'
> I could see the commits as expected.

Okay, odd! I'll have to defer to the yocto/OE experts :)

Andrew
