Return-Path: <andrew@aj.id.au>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=aj.id.au
 (client-ip=64.147.123.25; helo=wout2-smtp.messagingengine.com;
 envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="MwtTMcGS"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="oNYGgcJY"; dkim-atps=neutral
Received: from wout2-smtp.messagingengine.com (wout2-smtp.messagingengine.com
 [64.147.123.25])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 42KkTL0zkSzF27h
 for <openbmc@lists.ozlabs.org>; Wed, 26 Sep 2018 13:49:25 +1000 (AEST)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.west.internal (Postfix) with ESMTP id 47B14375;
 Tue, 25 Sep 2018 23:49:23 -0400 (EDT)
Received: from web1 ([10.202.2.211])
 by compute4.internal (MEProxy); Tue, 25 Sep 2018 23:49:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-sender
 :x-me-sender:x-sasl-enc; s=fm3; bh=UPdvy2v+pSs8YV8K6jaOWgZV5Tuj3
 tBwb9DDrM2Pucc=; b=MwtTMcGSSOVIl7k3Xh6eMvss603ccag/O/EmsF7M2ODsB
 CgmO0TbpnI8WNjBsRZS5zFEwNssjnCI2aFuG9yWIUpajI7JFxFfnZ/gB7QksUvl8
 A5LBWgy6HXLm7j59F+PYQq6PAZZv/QGWbjldl4tV00VtjP7DjbuDL0qf6zzn1Q3O
 q8Tzq8wJXml44FOyV5/exqLxtkGC8V+TRARe7Gur8nJKXCJtjK1Yt64qOSmhXksh
 rAPICj6foZNZfoo9GNXfakitE6X0hF4ZOhnE1krOe2uFKnep1xhCTVKoZIZTRpVr
 c+R45K2mHx5rCmp7IEE1GjcqgQM2gxeq4Oukx7mwg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=UPdvy2
 v+pSs8YV8K6jaOWgZV5Tuj3tBwb9DDrM2Pucc=; b=oNYGgcJYXhD9HqHfU/SHvJ
 oolxreSbSdNYFkfgQUubOUEew8/Qpz5L980WqPz30x+pTWMqife2damG181fe0S5
 VKHcSO+N85tkj5Q6R7MaDXIzmoeUfNGt7z4l5+jzzFy5LKApgx0OcyZq/Fj6/Ea+
 yLmzUElsPaQ9mg2kbS4yvj9BqilmtNcFAVtjMaIRKrnWVNzHATEY9WSbkj75GWSZ
 ULlLTyul692s/MC6vpfbb7T7JgV25PVJcq1uL8DWTi9A7xbqkv1f6fXdVlhdr40I
 V4tykYksgm3vjg0teEOKteO2Tf9igJrtf4woJH5bB65iLdioz2OW9sbarcqD3oQg
 ==
X-ME-Proxy: <xmx:wgGrW20OY-ws_RZzqbmPAqa7lB9JKmnC8uADavOSuaRspq60PBcDaA>
 <xmx:wgGrW0hgNcYU50R7cKLQDABX4sQ9oHQVG1HaoaBX4gXJ7Yr6zxZeVg>
 <xmx:wgGrWybChRNid8wyl2zDDoLaRWu5irJzGdl4mxGjRBRbtG9vJ-YMPw>
 <xmx:wgGrW8S0loaH50aIbW_uDrKJuk7AlUTqSjgEO04MbCgEUZX2NhaVmA>
 <xmx:wgGrW1SiVfRL5YcyKOLWjKEKjRHTjIyrCtCESwNGbosM7HUmbkspew>
 <xmx:wgGrW3Npr0NPKDXwQyo0llVu4pW3mn0ljnYwTeVZeZhPVaQmhmldRA>
X-ME-Sender: <xms:wgGrW5zUtxX4O-0EH0m_dkuz4RF6Lr1mdnQtJarYVA9MiSV9-Imdfg>
Received: by mailuser.nyi.internal (Postfix, from userid 99)
 id 7FF32940B6; Tue, 25 Sep 2018 23:49:22 -0400 (EDT)
Message-Id: <1537933762.273359.1520855776.6C5F0423@webmail.messagingengine.com>
From: Andrew Jeffery <andrew@aj.id.au>
To: xiuzhi <1450335857@qq.com>, openbmc <openbmc@lists.ozlabs.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-Mailer: MessagingEngine.com Webmail Interface - ajax-2e36a0dc
Subject: Re: MAC#2 RGMII mode can't ping other IP address on AST2500
References: <tencent_5BF308BD00D5F7E65B3CB94C@qq.com>
In-Reply-To: <tencent_5BF308BD00D5F7E65B3CB94C@qq.com>
Date: Wed, 26 Sep 2018 13:19:22 +0930
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
X-List-Received-Date: Wed, 26 Sep 2018 03:49:29 -0000

Hello,

On Wed, 26 Sep 2018, at 11:47, xiuzhi wrote:
> Hi All,
>    My hardware set AST2500 MAC#2  on RGMII mode. the device is Broadcom=20
> BCM54612, The PHY and control is good . But it can not ping other IP.=20
> The .dts file is:
>=20=20
> &mac1 {
>=20
>         status =3D "okay";
>=20
>         pinctrl-names =3D "default";
>=20
>         pinctrl-0 =3D <&pinctrl_rgmii2_default>;
>=20
> };
>=20
> The kernel boot info:
>=20
> [    3.747357] ftgmac100 1e680000.ethernet: Error applying setting,=20
> reverse things back

The failure to apply the pinctrl configuration isn't going to help. Can you=
 please open an issue on GitHub, provide the full dmesg output and point to=
 the kernel tree and configuration you are building?

Thanks,

Andrew

>=20
> [    3.755351] ftgmac100 1e680000.ethernet: Generated random MAC address=
=20
> 6a:ba:31:cd:e3:32
>=20
> [    3.771891] libphy: ftgmac100_mdio: probed
>=20
> [    3.776178] Generic PHY 1e680000.ethernet--1:00: attached PHY driver=20
> [Generic PHY] (mii_bus:phy_addr=3D1e680000.ethernet--1:00, irq=3DPOLL)
>=20
> [    3.799636] ftgmac100 1e680000.ethernet eth0: irq 19, mapped at 5ae850=
20
>=20
> ... ...
>=20
> [  OK  ] Found device /dev/aspeed-lpc-ctrl.
>=20
> [  OK     17.494678] ftgmac100 1e680000.ethernet eth0: Link is Up -=20
> 100Mbps/Full - flow control rx/tx
>=20
> m] Created slice[   17.503871] IPv6: ADDRCONF(NETDEV_CHANGE): eth0: link=
=20
> becomes ready
>=20
>  system-xyz.openbmc_project.led.controller.slice.
>=20
>          Starting Network Name Resolution...
>=20
> [  OK  ] Reached target System Time Synchronized.
>=20
> ......
>=20
> The values of register SCU0C and SCU70 are correct, the values are:
>=20
> #devmem 0x1e6e200C
>=20
> 0xFFDD7A8B,  the bit 21 is 0(MAC#2 enable clock running) ,the bit 20 is 1
>=20
> #dev mem 0x1e6e2070
>=20
> 0xF109F296 , the bit 7 is 1 (RGMII),the bit6 is 0
>=20
>=20
>=20
>=20
> Execting the command "ifconfig eth0 up" log is:
>=20
> root@romulus:~# ifconfig eth0 up=20=20
>=20
> [  274.978358] IPv6: ADDRCONF(NETDEV_UP): eth0: link is not ready
>=20
> root@romulus:~# [  274.986878] ftgmac100 1e680000.ethernet eth0: Link is=
=20
> Up - 100Mbps/Full - flow control rx/tx
>=20
> [  274.995944] IPv6: ADDRCONF(NETDEV_CHANGE): eth0: link becomes ready=20
>=20
> My bmc ip is 192.168.120.141, it can't ping other IPs.
>=20
> I also set the gateway. route add default gw 192.168.120.254.
> I trace the error  "ftgmac100 1e680000.ethernet: Error applying setting,=
=20
> reverse things back" in file drivers/pinctrl/core.c=20=20
> L1206=20
> list_for_each_entry(setting, &stte->settings,node)
> switch(setting->type=EF=BC=89{
> case PIN_MAP_TYPE_MUX_GROUP
>       ret =3D pinmux_enable_setting(setting);=20
> }
> the ret value is -1=20
> My kernel version is 4.17.14. The other kernel versions reproduce the=20
> same error.
> What is wrong with it?
>=20
>=20
> Xiuzhi
