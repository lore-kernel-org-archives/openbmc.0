Return-Path: <bradleyb@fuzziesquirrel.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=fuzziesquirrel.com
 (client-ip=173.167.31.197; helo=bajor.fuzziesquirrel.com;
 envelope-from=bradleyb@fuzziesquirrel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=fuzziesquirrel.com
Received: from bajor.fuzziesquirrel.com (mail.fuzziesquirrel.com
 [173.167.31.197])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 43dmNN5GdWzDqSc
 for <openbmc@lists.ozlabs.org>; Tue, 15 Jan 2019 08:10:59 +1100 (AEDT)
X-Virus-Scanned: amavisd-new at fuzziesquirrel.com
Received: from [192.168.253.30] (unknown [192.168.253.30])
 by bajor.fuzziesquirrel.com (Postfix) with ESMTPSA id B48CF6DC7D;
 Mon, 14 Jan 2019 16:10:56 -0500 (EST)
Content-Type: text/plain;
	charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 12.2 \(3445.102.3\))
Subject: Re: New repo request: phosphor-ipmi-blobs-binarystore
From: Brad Bishop <bradleyb@fuzziesquirrel.com>
In-Reply-To: <CAGMNF6Vdf-tPdAP8QgXTNtykwu9Y49+RwXhyrJxsae+vkqMKxw@mail.gmail.com>
Date: Mon, 14 Jan 2019 16:10:56 -0500
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 "Tanous, Ed" <ed.tanous@intel.com>
Content-Transfer-Encoding: quoted-printable
Message-Id: <ADABA41C-F055-402C-A0D7-9C4279DC4C8B@fuzziesquirrel.com>
References: <CAGMNF6VE0JaN93hZT5_PNYgu-inpx5JTWk4NhpS6=VuBuxpEzA@mail.gmail.com>
 <012da767-1f7c-6bff-ad47-afaa352b8242@intel.com>
 <CAGMNF6U9oo1UhAAd8UxpGLONJGuQFhsxN38=MTpB_VNmQzEp-g@mail.gmail.com>
 <CAGMNF6VP9watHPHcOq2=SsoZ+fd+x-KSN2tfQwwLDvqg1sisgQ@mail.gmail.com>
 <CAGMNF6Ura0a-+N_ApsZfBEAcMxMWk=xxtWYMZ9kP_DaC13gCVg@mail.gmail.com>
 <8ED680A1-41E3-43AE-B12A-722AC71B518E@fuzziesquirrel.com>
 <CAGMNF6Vdf-tPdAP8QgXTNtykwu9Y49+RwXhyrJxsae+vkqMKxw@mail.gmail.com>
To: Kun Yi <kunyi@google.com>
X-Mailer: Apple Mail (2.3445.102.3)
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
X-List-Received-Date: Mon, 14 Jan 2019 21:11:01 -0000


> On Jan 14, 2019, at 2:09 PM, Kun Yi <kunyi@google.com> wrote:
>=20
>> On Mon, Jan 14, 2019 at 7:55 AM Brad Bishop =
<bradleyb@fuzziesquirrel.com> wrote:
>> Hi Kun
>>=20
>> Just wanted to verify quick before I do it that you still want a
>> phosphor-ipmi-blobs-binarystore repository?
>>=20
>> thx - brad
>=20
> Yes, we still intend to make the code available for upstream. Thanks!

done!
