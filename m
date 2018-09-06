Return-Path: <a.amelkin@yadro.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=yadro.com
 (client-ip=89.207.88.251; helo=mta-01.yadro.com;
 envelope-from=a.amelkin@yadro.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=yadro.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=yadro.com header.i=@yadro.com header.b="ujIrXAiW"; 
 dkim-atps=neutral
Received: from mta-01.yadro.com (mta-01.yadro.com [89.207.88.251])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 425gx06dlvzF39Y
 for <openbmc@lists.ozlabs.org>; Thu,  6 Sep 2018 23:13:08 +1000 (AEST)
Received: from localhost (unknown [127.0.0.1])
 by mta-01.yadro.com (Postfix) with ESMTP id B9494411F9;
 Thu,  6 Sep 2018 13:13:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=yadro.com; h=
 content-type:content-type:in-reply-to:mime-version:user-agent
 :date:date:message-id:from:from:references:subject:subject
 :received:received:received; s=mta-01; t=1536239584; x=
 1538053985; bh=8eyaoORZp/fYJEC2Oih54/FZ7txyYqIqol7xVQrbpOY=; b=u
 jIrXAiWm3giGlWdxrEB5qujfBv9FTY3xyc0ubG++NRoSgrLYWDYIWWqrDI5ocYTm
 T69HxQ3mBiQZoGKpf+m3Xc4gwV4Mve9U9BC1fCpZ59Nc6GMyYmAtB7fHm49LrytO
 cfMhJrQHP79Iijng/qnXdkPrLT5eGMUbIYQ6iPG8KM=
X-Virus-Scanned: amavisd-new at yadro.com
Received: from mta-01.yadro.com ([127.0.0.1])
 by localhost (mta-01.yadro.com [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id urO0Cp8kMA-W; Thu,  6 Sep 2018 16:13:04 +0300 (MSK)
Received: from T-EXCH-02.corp.yadro.com (t-exch-02.corp.yadro.com
 [172.17.10.102])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by mta-01.yadro.com (Postfix) with ESMTPS id 6FCC641185;
 Thu,  6 Sep 2018 16:13:04 +0300 (MSK)
Received: from [172.17.14.168] (172.17.14.168) by T-EXCH-02.corp.yadro.com
 (172.17.10.102) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id 15.1.669.32; Thu, 6 Sep
 2018 16:13:04 +0300
Subject: Re: Proposals for commit log policy
To: Patrick Venture <venture@google.com>, Brad Bishop
 <bradleyb@fuzziesquirrel.com>
CC: OpenBMC Maillist <openbmc@lists.ozlabs.org>, <gmills@linux.vnet.ibm.com>, 
 "Tanous, Ed" <ed.tanous@intel.com>
References: <0ef9181f-eb70-552b-3411-da2bc9676be1@yadro.com>
 <CACPK8XdtitrjvDpuiPiz_ew03m972ueGRXAhd4kM_z6YSVtL3A@mail.gmail.com>
 <0E782585-1B8A-4BF7-9454-443061BA9C32@fuzziesquirrel.com>
 <CALLMt=rGmZ9-29xWMymUvdCAgVnFzQ+gyZDn3zXnWeR4imSYPA@mail.gmail.com>
 <359bcf51-5732-a65b-4b7e-dba2df0dd375@linux.vnet.ibm.com>
 <7E9441B1E5EFFD4681F54958E821699345836D0F@ORSMSX114.amr.corp.intel.com>
 <5755FBD3-3D78-4E3A-8F50-D4976EE3B2B2@fuzziesquirrel.com>
 <CAO=notzk_+Q_Pg4xcxzDL=Ux3gyMb2iE0pfSgygDw32wzBHB=w@mail.gmail.com>
From: Alexander Amelkin <a.amelkin@yadro.com>
Openpgp: preference=signencrypt
Autocrypt: addr=a.amelkin@yadro.com; prefer-encrypt=mutual; keydata=
 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
 dTYsE5wSxM06T2l/MILupCNZ7A==
Message-ID: <47adccd0-a3dc-419f-de07-803a38f6fb6b@yadro.com>
Date: Thu, 6 Sep 2018 16:13:03 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.5.0
MIME-Version: 1.0
In-Reply-To: <CAO=notzk_+Q_Pg4xcxzDL=Ux3gyMb2iE0pfSgygDw32wzBHB=w@mail.gmail.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="7ZKWWqX0ES1IaUPmPPRuKxLtUQgklcc8W"
X-Originating-IP: [172.17.14.168]
X-ClientProxiedBy: T-EXCH-01.corp.yadro.com (172.17.10.101) To
 T-EXCH-02.corp.yadro.com (172.17.10.102)
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
X-List-Received-Date: Thu, 06 Sep 2018 13:13:09 -0000

--7ZKWWqX0ES1IaUPmPPRuKxLtUQgklcc8W
Content-Type: multipart/mixed; boundary="J8XR3wVRXROtGvoqewsVeU26Ho2UGCnip";
 protected-headers="v1"
From: Alexander Amelkin <a.amelkin@yadro.com>
To: Patrick Venture <venture@google.com>,
 Brad Bishop <bradleyb@fuzziesquirrel.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>, gmills@linux.vnet.ibm.com,
 "Tanous, Ed" <ed.tanous@intel.com>
Message-ID: <47adccd0-a3dc-419f-de07-803a38f6fb6b@yadro.com>
Subject: Re: Proposals for commit log policy
References: <0ef9181f-eb70-552b-3411-da2bc9676be1@yadro.com>
 <CACPK8XdtitrjvDpuiPiz_ew03m972ueGRXAhd4kM_z6YSVtL3A@mail.gmail.com>
 <0E782585-1B8A-4BF7-9454-443061BA9C32@fuzziesquirrel.com>
 <CALLMt=rGmZ9-29xWMymUvdCAgVnFzQ+gyZDn3zXnWeR4imSYPA@mail.gmail.com>
 <359bcf51-5732-a65b-4b7e-dba2df0dd375@linux.vnet.ibm.com>
 <7E9441B1E5EFFD4681F54958E821699345836D0F@ORSMSX114.amr.corp.intel.com>
 <5755FBD3-3D78-4E3A-8F50-D4976EE3B2B2@fuzziesquirrel.com>
 <CAO=notzk_+Q_Pg4xcxzDL=Ux3gyMb2iE0pfSgygDw32wzBHB=w@mail.gmail.com>
In-Reply-To: <CAO=notzk_+Q_Pg4xcxzDL=Ux3gyMb2iE0pfSgygDw32wzBHB=w@mail.gmail.com>

--J8XR3wVRXROtGvoqewsVeU26Ho2UGCnip
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Content-Language: en-US

05.09.2018 02:38, Patrick Venture wrote:
>
>> I fixed it up (by re-writing it in python=E2=80=A6it was in Perl) and =
re-deployed, given
>> all the objections.
> Yay.  No more perl!
Argh! Why do you guys love this ugly python so much? Perl is so much more=
 beautiful and comfortable and kludge-less (like has non-ugly regexps bui=
lt in)... No semicolons? Indentation defining code block limits? Oh my...=
 Nonetheless, ugly technologies tend to win, it seems.

No need to reply. Just my old-timer's muttering...


--J8XR3wVRXROtGvoqewsVeU26Ho2UGCnip--

--7ZKWWqX0ES1IaUPmPPRuKxLtUQgklcc8W
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJbkSffAAoJEOiTWHtbdBeNb/8QANxC5CtvmNASsvZmOMSy03b9
fB1SQV065is7Ja0c8SyuWcMvqUXwdf8lqUbQ/UWybKCu1g+sqmX8ZG2BQiR2aUzr
njjwAlNqVWdUuV80fShB0YcJOs855PoJN1085fX1LCQGdnnQL0BTkXluSrjqLhRB
kS0419fU/6lMux4/UaC0WxPz3BQy06Xz3TxEnSDtxrhKGLkhbKBBSA4DFCktTyFj
GtiORUCVCuPWEvyaIdftXxWFLXCTTOAknyJDh5gqdiYOVtK3LtzVjVk12RPVSuZi
JbTQkSM15DsUsnHo3mwbi+RpKD9IoV9XFzivUvQMEYdd0uWnLSapCaJ0Y7GP5toi
M4vOQ/qo+fkbd/0ZnnSq5UMPzrgQbOxCJi+PCKZU1OadHC2teQGxY/mzftl93HRC
KSyyA72j4f8yWoLyyRoo6k84DTtxZNYECEKnjnccdFZ1hun8gxoix5iOIqiRum/k
k/FkVMQRXPHRrNTeB4ON2prEqvGFlCYmFmD2PRQPjCMm/t8OAFvwA8O2Tc5/rPrm
4/3VdmBVbWOYVUtn19h/JAGkV4mkIA6NWIbDHLTpU5pGXkEzBuD617EgAcSrR5Ii
/43lS9zPn2A+a2vgGr993+RHm5NBbaSBNLB38q5NL72FoxidNd7yH46Y9xgGW5TE
7i/6GWHgFc10aSfg7DWh
=nw0t
-----END PGP SIGNATURE-----

--7ZKWWqX0ES1IaUPmPPRuKxLtUQgklcc8W--
