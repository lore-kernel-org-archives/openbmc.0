Return-Path: <andrew@aj.id.au>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=aj.id.au
 (client-ip=66.111.4.29; helo=out5-smtp.messagingengine.com;
 envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="o4IX7CYd"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="dS+I2ipP"; dkim-atps=neutral
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
 [66.111.4.29])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 42r4xN1JTnzF3Jy
 for <openbmc@lists.ozlabs.org>; Thu,  8 Nov 2018 12:11:35 +1100 (AEDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 7E0DD21B1B;
 Wed,  7 Nov 2018 20:11:33 -0500 (EST)
Received: from web3 ([10.202.2.213])
 by compute4.internal (MEProxy); Wed, 07 Nov 2018 20:11:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 message-id:from:to:cc:mime-version:content-transfer-encoding
 :content-type:references:subject:in-reply-to:date; s=fm1; bh=9nn
 ytjEF0mf38hYgzYOmaS7l6C+2zIxW9YqmEcrDtwI=; b=o4IX7CYdNEJmDP+qDpw
 AUm+8ZZle44n0k8nxy0AQb8yRVVYi0mO5qWaKnGWUbIfhwpGpqbnz2DWDf7aDt6V
 u4OVFKVZYXM30ZO39pcHWXODAvi1lcpqje2fzeRc4WposzruEdbp2rg9DRGPpJvS
 l7sCvWAR/1KI2pKYLFMR2e2U0wuFPU8K9BtZob5KLRHr594y37lQApC3pHzn4gAG
 ORGNdGEMQadWRB7GRqivQttvYm8OtdN8zRV0XsiXQZuzX5yU9kQfQENU7p/g8J8j
 4+8hYEMsOncfhb9rv8dLyipOMsQeflWz+gl38J1EWfklhgAC/pbPIJJkA+Nrn4te
 VgQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm1; bh=9nnytjEF0mf38hYgzYOmaS7l6C+2zIxW9YqmEcrDt
 wI=; b=dS+I2ipP5wiryvadXwwmIDQsBure81Sei5ofISsGSm77A+Rb8FGu0DGrT
 2fWYCokwiTX0DUaAgKw7Auq5NOw3CRXizpy2n2NNPzqZnT5ZfcScYjxFjpz7Q8dw
 d/gAaBfVvVAac9lB2vCfgE7rYfpmS0SappfRXGaJ4/A9ByYStuZUUJGh3aofkANT
 suKPVNU8wV/HFNKhynHBc0f3ZUjMDbqaOcDWKsw1R9SL7JrJp68pY0/ma87F7j/z
 iKZNY5Sk+JuSYSLih8lFO/4RHfa7FtZv8EI9QSI2dlXQXQ/DiFM3pyF3cBynNoyy
 8Wi9wWToD63JLCCDY3AardOZoeeAw==
X-ME-Sender: <xms:RY3jW1GoAk71VlU_ikHihNczyBbrB4T9A4_kWRTGWNF1veTjHg6WRA>
X-ME-Proxy: <xmx:RY3jW5_0bQLRn5kkunEIG1L7LvfGJFXVjwooOyqq_fmLvD2zJE75tw>
 <xmx:RY3jWz3ltjTWTZdsA9WCkmNJONoFgQFbbfIasBcNKxHuz6-ZqryHrA>
 <xmx:RY3jW9gaQsi5ImdWituF9qZuxCWBXTXXp0unWG8kclXaft3w0u1F3g>
 <xmx:RY3jW3cT_Id2D5uHQ3vRdsrClKuq4N4TFuOnNEU598c2O1UZObNBpg>
 <xmx:RY3jWx1TjFYqXxna-fKG4jkz6AWNbtsFXv5s_7HemnxXo8bXfTD7Qg>
 <xmx:RY3jW7JALtfH_zJ07Kkm-dunFTRaqzjgFjZeEYYdSHRXChGyb7psBA>
Received: by mailuser.nyi.internal (Postfix, from userid 99)
 id F2FED9E4F3; Wed,  7 Nov 2018 20:11:32 -0500 (EST)
Message-Id: <1541639492.1485316.1569473080.44A0676A@webmail.messagingengine.com>
From: Andrew Jeffery <andrew@aj.id.au>
To: Joel Stanley <joel@jms.id.au>,
 =?utf-8?Q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-Mailer: MessagingEngine.com Webmail Interface - ajax-d469da0c
References: <20181012080723.15825-1-clg@kaod.org>
 <CACPK8XfTK7SVkq25YXjRKK94YZp8HRJreHKh20Zq6VW=qYF1fA@mail.gmail.com>
Subject: Re: [PATCH linux dev-4.18] /dev/mem: add a devmem kernel parameter to
 activate the device
In-Reply-To: <CACPK8XfTK7SVkq25YXjRKK94YZp8HRJreHKh20Zq6VW=qYF1fA@mail.gmail.com>
Date: Thu, 08 Nov 2018 11:41:32 +1030
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
X-List-Received-Date: Thu, 08 Nov 2018 01:11:37 -0000

On Mon, 22 Oct 2018, at 08:54, Joel Stanley wrote:
> On Fri, 12 Oct 2018 at 18:37, C=C3=A9dric Le Goater <clg@kaod.org> wrote:
> >
> > For security reasons, some configuration needs to run without /dev/mem
> > but on some occasions, to debug HW for instance, it's still useful to
> > be able to reboot the system with access to physical memory.
> >
> > Add a kernel parameter which activates the /dev/mem device only when
> > 'mem.devmem' is enabled.
> >
> > Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
>=20
> Thanks C=C3=A9dric. I've put this in the 4.18 tree.
>=20
> Can you submit this upstream too please?

Have this been done? Just following up out of interest.

I do wonder about it though. /dev/mem is accessible if you're root, but giv=
en
 pretty much everything runs as root on the BMC we turn it off. But if it's=
 just
a kernel commandline parameter away, it's also just a
`fw_setenv ... && reboot` away, at which point all the security is gone? If
you're somehow not root on the BMC then you wouldn't have access even if
it were present, and you can't change the u-boot environment either.

Andrew
