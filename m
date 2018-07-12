Return-Path: <andrew@aj.id.au>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=aj.id.au
 (client-ip=66.111.4.28; helo=out4-smtp.messagingengine.com;
 envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="mGR5Zpkt"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="bjcL7aYE"; dkim-atps=neutral
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
 [66.111.4.28])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 41RLWZ0z7SzDr0X
 for <openbmc@lists.ozlabs.org>; Fri, 13 Jul 2018 02:10:33 +1000 (AEST)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 35CFC20D12;
 Thu, 12 Jul 2018 12:10:31 -0400 (EDT)
Received: from web5 ([10.202.2.215])
 by compute4.internal (MEProxy); Thu, 12 Jul 2018 12:10:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=cc
 :content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-sender
 :x-me-sender:x-sasl-enc; s=fm3; bh=CbdnLGVh0Cc3IeiQKoCej/KzRnTMu
 TEanCYJ72i3tiE=; b=mGR5ZpktfT+nRvcU50ZhvASsXt3m+L/0ZVEuVoawEcqtO
 w7PE5IAv7YhkzPWRcsf/h2eQlVCRwLbSXetSgfAsh3ccnQE236o+qF0OmCIrgOL0
 HbCe3m28925OIn0x6t1vnn+FZSQ+TR87RkpgU7UlBwVtmwmjFTiX/Qp//pviWzh4
 4wg1MTsQZ428evY3hhwxcKTDF/XcK4Qxomr9kA/5G8/61P85ZDnih+MFXXdemfGp
 XV9PWtL4j1oAaKQC1HU/xoUK3Wq7sDlt1AAU79kWjrUir/tfVVr1I6HJS5OSp09X
 vtT2lXKAM8iRQws0bSTRQxZsEa7WKV45/x3OlwqIQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=CbdnLG
 Vh0Cc3IeiQKoCej/KzRnTMuTEanCYJ72i3tiE=; b=bjcL7aYEw3Uqc/esm8eyUs
 Txgmsh2lMNVTfnvsPh1zitjPIvt0By7fEEH5WAYLQmTEqDvatAPccvMf9c9tkBV1
 xqxvYr2ibvGjHrdHFMnCRWNu7gJzPna0KaQjqU+S4XbGQTRSiu7tetkS6J+Qul1u
 c3M8b0JnLElrnx3UMfSrqzgyv2j2r7MeVPJ97o7DJUDXxTj8eQXVjy1oUi3OZiyt
 syUYA+xiiErRy0pk/eYN5SLcLEV9LTmyq+tegVcboW+FxBO7wPGLSGaLQrb05JVw
 37VmcI8K6zAGTkoRz+e8sqKpKvS0r1OcoR532U14RT9AH4u8Pn0TIjI950K9RwUQ
 ==
X-ME-Proxy: <xmx:dn1HWyPe23JYoocmZyB5HXvB-Q8vmpSD_pR7_C4bCXvNoS4fSucAgQ>
 <xmx:dn1HWxL9vcf8hka0UsakgFjQWk9LuP62k7pkfXvvhJfYr71dtcEQrg>
 <xmx:dn1HW7E1tc1xX1HM-OwGisKEeh0WOqY3ertLkwsRKV9oGgG6uVcybQ>
 <xmx:dn1HWxRgV0vsh_eDzJmM3uZSfbw0phjqCSgKxc8CGecliwkzqkyYsg>
 <xmx:dn1HW_HLjRxu33BBS5GXUARvV5p4JujIipWhCFx70OwlIz_Gz5a-qQ>
 <xmx:d31HW9KRnDMrqK0tPhjKXXIXA8lLj14aGvsE0oX1LPry9OtmK8MtAA>
X-ME-Sender: <xms:dn1HW15AUImaVAfQPjo3-HLZTQrZHwQx_4JpXxjHpT-OrvezIItwEA>
Received: by mailuser.nyi.internal (Postfix, from userid 99)
 id 7D8969E0F0; Thu, 12 Jul 2018 12:10:30 -0400 (EDT)
Message-Id: <1531411830.3639858.1438698880.654F54F0@webmail.messagingengine.com>
From: Andrew Jeffery <andrew@aj.id.au>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: QEMU Developers <qemu-devel@nongnu.org>, Joel Stanley <joel@jms.id.au>,
 =?utf-8?Q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 "qemu-arm" <qemu-arm@nongnu.org>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="utf-8"
X-Mailer: MessagingEngine.com Webmail Interface - ajax-957169fa
In-Reply-To: <CAFEAcA9GHFwscBzRGRbqAN+nWWYYbSZB-M0Kt+r=fFFG3xfm8w@mail.gmail.com>
Subject: Re: [PATCH] aspeed: Implement write-1-{set,
 clear} for AST2500 strapping
References: <20180709143524.17480-1-andrew@aj.id.au>
 <CAFEAcA9GHFwscBzRGRbqAN+nWWYYbSZB-M0Kt+r=fFFG3xfm8w@mail.gmail.com>
Date: Fri, 13 Jul 2018 01:40:30 +0930
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
X-List-Received-Date: Thu, 12 Jul 2018 16:10:37 -0000

On Fri, 13 Jul 2018, at 01:28, Peter Maydell wrote:
> On 9 July 2018 at 15:35, Andrew Jeffery <andrew@aj.id.au> wrote:
> > The AST2500 SoC family changes the runtime behaviour of the hardware
> > strapping register (SCU70) to write-1-set/write-1-clear, with
> > write-1-clear implemented on the "read-only" SoC revision register
> > (SCU7C). For the the AST2400, the hardware strapping is
> > runtime-configured with read-modify-write semantics.
> >
> > Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
> > ---
> 
> Hi -- is this a bugfix suitable for 3.0, or something you'd
> like to wait until 3.1 ? The commit message sounds like a bugfix...

If we could get it into 3.0 that would be great. I ran into a case where the distinction was important so it would be good to have it resolved sooner rather than later.

Cheers,

Andrew
