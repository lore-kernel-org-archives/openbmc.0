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
 by lists.ozlabs.org (Postfix) with ESMTPS id 46YNDK26DxzF3Zh
 for <openbmc@lists.ozlabs.org>; Thu, 19 Sep 2019 00:49:35 +1000 (AEST)
X-Virus-Scanned: amavisd-new at fuzziesquirrel.com
Received: from [192.168.253.30] (unknown [192.168.253.30])
 by bajor.fuzziesquirrel.com (Postfix) with ESMTPSA id 2AF521666E5;
 Wed, 18 Sep 2019 10:49:31 -0400 (EDT)
Content-Type: text/plain;
	charset=utf-8;
	delsp=yes;
	format=flowed
Mime-Version: 1.0 (Mac OS X Mail 12.4 \(3445.104.11\))
Subject: Re: OpenBMC CVE issues in openssl
From: Brad Bishop <bradleyb@fuzziesquirrel.com>
In-Reply-To: <325677a8-6379-2181-1cae-7c946e360d5f@linux.intel.com>
Date: Wed, 18 Sep 2019 10:49:30 -0400
Cc: openbmc@lists.ozlabs.org
Message-Id: <F1D4FF4C-5C84-42E3-ABED-8522EE79D65A@fuzziesquirrel.com>
References: <325677a8-6379-2181-1cae-7c946e360d5f@linux.intel.com>
To: "Xu, Qiang" <qiang.xu@linux.intel.com>
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
X-List-Received-Date: Wed, 18 Sep 2019 14:49:38 -0000

at 2:05 AM, Xu, Qiang <qiang.xu@linux.intel.com> wrote:

> Hi,
>
> Some openssl vulnerabilities are found by security scan on latest OpenB=
MC =20
> which is using openssl 1.1.1c
>
> CVE-2019-1549
> CVE-2019-1563
> CVE-2019-1547
>
> They are fixed in latest openssl version 1.1.1d.
>
> Do we have plan to upgrade openssl recently?
>
> Thanks

I don=E2=80=99t think 1.1.1d has landed upstream yet.  If you update oe-c=
ore to =20
1.1.1d I will pick it up once it lands there.

-brad
