Return-Path: <andrew@aj.id.au>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=aj.id.au
 (client-ip=66.111.4.27; helo=out3-smtp.messagingengine.com;
 envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="aVKw7zx1"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="rWX08zVu"; dkim-atps=neutral
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com
 [66.111.4.27])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 42dZlq2FFMzDrdd
 for <openbmc@lists.ozlabs.org>; Mon, 22 Oct 2018 09:56:54 +1100 (AEDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 5F6C32144B;
 Sun, 21 Oct 2018 18:56:49 -0400 (EDT)
Received: from web1 ([10.202.2.211])
 by compute4.internal (MEProxy); Sun, 21 Oct 2018 18:56:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 message-id:from:to:cc:mime-version:content-transfer-encoding
 :content-type:references:in-reply-to:date:subject; s=fm1; bh=YZ6
 Wqzt0U8X/lKwyQfEajjD7MXjgO2H3tqvpQcFwABw=; b=aVKw7zx1LypIH9ssvRK
 JXzqxxRq77lT52uF5zrE/ERUiuoAd3NfnC66pDMPp0+ITO61qlRXYkZl8iK+dfcX
 SXhUiX4uC9KWMEliy4/BHr176tEaLY28UhvpDNH364WgcV9DvjAJN2dphlVyRlVS
 1E1lJIKU2gJSPsxITwxi7JiKM33JygKO1tpHr1lyAHKoV5QaZadvxL74xNYSpc5B
 AumMViLydPGclDb69QBjpAIdXevO1/oVhiRn3EIC00b5O3ipcsh7yW1XVolodoSA
 vBrllsXQM3R2UwRrSJzMXaNMj3CO2xxydVhZhFDgc1qFGBA+Y6tSOgcNgzfrT7jM
 P7w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm1; bh=YZ6Wqzt0U8X/lKwyQfEajjD7MXjgO2H3tqvpQcFwA
 Bw=; b=rWX08zVuTHnE3se1m8AlGDsmSTruyqGxsJCz69gsbzZpDB2wLs5YXM4ar
 fMbkRC3R+pSL9W8XQare3XHpTTqmqwP7+HaBR0YkdJbkRVWxksiaXKRDzfHxnB3x
 qiFtB6eel2rllOsjeMcLXofiriYi74VwcsUkC6SbaNmwvzA8K3Ki/UkMpTXq9xhH
 tNlGzceUHVj54mzuTIbdzIrFIRyuvX62Qr26zBz2uOVCuS735XJXeoWS2jrjvmym
 qw6SKYQct3OlD5xVsoiFTCbw7AyydFxwQtQRNdCpTHoN9hxGB6tF8FAG4dMuvqL6
 kDT2kXo3qAh75dmhDcbw6F5uzEGqw==
X-ME-Sender: <xms:MATNWxdI7QVVyqtihgKnNV6xQ2IhuOEoLw-wet1aFpXQY4mJy38pqg>
X-ME-Proxy: <xmx:MATNW4n2F35iIai8a03ZmnvAbg-iGSminvAfhsVvkQSb6H89ekTgJg>
 <xmx:MATNW9Eh3AJVnkD6pg2__imTa57WUeDPt1jRhy_9X4Kb5cdF1vUIVw>
 <xmx:MATNW5R7FI1MdPcXhnPRZSD6n4xvqXTdkD24Vb-EfK2NWC3Aw3tbGg>
 <xmx:MATNW0Sy9n4mFyQmfddoX0BhVv27wRokqGZSccYXqwMGIxVeCuN4Hg>
 <xmx:MATNW3eN-7bMfmQEpx0ZJgqX0qpy11YFvsXBQA-RcfqXbxIOcCaCTQ>
 <xmx:MQTNWwaaGoEuddFpDhuUWzufwzjZRvH7MoJFPk7v1EQsb6U_n3Qmvw>
Received: by mailuser.nyi.internal (Postfix, from userid 99)
 id 637B29410D; Sun, 21 Oct 2018 18:56:48 -0400 (EDT)
Message-Id: <1540162608.649319.1549705104.65B58E15@webmail.messagingengine.com>
From: Andrew Jeffery <andrew@aj.id.au>
To: Joel Stanley <joel@jms.id.au>, Brad Bishop <bradleyb@fuzziesquirrel.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="utf-8"
X-Mailer: MessagingEngine.com Webmail Interface - ajax-cc4e8f33
References: <20180927064651.3118-1-andrew@aj.id.au>
 <81979977-2E26-4276-9991-C7FD28125135@fuzziesquirrel.com>
 <CACPK8Xc-HzbPCXaPd14pLuAqCzj1LJ7FaiEKQV3Q=YMWv9-w-A@mail.gmail.com>
In-Reply-To: <CACPK8Xc-HzbPCXaPd14pLuAqCzj1LJ7FaiEKQV3Q=YMWv9-w-A@mail.gmail.com>
Date: Mon, 22 Oct 2018 09:26:48 +1030
Subject: Re: [PATCH linux dev-4.18] arm: dts: aspeed: Use ColdFire FSI offload
 on Witherspoon
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Sun, 21 Oct 2018 22:57:00 -0000

On Mon, 22 Oct 2018, at 08:55, Joel Stanley wrote:
> On Fri, 28 Sep 2018 at 01:58, Brad Bishop <bradleyb@fuzziesquirrel.com> wrote:
> >
> >
> >
> > > On Sep 27, 2018, at 2:46 AM, Andrew Jeffery <andrew@aj.id.au> wrote:
> > >
> > > Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
> >
> > Acked-by: Brad Bishop <bradleyb@fuzziesquirrel.com>
> 
> Thanks. Can you also submit this upstream?
> 
> If I merge this into the openbmc kernel tree and bump meta-aspeed,
> does witherspoon have the appropriate bits in place to still work?

No yet, you NAK'ed my dodgy patch for the Witherspoon rootfs. I need to sort out how to do it properly.

> 
> Cheers,
> 
> Joel
