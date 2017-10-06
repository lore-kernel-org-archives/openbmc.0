Return-Path: <andrew@aj.id.au>
Authentication-Results: ozlabs.org; spf=pass (mailfrom) smtp.mailfrom=aj.id.au
 (client-ip=66.111.4.25; helo=out1-smtp.messagingengine.com;
 envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="fNRtaRLJ"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="m5R3X4lZ"; dkim-atps=neutral
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3y82nV6Tt5zDqhf
 for <openbmc@lists.ozlabs.org>; Sat,  7 Oct 2017 08:28:46 +1100 (AEDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id AF1A420B19;
 Fri,  6 Oct 2017 17:28:43 -0400 (EDT)
Received: from web1 ([10.202.2.211])
 by compute4.internal (MEProxy); Fri, 06 Oct 2017 17:28:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=cc
 :content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-sender
 :x-me-sender:x-sasl-enc; s=fm1; bh=iCWdqZG+dTer/VD37Niu5OCaV/5bI
 rDHzaVBHr11/mw=; b=fNRtaRLJ1UcVuWli/cez54cAZTALdiUSU6r03t/i9fsOz
 4j0+wCchuWeZ2HIYKW7knNnyuvbFo597xrJ7APL0ZE3fhYyRyagruFicwo1oEFhg
 lo8QcKU/KCssjq3ToeNb+e+S8rG3/aoHJrX3Dz6Q06YkpHgzONaE2yQpYVDt6Nre
 Q9+iU6S+I1gVGSWC7ct36hiWzLJV+gcxtRMSaxEH2FeYWootocExHtZfOLHtNRfJ
 3bhNoeZZcTUehoX+Aezhky2oXoUcIiVtKO39V/VN7f6ov6FU4ZLRGiEgLwloXIW1
 gEktYyadDT7M1sDdwSjLLfxocVIP0Hs1p5xIRbbKA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=iCWdqZ
 G+dTer/VD37Niu5OCaV/5bIrDHzaVBHr11/mw=; b=m5R3X4lZOrvPt/4KxDPbRb
 dVlqDkoNUin/DD90XiociOcUzD4lwCNuO1H6HgHCoe+LpaCv9Sj8Lq7Cyhbrr1Jy
 InWxchjTFA1xgVF9BTZLO6P+XmKLFlYZ2krOsulkArLJq2vIyzLEhyb/RDTYfSrY
 eLFJJ8238niNjcqCqU9I8SFI8pZK2oZ/BCHl+8SnApO7MD0HgoqTtFj2Wlms+G67
 xbK7PKlZPy4yLEais4ttWTPl2he7BqUwpg8cc3Y8+vBoLONO8zSIYyaGtaQEeqMS
 /AMsX1FeCDvVPKHbNKplwHK3zWu0IDNXs7Hjiq+gabdo5vVYrARfVofNvHTb/nUQ
 ==
X-ME-Sender: <xms:i_XXWYcgxavX5YJOYVDPW50BwI4Y1-ukxnQt5SADAZm043IRDYTlYw>
Received: by mailuser.nyi.internal (Postfix, from userid 99)
 id 8CCC395793; Fri,  6 Oct 2017 17:28:43 -0400 (EDT)
Message-Id: <1507325323.1545468.1130544088.6FEEF44B@webmail.messagingengine.com>
From: Andrew Jeffery <andrew@aj.id.au>
To: Rick Altherr <raltherr@google.com>, Javier Romero <xavinux@gmail.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="utf-8"
X-Mailer: MessagingEngine.com Webmail Interface - ajax-26fdae60
Date: Sat, 07 Oct 2017 07:58:43 +1030
References: <CAEX+82Lr=pJEvRqfi9MA=ZBW=DR+mY2VYVUhhTBgrPFA3c239g@mail.gmail.com>
 <CAPLgG=nHvmVzBW2CDxvgaeYAHoNL53W3An-p9fK3D4HfsU=Bbw@mail.gmail.com>
In-Reply-To: <CAPLgG=nHvmVzBW2CDxvgaeYAHoNL53W3An-p9fK3D4HfsU=Bbw@mail.gmail.com>
Subject: Re: OpenBMC on Raspberry PI 3.
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
X-List-Received-Date: Fri, 06 Oct 2017 21:28:48 -0000



On Sat, 7 Oct 2017, at 03:29, Rick Altherr wrote:
> When you run  export TEMPLATECONF=meta-openbmc-machines/meta-
> openpower/meta-ibm/meta-palmetto/conf, you are telling the build system
> that you want to build images for the BMC processor used on the Palmetto
> machine (Aspeed AST2400).  That image won't boot on a RaspberryPi.  What
> you'll need to do is create a new layer in meta-openbmc-machines for a
> RaspberryPi that includes the raspberrypi layer, specifies the correct
> kernel device tree, etc. 

 As a heads-up, some of this work has already been done:

https://github.com/openbmc/openbmc/tree/master/meta-openbmc-machines/meta-evb/meta-evb-raspberrypi/conf

It was added in this change:

https://gerrit.openbmc-project.xyz/#/c/508/

I don't think it was thoroughly tested and it has probably bit-rotted,
but maybe it's existence will flatten out the learning curve a bit.

Cheers,

Andrew
