Return-Path: <andrew@aj.id.au>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=aj.id.au
 (client-ip=66.111.4.25; helo=out1-smtp.messagingengine.com;
 envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="r52NrGvV"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="c1EFemGi"; dkim-atps=neutral
X-Greylist: delayed 429 seconds by postgrey-1.36 at bilbo;
 Tue, 11 Dec 2018 11:42:38 AEDT
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 43DLkk0MD3zDq5m
 for <openbmc@lists.ozlabs.org>; Tue, 11 Dec 2018 11:42:37 +1100 (AEDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 1DC36216CA;
 Mon, 10 Dec 2018 19:35:25 -0500 (EST)
Received: from web5 ([10.202.2.215])
 by compute4.internal (MEProxy); Mon, 10 Dec 2018 19:35:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 message-id:from:to:cc:mime-version:content-transfer-encoding
 :content-type:in-reply-to:date:references:subject; s=fm1; bh=PBl
 uqZuQ82eFD8J14Y7wGOCIjNatkpSgrSIfyiBJ6/4=; b=r52NrGvVtrFo7Av981j
 SwcblwskjOc3+s+MTEPERUkRgv5MlFRKli016HwGHzv86wBazNcYAdUJx5rh/2b8
 H0JNNGSS7a0b1+dtRUUSCiIvoUhAWlfqseMHEBP+PxSipMjiLOeaxRy4Q14hX5qa
 OrmCefZea1Q4yUcI0NClwy8bvpZLwQLi1nhvlkTQcJKg4fa85wTaAvWXIn4ATuhP
 MXfMSDCCi78sl5rf1F/RQBom5JDVVauLNgfRHQze7At7ueuC1XDDczwWIX1vuWON
 odBUaPceKAEJ4xMt150bFnT1wzPkGGhyEA7CZQLKhJZBIKTxUUY2a0tprqV+6vUE
 0lg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm1; bh=PBluqZuQ82eFD8J14Y7wGOCIjNatkpSgrSIfyiBJ6
 /4=; b=c1EFemGijrctmFun3sVGH4ruk9X0ubQ772KBUSz0XwK4bpqxQAp+CY6iO
 TWjMH9GUl/5TrA8kOt+WM/J0bUtkWwyVE1wgG1XOhAm5MXDNz8+HkKaupT0LEIJK
 C7M8t71zvb3dZTPDFYiScqkZtGpiTxzvWcitiankVqOC/EfHvCfyO3jXlWE/Z6A0
 t7DSjDdukklHU/GaOrKLGegqGYofMGoa7gR5/3y7yKUSQCVo/SQ8FaVl6aCvidE/
 A7bRw90mFhCXrt/lEic/nhdAQW67X4AUXBqUwJG/kNO7swYQShSX6jg1KbGudi7q
 XRgog/OFjnqZyKO5eG/O9pURbYdRw==
X-ME-Sender: <xms:TAYPXFAO75beLsVMvuargxhdaVY_n5vTL3N1xoeEjuWSppkS3Yc6zw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedtkedrudegiedgvdefucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfquhhtnecuuegrihhlohhuthemucef
 tddtnecunecujfgurhepkffhvfgggfgtofgjffhfufesthhqredtredtjeenucfhrhhomh
 eptehnughrvgifucflvghffhgvrhihuceorghnughrvgifsegrjhdrihgurdgruheqnecu
 rfgrrhgrmhepmhgrihhlfhhrohhmpegrnhgurhgvfiesrghjrdhiugdrrghunecuvehluh
 hsthgvrhfuihiivgeptd
X-ME-Proxy: <xmx:TAYPXIjViivmEhhVgQ_DW6vTi6Nu1q90zgPQ9fcxDX5s7YjTOd-UTg>
 <xmx:TAYPXL8OA1kK7nFYMIlBdh_bOfqS6RpcUo0Os1EBVSRlgOq8tv0Ypg>
 <xmx:TAYPXPCxZsH5nx8CHAY2358JLaxBbaH8j0N6QycQWQICKSj4Lzgn4A>
 <xmx:TAYPXNsfh6AEWyqC8XFs_wtMFXYA1W3z1udJlooLSYPLAtk9xJeGVg>
 <xmx:TAYPXAdBqx2-jj4Eoh6OfS_JGYjKFv5ESki63sLx2WGVHm8ZC9iKPQ>
 <xmx:TQYPXHQrBwLVwNHWbnV6FrbBGzMfukcr1mn10tu2A4UvAy37UkKAXg>
Received: by mailuser.nyi.internal (Postfix, from userid 99)
 id E2D5F9E149; Mon, 10 Dec 2018 19:35:23 -0500 (EST)
Message-Id: <1544488523.3308636.1605248144.073FF1F1@webmail.messagingengine.com>
From: Andrew Jeffery <andrew@aj.id.au>
To: =?utf-8?Q?P=2E=20K=2E=20Lee=20=28=E6=9D=8E=E6=9F=8F=E5=AF=AC=29?=
 <P.K.Lee@quantatw.com>, bradleyb@fuzziesquirrel.com
Cc: openbmc@lists.ozlabs.org
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-Mailer: MessagingEngine.com Webmail Interface - ajax-2f590f9a
In-Reply-To: <16DD5F49-0911-4513-B01B-B8B8BAADFFAB@quantatw.com>
Date: Tue, 11 Dec 2018 11:05:23 +1030
References: <16DD5F49-0911-4513-B01B-B8B8BAADFFAB@quantatw.com>
Subject: Re: The ipmid failed to start
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
X-List-Received-Date: Tue, 11 Dec 2018 00:42:38 -0000

Hello,

On Mon, 10 Dec 2018, at 14:33, P. K. Lee (=E6=9D=8E=E6=9F=8F=E5=AF=AC) wrot=
e:
> Hi Brad,
>=20
> I saw the issue, which is "recipes-phosphor: Fix systemd unit=20
> dependences of ipmid, mboxd" appending=20
> "Requires=3Dorg.openbmc.HostIpmi.service" and=20
> "Afteorg.openbmc.HostIpmi.service", you merged on Nov 29.
>=20
> After that, the ipmid failed to start.
>=20
> Because the file meta-phosphor/recipes-phosphor/ipmi/phosphor-ipmi-kcs/
> org.openbmc.HostIpmi.service already included "After=3Dphosphor-ipmi-
> host.service" before, it caused two services waiting for each other.

Ah, KCS. This is why I didn't hit the problem in my testing.

>=20
> If the "Requires=3Dorg.openbmc.HostIpmi.service" and=20
> "Afteorg.openbmc.HostIpmi.service" are removed in the meta-phosphor/
> recipes-phosphor/ipmi/phosphor-ipmi-host/phosphor-ipmi-host.service or=20
> the "After=3Dphosphor-ipmi-host.service" is removed in the meta-phosphor/
> recipes-phosphor/ipmi/phosphor-ipmi-kcs/org.openbmc.HostIpmi.service,=20
> the ipmid will start normally.
>=20
> I wonder if there is a better way to go about it.

It's a bit dicey. Something to consider here is that systemd does it's tear=
-down in stack-order with respect to the Before=3D/After=3D relationships d=
efined in the service files. With org.openbmc.HostIpmi.service having an Af=
ter=3D relationship with phosphor-ipmi-host.service it is torn down before =
phosphor-ipmi-host. This impacts processes that want to send events to the =
host during the BMC shutdown path: These applications need to depend on pho=
sphor-ipmi-host to access its APIs, and it's a layering violation for the a=
pplications to also depend on the transport that phosphor-ipmi-host is usin=
g (KCS, BT etc). In order to propagate the event to the host, phosphor-ipmi=
-host needs its transport, and therefore must have an After=3D relationship=
 with the transport process due to systemd's stack ordering on tear-down.

Having said that, requiring that After=3D relationship means that phosphor-=
ipmi-host.service is started after org.openbmc.HostIpmi.service, which mean=
s messages that arrive in the period between the two starting may get lost.=
 I think it's worth keeping in mind that org.openbmc.HostIpmi simply emits =
a signal when a message is received, and this provides no guarantee of anyo=
ne actually caring. This is in contrast to sending events the other way, wh=
ere org.openbmc.HostIpmi's interface provides a DBus method, which guarante=
es someone cares or the caller receives an error. This design fits the Afte=
r=3D relationship that I made phosphor-ipmi-host have on org.openbmc.HostIp=
mi.service, so I'd suggest it's worth changing the relationship for the KCS=
 implementation as well.

However, maybe that's a decision to be made per-platform rather than genera=
lly. I guess the unit files can be overridden in the packaging if this is a=
 concern?

>=20
> By the way, after I pushed the code to the Gerrit, "Jenkins Patch Set 1:=
=20
> User not approved, see admin, no CI" it showed. How can I solve this=20
> problem?

You need to convince someone that your patch isn't going to exploit our CI =
infrastructure :) Once you've earned some trust in the community with your =
contributions generally someone will add you to the list that allows CI to =
test your patches straight away.

Cheers,

Andrew

>=20
> Sincerely,
> P. K. Lee
