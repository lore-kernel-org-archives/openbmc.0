Return-Path: <a.amelkin@yadro.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=yadro.com
 (client-ip=89.207.88.251; helo=mta-01.yadro.com;
 envelope-from=a.amelkin@yadro.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=yadro.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=yadro.com header.i=@yadro.com header.b="hWHccshV"; 
 dkim-atps=neutral
Received: from mta-01.yadro.com (mta-01.yadro.com [89.207.88.251])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 40Bqg56545zF1j4
 for <openbmc@lists.ozlabs.org>; Fri, 30 Mar 2018 03:18:25 +1100 (AEDT)
Received: from localhost (unknown [127.0.0.1])
 by mta-01.yadro.com (Postfix) with ESMTP id 416615396C
 for <openbmc@lists.ozlabs.org>; Thu, 29 Mar 2018 16:18:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=yadro.com; h=
 mime-version:content-transfer-encoding:content-id:content-type
 :content-type:content-language:accept-language:in-reply-to
 :references:message-id:date:date:subject:subject:from:from
 :received:received:received:received; s=mta-01; t=1522340300; x=
 1524154701; bh=LlTFX6KpzmcYwwnNQh3eQmaNIGeECGSBIkdqXJKAdVo=; b=h
 WHccshVJv2bxIJr31Zos48JdGPDV65jk5Y0csoUWiwJl/qk2rcVpltmACAZi+PuT
 pv9Jm6OO+tcimI0NAWllBtE4mW/VpJhiyG+doj0DFHbqvSVj+optNgsoVjz5JMQz
 r4ozHzqlU+RjdQzZH5lpSZ3eikvLdoP+fFKXpBr+Ks=
X-Virus-Scanned: amavisd-new at yadro.com
Received: from mta-01.yadro.com ([127.0.0.1])
 by localhost (mta-01.yadro.com [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6zjGONriVpyB for <openbmc@lists.ozlabs.org>;
 Thu, 29 Mar 2018 19:18:20 +0300 (MSK)
Received: from T-EXCH-01.corp.yadro.com (t-exch-01.corp.yadro.com
 [172.17.10.101])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by mta-01.yadro.com (Postfix) with ESMTPS id 4F0E550C4E
 for <openbmc@lists.ozlabs.org>; Thu, 29 Mar 2018 19:18:20 +0300 (MSK)
Received: from T-EXCH-02.corp.yadro.com (172.17.10.102) by
 T-EXCH-01.corp.yadro.com (172.17.10.101) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id
 15.1.669.32; Thu, 29 Mar 2018 19:18:19 +0300
Received: from T-EXCH-02.corp.yadro.com ([fe80::c87c:3169:a2ee:3f8]) by
 T-EXCH-02.corp.yadro.com ([fe80::c87c:3169:a2ee:3f8%14]) with mapi id
 15.01.0669.032; Thu, 29 Mar 2018 19:18:19 +0300
From: Alexander Amelkin <a.amelkin@yadro.com>
To: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Subject: Re: Attention users of network IPMI
Thread-Topic: Attention users of network IPMI
Thread-Index: AQHTx0ApTRijMKi5NESVSOi5QKFKxKPnAikAgABiFYA=
Date: Thu, 29 Mar 2018 16:18:19 +0000
Message-ID: <20180329161612.GA1946@cinnamon>
References: <d58f47d2-310c-f6cb-1ef0-6f7cae9bf7c0@linux.vnet.ibm.com>
 <4333c25f-d5bb-e4b8-f6c4-62deb53362a1@linux.vnet.ibm.com>
In-Reply-To: <4333c25f-d5bb-e4b8-f6c4-62deb53362a1@linux.vnet.ibm.com>
Accept-Language: ru-RU, en-US
Content-Language: ru-RU
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-imapappendstamp: T-EXCH-02.corp.yadro.com (15.01.0669.032)
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [10.100.1.58]
Content-Type: text/plain; charset="koi8-r"
Content-ID: <3C7894E229667C4F82FF3A19D70EE141@yadro.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
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
X-List-Received-Date: Thu, 29 Mar 2018 16:18:27 -0000

On Thu, Mar 29, 2018 at 06:56:00PM +0530, Deepak Kodihalli wrote:
> On 29/03/18 2:53 pm, Tom Joseph wrote:
> >Hello,
> >
> >Based on=9A feedback from the team writing management scripts for OpenBM=
C.
> >There is a suggestion to
> >support the "-U" parameter when running the IPMI over network, to keep t=
he
> >script consistent across
> >multiple BMC implementations.
> >
> >The support currently in=9A OpenBMC for the IPMI user accounts is the
> >nameless account and the -U option
> >is not needed and only the -P option is needed. With the proposed change=
,
> >"-U admin" is needed, for the
>=20
> This would break current users based on a nameless account. So I suppose
> that you'd have to still support a nameless account.

Sure. IPMI specification clearly states for Set User Access command that
"if implemented, this command must support at least the null user".

> >session setup to succeed. "root"=9A username was not preferred so that t=
he
> >user does not get confused with the
> >linux user account.
> >
> >IPMITool usage with the proposed change:
> >
> >ipmitool -I lanplus -H x.x.x.x -U admin -P 0penBmc <cmd>

Just a note. IMO, the password for IPMI users must be the same as for
system users, and preferably verified using pam as well.

IPMI defines user privileges (user, operator, administrator, oem
prooprietary privileges), and I think we need to support them. I'd do that =
via
standard user groups.  The root username may still be available with
'administrator' privilege level (user 'root' included into 'admin' group).
That way we can rely on standard means for authentication and filesystem
permissions, and maybe have some pam plugin for interaction with phosphor
(e.g. to check whether a user is disabled).

I'd also say that Get Device ID must work without password for anonymous
user for ease of IPMI-enabled device discovery, but that again may break
the existing setups using anonymous user with a password, and I can't find
anything in IPMI v2.0 specification on authentication requirements for Get
Device ID (if I was writing the spec, I'd demand absence of authentication
for that command).

Alexander.
