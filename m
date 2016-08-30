Return-Path: <andrew@aj.id.au>
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
 [66.111.4.28])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3sNWY15KSFzDrgx
 for <openbmc@lists.ozlabs.org>; Tue, 30 Aug 2016 11:44:53 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
 dkim=fail reason="signature verification failed" (1024-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b=WYCdD8Ty; 
 dkim=fail reason="signature verification failed" (1024-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b=g0uAtDPx; dkim-atps=neutral
Received: from compute7.internal (compute7.nyi.internal [10.202.2.47])
 by mailout.nyi.internal (Postfix) with ESMTP id 87894202C7;
 Mon, 29 Aug 2016 21:44:51 -0400 (EDT)
Received: from frontend2 ([10.202.2.161])
 by compute7.internal (MEProxy); Mon, 29 Aug 2016 21:44:51 -0400
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=aj.id.au; h=
 content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to:x-sasl-enc:x-sasl-enc; s=mesmtp; bh=+FtOa
 Z3XjX7WyeutWQ8ZDiMP4T4=; b=WYCdD8Ty1BxUaW96XWk4LJXloDcKBoHo1hyLh
 Pv6AhcYm3w1Dr+svby3cyGfeKgEHaqcrzDe1IpKvCgIVNMEYZn+oOEzp/ZHfZwGo
 aXF8xSMZgXH06XbNCG8G43V5zouYfDYHP0XbQBQ4Xl1BcwGtQvOPo01+1RB6tE8z
 46ZwpQ=
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=
 messagingengine.com; h=content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-sasl-enc
 :x-sasl-enc; s=smtpout; bh=+FtOaZ3XjX7WyeutWQ8ZDiMP4T4=; b=g0uAt
 DPx/EqR+sk8zwcIxqiXeBINIiVJCzXnnFIcM7RjUIjnKIfaNMOscAVo2/M52RERW
 XsYPCId9VpBLy8ImIPu87eNto1GZggJYJVrRjvnWR6oFrJxiMcvELa2t00o2x0q9
 vFvYwGETQ935fig6n3fDY1t2KfFw6wpH0zuvWs=
X-Sasl-enc: o6piCN5p3L3O3KtiN3UtERKIpXaMFqR1xko9vQkdFGFG 1472521490
Received: from keelia (unknown [203.0.153.9])
 by mail.messagingengine.com (Postfix) with ESMTPA id 9524ACCDC5;
 Mon, 29 Aug 2016 21:44:49 -0400 (EDT)
Message-ID: <1472521481.5707.99.camel@aj.id.au>
Subject: Re: Linux dev-4.7 tree: Request for testing
From: Andrew Jeffery <andrew@aj.id.au>
To: =?ISO-8859-1?Q?C=E9dric?= Le Goater <clg@kaod.org>, Joel Stanley
 <joel@jms.id.au>, OpenBMC Maillist <openbmc@lists.ozlabs.org>
Date: Tue, 30 Aug 2016 11:14:41 +0930
In-Reply-To: <6c6aefd4-1be7-a441-2baa-d6df685feddf@kaod.org>
References: <CACPK8Xd1M2x5rrPUNwvhg4Yes85hPHxPbnysiC-jNii8W3KBHA@mail.gmail.com>
 <6c6aefd4-1be7-a441-2baa-d6df685feddf@kaod.org>
Content-Type: multipart/signed; micalg="pgp-sha512";
 protocol="application/pgp-signature"; boundary="=-AxQ8Ja8obIp3T6F2xcYP"
X-Mailer: Evolution 3.18.5.2-0ubuntu3 
Mime-Version: 1.0
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.22
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Tue, 30 Aug 2016 01:44:55 -0000


--=-AxQ8Ja8obIp3T6F2xcYP
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 2016-08-22 at 17:29 +0200, C=C3=A9dric Le Goater wrote:
> On 08/09/2016 05:13 PM, Joel Stanley wrote:
> >=20
> > Hello OpenBMCers,

...

> > =C2=A0 net/faraday: Avoid PHYSTS_CHG interrupt
> I gave it a try on a palmetto and a ast2500 evb. Both boot fine but
> the evb dmesg is full of :=C2=A0=C2=A0
>=20
> net_ratelimit: 299522 callbacks suppressed
> ftgmac100 1e660000.ethernet eth0: [ISR] =3D 0x203: PHYSTS_CHG
> ftgmac100 1e660000.ethernet eth0: [ISR] =3D 0x250: PHYSTS_CHG
> ftgmac100 1e660000.ethernet eth0: [ISR] =3D 0x200: PHYSTS_CHG
> ftgmac100 1e660000.ethernet eth0: [ISR] =3D 0x200: PHYSTS_CHG
> ftgmac100 1e660000.ethernet eth0: [ISR] =3D 0x200: PHYSTS_CHG
> ftgmac100 1e660000.ethernet eth0: [ISR] =3D 0x200: PHYSTS_CHG
> ftgmac100 1e660000.ethernet eth0: [ISR] =3D 0x203: PHYSTS_CHG
> ftgmac100 1e660000.ethernet eth0: [ISR] =3D 0x200: PHYSTS_CHG
> ftgmac100 1e660000.ethernet eth0: [ISR] =3D 0x200: PHYSTS_CHG
> ftgmac100 1e660000.ethernet eth0: [ISR] =3D 0x203: PHYSTS_CHG
>=20
> Below is a possible fix,
> Cheers,
>=20
> C.
>=20
>=20
> From: C=C3=A9dric Le Goater <clg@kaod.org>
> Subject: [PATCH] net/ftgmac100: raise PHY link sensor level
> Date: Mon, 22 Aug 2016 16:29:02 +0200
> MIME-Version: 1.0
> Content-Type: text/plain; charset=3DUTF-8
> Content-Transfer-Encoding: 8bit
>=20
> Commit 5f5d3d87370f ("net/faraday: Avoid PHYSTS_CHG interrupt")
> lowered the sensivity of the PHY link by setting Bit#11 in the MAC
> Control Register. But this seems to generate bogus PHY interrupts on
> non NC-SI adapters :
>=20
> =C2=A0=C2=A0=C2=A0=C2=A0net_ratelimit: 299522 callbacks suppressed
> =C2=A0=C2=A0=C2=A0=C2=A0ftgmac100 1e660000.ethernet eth0: [ISR] =3D 0x203=
: PHYSTS_CHG
> =C2=A0=C2=A0=C2=A0=C2=A0ftgmac100 1e660000.ethernet eth0: [ISR] =3D 0x250=
: PHYSTS_CHG
> =C2=A0=C2=A0=C2=A0=C2=A0ftgmac100 1e660000.ethernet eth0: [ISR] =3D 0x200=
: PHYSTS_CHG
> =C2=A0=C2=A0=C2=A0=C2=A0ftgmac100 1e660000.ethernet eth0: [ISR] =3D 0x200=
: PHYSTS_CHG
> =C2=A0=C2=A0=C2=A0=C2=A0ftgmac100 1e660000.ethernet eth0: [ISR] =3D 0x200=
: PHYSTS_CHG
> =C2=A0=C2=A0=C2=A0=C2=A0ftgmac100 1e660000.ethernet eth0: [ISR] =3D 0x200=
: PHYSTS_CHG
> =C2=A0=C2=A0=C2=A0=C2=A0ftgmac100 1e660000.ethernet eth0: [ISR] =3D 0x203=
: PHYSTS_CHG
> =C2=A0=C2=A0=C2=A0=C2=A0ftgmac100 1e660000.ethernet eth0: [ISR] =3D 0x200=
: PHYSTS_CHG
> =C2=A0=C2=A0=C2=A0=C2=A0...
>=20
> Let's lower the sensivity only for NC-SI adapters.
>=20
> Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
> ---
> =C2=A0drivers/net/ethernet/faraday/ftgmac100.c |=C2=A0=C2=A0=C2=A0=C2=A04=
 +++-
> =C2=A01 file changed, 3 insertions(+), 1 deletion(-)
>=20
> Index: linux-openbmc-4.7.git/drivers/net/ethernet/faraday/ftgmac100.c
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> --- linux-openbmc-
> 4.7.git.orig/drivers/net/ethernet/faraday/ftgmac100.c
> +++ linux-openbmc-4.7.git/drivers/net/ethernet/faraday/ftgmac100.c
> @@ -215,7 +215,6 @@ static void ftgmac100_init_hw(struct ftg
> =C2=A0				=C2=A0FTGMAC100_MACCR_RXMAC_EN	| \
> =C2=A0				=C2=A0FTGMAC100_MACCR_FULLDUP	| \
> =C2=A0				=C2=A0FTGMAC100_MACCR_CRC_APD	| \
> -				=C2=A0FTGMAC100_MACCR_PHY_LINK_LEVEL | \
> =C2=A0				=C2=A0FTGMAC100_MACCR_RX_RUNT	| \
> =C2=A0				=C2=A0FTGMAC100_MACCR_RX_BROADPKT)
> =C2=A0
> @@ -223,6 +222,9 @@ static void ftgmac100_start_hw(struct ft
> =C2=A0{
> =C2=A0	int maccr =3D MACCR_ENABLE_ALL;
> =C2=A0
> +	if (priv->use_ncsi)
> +		maccr |=3D FTGMAC100_MACCR_PHY_LINK_LEVEL;
> +
> =C2=A0	switch (speed) {
> =C2=A0	default:
> =C2=A0	case 10:
>=20

I gave this change a spin and found that the interrupt storm returned
out of the blue after a period of time. The patch didn't apply cleanly
to my tree and I manually made the change, so there's scope for PEBKAC.
=C2=A0Also, I was testing MAC2 on the EVB, disabling MAC1 in the devicetree
and also muxing in MDIO2 so MAC2 had something to work with. So, lots
of bad sience, but here's the full boot log:

U-Boot 2016.05-00095-gd347555e6ee8 (Jun 23 2016 - 14:48:50 +0930)

DRAM:=C2=A0=C2=A0496 MiB
Flash: 32 MiB
In:=C2=A0=C2=A0=C2=A0=C2=A0serial
Out:=C2=A0=C2=A0=C2=A0serial
Err:=C2=A0=C2=A0=C2=A0serial
Net:=C2=A0=C2=A0=C2=A0MAC0 : RGMII
MAC1 : RGMII
FTGMAC100#0, FTGMAC100#1
Hit any key to stop autoboot:=C2=A0=C2=A00
ast# dhcp
FTGMAC100#0: Starting autonegotiation...
FTGMAC100#0: Autonegotiation timed out (status=3D0x7949)
FTGMAC100#0: link down
FTGMAC100#1: no PHY present
BOOTP broadcast 1
DHCP client bound to address 10.104.0.178 (3 ms)
Using FTGMAC100#1 device
TFTP from server 10.104.0.15; our IP address is 10.104.0.178
Filename 'uImage.ast2500evb'.
Load address: 0x83000000
Loading: #################################################################
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0#####################=
#####################
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0112.3 KiB/s
done
Bytes transferred =3D 1569521 (17f2f1 hex)
ast# tftp 0x84000000 misc.rootfs.cpio
FTGMAC100#1: no PHY present
Using FTGMAC100#1 device
TFTP from server 10.104.0.15; our IP address is 10.104.0.178
Filename 'misc.rootfs.cpio'.
Load address: 0x84000000
Loading: #################################################################
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0#####################=
############################################
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0#####################=
############################################
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0#####################=
############################################
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0#####################=
############################################
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0#####################=
############################################
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0#####################=
############################################
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0#####################=
############################################
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0#####################=
############################################
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0#####################=
############################################
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0#####################=
############################################
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0#####################=
############################################
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0#####################=
############################################
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0#####################=
############################################
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0#####################=
##########################################
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0134.8 KiB/s
done
Bytes transferred =3D 14278144 (d9de00 hex)
ast# bootm 0x83000000 0x84000000
## Booting kernel from Legacy Image at 83000000 ...
=C2=A0=C2=A0=C2=A0Image Name:=C2=A0=C2=A0=C2=A0v4.8-rc2-115-g454e3b36a4e9-d=
irty
=C2=A0=C2=A0=C2=A0Image Type:=C2=A0=C2=A0=C2=A0ARM Linux Kernel Image (unco=
mpressed)
=C2=A0=C2=A0=C2=A0Data Size:=C2=A0=C2=A0=C2=A0=C2=A01569457 Bytes =3D 1.5 M=
iB
=C2=A0=C2=A0=C2=A0Load Address: 80001000
=C2=A0=C2=A0=C2=A0Entry Point:=C2=A0=C2=A080001000
=C2=A0=C2=A0=C2=A0Verifying Checksum ... OK
Wrong Ramdisk Image Format
Ramdisk image is corrupt or invalid
ast# tftp 0x84000000 misc.rootfs.cpio.u-boot
FTGMAC100#1: no PHY present
Using FTGMAC100#1 device
TFTP from server 10.104.0.15; our IP address is 10.104.0.178
Filename 'misc.rootfs.cpio.u-boot'.
Load address: 0x84000000
Loading: #################################################################
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0#####################=
############################################
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0#####################=
############################################
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0#####################=
############################################
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0#####################=
############################################
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0#####################=
############################################
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0#####################=
############################################
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0#####################=
############################################
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0#####################=
############################################
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0#####################=
############################################
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0#####################=
############################################
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0#####################=
############################################
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0#####################=
############################################
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0#####################=
############################################
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0#####################=
##########################################
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0181.6 KiB/s
done
Bytes transferred =3D 14278208 (d9de40 hex)
ast# bootm 0x83000000 0x84000000
## Booting kernel from Legacy Image at 83000000 ...
=C2=A0=C2=A0=C2=A0Image Name:=C2=A0=C2=A0=C2=A0v4.8-rc2-115-g454e3b36a4e9-d=
irty
=C2=A0=C2=A0=C2=A0Image Type:=C2=A0=C2=A0=C2=A0ARM Linux Kernel Image (unco=
mpressed)
=C2=A0=C2=A0=C2=A0Data Size:=C2=A0=C2=A0=C2=A0=C2=A01569457 Bytes =3D 1.5 M=
iB
=C2=A0=C2=A0=C2=A0Load Address: 80001000
=C2=A0=C2=A0=C2=A0Entry Point:=C2=A0=C2=A080001000
=C2=A0=C2=A0=C2=A0Verifying Checksum ... OK
## Loading init Ramdisk from Legacy Image at 84000000 ...
=C2=A0=C2=A0=C2=A0Image Name:=C2=A0=C2=A0=C2=A0buildroot userspace
=C2=A0=C2=A0=C2=A0Image Type:=C2=A0=C2=A0=C2=A0ARM Linux RAMDisk Image (unc=
ompressed)
=C2=A0=C2=A0=C2=A0Data Size:=C2=A0=C2=A0=C2=A0=C2=A014278144 Bytes =3D 13.6=
 MiB
=C2=A0=C2=A0=C2=A0Load Address: 81000000
=C2=A0=C2=A0=C2=A0Entry Point:=C2=A0=C2=A081000000
=C2=A0=C2=A0=C2=A0Verifying Checksum ... OK
=C2=A0=C2=A0=C2=A0Loading Kernel Image ... OK

Starting kernel ...

Uncompressing Linux... done, booting the kernel.
[=C2=A0=C2=A0=C2=A0=C2=A00.000000] Booting Linux on physical CPU 0x0
[=C2=A0=C2=A0=C2=A0=C2=A00.000000] Linux version 4.8.0-rc2-00115-g454e3b36a=
4e9-dirty (andrew@keelia) (gcc version 5.4.0 20160609 (Ubuntu/Linaro 5.4.0-=
6ubuntu1~16.04.1) ) #606 Tue Aug 30 10:07:10 ACST 2016
[=C2=A0=C2=A0=C2=A0=C2=A00.000000] CPU: ARMv6-compatible processor [410fb76=
7] revision 7 (ARMv7), cr=3D00c5387d
[=C2=A0=C2=A0=C2=A0=C2=A00.000000] CPU: PIPT / VIPT nonaliasing data cache,=
 VIPT nonaliasing instruction cache
[=C2=A0=C2=A0=C2=A0=C2=A00.000000] OF: fdt:Machine model: AST2500 EVB
[=C2=A0=C2=A0=C2=A0=C2=A00.000000] bootconsole [earlycon0] enabled
[=C2=A0=C2=A0=C2=A0=C2=A00.000000] Memory policy: Data cache writeback
[=C2=A0=C2=A0=C2=A0=C2=A00.000000] SOC Rev: 04010303
[=C2=A0=C2=A0=C2=A0=C2=A00.000000] On node 0 totalpages: 126976
[=C2=A0=C2=A0=C2=A0=C2=A00.000000] free_area_init_node: node 0, pgdat 80720=
c6c, node_mem_map 9ec19000
[=C2=A0=C2=A0=C2=A0=C2=A00.000000]=C2=A0=C2=A0=C2=A0Normal zone: 992 pages =
used for memmap
[=C2=A0=C2=A0=C2=A0=C2=A00.000000]=C2=A0=C2=A0=C2=A0Normal zone: 0 pages re=
served
[=C2=A0=C2=A0=C2=A0=C2=A00.000000]=C2=A0=C2=A0=C2=A0Normal zone: 126976 pag=
es, LIFO batch:31
[=C2=A0=C2=A0=C2=A0=C2=A00.000000] pcpu-alloc: s0 r0 d32768 u32768 alloc=3D=
1*32768
[=C2=A0=C2=A0=C2=A0=C2=A00.000000] pcpu-alloc: [0] 0
[=C2=A0=C2=A0=C2=A0=C2=A00.000000] Built 1 zonelists in Zone order, mobilit=
y grouping on.=C2=A0=C2=A0Total pages: 125984
[=C2=A0=C2=A0=C2=A0=C2=A00.000000] Kernel command line: console=3DttyS4,115=
200n8 root=3D/dev/ram rw earlyprintk debug
[=C2=A0=C2=A0=C2=A0=C2=A00.000000] PID hash table entries: 2048 (order: 1, =
8192 bytes)
[=C2=A0=C2=A0=C2=A0=C2=A00.000000] Dentry cache hash table entries: 65536 (=
order: 6, 262144 bytes)
[=C2=A0=C2=A0=C2=A0=C2=A00.000000] Inode-cache hash table entries: 32768 (o=
rder: 5, 131072 bytes)
[=C2=A0=C2=A0=C2=A0=C2=A00.000000] Memory: 477456K/507904K available (3072K=
 kernel code, 150K rwdata, 980K rodata, 1024K init, 5685K bss, 30448K reser=
ved, 0K cma-reserved)
[=C2=A0=C2=A0=C2=A0=C2=A00.000000] Virtual kernel memory layout:
[=C2=A0=C2=A0=C2=A0=C2=A00.000000]=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0vector=C2=
=A0=C2=A0: 0xffff0000 - 0xffff1000=C2=A0=C2=A0=C2=A0(=C2=A0=C2=A0=C2=A04 kB=
)
[=C2=A0=C2=A0=C2=A0=C2=A00.000000]=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0fixmap=C2=
=A0=C2=A0: 0xffc00000 - 0xfff00000=C2=A0=C2=A0=C2=A0(3072 kB)
[=C2=A0=C2=A0=C2=A0=C2=A00.000000]=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0vmalloc : 0=
x9f800000 - 0xff800000=C2=A0=C2=A0=C2=A0(1536 MB)
[=C2=A0=C2=A0=C2=A0=C2=A00.000000]=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0lowmem=C2=
=A0=C2=A0: 0x80000000 - 0x9f000000=C2=A0=C2=A0=C2=A0( 496 MB)
[=C2=A0=C2=A0=C2=A0=C2=A00.000000]=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0modules : 0=
x7f000000 - 0x80000000=C2=A0=C2=A0=C2=A0(=C2=A0=C2=A016 MB)
[=C2=A0=C2=A0=C2=A0=C2=A00.000000]=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0.text : 0x80008000 - 0x80400000=C2=A0=C2=A0=C2=A0(4064 kB)
[=C2=A0=C2=A0=C2=A0=C2=A00.000000]=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0.init : 0x80600000 - 0x80700000=C2=A0=C2=A0=C2=A0(1024 kB)
[=C2=A0=C2=A0=C2=A0=C2=A00.000000]=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0.data : 0x80700000 - 0x807258e8=C2=A0=C2=A0=C2=A0( 151 kB)
[=C2=A0=C2=A0=C2=A0=C2=A00.000000]=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0.bss : 0x807258e8 - 0x80cb2e90=C2=A0=C2=A0=C2=A0(5686 kB)
[=C2=A0=C2=A0=C2=A0=C2=A00.000000] NR_IRQS:16 nr_irqs:16 16
[=C2=A0=C2=A0=C2=A0=C2=A00.000000] clocksource: moxart_timer: mask: 0xfffff=
fff max_cycles: 0xffffffff, max_idle_ns: 77222644334 ns
[=C2=A0=C2=A0=C2=A0=C2=A00.000000] sched_clock: 32 bits at 100 Hz, resoluti=
on 10000000ns, wraps every 21474836475000000ns
[=C2=A0=C2=A0=C2=A0=C2=A00.010000] Lock dependency validator: Copyright (c)=
 2006 Red Hat, Inc., Ingo Molnar
[=C2=A0=C2=A0=C2=A0=C2=A00.020000] ... MAX_LOCKDEP_SUBCLASSES:=C2=A0=C2=A08
[=C2=A0=C2=A0=C2=A0=C2=A00.020000] ... MAX_LOCK_DEPTH:=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A048
[=C2=A0=C2=A0=C2=A0=C2=A00.020000] ... MAX_LOCKDEP_KEYS:=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A08191
[=C2=A0=C2=A0=C2=A0=C2=A00.030000] ... CLASSHASH_SIZE:=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A04096
[=C2=A0=C2=A0=C2=A0=C2=A00.030000] ... MAX_LOCKDEP_ENTRIES:=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A032768
[=C2=A0=C2=A0=C2=A0=C2=A00.040000] ... MAX_LOCKDEP_CHAINS:=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A065536
[=C2=A0=C2=A0=C2=A0=C2=A00.040000] ... CHAINHASH_SIZE:=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A032768
[=C2=A0=C2=A0=C2=A0=C2=A00.050000]=C2=A0=C2=A0memory used by lock dependenc=
y info: 5151 kB
[=C2=A0=C2=A0=C2=A0=C2=A00.060000]=C2=A0=C2=A0per task-struct memory footpr=
int: 1536 bytes
[=C2=A0=C2=A0=C2=A0=C2=A00.070000] Calibrating delay loop... 783.97 BogoMIP=
S (lpj=3D3919872)
[=C2=A0=C2=A0=C2=A0=C2=A00.110000] pid_max: default: 32768 minimum: 301
[=C2=A0=C2=A0=C2=A0=C2=A00.110000] Mount-cache hash table entries: 1024 (or=
der: 0, 4096 bytes)
[=C2=A0=C2=A0=C2=A0=C2=A00.120000] Mountpoint-cache hash table entries: 102=
4 (order: 0, 4096 bytes)
[=C2=A0=C2=A0=C2=A0=C2=A00.140000] CPU: Testing write buffer coherency: ok
[=C2=A0=C2=A0=C2=A0=C2=A00.150000] Setting up static identity map for 0x801=
00000 - 0x8010005c
[=C2=A0=C2=A0=C2=A0=C2=A00.170000] devtmpfs: initialized
[=C2=A0=C2=A0=C2=A0=C2=A00.290000] clocksource: jiffies: mask: 0xffffffff m=
ax_cycles: 0xffffffff, max_idle_ns: 19112604462750000 ns
[=C2=A0=C2=A0=C2=A0=C2=A00.310000] pinctrl core: initialized pinctrl subsys=
tem
[=C2=A0=C2=A0=C2=A0=C2=A00.320000] NET: Registered protocol family 16
[=C2=A0=C2=A0=C2=A0=C2=A00.330000] DMA: preallocated 256 KiB pool for atomi=
c coherent allocations
[=C2=A0=C2=A0=C2=A0=C2=A00.360000] aspeed-g5-pinctrl 1e6e2000.syscon:pinctr=
l@1e6e2000: try to register 228 pins ...
[=C2=A0=C2=A0=C2=A0=C2=A00.370000] pinctrl core: registered pin 0 (B14) on =
aspeed-g5-pinctrl
[=C2=A0=C2=A0=C2=A0=C2=A00.370000] pinctrl core: registered pin 1 (PIN1) on=
 aspeed-g5-pinctrl
[=C2=A0=C2=A0=C2=A0=C2=A00.380000] pinctrl core: registered pin 2 (PIN2) on=
 aspeed-g5-pinctrl
[=C2=A0=C2=A0=C2=A0=C2=A00.390000] pinctrl core: registered pin 3 (E13) on =
aspeed-g5-pinctrl
[=C2=A0=C2=A0=C2=A0=C2=A00.400000] pinctrl core: registered pin 4 (C14) on =
aspeed-g5-pinctrl
[=C2=A0=C2=A0=C2=A0=C2=A00.400000] pinctrl core: registered pin 5 (A13) on =
aspeed-g5-pinctrl
[=C2=A0=C2=A0=C2=A0=C2=A00.410000] pinctrl core: registered pin 6 (C13) on =
aspeed-g5-pinctrl
[=C2=A0=C2=A0=C2=A0=C2=A00.420000] pinctrl core: registered pin 7 (B13) on =
aspeed-g5-pinctrl
[=C2=A0=C2=A0=C2=A0=C2=A00.430000] pinctrl core: registered pin 8 (PIN8) on=
 aspeed-g5-pinctrl
[=C2=A0=C2=A0=C2=A0=C2=A00.430000] pinctrl core: registered pin 9 (PIN9) on=
 aspeed-g5-pinctrl
[=C2=A0=C2=A0=C2=A0=C2=A00.440000] pinctrl core: registered pin 10 (PIN10) =
on aspeed-g5-pinctrl
[=C2=A0=C2=A0=C2=A0=C2=A00.450000] pinctrl core: registered pin 11 (PIN11) =
on aspeed-g5-pinctrl
[=C2=A0=C2=A0=C2=A0=C2=A00.460000] pinctrl core: registered pin 12 (PIN12) =
on aspeed-g5-pinctrl
[=C2=A0=C2=A0=C2=A0=C2=A00.460000] pinctrl core: registered pin 13 (PIN13) =
on aspeed-g5-pinctrl
[=C2=A0=C2=A0=C2=A0=C2=A00.470000] pinctrl core: registered pin 14 (PIN14) =
on aspeed-g5-pinctrl
[=C2=A0=C2=A0=C2=A0=C2=A00.480000] pinctrl core: registered pin 15 (H20) on=
 aspeed-g5-pinctrl
[=C2=A0=C2=A0=C2=A0=C2=A00.490000] pinctrl core: registered pin 16 (C12) on=
 aspeed-g5-pinctrl
[=C2=A0=C2=A0=C2=A0=C2=A00.490000] pinctrl core: registered pin 17 (A12) on=
 aspeed-g5-pinctrl
[=C2=A0=C2=A0=C2=A0=C2=A00.500000] pinctrl core: registered pin 18 (B12) on=
 aspeed-g5-pinctrl
[=C2=A0=C2=A0=C2=A0=C2=A00.510000] pinctrl core: registered pin 19 (D9) on =
aspeed-g5-pinctrl
[=C2=A0=C2=A0=C2=A0=C2=A00.520000] pinctrl core: registered pin 20 (D10) on=
 aspeed-g5-pinctrl
[=C2=A0=C2=A0=C2=A0=C2=A00.520000] pinctrl core: registered pin 21 (E12) on=
 aspeed-g5-pinctrl
[=C2=A0=C2=A0=C2=A0=C2=A00.530000] pinctrl core: registered pin 22 (C11) on=
 aspeed-g5-pinctrl
[=C2=A0=C2=A0=C2=A0=C2=A00.540000] pinctrl core: registered pin 23 (B11) on=
 aspeed-g5-pinctrl
[=C2=A0=C2=A0=C2=A0=C2=A00.550000] pinctrl core: registered pin 24 (F19) on=
 aspeed-g5-pinctrl
[=C2=A0=C2=A0=C2=A0=C2=A00.550000] pinctrl core: registered pin 25 (E21) on=
 aspeed-g5-pinctrl
[=C2=A0=C2=A0=C2=A0=C2=A00.560000] pinctrl core: registered pin 26 (D20) on=
 aspeed-g5-pinctrl
[=C2=A0=C2=A0=C2=A0=C2=A00.570000] pinctrl core: registered pin 27 (D21) on=
 aspeed-g5-pinctrl
[=C2=A0=C2=A0=C2=A0=C2=A00.580000] pinctrl core: registered pin 28 (PIN28) =
on aspeed-g5-pinctrl
[=C2=A0=C2=A0=C2=A0=C2=A00.580000] pinctrl core: registered pin 29 (PIN29) =
on aspeed-g5-pinctrl
[=C2=A0=C2=A0=C2=A0=C2=A00.590000] pinctrl core: registered pin 30 (PIN30) =
on aspeed-g5-pinctrl
[=C2=A0=C2=A0=C2=A0=C2=A00.600000] pinctrl core: registered pin 31 (PIN31) =
on aspeed-g5-pinctrl
[=C2=A0=C2=A0=C2=A0=C2=A00.610000] pinctrl core: registered pin 32 (B20) on=
 aspeed-g5-pinctrl
[=C2=A0=C2=A0=C2=A0=C2=A00.610000] pinctrl core: registered pin 33 (C20) on=
 aspeed-g5-pinctrl
[=C2=A0=C2=A0=C2=A0=C2=A00.620000] pinctrl core: registered pin 34 (PIN34) =
on aspeed-g5-pinctrl
[=C2=A0=C2=A0=C2=A0=C2=A00.630000] pinctrl core: registered pin 35 (PIN35) =
on aspeed-g5-pinctrl
[=C2=A0=C2=A0=C2=A0=C2=A00.640000] pinctrl core: registered pin 36 (PIN36) =
on aspeed-g5-pinctrl
[=C2=A0=C2=A0=C2=A0=C2=A00.640000] pinctrl core: registered pin 37 (PIN37) =
on aspeed-g5-pinctrl
[=C2=A0=C2=A0=C2=A0=C2=A00.650000] pinctrl core: registered pin 38 (PIN38) =
on aspeed-g5-pinctrl
[=C2=A0=C2=A0=C2=A0=C2=A00.660000] pinctrl core: registered pin 39 (PIN39) =
on aspeed-g5-pinctrl
[=C2=A0=C2=A0=C2=A0=C2=A00.670000] pinctrl core: registered pin 40 (PIN40) =
on aspeed-g5-pinctrl
[=C2=A0=C2=A0=C2=A0=C2=A00.670000] pinctrl core: registered pin 41 (PIN41) =
on aspeed-g5-pinctrl
[=C2=A0=C2=A0=C2=A0=C2=A00.680000] pinctrl core: registered pin 42 (PIN42) =
on aspeed-g5-pinctrl
[=C2=A0=C2=A0=C2=A0=C2=A00.690000] pinctrl core: registered pin 43 (PIN43) =
on aspeed-g5-pinctrl
[=C2=A0=C2=A0=C2=A0=C2=A00.700000] pinctrl core: registered pin 44 (PIN44) =
on aspeed-g5-pinctrl
[=C2=A0=C2=A0=C2=A0=C2=A00.700000] pinctrl core: registered pin 45 (PIN45) =
on aspeed-g5-pinctrl
[=C2=A0=C2=A0=C2=A0=C2=A00.710000] pinctrl core: registered pin 46 (PIN46) =
on aspeed-g5-pinctrl
[=C2=A0=C2=A0=C2=A0=C2=A00.720000] pinctrl core: registered pin 47 (PIN47) =
on aspeed-g5-pinctrl
[=C2=A0=C2=A0=C2=A0=C2=A00.730000] pinctrl core: registered pin 48 (PIN48) =
on aspeed-g5-pinctrl
[=C2=A0=C2=A0=C2=A0=C2=A00.740000] pinctrl core: registered pin 49 (PIN49) =
on aspeed-g5-pinctrl
[=C2=A0=C2=A0=C2=A0=C2=A00.740000] pinctrl core: registered pin 50 (PIN50) =
on aspeed-g5-pinctrl
[=C2=A0=C2=A0=C2=A0=C2=A00.750000] pinctrl core: registered pin 51 (PIN51) =
on aspeed-g5-pinctrl
[=C2=A0=C2=A0=C2=A0=C2=A00.760000] pinctrl core: registered pin 52 (PIN52) =
on aspeed-g5-pinctrl
[=C2=A0=C2=A0=C2=A0=C2=A00.770000] pinctrl core: registered pin 53 (PIN53) =
on aspeed-g5-pinctrl
[=C2=A0=C2=A0=C2=A0=C2=A00.770000] pinctrl core: registered pin 54 (PIN54) =
on aspeed-g5-pinctrl
[=C2=A0=C2=A0=C2=A0=C2=A00.780000] pinctrl core: registered pin 55 (PIN55) =
on aspeed-g5-pinctrl
[=C2=A0=C2=A0=C2=A0=C2=A00.790000] pinctrl core: registered pin 56 (PIN56) =
on aspeed-g5-pinctrl
[=C2=A0=C2=A0=C2=A0=C2=A00.800000] pinctrl core: registered pin 57 (PIN57) =
on aspeed-g5-pinctrl
[=C2=A0=C2=A0=C2=A0=C2=A00.800000] pinctrl core: registered pin 58 (PIN58) =
on aspeed-g5-pinctrl
[=C2=A0=C2=A0=C2=A0=C2=A00.810000] pinctrl core: registered pin 59 (PIN59) =
on aspeed-g5-pinctrl
[=C2=A0=C2=A0=C2=A0=C2=A00.820000] pinctrl core: registered pin 60 (PIN60) =
on aspeed-g5-pinctrl
[=C2=A0=C2=A0=C2=A0=C2=A00.830000] pinctrl core: registered pin 61 (PIN61) =
on aspeed-g5-pinctrl
[=C2=A0=C2=A0=C2=A0=C2=A00.830000] pinctrl core: registered pin 62 (PIN62) =
on aspeed-g5-pinctrl
[=C2=A0=C2=A0=C2=A0=C2=A00.840000] pinctrl core: registered pin 63 (PIN63) =
on aspeed-g5-pinctrl
[=C2=A0=C2=A0=C2=A0=C2=A00.850000] pinctrl core: registered pin 64 (C18) on=
 aspeed-g5-pinctrl
[=C2=A0=C2=A0=C2=A0=C2=A00.860000] pinctrl core: registered pin 65 (E15) on=
 aspeed-g5-pinctrl
[=C2=A0=C2=A0=C2=A0=C2=A00.860000] pinctrl core: registered pin 66 (A14) on=
 aspeed-g5-pinctrl
[=C2=A0=C2=A0=C2=A0=C2=A00.870000] pinctrl core: registered pin 67 (C16) on=
 aspeed-g5-pinctrl
[=C2=A0=C2=A0=C2=A0=C2=A00.880000] pinctrl core: registered pin 68 (PIN68) =
on aspeed-g5-pinctrl
[=C2=A0=C2=A0=C2=A0=C2=A00.890000] pinctrl core: registered pin 69 (PIN69) =
on aspeed-g5-pinctrl
[=C2=A0=C2=A0=C2=A0=C2=A00.890000] pinctrl core: registered pin 70 (PIN70) =
on aspeed-g5-pinctrl
[=C2=A0=C2=A0=C2=A0=C2=A00.900000] pinctrl core: registered pin 71 (PIN71) =
on aspeed-g5-pinctrl
[=C2=A0=C2=A0=C2=A0=C2=A00.910000] pinctrl core: registered pin 72 (PIN72) =
on aspeed-g5-pinctrl
[=C2=A0=C2=A0=C2=A0=C2=A00.920000] pinctrl core: registered pin 73 (L2) on =
aspeed-g5-pinctrl
[=C2=A0=C2=A0=C2=A0=C2=A00.930000] pinctrl core: registered pin 74 (N3) on =
aspeed-g5-pinctrl
[=C2=A0=C2=A0=C2=A0=C2=A00.930000] pinctrl core: registered pin 75 (N4) on =
aspeed-g5-pinctrl
[=C2=A0=C2=A0=C2=A0=C2=A00.940000] pinctrl core: registered pin 76 (PIN76) =
on aspeed-g5-pinctrl
[=C2=A0=C2=A0=C2=A0=C2=A00.950000] pinctrl core: registered pin 77 (PIN77) =
on aspeed-g5-pinctrl
[=C2=A0=C2=A0=C2=A0=C2=A00.960000] pinctrl core: registered pin 78 (PIN78) =
on aspeed-g5-pinctrl
[=C2=A0=C2=A0=C2=A0=C2=A00.960000] pinctrl core: registered pin 79 (PIN79) =
on aspeed-g5-pinctrl
[=C2=A0=C2=A0=C2=A0=C2=A00.970000] pinctrl core: registered pin 80 (L3) on =
aspeed-g5-pinctrl
[=C2=A0=C2=A0=C2=A0=C2=A00.980000] pinctrl core: registered pin 81 (L4) on =
aspeed-g5-pinctrl
[=C2=A0=C2=A0=C2=A0=C2=A00.980000] pinctrl core: registered pin 82 (L1) on =
aspeed-g5-pinctrl
[=C2=A0=C2=A0=C2=A0=C2=A00.990000] pinctrl core: registered pin 83 (N2) on =
aspeed-g5-pinctrl
[=C2=A0=C2=A0=C2=A0=C2=A01.000000] pinctrl core: registered pin 84 (N1) on =
aspeed-g5-pinctrl
[=C2=A0=C2=A0=C2=A0=C2=A01.010000] pinctrl core: registered pin 85 (P1) on =
aspeed-g5-pinctrl
[=C2=A0=C2=A0=C2=A0=C2=A01.010000] pinctrl core: registered pin 86 (P2) on =
aspeed-g5-pinctrl
[=C2=A0=C2=A0=C2=A0=C2=A01.020000] pinctrl core: registered pin 87 (R1) on =
aspeed-g5-pinctrl
[=C2=A0=C2=A0=C2=A0=C2=A01.030000] pinctrl core: registered pin 88 (PIN88) =
on aspeed-g5-pinctrl
[=C2=A0=C2=A0=C2=A0=C2=A01.040000] pinctrl core: registered pin 89 (PIN89) =
on aspeed-g5-pinctrl
[=C2=A0=C2=A0=C2=A0=C2=A01.040000] pinctrl core: registered pin 90 (PIN90) =
on aspeed-g5-pinctrl
[=C2=A0=C2=A0=C2=A0=C2=A01.050000] pinctrl core: registered pin 91 (PIN91) =
on aspeed-g5-pinctrl
[=C2=A0=C2=A0=C2=A0=C2=A01.060000] pinctrl core: registered pin 92 (PIN92) =
on aspeed-g5-pinctrl
[=C2=A0=C2=A0=C2=A0=C2=A01.070000] pinctrl core: registered pin 93 (PIN93) =
on aspeed-g5-pinctrl
[=C2=A0=C2=A0=C2=A0=C2=A01.070000] pinctrl core: registered pin 94 (PIN94) =
on aspeed-g5-pinctrl
[=C2=A0=C2=A0=C2=A0=C2=A01.080000] pinctrl core: registered pin 95 (PIN95) =
on aspeed-g5-pinctrl
[=C2=A0=C2=A0=C2=A0=C2=A01.090000] pinctrl core: registered pin 96 (PIN96) =
on aspeed-g5-pinctrl
[=C2=A0=C2=A0=C2=A0=C2=A01.100000] pinctrl core: registered pin 97 (PIN97) =
on aspeed-g5-pinctrl
[=C2=A0=C2=A0=C2=A0=C2=A01.110000] pinctrl core: registered pin 98 (PIN98) =
on aspeed-g5-pinctrl
[=C2=A0=C2=A0=C2=A0=C2=A01.110000] pinctrl core: registered pin 99 (PIN99) =
on aspeed-g5-pinctrl
[=C2=A0=C2=A0=C2=A0=C2=A01.120000] pinctrl core: registered pin 100 (PIN100=
) on aspeed-g5-pinctrl
[=C2=A0=C2=A0=C2=A0=C2=A01.130000] pinctrl core: registered pin 101 (PIN101=
) on aspeed-g5-pinctrl
[=C2=A0=C2=A0=C2=A0=C2=A01.140000] pinctrl core: registered pin 102 (PIN102=
) on aspeed-g5-pinctrl
[=C2=A0=C2=A0=C2=A0=C2=A01.140000] pinctrl core: registered pin 103 (PIN103=
) on aspeed-g5-pinctrl
[=C2=A0=C2=A0=C2=A0=C2=A01.150000] pinctrl core: registered pin 104 (V2) on=
 aspeed-g5-pinctrl
[=C2=A0=C2=A0=C2=A0=C2=A01.160000] pinctrl core: registered pin 105 (W2) on=
 aspeed-g5-pinctrl
[=C2=A0=C2=A0=C2=A0=C2=A01.170000] pinctrl core: registered pin 106 (V3) on=
 aspeed-g5-pinctrl
[=C2=A0=C2=A0=C2=A0=C2=A01.170000] pinctrl core: registered pin 107 (U3) on=
 aspeed-g5-pinctrl
[=C2=A0=C2=A0=C2=A0=C2=A01.180000] pinctrl core: registered pin 108 (W3) on=
 aspeed-g5-pinctrl
[=C2=A0=C2=A0=C2=A0=C2=A01.190000] pinctrl core: registered pin 109 (AA3) o=
n aspeed-g5-pinctrl
[=C2=A0=C2=A0=C2=A0=C2=A01.200000] pinctrl core: registered pin 110 (Y3) on=
 aspeed-g5-pinctrl
[=C2=A0=C2=A0=C2=A0=C2=A01.200000] pinctrl core: registered pin 111 (T4) on=
 aspeed-g5-pinctrl
[=C2=A0=C2=A0=C2=A0=C2=A01.210000] pinctrl core: registered pin 112 (PIN112=
) on aspeed-g5-pinctrl
[=C2=A0=C2=A0=C2=A0=C2=A01.220000] pinctrl core: registered pin 113 (PIN113=
) on aspeed-g5-pinctrl
[=C2=A0=C2=A0=C2=A0=C2=A01.230000] pinctrl core: registered pin 114 (PIN114=
) on aspeed-g5-pinctrl
[=C2=A0=C2=A0=C2=A0=C2=A01.230000] pinctrl core: registered pin 115 (PIN115=
) on aspeed-g5-pinctrl
[=C2=A0=C2=A0=C2=A0=C2=A01.240000] pinctrl core: registered pin 116 (PIN116=
) on aspeed-g5-pinctrl
[=C2=A0=C2=A0=C2=A0=C2=A01.250000] pinctrl core: registered pin 117 (PIN117=
) on aspeed-g5-pinctrl
[=C2=A0=C2=A0=C2=A0=C2=A01.260000] pinctrl core: registered pin 118 (PIN118=
) on aspeed-g5-pinctrl
[=C2=A0=C2=A0=C2=A0=C2=A01.270000] pinctrl core: registered pin 119 (PIN119=
) on aspeed-g5-pinctrl
[=C2=A0=C2=A0=C2=A0=C2=A01.270000] pinctrl core: registered pin 120 (PIN120=
) on aspeed-g5-pinctrl
[=C2=A0=C2=A0=C2=A0=C2=A01.280000] pinctrl core: registered pin 121 (PIN121=
) on aspeed-g5-pinctrl
[=C2=A0=C2=A0=C2=A0=C2=A01.290000] pinctrl core: registered pin 122 (PIN122=
) on aspeed-g5-pinctrl
[=C2=A0=C2=A0=C2=A0=C2=A01.300000] pinctrl core: registered pin 123 (PIN123=
) on aspeed-g5-pinctrl
[=C2=A0=C2=A0=C2=A0=C2=A01.310000] pinctrl core: registered pin 124 (PIN124=
) on aspeed-g5-pinctrl
[=C2=A0=C2=A0=C2=A0=C2=A01.310000] pinctrl core: registered pin 125 (PIN125=
) on aspeed-g5-pinctrl
[=C2=A0=C2=A0=C2=A0=C2=A01.320000] pinctrl core: registered pin 126 (PIN126=
) on aspeed-g5-pinctrl
[=C2=A0=C2=A0=C2=A0=C2=A01.330000] pinctrl core: registered pin 127 (V6) on=
 aspeed-g5-pinctrl
[=C2=A0=C2=A0=C2=A0=C2=A01.340000] pinctrl core: registered pin 128 (A11) o=
n aspeed-g5-pinctrl
[=C2=A0=C2=A0=C2=A0=C2=A01.340000] pinctrl core: registered pin 129 (A10) o=
n aspeed-g5-pinctrl
[=C2=A0=C2=A0=C2=A0=C2=A01.350000] pinctrl core: registered pin 130 (A9) on=
 aspeed-g5-pinctrl
[=C2=A0=C2=A0=C2=A0=C2=A01.360000] pinctrl core: registered pin 131 (B9) on=
 aspeed-g5-pinctrl
[=C2=A0=C2=A0=C2=A0=C2=A01.370000] pinctrl core: registered pin 132 (N21) o=
n aspeed-g5-pinctrl
[=C2=A0=C2=A0=C2=A0=C2=A01.370000] pinctrl core: registered pin 133 (N22) o=
n aspeed-g5-pinctrl
[=C2=A0=C2=A0=C2=A0=C2=A01.380000] pinctrl core: registered pin 134 (B10) o=
n aspeed-g5-pinctrl
[=C2=A0=C2=A0=C2=A0=C2=A01.390000] pinctrl core: registered pin 135 (N20) o=
n aspeed-g5-pinctrl
[=C2=A0=C2=A0=C2=A0=C2=A01.400000] pinctrl core: registered pin 136 (PIN136=
) on aspeed-g5-pinctrl
[=C2=A0=C2=A0=C2=A0=C2=A01.400000] pinctrl core: registered pin 137 (PIN137=
) on aspeed-g5-pinctrl
[=C2=A0=C2=A0=C2=A0=C2=A01.410000] pinctrl core: registered pin 138 (PIN138=
) on aspeed-g5-pinctrl
[=C2=A0=C2=A0=C2=A0=C2=A01.420000] pinctrl core: registered pin 139 (PIN139=
) on aspeed-g5-pinctrl
[=C2=A0=C2=A0=C2=A0=C2=A01.430000] pinctrl core: registered pin 140 (PIN140=
) on aspeed-g5-pinctrl
[=C2=A0=C2=A0=C2=A0=C2=A01.430000] pinctrl core: registered pin 141 (PIN141=
) on aspeed-g5-pinctrl
[=C2=A0=C2=A0=C2=A0=C2=A01.440000] pinctrl core: registered pin 142 (D8) on=
 aspeed-g5-pinctrl
[=C2=A0=C2=A0=C2=A0=C2=A01.450000] pinctrl core: registered pin 143 (E10) o=
n aspeed-g5-pinctrl
[=C2=A0=C2=A0=C2=A0=C2=A01.460000] pinctrl core: registered pin 144 (PIN144=
) on aspeed-g5-pinctrl
[=C2=A0=C2=A0=C2=A0=C2=A01.470000] pinctrl core: registered pin 145 (PIN145=
) on aspeed-g5-pinctrl
[=C2=A0=C2=A0=C2=A0=C2=A01.470000] pinctrl core: registered pin 146 (PIN146=
) on aspeed-g5-pinctrl
[=C2=A0=C2=A0=C2=A0=C2=A01.480000] pinctrl core: registered pin 147 (PIN147=
) on aspeed-g5-pinctrl
[=C2=A0=C2=A0=C2=A0=C2=A01.490000] pinctrl core: registered pin 148 (PIN148=
) on aspeed-g5-pinctrl
[=C2=A0=C2=A0=C2=A0=C2=A01.500000] pinctrl core: registered pin 149 (PIN149=
) on aspeed-g5-pinctrl
[=C2=A0=C2=A0=C2=A0=C2=A01.500000] pinctrl core: registered pin 150 (PIN150=
) on aspeed-g5-pinctrl
[=C2=A0=C2=A0=C2=A0=C2=A01.510000] pinctrl core: registered pin 151 (PIN151=
) on aspeed-g5-pinctrl
[=C2=A0=C2=A0=C2=A0=C2=A01.520000] pinctrl core: registered pin 152 (B5) on=
 aspeed-g5-pinctrl
[=C2=A0=C2=A0=C2=A0=C2=A01.530000] pinctrl core: registered pin 153 (E9) on=
 aspeed-g5-pinctrl
[=C2=A0=C2=A0=C2=A0=C2=A01.540000] pinctrl core: registered pin 154 (F9) on=
 aspeed-g5-pinctrl
[=C2=A0=C2=A0=C2=A0=C2=A01.540000] pinctrl core: registered pin 155 (A5) on=
 aspeed-g5-pinctrl
[=C2=A0=C2=A0=C2=A0=C2=A01.550000] pinctrl core: registered pin 156 (E7) on=
 aspeed-g5-pinctrl
[=C2=A0=C2=A0=C2=A0=C2=A01.560000] pinctrl core: registered pin 157 (D7) on=
 aspeed-g5-pinctrl
[=C2=A0=C2=A0=C2=A0=C2=A01.560000] pinctrl core: registered pin 158 (B2) on=
 aspeed-g5-pinctrl
[=C2=A0=C2=A0=C2=A0=C2=A01.570000] pinctrl core: registered pin 159 (B1) on=
 aspeed-g5-pinctrl
[=C2=A0=C2=A0=C2=A0=C2=A01.580000] pinctrl core: registered pin 160 (A2) on=
 aspeed-g5-pinctrl
[=C2=A0=C2=A0=C2=A0=C2=A01.590000] pinctrl core: registered pin 161 (B3) on=
 aspeed-g5-pinctrl
[=C2=A0=C2=A0=C2=A0=C2=A01.590000] pinctrl core: registered pin 162 (D5) on=
 aspeed-g5-pinctrl
[=C2=A0=C2=A0=C2=A0=C2=A01.600000] pinctrl core: registered pin 163 (D4) on=
 aspeed-g5-pinctrl
[=C2=A0=C2=A0=C2=A0=C2=A01.610000] pinctrl core: registered pin 164 (B4) on=
 aspeed-g5-pinctrl
[=C2=A0=C2=A0=C2=A0=C2=A01.620000] pinctrl core: registered pin 165 (A4) on=
 aspeed-g5-pinctrl
[=C2=A0=C2=A0=C2=A0=C2=A01.620000] pinctrl core: registered pin 166 (A3) on=
 aspeed-g5-pinctrl
[=C2=A0=C2=A0=C2=A0=C2=A01.630000] pinctrl core: registered pin 167 (D6) on=
 aspeed-g5-pinctrl
[=C2=A0=C2=A0=C2=A0=C2=A01.640000] pinctrl core: registered pin 168 (C5) on=
 aspeed-g5-pinctrl
[=C2=A0=C2=A0=C2=A0=C2=A01.650000] pinctrl core: registered pin 169 (C4) on=
 aspeed-g5-pinctrl
[=C2=A0=C2=A0=C2=A0=C2=A01.650000] pinctrl core: registered pin 170 (C2) on=
 aspeed-g5-pinctrl
[=C2=A0=C2=A0=C2=A0=C2=A01.660000] pinctrl core: registered pin 171 (C1) on=
 aspeed-g5-pinctrl
[=C2=A0=C2=A0=C2=A0=C2=A01.670000] pinctrl core: registered pin 172 (C3) on=
 aspeed-g5-pinctrl
[=C2=A0=C2=A0=C2=A0=C2=A01.680000] pinctrl core: registered pin 173 (D1) on=
 aspeed-g5-pinctrl
[=C2=A0=C2=A0=C2=A0=C2=A01.680000] pinctrl core: registered pin 174 (D2) on=
 aspeed-g5-pinctrl
[=C2=A0=C2=A0=C2=A0=C2=A01.690000] pinctrl core: registered pin 175 (E6) on=
 aspeed-g5-pinctrl
[=C2=A0=C2=A0=C2=A0=C2=A01.700000] pinctrl core: registered pin 176 (PIN176=
) on aspeed-g5-pinctrl
[=C2=A0=C2=A0=C2=A0=C2=A01.710000] pinctrl core: registered pin 177 (PIN177=
) on aspeed-g5-pinctrl
[=C2=A0=C2=A0=C2=A0=C2=A01.710000] pinctrl core: registered pin 178 (PIN178=
) on aspeed-g5-pinctrl
[=C2=A0=C2=A0=C2=A0=C2=A01.720000] pinctrl core: registered pin 179 (PIN179=
) on aspeed-g5-pinctrl
[=C2=A0=C2=A0=C2=A0=C2=A01.730000] pinctrl core: registered pin 180 (PIN180=
) on aspeed-g5-pinctrl
[=C2=A0=C2=A0=C2=A0=C2=A01.740000] pinctrl core: registered pin 181 (PIN181=
) on aspeed-g5-pinctrl
[=C2=A0=C2=A0=C2=A0=C2=A01.740000] pinctrl core: registered pin 182 (PIN182=
) on aspeed-g5-pinctrl
[=C2=A0=C2=A0=C2=A0=C2=A01.750000] pinctrl core: registered pin 183 (PIN183=
) on aspeed-g5-pinctrl
[=C2=A0=C2=A0=C2=A0=C2=A01.760000] pinctrl core: registered pin 184 (PIN184=
) on aspeed-g5-pinctrl
[=C2=A0=C2=A0=C2=A0=C2=A01.770000] pinctrl core: registered pin 185 (PIN185=
) on aspeed-g5-pinctrl
[=C2=A0=C2=A0=C2=A0=C2=A01.780000] pinctrl core: registered pin 186 (PIN186=
) on aspeed-g5-pinctrl
[=C2=A0=C2=A0=C2=A0=C2=A01.780000] pinctrl core: registered pin 187 (PIN187=
) on aspeed-g5-pinctrl
[=C2=A0=C2=A0=C2=A0=C2=A01.790000] pinctrl core: registered pin 188 (PIN188=
) on aspeed-g5-pinctrl
[=C2=A0=C2=A0=C2=A0=C2=A01.800000] pinctrl core: registered pin 189 (PIN189=
) on aspeed-g5-pinctrl
[=C2=A0=C2=A0=C2=A0=C2=A01.810000] pinctrl core: registered pin 190 (PIN190=
) on aspeed-g5-pinctrl
[=C2=A0=C2=A0=C2=A0=C2=A01.820000] pinctrl core: registered pin 191 (PIN191=
) on aspeed-g5-pinctrl
[=C2=A0=C2=A0=C2=A0=C2=A01.820000] pinctrl core: registered pin 192 (PIN192=
) on aspeed-g5-pinctrl
[=C2=A0=C2=A0=C2=A0=C2=A01.830000] pinctrl core: registered pin 193 (PIN193=
) on aspeed-g5-pinctrl
[=C2=A0=C2=A0=C2=A0=C2=A01.840000] pinctrl core: registered pin 194 (PIN194=
) on aspeed-g5-pinctrl
[=C2=A0=C2=A0=C2=A0=C2=A01.850000] pinctrl core: registered pin 195 (PIN195=
) on aspeed-g5-pinctrl
[=C2=A0=C2=A0=C2=A0=C2=A01.850000] pinctrl core: registered pin 196 (PIN196=
) on aspeed-g5-pinctrl
[=C2=A0=C2=A0=C2=A0=C2=A01.860000] pinctrl core: registered pin 197 (PIN197=
) on aspeed-g5-pinctrl
[=C2=A0=C2=A0=C2=A0=C2=A01.870000] pinctrl core: registered pin 198 (PIN198=
) on aspeed-g5-pinctrl
[=C2=A0=C2=A0=C2=A0=C2=A01.880000] pinctrl core: registered pin 199 (PIN199=
) on aspeed-g5-pinctrl
[=C2=A0=C2=A0=C2=A0=C2=A01.890000] pinctrl core: registered pin 200 (PIN200=
) on aspeed-g5-pinctrl
[=C2=A0=C2=A0=C2=A0=C2=A01.890000] pinctrl core: registered pin 201 (PIN201=
) on aspeed-g5-pinctrl
[=C2=A0=C2=A0=C2=A0=C2=A01.900000] pinctrl core: registered pin 202 (PIN202=
) on aspeed-g5-pinctrl
[=C2=A0=C2=A0=C2=A0=C2=A01.910000] pinctrl core: registered pin 203 (PIN203=
) on aspeed-g5-pinctrl
[=C2=A0=C2=A0=C2=A0=C2=A01.920000] pinctrl core: registered pin 204 (PIN204=
) on aspeed-g5-pinctrl
[=C2=A0=C2=A0=C2=A0=C2=A01.930000] pinctrl core: registered pin 205 (PIN205=
) on aspeed-g5-pinctrl
[=C2=A0=C2=A0=C2=A0=C2=A01.930000] pinctrl core: registered pin 206 (PIN206=
) on aspeed-g5-pinctrl
[=C2=A0=C2=A0=C2=A0=C2=A01.940000] pinctrl core: registered pin 207 (PIN207=
) on aspeed-g5-pinctrl
[=C2=A0=C2=A0=C2=A0=C2=A01.950000] pinctrl core: registered pin 208 (PIN208=
) on aspeed-g5-pinctrl
[=C2=A0=C2=A0=C2=A0=C2=A01.960000] pinctrl core: registered pin 209 (PIN209=
) on aspeed-g5-pinctrl
[=C2=A0=C2=A0=C2=A0=C2=A01.960000] pinctrl core: registered pin 210 (PIN210=
) on aspeed-g5-pinctrl
[=C2=A0=C2=A0=C2=A0=C2=A01.970000] pinctrl core: registered pin 211 (PIN211=
) on aspeed-g5-pinctrl
[=C2=A0=C2=A0=C2=A0=C2=A01.980000] pinctrl core: registered pin 212 (PIN212=
) on aspeed-g5-pinctrl
[=C2=A0=C2=A0=C2=A0=C2=A01.990000] pinctrl core: registered pin 213 (PIN213=
) on aspeed-g5-pinctrl
[=C2=A0=C2=A0=C2=A0=C2=A02.000000] pinctrl core: registered pin 214 (PIN214=
) on aspeed-g5-pinctrl
[=C2=A0=C2=A0=C2=A0=C2=A02.000000] pinctrl core: registered pin 215 (PIN215=
) on aspeed-g5-pinctrl
[=C2=A0=C2=A0=C2=A0=C2=A02.010000] pinctrl core: registered pin 216 (PIN216=
) on aspeed-g5-pinctrl
[=C2=A0=C2=A0=C2=A0=C2=A02.020000] pinctrl core: registered pin 217 (PIN217=
) on aspeed-g5-pinctrl
[=C2=A0=C2=A0=C2=A0=C2=A02.030000] pinctrl core: registered pin 218 (PIN218=
) on aspeed-g5-pinctrl
[=C2=A0=C2=A0=C2=A0=C2=A02.030000] pinctrl core: registered pin 219 (PIN219=
) on aspeed-g5-pinctrl
[=C2=A0=C2=A0=C2=A0=C2=A02.040000] pinctrl core: registered pin 220 (PIN220=
) on aspeed-g5-pinctrl
[=C2=A0=C2=A0=C2=A0=C2=A02.050000] pinctrl core: registered pin 221 (PIN221=
) on aspeed-g5-pinctrl
[=C2=A0=C2=A0=C2=A0=C2=A02.060000] pinctrl core: registered pin 222 (PIN222=
) on aspeed-g5-pinctrl
[=C2=A0=C2=A0=C2=A0=C2=A02.070000] pinctrl core: registered pin 223 (PIN223=
) on aspeed-g5-pinctrl
[=C2=A0=C2=A0=C2=A0=C2=A02.070000] pinctrl core: registered pin 224 (PIN224=
) on aspeed-g5-pinctrl
[=C2=A0=C2=A0=C2=A0=C2=A02.080000] pinctrl core: registered pin 225 (PIN225=
) on aspeed-g5-pinctrl
[=C2=A0=C2=A0=C2=A0=C2=A02.090000] pinctrl core: registered pin 226 (PIN226=
) on aspeed-g5-pinctrl
[=C2=A0=C2=A0=C2=A0=C2=A02.100000] pinctrl core: registered pin 227 (PIN227=
) on aspeed-g5-pinctrl
[=C2=A0=C2=A0=C2=A0=C2=A02.310000] clocksource: Switched to clocksource mox=
art_timer
[=C2=A0=C2=A0=C2=A0=C2=A02.350000] NET: Registered protocol family 2
[=C2=A0=C2=A0=C2=A0=C2=A02.350000] TCP established hash table entries: 4096=
 (order: 2, 16384 bytes)
[=C2=A0=C2=A0=C2=A0=C2=A02.350000] TCP bind hash table entries: 4096 (order=
: 5, 147456 bytes)
[=C2=A0=C2=A0=C2=A0=C2=A02.380000] TCP: Hash tables configured (established=
 4096 bind 4096)
[=C2=A0=C2=A0=C2=A0=C2=A02.380000] UDP hash table entries: 256 (order: 2, 2=
0480 bytes)
[=C2=A0=C2=A0=C2=A0=C2=A02.380000] UDP-Lite hash table entries: 256 (order:=
 2, 20480 bytes)
[=C2=A0=C2=A0=C2=A0=C2=A02.380000] NET: Registered protocol family 1
[=C2=A0=C2=A0=C2=A0=C2=A02.380000] Trying to unpack rootfs image as initram=
fs...
[=C2=A0=C2=A0=C2=A0=C2=A02.940000] Freeing initrd memory: 13944K (81000000 =
- 81d9e000)
[=C2=A0=C2=A0=C2=A0=C2=A02.940000] alarmtimer alarmtimer: no of_node; not p=
arsing pinctrl DT
[=C2=A0=C2=A0=C2=A0=C2=A02.940000] futex hash table entries: 256 (order: 1,=
 11264 bytes)
[=C2=A0=C2=A0=C2=A0=C2=A03.040000] workingset: timestamp_bits=3D30 max_orde=
r=3D17 bucket_order=3D0
[=C2=A0=C2=A0=C2=A0=C2=A03.040000] squashfs: version 4.0 (2009/01/31) Phill=
ip Lougher
[=C2=A0=C2=A0=C2=A0=C2=A03.040000] jffs2: version 2.2. (NAND) =C2=A9 2001-2=
006 Red Hat, Inc.
[=C2=A0=C2=A0=C2=A0=C2=A03.040000] Block layer SCSI generic (bsg) driver ve=
rsion 0.4 loaded (major 251)
[=C2=A0=C2=A0=C2=A0=C2=A03.040000] io scheduler noop registered
[=C2=A0=C2=A0=C2=A0=C2=A03.040000] io scheduler deadline registered
[=C2=A0=C2=A0=C2=A0=C2=A03.040000] io scheduler cfq registered (default)
[=C2=A0=C2=A0=C2=A0=C2=A03.140000] Serial: 8250/16550 driver, 6 ports, IRQ =
sharing enabled
[=C2=A0=C2=A0=C2=A0=C2=A03.140000] serial8250 serial8250: no of_node; not p=
arsing pinctrl DT
[=C2=A0=C2=A0=C2=A0=C2=A03.140000] console [ttyS4] disabled
[=C2=A0=C2=A0=C2=A0=C2=A03.140000] 1e784000.serial: ttyS4 at MMIO 0x1e78400=
0 (irq =3D 20, base_baud =3D 1500000) is a 16550A
[=C2=A0=C2=A0=C2=A0=C2=A03.140000] console [ttyS4] enabled
[=C2=A0=C2=A0=C2=A0=C2=A03.140000] console [ttyS4] enabled
[=C2=A0=C2=A0=C2=A0=C2=A03.140000] bootconsole [earlycon0] disabled
[=C2=A0=C2=A0=C2=A0=C2=A03.140000] bootconsole [earlycon0] disabled
[=C2=A0=C2=A0=C2=A0=C2=A03.490000] brd: module loaded
[=C2=A0=C2=A0=C2=A0=C2=A03.490000] bt-host 1e789140.ibt: Found bt host devi=
ce
[=C2=A0=C2=A0=C2=A0=C2=A03.490000] bt-host 1e789140.ibt: Using IRQ 19
[=C2=A0=C2=A0=C2=A0=C2=A03.490000] platform 1e620000.fmc:flash@0: mx25l2563=
5e (32768 Kbytes)
[=C2=A0=C2=A0=C2=A0=C2=A03.490000] 6 ofpart partitions found on MTD device =
bmc
[=C2=A0=C2=A0=C2=A0=C2=A03.490000] Creating 6 MTD partitions on "bmc":
[=C2=A0=C2=A0=C2=A0=C2=A03.490000] 0x000000000000-0x000000060000 : "u-boot"
[=C2=A0=C2=A0=C2=A0=C2=A03.490000] 0x000000060000-0x000000080000 : "u-boot-=
env"
[=C2=A0=C2=A0=C2=A0=C2=A03.620000] 0x000000080000-0x000000300000 : "kernel"
[=C2=A0=C2=A0=C2=A0=C2=A03.620000] 0x000000300000-0x0000004c0000 : "initram=
fs"
[=C2=A0=C2=A0=C2=A0=C2=A03.620000] 0x0000004c0000-0x000001c00000 : "rofs"
[=C2=A0=C2=A0=C2=A0=C2=A03.620000] 0x000001c00000-0x000002000000 : "rwfs"
[=C2=A0=C2=A0=C2=A0=C2=A03.750000] libphy: Fixed MDIO Bus: probed
[=C2=A0=C2=A0=C2=A0=C2=A03.750000] pinctrl core: add 1 pinctrl maps
[=C2=A0=C2=A0=C2=A0=C2=A03.750000] pinctrl core: add 1 pinctrl maps
[=C2=A0=C2=A0=C2=A0=C2=A03.750000] aspeed-g5-pinctrl 1e6e2000.syscon:pinctr=
l@1e6e2000: found group selector 29 for RGMII2
[=C2=A0=C2=A0=C2=A0=C2=A03.750000] aspeed-g5-pinctrl 1e6e2000.syscon:pinctr=
l@1e6e2000: found group selector 17 for MDIO2
[=C2=A0=C2=A0=C2=A0=C2=A03.750000] aspeed-g5-pinctrl 1e6e2000.syscon:pinctr=
l@1e6e2000: request pin 158 (B2) for 1e680000.ethernet
[=C2=A0=C2=A0=C2=A0=C2=A03.750000] aspeed-g5-pinctrl 1e6e2000.syscon:pinctr=
l@1e6e2000: request pin 159 (B1) for 1e680000.ethernet
[=C2=A0=C2=A0=C2=A0=C2=A03.750000] aspeed-g5-pinctrl 1e6e2000.syscon:pinctr=
l@1e6e2000: request pin 160 (A2) for 1e680000.ethernet
[=C2=A0=C2=A0=C2=A0=C2=A03.750000] aspeed-g5-pinctrl 1e6e2000.syscon:pinctr=
l@1e6e2000: request pin 161 (B3) for 1e680000.ethernet
[=C2=A0=C2=A0=C2=A0=C2=A03.750000] aspeed-g5-pinctrl 1e6e2000.syscon:pinctr=
l@1e6e2000: request pin 162 (D5) for 1e680000.ethernet
[=C2=A0=C2=A0=C2=A0=C2=A03.750000] aspeed-g5-pinctrl 1e6e2000.syscon:pinctr=
l@1e6e2000: request pin 163 (D4) for 1e680000.ethernet
[=C2=A0=C2=A0=C2=A0=C2=A03.750000] aspeed-g5-pinctrl 1e6e2000.syscon:pinctr=
l@1e6e2000: request pin 170 (C2) for 1e680000.ethernet
[=C2=A0=C2=A0=C2=A0=C2=A03.750000] aspeed-g5-pinctrl 1e6e2000.syscon:pinctr=
l@1e6e2000: request pin 171 (C1) for 1e680000.ethernet
[=C2=A0=C2=A0=C2=A0=C2=A03.750000] aspeed-g5-pinctrl 1e6e2000.syscon:pinctr=
l@1e6e2000: request pin 172 (C3) for 1e680000.ethernet
[=C2=A0=C2=A0=C2=A0=C2=A03.890000] aspeed-g5-pinctrl 1e6e2000.syscon:pinctr=
l@1e6e2000: request pin 173 (D1) for 1e680000.ethernet
[=C2=A0=C2=A0=C2=A0=C2=A03.890000] aspeed-g5-pinctrl 1e6e2000.syscon:pinctr=
l@1e6e2000: request pin 174 (D2) for 1e680000.ethernet
[=C2=A0=C2=A0=C2=A0=C2=A03.890000] aspeed-g5-pinctrl 1e6e2000.syscon:pinctr=
l@1e6e2000: request pin 175 (E6) for 1e680000.ethernet
[=C2=A0=C2=A0=C2=A0=C2=A03.890000] SCUa0[0x00000040]=3D0x0, got 0x0 from 0x=
00000000
[=C2=A0=C2=A0=C2=A0=C2=A03.890000] SCU70[0x00000080]=3D0x1, got 0x1 from 0x=
7100c2e6
[=C2=A0=C2=A0=C2=A0=C2=A03.890000] SCU48[0x40000000]=3D0x0, got 0x0 from 0x=
80082208
[=C2=A0=C2=A0=C2=A0=C2=A03.890000] SCUa0[0x00000080]=3D0x0, got 0x0 from 0x=
00000000
[=C2=A0=C2=A0=C2=A0=C2=A03.890000] SCU70[0x00000080]=3D0x1, got 0x1 from 0x=
7100c2e6
[=C2=A0=C2=A0=C2=A0=C2=A03.890000] SCUa0[0x00000100]=3D0x0, got 0x0 from 0x=
00000000
[=C2=A0=C2=A0=C2=A0=C2=A03.890000] SCU70[0x00000080]=3D0x1, got 0x1 from 0x=
7100c2e6
[=C2=A0=C2=A0=C2=A0=C2=A03.890000] SCUa0[0x00000200]=3D0x0, got 0x0 from 0x=
00000000
[=C2=A0=C2=A0=C2=A0=C2=A03.890000] SCU70[0x00000080]=3D0x1, got 0x1 from 0x=
7100c2e6
[=C2=A0=C2=A0=C2=A0=C2=A03.890000] SCUa0[0x00000400]=3D0x0, got 0x0 from 0x=
00000000
[=C2=A0=C2=A0=C2=A0=C2=A03.890000] SCU70[0x00000080]=3D0x1, got 0x1 from 0x=
7100c2e6
[=C2=A0=C2=A0=C2=A0=C2=A03.890000] SCUa0[0x00000800]=3D0x0, got 0x0 from 0x=
00000000
[=C2=A0=C2=A0=C2=A0=C2=A03.890000] SCU70[0x00000080]=3D0x1, got 0x1 from 0x=
7100c2e6
[=C2=A0=C2=A0=C2=A0=C2=A03.890000] SCUa0[0x00040000]=3D0x0, got 0x0 from 0x=
00000000
[=C2=A0=C2=A0=C2=A0=C2=A03.890000] SCU70[0x00000080]=3D0x1, got 0x1 from 0x=
7100c2e6
[=C2=A0=C2=A0=C2=A0=C2=A03.890000] SCUa0[0x00080000]=3D0x0, got 0x0 from 0x=
00000000
[=C2=A0=C2=A0=C2=A0=C2=A03.890000] SCU70[0x00000080]=3D0x1, got 0x1 from 0x=
7100c2e6
[=C2=A0=C2=A0=C2=A0=C2=A03.890000] SCUa0[0x00100000]=3D0x0, got 0x0 from 0x=
00000000
[=C2=A0=C2=A0=C2=A0=C2=A03.890000] SCU70[0x00000080]=3D0x1, got 0x1 from 0x=
7100c2e6
[=C2=A0=C2=A0=C2=A0=C2=A03.890000] SCUa0[0x00200000]=3D0x0, got 0x0 from 0x=
00000000
[=C2=A0=C2=A0=C2=A0=C2=A03.890000] SCU70[0x00000080]=3D0x1, got 0x1 from 0x=
7100c2e6
[=C2=A0=C2=A0=C2=A0=C2=A04.040000] SCUa0[0x00400000]=3D0x0, got 0x0 from 0x=
00000000
[=C2=A0=C2=A0=C2=A0=C2=A04.040000] SCU70[0x00000080]=3D0x1, got 0x1 from 0x=
7100c2e6
[=C2=A0=C2=A0=C2=A0=C2=A04.040000] SCUa0[0x00800000]=3D0x0, got 0x0 from 0x=
00000000
[=C2=A0=C2=A0=C2=A0=C2=A04.040000] SCU70[0x00000080]=3D0x1, got 0x1 from 0x=
7100c2e6
[=C2=A0=C2=A0=C2=A0=C2=A04.040000] aspeed-g5-pinctrl 1e6e2000.syscon:pinctr=
l@1e6e2000: request pin 6 (C13) for 1e680000.ethernet
[=C2=A0=C2=A0=C2=A0=C2=A04.040000] aspeed-g5-pinctrl 1e6e2000.syscon:pinctr=
l@1e6e2000: request pin 7 (B13) for 1e680000.ethernet
[=C2=A0=C2=A0=C2=A0=C2=A04.040000] SCU90[0x00000004]=3D0x1, got 0x1 from 0x=
00220044
[=C2=A0=C2=A0=C2=A0=C2=A04.040000] SCU90[0x00000040]=3D0x0, got 0x1 from 0x=
00220044
[=C2=A0=C2=A0=C2=A0=C2=A04.040000] SCU90[0x00000004]=3D0x1, got 0x1 from 0x=
00220004
[=C2=A0=C2=A0=C2=A0=C2=A04.040000] SCU90[0x00000040]=3D0x0, got 0x0 from 0x=
00220004
[=C2=A0=C2=A0=C2=A0=C2=A04.040000] SCU90[0x00000004]=3D0x1, got 0x1 from 0x=
00220004
[=C2=A0=C2=A0=C2=A0=C2=A04.040000] SCU90[0x00000040]=3D0x0, got 0x0 from 0x=
00220004
[=C2=A0=C2=A0=C2=A0=C2=A04.040000] ftgmac100 1e680000.ethernet: Read MAC ad=
dress 00:c0:a8:12:34:56 from chip
[=C2=A0=C2=A0=C2=A0=C2=A04.040000] RTL8211E Gigabit Ethernet 1e680000.ether=
ne:00: no of_node; not parsing pinctrl DT
[=C2=A0=C2=A0=C2=A0=C2=A04.040000] RTL8211E Gigabit Ethernet 1e680000.ether=
ne:01: no of_node; not parsing pinctrl DT
[=C2=A0=C2=A0=C2=A0=C2=A04.200000] libphy: ftgmac100_mdio: probed
[=C2=A0=C2=A0=C2=A0=C2=A04.200000] ftgmac100 1e680000.ethernet eth0: irq 17=
, mapped at f0080000
[=C2=A0=C2=A0=C2=A0=C2=A04.200000] i2c /dev entries driver
[=C2=A0=C2=A0=C2=A0=C2=A04.200000] i2c_aspeed 1e78a000.i2c: i2c controller =
registered, irq 21
[=C2=A0=C2=A0=C2=A0=C2=A04.200000] pinctrl core: add 1 pinctrl maps
[=C2=A0=C2=A0=C2=A0=C2=A04.200000] aspeed-g5-pinctrl 1e6e2000.syscon:pinctr=
l@1e6e2000: found group selector 9 for I2C4
[=C2=A0=C2=A0=C2=A0=C2=A04.200000] aspeed-g5-pinctrl 1e6e2000.syscon:pinctr=
l@1e6e2000: request pin 130 (A9) for i2c-3
[=C2=A0=C2=A0=C2=A0=C2=A04.200000] aspeed-g5-pinctrl 1e6e2000.syscon:pinctr=
l@1e6e2000: request pin 131 (B9) for i2c-3
[=C2=A0=C2=A0=C2=A0=C2=A04.200000] SCU90[0x00020000]=3D0x1, got 0x1 from 0x=
00220004
[=C2=A0=C2=A0=C2=A0=C2=A04.200000] SCU90[0x00020000]=3D0x1, got 0x1 from 0x=
00220004
[=C2=A0=C2=A0=C2=A0=C2=A04.200000] dummy 3-0051: no of_node; not parsing pi=
nctrl DT
[=C2=A0=C2=A0=C2=A0=C2=A04.200000] dummy 3-0052: no of_node; not parsing pi=
nctrl DT
[=C2=A0=C2=A0=C2=A0=C2=A04.200000] dummy 3-0053: no of_node; not parsing pi=
nctrl DT
[=C2=A0=C2=A0=C2=A0=C2=A04.200000] at24 3-0050: 1024 byte 24c08 EEPROM, wri=
table, 16 bytes/write
[=C2=A0=C2=A0=C2=A0=C2=A04.200000] i2c_aspeed i2c-3: i2c bus 3 registered, =
irq 217
[=C2=A0=C2=A0=C2=A0=C2=A04.200000] pinctrl core: add 1 pinctrl maps
[=C2=A0=C2=A0=C2=A0=C2=A04.200000] aspeed-g5-pinctrl 1e6e2000.syscon:pinctr=
l@1e6e2000: found group selector 13 for I2C8
[=C2=A0=C2=A0=C2=A0=C2=A04.370000] random: fast init done
[=C2=A0=C2=A0=C2=A0=C2=A04.370000] aspeed-g5-pinctrl 1e6e2000.syscon:pinctr=
l@1e6e2000: request pin 86 (P2) for i2c-7
[=C2=A0=C2=A0=C2=A0=C2=A04.370000] aspeed-g5-pinctrl 1e6e2000.syscon:pinctr=
l@1e6e2000: request pin 87 (R1) for i2c-7
[=C2=A0=C2=A0=C2=A0=C2=A04.370000] SCU90[0x00200000]=3D0x1, got 0x1 from 0x=
00220004
[=C2=A0=C2=A0=C2=A0=C2=A04.370000] SCU90[0x00200000]=3D0x1, got 0x1 from 0x=
00220004
[=C2=A0=C2=A0=C2=A0=C2=A04.370000] i2c_aspeed i2c-7: i2c bus 7 registered, =
irq 221
[=C2=A0=C2=A0=C2=A0=C2=A04.430000] lm75 7-004d: hwmon0: sensor 'lm75'
[=C2=A0=C2=A0=C2=A0=C2=A04.450000] NET: Registered protocol family 10
[=C2=A0=C2=A0=C2=A0=C2=A04.470000] NET: Registered protocol family 17
[=C2=A0=C2=A0=C2=A0=C2=A04.490000] kmemleak: Kernel memory leak detector in=
itialized
[=C2=A0=C2=A0=C2=A0=C2=A04.490000] kmemleak: Automatic memory scanning thre=
ad started
[=C2=A0=C2=A0=C2=A0=C2=A04.490000] hctosys: unable to open rtc device (rtc0=
)
[=C2=A0=C2=A0=C2=A0=C2=A04.520000] Freeing unused kernel memory: 1024K (806=
00000 - 80700000)
Starting logging: OK
Initializing random number generator... done.
Starting network...
[=C2=A0=C2=A0=C2=A0=C2=A05.330000] IPv6: ADDRCONF(NETDEV_UP): eth0: link is=
 not ready
udhcpc (v1.24.1) started
Sending discover...
[=C2=A0=C2=A0=C2=A0=C2=A07.440000] IPv6: ADDRCONF(NETDEV_CHANGE): eth0: lin=
k becomes ready
Sending discover...
Sending select for 10.104.0.185...
Lease of 10.104.0.185 obtained, lease time 86400
deleting routers
adding dns 192.231.203.132
adding dns 210.5.35.1
ssh-keygen: generating new host keys: RSA DSA ECDSA ED25519
Starting sshd: OK

Welcome to Buildroot
buildroot login: root
# ping 8.8.8.8
PING 8.8.8.8 (8.8.8.8): 56 data bytes
64 bytes from 8.8.8.8: seq=3D0 ttl=3D59 time=3D23.192 ms
^C
--- 8.8.8.8 ping statistics ---
1 packets transmitted, 1 packets received, 0% packet loss
round-trip min/avg/max =3D 23.192/23.192/23.192 ms
# echo nameserver 8.8.8.8 > /etc/resolv.conf
# ping on.net
PING on.net (150.101.140.197): 56 data bytes
64 bytes from 150.101.140.197: seq=3D0 ttl=3D57 time=3D1.566 ms
64 bytes from 150.101.140.197: seq=3D1 ttl=3D57 time=3D1.528 ms
^C
--- on.net ping statistics ---
2 packets transmitted, 2 packets received, 0% packet loss
round-trip min/avg/max =3D 1.528/1.547/1.566 ms
# wget http://mirror.internode.on.net/pub/test/10meg.test
Connecting to mirror.internode.on.net (150.101.135.3:80)
10meg.test=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0100% |*******************************|=C2=A0=C2=A09765k=C2=A0=C2=A00:00:=
00 ETA
# rm 10meg.test
# wget http://mirror.internode.on.net/pub/test/10meg.test
Connecting to mirror.internode.on.net (150.101.135.3:80)
10meg.test=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0100% |*******************************|=C2=A0=C2=A09765k=C2=A0=C2=A00:00:=
00 ETA
# rm 10meg.test
# wget http://mirror.internode.on.net/pub/test/100meg.test
Connecting to mirror.internode.on.net (150.101.135.3:80)
100meg.test=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A017% |*****=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0| 16989k=C2=A0=C2=A00:00:42 ETA[=C2=A0=C2=A0134.370000=
] random: crng init done
100meg.test=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0100%=
 |*******************************| 97656k=C2=A0=C2=A00:00:00 ETA
# rm 100meg.test
# [ 1342.210000] ftgmac100 1e680000.ethernet eth0: [ISR] =3D 0x200: PHYSTS_=
CHG
[ 1342.210000] ftgmac100 1e680000.ethernet eth0: [ISR] =3D 0x200: PHYSTS_CH=
G
[ 1342.220000] ftgmac100 1e680000.ethernet eth0: [ISR] =3D 0x200: PHYSTS_CH=
G
[ 1342.220000] ftgmac100 1e680000.ethernet eth0: [ISR] =3D 0x200: PHYSTS_CH=
G
[ 1342.220000] ftgmac100 1e680000.ethernet eth0: [ISR] =3D 0x200: PHYSTS_CH=
G
[ 1342.240000] ftgmac100 1e680000.ethernet eth0: [ISR] =3D 0x200: PHYSTS_CH=
G
--=-AxQ8Ja8obIp3T6F2xcYP
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAABCgAGBQJXxOUKAAoJEJ0dnzgO5LT5JXUP/0I0230nwhwf1dpqIggLyd3T
v0WLzNKdQGwSJYQfW85OT0UsbxkoH8DdksQOFTe/EKm2zQu+EYxavJJj7cJ83x2r
cNA6gnrd8m+akHDdIjxTtHNInIjtGIOwLnuoimFCDjz/7nHsDATB6Fo1PtCWKL3G
cBCkjuAspfTWLab7wY8QWiHedfwGKFGUTYV2Hx7I3+w/B8T2fz9HH2qsWRKyre+o
XEUgjSFYgDVSkIcrvqzoQh8E3Df59cgGiYxJl7aFaLCjbKlVj9n3g1GroHWag0pw
LyJ48RZbTjR9jKgy9gguDlQwYJhEV/UxCMKpxfbyXYLHYIDDP8UBTwYWAsR1Fogt
t60vYglEFBNwWsDc/e9xIlt4w/BIz7NP2iSXOfhh+gZL1uLJvA3yT+ZZhchfY5Ft
E7HGqoDGQMNgHAmiXYXgyq386nljO7540tSNoqY0OWwpX1fj7H/el2kvsM1gGwyd
yGoTwsW8nFLxY3lmzlGBzCcwI24LBNKnZ2k82V2Cw5imZRtIki1TyYQUJkNY1Lfg
vmF9TOODRJ9XH0OXr+NE7Wn2nvfRSHlEssD/LB94UoeuxgTtUMNamsjw5navK0eJ
IWFjK9hZje5USWpUn9dtzJ9024eXboN2SyMOryNG+jzoZr3itO4GteryGTWA8phF
O9HVN8hg4fkaUxL1V9L7
=NayZ
-----END PGP SIGNATURE-----

--=-AxQ8Ja8obIp3T6F2xcYP--
