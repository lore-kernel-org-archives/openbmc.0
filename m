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
 by lists.ozlabs.org (Postfix) with ESMTPS id 4252lV0bpJzF374
 for <openbmc@lists.ozlabs.org>; Wed,  5 Sep 2018 22:17:40 +1000 (AEST)
X-Virus-Scanned: amavisd-new at fuzziesquirrel.com
Received: from [192.168.253.30] (unknown [192.168.253.30])
 by bajor.fuzziesquirrel.com (Postfix) with ESMTPSA id 443B0E2685;
 Wed,  5 Sep 2018 08:17:37 -0400 (EDT)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 11.5 \(3445.9.1\))
Subject: Re: Proposal for caching/buffering POST codes list for one boot
 process.
From: Brad Bishop <bradleyb@fuzziesquirrel.com>
In-Reply-To: <959CAFA1E282D14FB901BE9A7BF4E77249E0B119@shsmsx102.ccr.corp.intel.com>
Date: Wed, 5 Sep 2018 08:17:36 -0400
Cc: "kunyi731@gmail.com" <kunyi731@gmail.com>,
 "Mihm, James" <james.mihm@intel.com>, "Tanous, Ed" <ed.tanous@intel.com>,
 "Li, Yong B" <yong.b.li@intel.com>, "Feist, James" <james.feist@intel.com>,
 "Jia, Chunhui" <chunhui.jia@intel.com>,
 "venture@google.com" <venture@google.com>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
 "Xu, Qiang" <qiang.xu@intel.com>, "Yang, Cheng C" <cheng.c.yang@intel.com>,
 "chunhui.jia@linux.intel.com" <chunhui.jia@linux.intel.com>,
 "geissonator@yahoo.com" <geissonator@yahoo.com>,
 "Nguyen, Hai V" <hai.v.nguyen@intel.com>
Content-Transfer-Encoding: quoted-printable
Message-Id: <2D3522BB-7A89-4238-8BB5-63F60460BCC5@fuzziesquirrel.com>
References: <959CAFA1E282D14FB901BE9A7BF4E77249E020C3@shsmsx102.ccr.corp.intel.com>
 <7E9441B1E5EFFD4681F54958E8216993458353D7@ORSMSX114.amr.corp.intel.com>
 <CAO=notwzyahJ3onTynwoSff6y5NamoHRH_PtdwAyt2sgUNZh_A@mail.gmail.com>
 <7E9441B1E5EFFD4681F54958E8216993458355BC@ORSMSX114.amr.corp.intel.com>
 <2018082715593358738018@linux.intel.com>
 <7E9441B1E5EFFD4681F54958E821699345835CCF@ORSMSX114.amr.corp.intel.com>
 <CADNDqJzNhd_ApA83F8BubFUaGfrc2+W8TPw6_9PZCPwUvxH-+Q@mail.gmail.com>
 <CADNDqJwvMaGXCiFGO+3iEgNG=S=BLA=CVgZ8N2-e8m==KMGwbw@mail.gmail.com>
 <CADNDqJw8hnOGP3YEW0eS5CN7BLJ6Gu6tTxSugcJFrzrwYS7EJA@mail.gmail.com>
 <7E9441B1E5EFFD4681F54958E821699345836607@ORSMSX114.amr.corp.intel.com>
 <959CAFA1E282D14FB901BE9A7BF4E77249E05E02@shsmsx102.ccr.corp.intel.com>
 <2F9169B5-BA73-4157-BEA4-2F80B8051757@fuzziesquirrel.com>
 <959CAFA1E282D14FB901BE9A7BF4E77249E068BE@shsmsx102.ccr.corp.intel.com>
 <C92B9CD1-4673-455D-995B-20F3A289BED8@fuzziesquirrel.com>
 <959CAFA1E282D14FB901BE9A7BF4E77249E0B119@shsmsx102.ccr.corp.intel.com>
To: "Wang, Kuiying" <kuiying.wang@intel.com>
X-Mailer: Apple Mail (2.3445.9.1)
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
X-List-Received-Date: Wed, 05 Sep 2018 12:17:42 -0000


> On Sep 5, 2018, at 3:25 AM, Wang, Kuiying <kuiying.wang@intel.com> =
wrote:
>=20
> Ok, great.
> Brad, please help create a repo "phosphor-post-code-manager=E2=80=9D

done!=
