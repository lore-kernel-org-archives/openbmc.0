Return-Path: <andrew@aj.id.au>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=aj.id.au
 (client-ip=66.111.4.29; helo=out5-smtp.messagingengine.com;
 envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="t1OZK0qG"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="pXb7XhWx"; dkim-atps=neutral
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
 [66.111.4.29])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 42vjkM0kmjzDrPy
 for <openbmc@lists.ozlabs.org>; Wed, 14 Nov 2018 09:59:38 +1100 (AEDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id F12342079B;
 Tue, 13 Nov 2018 17:59:35 -0500 (EST)
Received: from web3 ([10.202.2.213])
 by compute4.internal (MEProxy); Tue, 13 Nov 2018 17:59:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 message-id:from:to:cc:mime-version:content-transfer-encoding
 :content-type:date:references:subject:in-reply-to; s=fm1; bh=VE7
 z6Gw9FjEFeaIERTP4nnLnk8s+x9xHD/hy7qZKoG0=; b=t1OZK0qGrggC+q2k4Ii
 MFFz6DW6f8XjONvjj9dHzLmeNgmelkf0ERfbIpOGPBHdetzPcf95QZ4e1gPm9X2s
 5BXXu6VIQSgFcoGaSFszBT6T9BQAkOoGuzebdKl+xFj/u6YdhIPeZaWjWpJjwnL2
 n3CkHHkXbmtJ96OIEgLQcwLCPmUuQSWVmwDR52TcL+hEvDtKgXyUqCPorU3F3FnC
 L4brxfJdjY4tqfi5Qw3QZMiwSZPx+qt9g/3Xbk6gHbKHNp9ypiaU1ZIrun5tL95s
 u9YhYDA6HKzi8vr7RJI+dZYRHN3kHUAOBdXIHdunBeCvTQEoL3Q6h0aRMqBznMUG
 zvQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm1; bh=VE7z6Gw9FjEFeaIERTP4nnLnk8s+x9xHD/hy7qZKo
 G0=; b=pXb7XhWxnNHhahhawkCi74B5Ri/w/3DuFt563bAFhoJgSiuguvWV6aast
 BqkfVXmcQuWFz8niuYcQGumb65xDfLEjJUKF8xPIVcSVPKpOQUxZMwdeDkmiif2i
 Gcv36xxgC0XpwEHTrqtcPGcL77zqNj0LR1EtDzQXR4RzuNj922i6vwMvUVmY1YXr
 vSWrx9He4PbndwxD0XPsE/BBLR+0mYLvihcM2ulsR4xlOjuXqt03FJ5nFfmRzPId
 u8MEdj/+7tIKFmKZd5SRi1RRb0SLqttj9fOiihsOPVqy5RhPm7CfaCSIy86eqOvz
 24lRfJDdV0UtZ8FQpsZGPPeoIVO/A==
X-ME-Sender: <xms:VlfrW83FEVIZxIfoCpelXluVayiCtcYcn3mViVLIywrXi8sj5piy2w>
X-ME-Proxy: <xmx:VlfrW0MSWnkWmYPnh1zj505hrVRFTqP31KDLw5Hh6JzsX-p7ItFTUQ>
 <xmx:VlfrWxV38Nlsjt23zMzWeysrO76gbV04JmuBhb8Wmtqa4Gi9FTUzIQ>
 <xmx:VlfrW3izq1Dn2_lLhlP3bqaT4VYCJesoarkAO2pgUMymVY-njQbU-Q>
 <xmx:VlfrW6jZZoRmA7obR2dlD0Tn9k_kQlseUQLP2jp3aRVXSPjdCfTBAA>
 <xmx:VlfrW1GnIbewf8T2iDEwNthkyngRyTKZXkRy2pXs_k3qsIVaOW_f0w>
 <xmx:V1frWxpIMDChmATO5TKIi323iU7vRnZ23zB2F6elZwIvoTseIkYHQg>
Received: by mailuser.nyi.internal (Postfix, from userid 99)
 id 8D1F19E498; Tue, 13 Nov 2018 17:59:34 -0500 (EST)
Message-Id: <1542149974.194577.1575978144.2C46B67A@webmail.messagingengine.com>
From: Andrew Jeffery <andrew@aj.id.au>
To: =?utf-8?Q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Joel Stanley <joel@jms.id.au>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-Mailer: MessagingEngine.com Webmail Interface - ajax-2d882eb6
Date: Wed, 14 Nov 2018 09:29:34 +1030
References: <20181012080723.15825-1-clg@kaod.org>
 <CACPK8XfTK7SVkq25YXjRKK94YZp8HRJreHKh20Zq6VW=qYF1fA@mail.gmail.com>
 <1541639492.1485316.1569473080.44A0676A@webmail.messagingengine.com>
 <3583a7d8-72ed-a724-418f-016cc5fb9bcd@kaod.org>
Subject: Re: [PATCH linux dev-4.18] /dev/mem: add a devmem kernel parameter to
 activate the device
In-Reply-To: <3583a7d8-72ed-a724-418f-016cc5fb9bcd@kaod.org>
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
X-List-Received-Date: Tue, 13 Nov 2018 22:59:43 -0000

On Tue, 13 Nov 2018, at 23:33, C=C3=A9dric Le Goater wrote:
> On 11/8/18 2:11 AM, Andrew Jeffery wrote:
> > On Mon, 22 Oct 2018, at 08:54, Joel Stanley wrote:
> >> On Fri, 12 Oct 2018 at 18:37, C=C3=A9dric Le Goater <clg@kaod.org> wro=
te:
> >>>
> >>> For security reasons, some configuration needs to run without /dev/mem
> >>> but on some occasions, to debug HW for instance, it's still useful to
> >>> be able to reboot the system with access to physical memory.
> >>>
> >>> Add a kernel parameter which activates the /dev/mem device only when
> >>> 'mem.devmem' is enabled.
> >>>
> >>> Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
> >>
> >> Thanks C=C3=A9dric. I've put this in the 4.18 tree.
> >>
> >> Can you submit this upstream too please?
> >=20
> > Have this been done? Just following up out of interest.
>=20
> no.=20
>=20
> > I do wonder about it though. /dev/mem is accessible if you're root, but=
 given
> >  pretty much everything runs as root on the BMC we turn it off. But if =
it's just
> > a kernel commandline parameter away, it's also just a
> > `fw_setenv ... && reboot` away, at which point all the security is gone=
? If
> > you're somehow not root on the BMC then you wouldn't have access even if
> > it were present, and you can't change the u-boot environment either.
>=20
> You seem to be suggesting that we should reactivate /dev/mem ?=20

Not really arguing either way, just observing that the patch doesn't gain a=
ny
security over just enabling it outright.

>=20
> C.=20
