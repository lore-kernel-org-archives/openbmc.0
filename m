Return-Path: <andrew@aj.id.au>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=aj.id.au
 (client-ip=64.147.123.25; helo=wout2-smtp.messagingengine.com;
 envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="T3PgZtFK"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="sgsS4b/9"; dkim-atps=neutral
X-Greylist: delayed 430 seconds by postgrey-1.36 at bilbo;
 Tue, 07 Aug 2018 09:11:20 AEST
Received: from wout2-smtp.messagingengine.com (wout2-smtp.messagingengine.com
 [64.147.123.25])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 41ktgX2Kw1zDqBy
 for <openbmc@lists.ozlabs.org>; Tue,  7 Aug 2018 09:11:20 +1000 (AEST)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.west.internal (Postfix) with ESMTP id C80ED1D8;
 Mon,  6 Aug 2018 19:04:04 -0400 (EDT)
Received: from web5 ([10.202.2.215])
 by compute4.internal (MEProxy); Mon, 06 Aug 2018 19:04:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=cc
 :content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-sender
 :x-me-sender:x-sasl-enc; s=fm3; bh=cY0tAEJfZQQ3p/VI4vJ4qPLXp/JWd
 GE+5Q+4q5z/KO8=; b=T3PgZtFKxJIfxFkrAX0CHpD4qc+jQD869JhjMD4c8kbN6
 woNcK5lE6Y9YuOcZg6i8yU8PY+rNxFDGNG4Yv1pkOcqAEdCn/sZnPPNsCHVGaGF8
 Gn1a6W3p8GJwXiyS5T+BhE98gSFWFHpqCtUoTuaZQBtiW5JgflgaXECYIXllMthH
 e7yi5bnn1KDD0kgMJZXB83ndqSotXNSCyujbK2I0FSkMPXFMCSnbuKTzWlKfWreh
 2N2vzG4r8CDGECrOw8fkfBpb5rWATqbKGUK4E9gpC/5YGVT4HFzQqaOSZUxv/3+w
 j3m7NPLNzsmNVW4NJq26+BWSVtzeiB0vvlqWlG8EQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=cY0tAE
 JfZQQ3p/VI4vJ4qPLXp/JWdGE+5Q+4q5z/KO8=; b=sgsS4b/9HBxxwcOgtTCkYW
 iAkquqvPKqn+/UdMcsi9Kp9znZlEfMrSJWm5bkHdvWO0A2TcVCot7Qbzb9xNCzcV
 2oQehYKdzthL5APxydbZ1P15WfrAEKt8g5WznNbnHeyA2yR+6jCruJozajPSPTqn
 VA95+/RQSu/KWS6QSslWXymrp2U01BQvmNjTuvbjW7aHxy0yDY7vb5F50uIH37D4
 yGHyeR/0PyH0XIfKONcSAjsELyjzX4wZJlpuNIlmiJEvZpkbf5Dq1JK8TEA9+3R5
 o7TkuLYeEzGzdygooboFDmjoc/5gUkC4DoTyw/mKejvCUi1APp2LIRN7Mlod07Fw
 ==
X-ME-Proxy: <xmx:49NoW9ux8nLN6fjViiotIrE4SeNn2LT62F7atfxrBjarkKjR1T9zTQ>
 <xmx:49NoW38Y5p9XtTw2QDlUCk0xj2FzrEAiNy9o6RkMqZns4BBNL6vDzQ>
 <xmx:49NoW-ZgtKggn7ctS0KGr0M7SutM-QAJQv-aem368N9iuTmZknN8xw>
 <xmx:49NoW7qYo7hea3CqpWVvabfqijI_dnSrnml0M2jNmatsRyS3yCrZNQ>
 <xmx:49NoW-a-f01K6hJug6QbbJvllUjv-D4EDTw2Y1X32mb9jKxCDkk-5w>
 <xmx:5NNoW8vAb41ImezNz5ElNLDZNO15xzMXV21Q6U3aZcGjMtLsBT9wtg>
X-ME-Sender: <xms:49NoW462mn2xXVsFzYyLJPxIqRuR1YFuJoaXQudJoHkGSf4Ct2PbmA>
Received: by mailuser.nyi.internal (Postfix, from userid 99)
 id 1E24D9E0F6; Mon,  6 Aug 2018 19:04:03 -0400 (EDT)
Message-Id: <1533596643.2696676.1465549384.610418DC@webmail.messagingengine.com>
From: Andrew Jeffery <andrew@aj.id.au>
To: Ed Tanous <ed.tanous@intel.com>, Patrick Venture <venture@google.com>,
 Matt Spinler <mspinler@linux.vnet.ibm.com>,
 Robert Lippert <rlippert@google.com>,
 Brad Bishop <bradleyb@fuzziesquirrel.com>, Nancy Yuen <yuenn@google.com>
Cc: Vernon Mauery <vernon.mauery@linux.intel.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 openbmc <openbmc-bounces+mspinler=linux.vnet.ibm.com@lists.ozlabs.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="utf-8"
X-Mailer: MessagingEngine.com Webmail Interface - ajax-2be8cd1b
Date: Tue, 07 Aug 2018 08:34:03 +0930
Subject: Re: In-Band Firmware Update
References: <CAO=notyCMVrJ9Ya+PaukB1k1M7KE07ZHnD5prt4CsA0gdfe+qw@mail.gmail.com>
 <20180723221837.GI105329@mauery>
 <7BB65E38-8F1D-4723-B1C5-74102D4D0B20@fb.com>
 <6491f54b7b2da630cd3796c6bc3a5214@linux.vnet.ibm.com>
 <CAO=notyMmcQQ=vmJ6G77EcsJfX6LRV-a7HEMdpr+SiWA4WpRZQ@mail.gmail.com>
 <CAO=notxcDx8BY3R_UH8P_wJHFPiRuikmhT8MwkKmtVvk4QnGhg@mail.gmail.com>
 <CAO=notyBLHJBtRF6POCvQejNkVSgsCSzCdb8vL41Q9uzJe-JFA@mail.gmail.com>
 <CAO=notz_FGnAe0_qJ4Zwh15Kr6_BqJiYNjA+feE2THYqRUQ4aw@mail.gmail.com>
 <5627e085-571f-02ef-306d-07874eae5109@intel.com>
In-Reply-To: <5627e085-571f-02ef-306d-07874eae5109@intel.com>
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
X-List-Received-Date: Mon, 06 Aug 2018 23:11:20 -0000

> I'd be interested in separating out the "file like" nature from the 
> interface, and keep it as just a "block level" update, that may be a 
> file, or may be something else.
> 

A slight tangent, but I think it's worth talking about here:

On OpenPOWER systems we developed a control protocol for the
host to manipulate the LPC FW mapping. v3 of the protocol included
support for mapping "arbitrary" stuff into the FW space with a
command to list what devices were available. It seems very similar to
what Patrick has outlined, though operates at the block level as Ed
mused about above.

Typically this mechanism is used for the host to access its firmware
which - again on OpenPOWER designs - sits on a flash device owned
by the BMC.

The control protocol was run over the LPC mailbox available on
ASPEED BMCs. However, I am currently developing a PoC IPMI
replacement for the mailbox interface, and intended to use much
the same command-set and argument layout as we have with the
mailbox. As mentioned above it aligns pretty well with what Patrick
is proposing.

So our use-case has less of an update focus, but at the end of the
day if you can perform arbitrary writes it roughly amounts to the
same thing. Should we expand the scope to cover my use-case here?
I'm fine if the answer is "no", but with the similarities it seemed
necessary to bring up.

Cheers,

Andrew

PS: The bits -
Repository: https://github.com/openbmc/mboxbridge
Protocol documentation: https://github.com/openbmc/mboxbridge/blob/master/Documentation/mbox_protocol.md
Implementation notes: https://github.com/openbmc/mboxbridge/blob/master/Documentation/mboxd.md
