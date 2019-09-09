Return-Path: <bradleyb@fuzziesquirrel.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=fuzziesquirrel.com
 (client-ip=173.167.31.197; helo=bajor.fuzziesquirrel.com;
 envelope-from=bradleyb@fuzziesquirrel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=fuzziesquirrel.com
Received: from bajor.fuzziesquirrel.com (mail.fuzziesquirrel.com
 [173.167.31.197])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46RlFz2yMlzDqP6
 for <openbmc@lists.ozlabs.org>; Mon,  9 Sep 2019 20:46:31 +1000 (AEST)
X-Virus-Scanned: amavisd-new at fuzziesquirrel.com
Received: from brads-mbp.dyn.fuzziesquirrel.com
 (Brads-MBP.dyn.fuzziesquirrel.com [192.168.253.30])
 by bajor.fuzziesquirrel.com (Postfix) with ESMTPSA id 256F95C0A1;
 Mon,  9 Sep 2019 06:46:28 -0400 (EDT)
Content-Type: text/plain;
	charset=utf-8;
	delsp=yes;
	format=flowed
Mime-Version: 1.0 (Mac OS X Mail 12.4 \(3445.104.11\))
Subject: Re: [PATCH] ncsi-netlink: support sending NC-SI commands over Netlink
 interface
From: Brad Bishop <bradleyb@fuzziesquirrel.com>
In-Reply-To: <CH2PR15MB3686CCC22840AD848796D6CAA3BD0@CH2PR15MB3686.namprd15.prod.outlook.com>
Date: Mon, 9 Sep 2019 06:46:27 -0400
Cc: Terry Duncan <terry.s.duncan@linux.intel.com>,
 "sam@mendozajonas.com" <sam@mendozajonas.com>,
 "davem@davemloft.net" <davem@davemloft.net>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
 "Justin.Lee1@Dell.com" <Justin.Lee1@Dell.com>
Message-Id: <32645B93-9E92-4945-9840-45E25D0A9351@fuzziesquirrel.com>
References: <CH2PR15MB36860EECD2EA6D63BEA70110A3A40@CH2PR15MB3686.namprd15.prod.outlook.com>
 <0da11d73-b3ab-53f6-f695-30857a743a7b@linux.intel.com>
 <CH2PR15MB3686CCC22840AD848796D6CAA3BD0@CH2PR15MB3686.namprd15.prod.outlook.com>
To: Ben Wei <benwei@fb.com>
X-Mailer: Apple Mail (2.3445.104.11)
Content-Transfer-Encoding: quoted-printable
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
X-List-Received-Date: Mon, 09 Sep 2019 10:46:32 -0000

>> Do you have plans to upstream your yocto recipe for this repo?
>
> Yes I sure can upstream the recipe file. I had to make local changes to=
 =20
> build ncsi-netlink for my BMC platform.
> Is there a group I may submit my recipe to?

Hi Ben

Can you try meta-openembedded?  If they will not take it, I=E2=80=99m hap=
py to host =20
a recipe for this in meta-phosphor.

In case you have not submitted a patch to meta-openembedded before... the=
 =20
correct mailing list is openembedded-devel:

https://www.openembedded.org/wiki/How_to_submit_a_patch_to_OpenEmbedded

thx - brad
