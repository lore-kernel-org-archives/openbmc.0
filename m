Return-Path: <openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5351EC77B78
	for <openbmc@archiver.kernel.org>; Wed, 19 Apr 2023 09:12:12 +0000 (UTC)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Q1Zmp57V8z3fTl
	for <openbmc@archiver.kernel.org>; Wed, 19 Apr 2023 19:12:10 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kaod.org (client-ip=46.105.45.231; helo=8.mo548.mail-out.ovh.net; envelope-from=clg@kaod.org; receiver=<UNKNOWN>)
Received: from 8.mo548.mail-out.ovh.net (8.mo548.mail-out.ovh.net [46.105.45.231])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Q1Zm735lzz3cKv
	for <openbmc@lists.ozlabs.org>; Wed, 19 Apr 2023 19:11:32 +1000 (AEST)
Received: from mxplan5.mail.ovh.net (unknown [10.109.156.26])
	by mo548.mail-out.ovh.net (Postfix) with ESMTPS id D83762219D;
	Wed, 19 Apr 2023 08:55:49 +0000 (UTC)
Received: from kaod.org (37.59.142.110) by DAG4EX2.mxp5.local (172.16.2.32)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.23; Wed, 19 Apr
 2023 10:55:48 +0200
Authentication-Results: garm.ovh; auth=pass (GARM-110S0045b3d63cc-8531-4f76-9bdf-04c40f95bf9c,
                    69F1EEDB97822AF506580D49051D386A746FF3D7) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <9c136acf-ea18-130b-41bb-5001b01ee8cf@kaod.org>
Date: Wed, 19 Apr 2023 10:55:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: Integrating swtpm(as a software TPM) with OpenBMC on Qemu
Content-Language: en-US
To: Sandeep Kumar <sandeep.pkumar@tcs.com>, "openbmc@lists.ozlabs.org"
	<openbmc@lists.ozlabs.org>, Ninad Palsule <ninad@linux.ibm.com>, Joel Stanley
	<jms@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>
References: <MA1PR01MB412922EF629403C84674A6AD87909@MA1PR01MB4129.INDPRD01.PROD.OUTLOOK.COM>
 <8e23c99e-0e62-3866-ce61-c75a14453a37@kaod.org>
 <MA1PR01MB4129EB6FA57EA28AA9002E9C879B9@MA1PR01MB4129.INDPRD01.PROD.OUTLOOK.COM>
 <2231ac88-3005-0fb4-6aad-e7652ffd3467@kaod.org>
 <MA1PR01MB41297891E40E6E5652661662879D9@MA1PR01MB4129.INDPRD01.PROD.OUTLOOK.COM>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <MA1PR01MB41297891E40E6E5652661662879D9@MA1PR01MB4129.INDPRD01.PROD.OUTLOOK.COM>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.110]
X-ClientProxiedBy: DAG8EX2.mxp5.local (172.16.2.72) To DAG4EX2.mxp5.local
 (172.16.2.32)
X-Ovh-Tracer-GUID: 84f714d2-130c-450c-9371-b46c946fde7a
X-Ovh-Tracer-Id: 12435845947582286755
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvhedrfedttddguddtucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepkfffgggfuffvfhfhjggtgfhisehtkeertddtfeejnecuhfhrohhmpeevrogurhhitgcunfgvucfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepteeghedugeeiffekfedtlefftdejleefgeegteelgfdujeeggfefieevuedtffehnecukfhppeduvdejrddtrddtrddupdefjedrheelrddugedvrdduuddtpdekvddrieegrddvhedtrddujedtnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepuddvjedrtddrtddruddpmhgrihhlfhhrohhmpeeotghlgheskhgrohgurdhorhhgqedpnhgspghrtghpthhtohepuddprhgtphhtthhopehsrghnuggvvghprdhpkhhumhgrrhesthgtshdrtghomhdpohhpvghnsghmtgeslhhishhtshdrohiilhgrsghsrdhorhhgpdhnihhnrggusehlihhnuhigrdhisghmrdgtohhmpdhjmhhssehjmhhsrdhiugdrrghupdgrnhgurhgvfiesrghjrdhiugdrrghupdfovfetjfhoshhtpehmohehgeekpdhmohguvgepshhmthhpohhuth
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
Errors-To: openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org>

Hello Sandeep

On 4/18/23 09:45, Sandeep Kumar wrote:
> TCS Confidential
> 
> Hi C,
> Built the qemu from your branch. Few issues,
> *$ ./qemu-system-arm -m 256 -M romulus-bmc -nographic -drive file=./obmc-phosphor-image-romulus.static.mtd,format=raw,if=mtd -net nic -net user,hostfwd=:127.0.0.1:2222-:22,hostfwd=:127.0.0.1:4443-:443,hostfwd=tcp:127.0.0.1:8880-:80,hostfwd=tcp:127.0.0.1:2200-:2200,hostfwd=udp:127.0.0.1:6623-:623,hostfwd=udp:127.0.0.1:6664-:664,hostname=qemu*
> *qemu-system-arm: -net user,hostfwd=:127.0.0.1:2222-:22,hostfwd=:127.0.0.1:4443-:443,hostfwd=tcp:127.0.0.1:8880-:80,hostfwd=tcp:127.0.0.1:2200-:2200,hostfwd=udp:127.0.0.1:6623-:623,hostfwd=udp:127.0.0.1:6664-:664,hostname=qemu: network backend 'user' is not compiled into this binary*
> I didn’t enable the slirp package I guess. So enabled it while running configure,
> *$ ../configure --enable-slirp*
> *........*
> *Run-time dependency slirp found: NO (tried pkgconfig)*
> *../meson.build:681:2: ERROR: Dependency "slirp" not found, tried pkgconfig*
> *A full log can be found at /home/tcs/work/sandeep/measured_boot/ibm_qemu/qemu/build/meson-logs/meson-log.txt*
> *NOTICE: You are using Python 3.6 which is EOL. Starting with v0.62.0, Meson will require Python 3.7 or newer*
> *ERROR: meson setup failed*
> I have already installed slirp locally, but still getting the above error.


Did you install the libslirp-dev or libslirp-devel package ?

C.

