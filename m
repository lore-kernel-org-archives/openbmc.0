Return-Path: <andrew@aj.id.au>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=aj.id.au
 (client-ip=66.111.4.29; helo=out5-smtp.messagingengine.com;
 envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="no7tZ2lc"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="XL4cTrBs"; dkim-atps=neutral
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
 [66.111.4.29])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 40KCT01qQhzDrJG
 for <openbmc@lists.ozlabs.org>; Mon,  9 Apr 2018 11:31:46 +1000 (AEST)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id D01EC2082D;
 Sun,  8 Apr 2018 21:31:40 -0400 (EDT)
Received: from web4 ([10.202.2.214])
 by compute4.internal (MEProxy); Sun, 08 Apr 2018 21:31:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=cc
 :content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-sender
 :x-me-sender:x-sasl-enc; s=fm2; bh=E/mgWalveR1EUk+4sg5pjEy371nKZ
 6shHSdASXJouRA=; b=no7tZ2lcuvzJGU+Kye42avr09cxJIJodLRAW8IoK/V7Ds
 E9LYqi085ImwoQ5Dc06OnCYePRh8q/00n41FsukRF+O+OA1bCxiBbZOq0BfBykQh
 81Uo/ApoTZnilFD5HlQumQCKYDkgi/q88/9U1wRsgIm27Tr9w1oDGNjbPbLIbyf7
 3bJnsrE6roSscotbPEEPgqW9F9b5EbyFpsIGph/MGcsw9t6dAORbmBD6LAlQD3zT
 VRabjeq8q55LgzlRMSzitTZCaEl8TGzCyeAPo1alcBzEd5Z5wDngr03bzZwGxypE
 6jPYxvFqeYNDC+r/p7Qvbt5VIluJKBLJkQEmdKg2A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=E/mgWa
 lveR1EUk+4sg5pjEy371nKZ6shHSdASXJouRA=; b=XL4cTrBsaTgZM/cmkfAKv6
 0srPCg6uij3On4c4Y3MJVSSxpCul8vlcYFcaHOzAzgPzHtOTHKKpjiTiR94ukItq
 S627I2JUOMBwPYX+hAEVmKsXvAXdLCHMo96VsmLz7RPQ0MKOJ6Hz0ImQYNrNL2/M
 ZP6m2gGVFfAMHJ+u3M1C1UzlmF6pRDAqnv3ung0KTozROjoAFHuRIzcWWItm/7LE
 u2miFt7zW3NR99Y8SFJeyfvf9YhGq/IbboQXyx0OznyZiCwiwDO/YE5xwLpqp5yQ
 KDBEMGGO5TfFV5dUsdV16mWuhhXaszWrnLN9Q5CpK8okGufy3ws0tL9vVM92k8rw
 ==
X-ME-Sender: <xms:fMLKWmBV4cvihrZ2GrzE3FJF-lGgimcr01k8FMBpWmXfc6LgZzQwWQ>
Received: by mailuser.nyi.internal (Postfix, from userid 99)
 id 61A01BA43C; Sun,  8 Apr 2018 21:31:40 -0400 (EDT)
Message-Id: <1523237500.4169453.1330941672.4E3BB08C@webmail.messagingengine.com>
From: Andrew Jeffery <andrew@aj.id.au>
To: Emily Shaffer <emilyshaffer@google.com>,
 Brad Bishop <bradleyb@fuzziesquirrel.com>
Cc: geissonator@yahoo.com, gkeishin@in.ibm.com, joel@jms.id.au,
 swanman@us.ibm.com, ed.tanous@intel.com, vernon.mauery@linux.intel.com,
 jk@ozlabs.org, gmills@us.ibm.com, spinler@us.ibm.com,
 tomjoseph@in.ibm.com, anoo@linux.vnet.ibm.com, dkodihal@in.ibm.com,
 msbarth@linux.ibm.com, venture@google.com,
 "guptam.qdt" <guptam.qdt@qualcommdatacenter.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-Mailer: MessagingEngine.com Webmail Interface - ajax-61ab7380
Date: Mon, 09 Apr 2018 11:01:40 +0930
References: <C664861D-B057-42CD-ADF1-B493E5324C79@fuzziesquirrel.com>
 <CAJoAoZ==uqjn1zKyqhF=dFPurzY+W_jrN2CXbBcXx3AKf+6ong@mail.gmail.com>
In-Reply-To: <CAJoAoZ==uqjn1zKyqhF=dFPurzY+W_jrN2CXbBcXx3AKf+6ong@mail.gmail.com>
Subject: Re: Maintainers and the CLA
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.26
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Mon, 09 Apr 2018 01:31:50 -0000

On Thu, 5 Apr 2018, at 06:06, Emily Shaffer wrote:
> On Wed, Apr 4, 2018 at 12:15 PM Brad Bishop <bradleyb@fuzziesquirrel.com>
> wrote:
>=20
> > If you are in the to: list you have code-review +2 authority
> > on one or more OpenBMC project repositories (i.e. you are a
> > project maintainer).
> >
> > If you don=E2=80=99t think you are a maintainer, or don=E2=80=99t know =
what
> > projects you maintain, please reply and we will get that fixed
> > up.
> >
> > As you probably all know by now, the OpenBMC project has moved
> > to The Linux Foundation and under the new project charter
> > contributors must execute one of the OpenBMC CLAs.
> >
> > I=E2=80=99ve put together a guide:
> >
> > https://gerrit.openbmc-project.xyz/#/c/9933/
> >
> > (please review it and provide feedback like anything else)
> > to help you ensure you are complying to the conditions
> > outlined in the charter, until such a time that we can have
> > a more automated verification process.
> >
>=20
> In the meantime while we're waiting for the automated process, I suggested
> to Brad that we might be able to add a sorted/searchable plaintext list of
> CLA signers somewhere like openbmc-tools repo; I figure that even manually
> updating it based on cache miss (contributor isn't on the list) or Brad
> pinging when the CLA repo gets updated may still beat putting the onus on
> maintainers to look through all the disparate CLAs every time someone pos=
ts
> a changelist.  I'd be happy to put up the first take of this if there's no
> dissent.  (Brad suggested that we should make sure _not_ to include email
> addresses, in order to avoid spam; that's fine with me since most
> contributors use their full name along with their commits.)
>=20

Emily has sent a pull-req for a list and a maintenance tool for inclusion i=
n openbmc-tools:

https://github.com/openbmc/openbmc-tools/pull/16

Brad: If you're happy with a hosting a complete list of CLA'ed names there,=
 I'll merge it.

Andrew
